-- One page's funnel against the same Page type, over the days of the period the funnel holds.
-- Start the statement with find.sql's `period` CTE (WITH period AS (...), copied as it is, with
-- the same timezone rule) so the funnel and the page's figures share one period. Then these
-- CTEs and the query at the foot. Replace the <angle-bracket> names in `source` with the columns
-- list_tables returns for `<client>-ecommerce_funnel`, and <path> in `target` with the page's
-- path as find.sql's landing page rule reduces it (the home page '/').
-- The funnel starts when the GA4 raw event stream began, so it holds only part of a long
-- period; `days` reports which part.
-- The landing page follows find.sql's landing page rule, stated there once: after `source`,
-- copy find.sql's `parsed`, `store_host` and `landing` CTEs as they are. They read `visits`,
-- which `source` here sets to total sessions, and give each row its `landing_page`: the store's
-- own path, or 'Unknown' for a row with no store page.
source AS (
  SELECT
    <date column> AS day,
    TRIM(<landing page column>) AS raw_landing_page,
    <landing page type column> AS page_type,
    LOWER(<device category column>) AS device,
    <total sessions column> AS visits,
    <engaged sessions column> AS engaged,
    <product view sessions column> AS product_view,
    <add to basket sessions column> AS add_to_basket,
    <checkout start sessions column> AS checkout_start,
    <purchase sessions column> AS purchase
  FROM `<client>-ecommerce_funnel`
),
-- parsed, store_host and landing: copied from find.sql here.
period_rows AS (
  SELECT s.*
  FROM landing AS s
  JOIN period AS p ON s.day BETWEEN p.date_from AND p.date_to
),
days AS (
  SELECT MIN(day) AS first_day, MAX(day) AS last_day FROM period_rows
),
target AS (SELECT '<path>' AS landing_page),
-- The page's own Page type, as the funnel table assigns it to the page's rows.
page_type_of AS (
  SELECT page_type
  FROM period_rows
  JOIN target USING (landing_page)
  GROUP BY page_type
  ORDER BY SUM(visits) DESC
  LIMIT 1
),
scoped AS (
  SELECT 'page' AS scope, r.*
  FROM period_rows AS r JOIN target USING (landing_page)
  UNION ALL
  SELECT 'page type' AS scope, r.*
  FROM period_rows AS r JOIN page_type_of USING (page_type)
),
-- Summed numerators and denominators. device is NULL on the all-devices row.
sums AS (
  SELECT
    scope, device,
    SUM(visits) AS sessions,
    SUM(engaged) AS engaged,
    SUM(product_view) AS product_view,
    SUM(add_to_basket) AS add_to_basket,
    SUM(checkout_start) AS checkout_start,
    SUM(purchase) AS purchase
  FROM scoped
  GROUP BY GROUPING SETS ((scope), (scope, device))
)
SELECT
  d.first_day, d.last_day,
  s.scope, s.device,
  s.sessions, s.product_view, s.add_to_basket, s.checkout_start, s.purchase,
  SAFE_DIVIDE(s.engaged, s.sessions) AS engagement_rate,
  SAFE_DIVIDE(s.product_view, s.sessions) AS product_view_rate,
  SAFE_DIVIDE(s.add_to_basket, s.product_view) AS add_to_basket_rate,
  SAFE_DIVIDE(s.checkout_start, s.add_to_basket) AS checkout_start_rate,
  SAFE_DIVIDE(s.purchase, s.checkout_start) AS checkout_completion_rate,
  SAFE_DIVIDE(s.purchase, s.sessions) AS session_purchase_conversion_rate
FROM sums AS s
CROSS JOIN days AS d
WHERE s.device IS NULL OR s.device IN ('mobile', 'desktop')
ORDER BY s.scope, s.device;
