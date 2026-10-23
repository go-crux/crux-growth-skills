-- Put these CTEs, everything above the FIND line, ahead of every query and join to them; each rule
-- is stated once, here. Close the statement with the Find query at the foot as written, or with
-- audit.sql's query for one page.
-- Replace the <angle-bracket> names in `source` with the columns list_tables returns for
-- `<client>-channel_reporting`; nothing else in this file changes by brand.
-- Timezone: where the brain's own instructions name the store's timezone, write every
-- CURRENT_DATE() below as CURRENT_DATE('<timezone>'), so yesterday is the store's own.
WITH
-- The cut: a thin cell has fewer visits than this in the period; an Underperforming page has at
-- least this share of the site's visits and revenue per visit at least this far below its Benchmark.
cut AS (
  SELECT 1000 AS thin_cell_visits, 0.01 AS min_visit_share, 0.20 AS min_gap
),
-- Last 90 complete days, ending yesterday. For a period the user names, change only these two dates.
period AS (
  SELECT
    DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY) AS date_from,
    DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) AS date_to
),
-- The one place that names mart columns. Revenue is one total sales column (after discounts and
-- returns). Where the mart carries ex-tax and inc-tax versions, take the column the brain's
-- revenue_per_session formula sums, else the ex-tax one, as SKILL.md step 2 sets out. Where the
-- mart flags test orders, zero their orders and revenue here and keep their visits, so the
-- site's visits stay equal to the sum of total_sessions.
source AS (
  SELECT
    <date column> AS day,
    COALESCE(<channel column>, 'Unknown') AS channel,
    TRIM(<landing page column>) AS raw_landing_page,
    total_sessions AS visits,
    <orders column, 0 on a flagged test order> AS orders,
    <total sales column, 0 on a flagged test order> AS revenue
  FROM `<client>-channel_reporting`
),
-- THE LANDING PAGE RULE, stated here once (funnel.sql copies these three CTEs, and page_type
-- below, as they are).
-- The brain's landing page is a path, or a URL with a scheme and host, or no page at all. Reduce
-- it to the store's own path: strip any scheme and host, cut the query string and fragment, drop
-- a trailing slash (the home page stays '/'), and keep a value that already starts with '/'.
-- Keep a page only on the store's own domain: the host carrying most visits in the period, with
-- 'www.' dropped. Every other host, every value containing '(not set)', and every value that is
-- neither a path nor a URL (a modelled re-attribution label, for one) becomes 'Unknown', as does
-- a NULL. 'Unknown' rows are never ranked and stay in the site totals.
parsed AS (
  SELECT
    s.*,
    REGEXP_REPLACE(
      LOWER(REGEXP_EXTRACT(s.raw_landing_page,
        r'^(?:[A-Za-z][A-Za-z0-9+.-]*://)?([A-Za-z0-9.-]+\.[A-Za-z0-9-]+)(?::[0-9]+)?(?:[/?#]|$)')),
      r'^www\.', '') AS host,
    IF(STARTS_WITH(s.raw_landing_page, '/'),
       REGEXP_EXTRACT(s.raw_landing_page, r'^([^?#]*)'),
       REGEXP_EXTRACT(s.raw_landing_page, r'^(?:[A-Za-z][A-Za-z0-9+.-]*://)?[^/?#]+([^?#]*)')) AS path
  FROM source AS s
),
store_host AS (
  SELECT p.host
  FROM parsed AS p
  JOIN period AS d ON p.day BETWEEN d.date_from AND d.date_to
  WHERE p.host IS NOT NULL
  GROUP BY p.host
  ORDER BY SUM(p.visits) DESC
  LIMIT 1
),
landing AS (
  SELECT
    p.* EXCEPT (raw_landing_page, host, path),
    IF(p.raw_landing_page IS NOT NULL
         AND NOT CONTAINS_SUBSTR(p.raw_landing_page, '(not set)')
         AND (STARTS_WITH(p.raw_landing_page, '/') OR p.host = (SELECT host FROM store_host)),
       COALESCE(NULLIF(RTRIM(p.path, '/'), ''), '/'),
       'Unknown') AS landing_page
  FROM parsed AS p
),
-- Page type from the path, and the pages never ranked: checkout links, /cart, /account and
-- 'Unknown' (orders with no visit, other hosts, '(not set)' and non-page values). Excluded pages
-- stay in the site totals. A product reached through a collection
-- (/collections/<collection>/products/<handle>) is a product, so it is tested before
-- /collections/. funnel.sql copies this CTE as it is, so Find and the funnel type a page alike.
page_type AS (
  SELECT
    landing_page,
    CASE
      WHEN REGEXP_CONTAINS(landing_page, r'^/(collections/[^/]+/)?products/') THEN 'product'
      WHEN STARTS_WITH(landing_page, '/collections/') THEN 'collection'
      WHEN STARTS_WITH(landing_page, '/pages/') THEN 'landing page'
      WHEN STARTS_WITH(landing_page, '/blogs/') THEN 'blog'
      WHEN landing_page = '/' THEN 'home'
      ELSE 'other'
    END AS page_type,
    landing_page = 'Unknown'
      OR REGEXP_CONTAINS(landing_page, r'^/(cart|account)(/|$)|/checkouts?(/|$)') AS excluded
  FROM (SELECT DISTINCT landing_page FROM landing)
),
period_rows AS (
  SELECT s.channel, s.landing_page, t.page_type, t.excluded, s.visits, s.orders, s.revenue
  FROM landing AS s
  JOIN period AS p ON s.day BETWEEN p.date_from AND p.date_to
  JOIN page_type AS t USING (landing_page)
),
-- Site totals over every row, excluded pages included.
site AS (
  SELECT
    SUM(visits) AS visits,
    SUM(orders) AS orders,
    SUM(revenue) AS revenue,
    SAFE_DIVIDE(SUM(revenue), SUM(visits)) AS revenue_per_visit
  FROM period_rows
),
-- Per ranked page and channel.
page_channel AS (
  SELECT
    landing_page, page_type, channel,
    SUM(visits) AS visits, SUM(orders) AS orders, SUM(revenue) AS revenue
  FROM period_rows
  WHERE NOT excluded
  GROUP BY landing_page, page_type, channel
),
type_channel AS (
  SELECT
    page_type, channel,
    SUM(visits) AS visits,
    SAFE_DIVIDE(SUM(revenue), SUM(visits)) AS revenue_per_visit
  FROM page_channel
  GROUP BY page_type, channel
),
type_all AS (
  SELECT page_type, SAFE_DIVIDE(SUM(revenue), SUM(visits)) AS revenue_per_visit
  FROM page_channel
  GROUP BY page_type
),
-- The site's revenue per visit for a Page type and channel, itself included. A thin cell takes
-- the Page type's rate across all channels.
benchmark_rate AS (
  SELECT
    c.page_type, c.channel,
    IF(c.visits < cut.thin_cell_visits, a.revenue_per_visit, c.revenue_per_visit) AS revenue_per_visit
  FROM type_channel AS c
  JOIN type_all AS a USING (page_type)
  CROSS JOIN cut
),
-- Benchmark revenue = sum over a page's channels of its visits there times that rate.
-- Revenue at stake = Benchmark revenue less the page's revenue.
page AS (
  SELECT
    pc.landing_page, pc.page_type,
    SUM(pc.visits) AS visits,
    SUM(pc.orders) AS orders,
    SUM(pc.revenue) AS revenue,
    SUM(pc.visits * r.revenue_per_visit) AS benchmark_revenue
  FROM page_channel AS pc
  JOIN benchmark_rate AS r USING (page_type, channel)
  GROUP BY pc.landing_page, pc.page_type
),
page_gap AS (
  SELECT
    *,
    SAFE_DIVIDE(orders, visits) AS conversion,
    SAFE_DIVIDE(revenue, visits) AS revenue_per_visit,
    SAFE_DIVIDE(benchmark_revenue, visits) AS benchmark_revenue_per_visit,
    benchmark_revenue - revenue AS revenue_at_stake
  FROM page
),
underperforming_page AS (
  SELECT g.*
  FROM page_gap AS g
  CROSS JOIN site
  CROSS JOIN cut
  WHERE g.visits >= cut.min_visit_share * site.visits
    AND g.revenue_per_visit <= (1 - cut.min_gap) * g.benchmark_revenue_per_visit
    AND g.revenue_at_stake > 0
),
-- Each ranked page's channels by visits, with each one's share of the page's visits. The Find
-- query leaves it unused; audit.sql reads it.
page_channel_share AS (
  SELECT
    landing_page, channel, visits,
    SAFE_DIVIDE(visits, SUM(visits) OVER (PARTITION BY landing_page)) AS visit_share,
    ROW_NUMBER() OVER (PARTITION BY landing_page ORDER BY visits DESC) AS channel_rank
  FROM page_channel
)

-- FIND. One row with the site and period, joined to the top 10 Underperforming pages. A NULL
-- landing_page means none qualified.
SELECT
  p.date_from, p.date_to,
  site.visits AS site_visits,
  site.revenue_per_visit AS site_revenue_per_visit,
  u.landing_page, u.page_type, u.visits, u.conversion,
  u.revenue_per_visit, u.benchmark_revenue_per_visit, u.revenue_at_stake
FROM site
CROSS JOIN period AS p
LEFT JOIN (
  SELECT * FROM underperforming_page ORDER BY revenue_at_stake DESC LIMIT 10
) AS u ON TRUE
ORDER BY u.revenue_at_stake DESC
