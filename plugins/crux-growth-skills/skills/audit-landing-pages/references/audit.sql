-- AUDIT. For one page. Put find.sql's CTEs (everything above its FIND line, with `source`
-- composed) ahead of this query and run the two together as one statement. The one edit here:
-- replace <path> with the audit URL reduced by find.sql's landing page rule (scheme and host
-- dropped, query string, fragment and trailing slash cut, the home page '/').
-- Returns the page's visits, orders, conversion, revenue per visit, Benchmark revenue per visit
-- and Revenue at stake (negative where the page is ahead of its Benchmark), with its top 3
-- channels by visits and each one's share of the page's visits. No rows means the page has no
-- visits in the mart (or is an excluded page).
SELECT
  p.date_from, p.date_to, site.visits AS site_visits,
  g.landing_page, g.page_type, g.visits, g.orders, g.conversion,
  g.revenue_per_visit, g.benchmark_revenue_per_visit, g.revenue_at_stake,
  s.channel, s.visit_share, s.channel_rank
FROM page_gap AS g
JOIN page_channel_share AS s USING (landing_page)
CROSS JOIN period AS p
CROSS JOIN site
WHERE g.landing_page = '<path>'
  AND s.channel_rank <= 3
ORDER BY s.channel_rank
