-- FATIGUE. Ad x day rows in, one row per Reported ad out: status, 5-day CAC, Peak CAC, Account
-- blend, Recommendation, size, confidence and 7-day spend. Run it as written with run_sql; the
-- only edits are the two marked <angle-bracket> places below.
-- Edit 1, in `source`: the mart's name, and any column list_tables shows under another name. Where
-- the mart has no `match_status` column, delete that one condition and nothing else.
-- Edit 2, in `retargeting`: the confirmed campaign_name_keys (ARRAY<STRING>[] when none).
-- Timezone: where the brain's own instructions name the store's timezone, write the one
-- CURRENT_DATE() in `period` as CURRENT_DATE('<timezone>'), so yesterday is the store's own.
-- The grain is the three name keys, never ad_id or a display name: a rename keeps its key, and
-- one key can hold many ids. `reach` is never summed. `purchases` is never read.
-- CAC is spend over new_orders. Day-of-week normalising divides each day's spend by that
-- weekday's index, which is the same as dividing each day's CAC by it, so every window's CAC
-- below is adj_spend over new_orders. Each comparison is written as spend >= multiple x CAC x
-- orders, so an ad with no new orders in the window counts as infinitely above any CAC.
WITH
-- Every threshold, stated once. The rolling frames in `rolling` are the 5 and 7 day windows.
cut AS (
  SELECT
    60 AS history_days,
    5 AS current_days,
    42 AS peak_lookback_days,
    7 AS reported_days,
    300 AS floor_life_spend,
    2 AS floor_age_days,
    30 AS floor_daily_spend,
    1.20 AS low_efficiency,
    1.50 AS fatigued,
    1.20 AS fatiguing,
    1.20 AS improving,
    0.80 AS winner,
    100 AS reported_spend,
    30 AS run_rate_days,
    20 AS high_orders,
    8 AS medium_orders
),
-- The last 60 complete days, ending yesterday.
period AS (
  SELECT
    DATE_SUB(CURRENT_DATE(), INTERVAL c.history_days DAY) AS date_from,
    DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) AS date_to
  FROM cut AS c
),
-- The one place that names mart columns. Rows with no ad drop out of judging and out of every
-- blend.
source AS (
  SELECT
    date AS day,
    campaign_name_key,
    adset_name_key,
    ad_name_key,
    campaign_name,
    ad_group,
    ad,
    campaign_type,
    COALESCE(spend, 0) AS spend,
    COALESCE(new_orders, 0) AS new_orders,
    ad_age
  FROM `<client>-meta_performance`
  WHERE COALESCE(ad, '') != 'Unknown'
    AND COALESCE(match_status, '') != 'unrendered_template'
),
-- The campaigns the user confirmed as retargeting or existing-customer. Judged against their own
-- Account blend; every other ad against the rest.
retargeting AS (
  SELECT campaign_name_key
  FROM UNNEST(ARRAY<STRING>['<campaign_name_key>', '<campaign_name_key>']) AS campaign_name_key
),
daily AS (
  SELECT
    s.day, s.campaign_name_key, s.adset_name_key, s.ad_name_key,
    SUM(s.spend) AS spend, SUM(s.new_orders) AS new_orders
  FROM source AS s
  CROSS JOIN period AS p
  WHERE s.day <= p.date_to
  GROUP BY 1, 2, 3, 4
),
-- Spend over the ad's whole life, for the first Eligibility floor.
lifetime AS (
  SELECT campaign_name_key, adset_name_key, ad_name_key, SUM(spend) AS life_spend
  FROM daily
  GROUP BY 1, 2, 3
),
window_days AS (
  SELECT d.*
  FROM daily AS d
  CROSS JOIN period AS p
  WHERE d.day >= p.date_from
),
-- The account's CAC on each weekday over its CAC on all 60 days. The index every day is divided by.
dow_totals AS (
  SELECT EXTRACT(DAYOFWEEK FROM day) AS dow, SUM(spend) AS spend, SUM(new_orders) AS new_orders
  FROM window_days
  GROUP BY 1
),
dow AS (
  SELECT
    dow,
    COALESCE(
      SAFE_DIVIDE(
        SAFE_DIVIDE(spend, new_orders),
        SAFE_DIVIDE(SUM(spend) OVER (), SUM(new_orders) OVER ())
      ),
      1
    ) AS dow_index
  FROM dow_totals
),
-- Every ad with spend in the last 7 days. An eligible ad spends at least 150 in 5 days, so it is
-- always in here, and so is every Reported ad.
judged_ads AS (
  SELECT w.campaign_name_key, w.adset_name_key, w.ad_name_key
  FROM window_days AS w
  CROSS JOIN period AS p
  CROSS JOIN cut AS c
  WHERE w.day > DATE_SUB(p.date_to, INTERVAL c.reported_days DAY)
  GROUP BY 1, 2, 3
  HAVING SUM(w.spend) > 0
),
-- A dense ad x day grid, so a rolling frame of 5 rows is 5 days.
ad_days AS (
  SELECT
    a.campaign_name_key, a.adset_name_key, a.ad_name_key,
    grid_day AS day,
    COALESCE(w.spend, 0) AS spend,
    COALESCE(w.new_orders, 0) AS new_orders,
    COALESCE(w.spend, 0) / x.dow_index AS adj_spend
  FROM judged_ads AS a
  CROSS JOIN period AS p
  CROSS JOIN UNNEST(GENERATE_DATE_ARRAY(p.date_from, p.date_to)) AS grid_day
  LEFT JOIN window_days AS w
    ON w.campaign_name_key = a.campaign_name_key
   AND w.adset_name_key = a.adset_name_key
   AND w.ad_name_key = a.ad_name_key
   AND w.day = grid_day
  JOIN dow AS x ON x.dow = EXTRACT(DAYOFWEEK FROM grid_day)
),
-- Rolling 5-day (the current window) and 7-day (the Peak CAC window) sums, as each day stood.
rolling AS (
  SELECT
    campaign_name_key, adset_name_key, ad_name_key, day, spend, new_orders, adj_spend,
    SUM(adj_spend) OVER r5 AS adj_spend_5,
    SUM(new_orders) OVER r5 AS orders_5,
    SUM(adj_spend) OVER r7 AS adj_spend_7,
    SUM(new_orders) OVER r7 AS orders_7
  FROM ad_days
  WINDOW
    r5 AS (PARTITION BY campaign_name_key, adset_name_key, ad_name_key ORDER BY day
           ROWS BETWEEN 4 PRECEDING AND CURRENT ROW),
    r7 AS (PARTITION BY campaign_name_key, adset_name_key, ad_name_key ORDER BY day
           ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
),
-- Peak CAC: the lowest rolling 7-day CAC on any of the last 42 days. A window with no new orders
-- has no CAC and is skipped.
peak AS (
  SELECT
    r.campaign_name_key, r.adset_name_key, r.ad_name_key,
    MIN(SAFE_DIVIDE(r.adj_spend_7, r.orders_7)) AS peak_cac
  FROM rolling AS r
  CROSS JOIN period AS p
  CROSS JOIN cut AS c
  WHERE r.day > DATE_SUB(p.date_to, INTERVAL c.peak_lookback_days DAY)
  GROUP BY 1, 2, 3
),
-- The 5-day window as it stood on the last day (d0) and the two days before it (d1, d2).
ad_now AS (
  SELECT
    r.campaign_name_key, r.adset_name_key, r.ad_name_key,
    SUM(IF(r.day > DATE_SUB(p.date_to, INTERVAL c.current_days DAY), r.spend, 0)) AS spend_5,
    SUM(IF(r.day > DATE_SUB(p.date_to, INTERVAL c.reported_days DAY), r.spend, 0)) AS spend_7,
    MAX(IF(r.day = p.date_to, r.adj_spend_5, NULL)) AS adj_d0,
    MAX(IF(r.day = p.date_to, r.orders_5, NULL)) AS ord_d0,
    MAX(IF(r.day = DATE_SUB(p.date_to, INTERVAL 1 DAY), r.adj_spend_5, NULL)) AS adj_d1,
    MAX(IF(r.day = DATE_SUB(p.date_to, INTERVAL 1 DAY), r.orders_5, NULL)) AS ord_d1,
    MAX(IF(r.day = DATE_SUB(p.date_to, INTERVAL 2 DAY), r.adj_spend_5, NULL)) AS adj_d2,
    MAX(IF(r.day = DATE_SUB(p.date_to, INTERVAL 2 DAY), r.orders_5, NULL)) AS ord_d2
  FROM rolling AS r
  CROSS JOIN period AS p
  CROSS JOIN cut AS c
  GROUP BY 1, 2, 3
),
-- Display names, campaign type and age as the ad's latest row shows them.
ad_info AS (
  SELECT
    s.campaign_name_key, s.adset_name_key, s.ad_name_key,
    ARRAY_AGG(
      STRUCT(s.campaign_name, s.ad_group, s.ad, s.campaign_type, s.ad_age)
      ORDER BY s.day DESC, s.ad_age DESC LIMIT 1
    )[OFFSET(0)] AS latest
  FROM source AS s
  CROSS JOIN period AS p
  WHERE s.day BETWEEN p.date_from AND p.date_to
  GROUP BY 1, 2, 3
),
facts AS (
  SELECT
    n.campaign_name_key, n.adset_name_key, n.ad_name_key,
    i.latest.campaign_name AS campaign_name,
    i.latest.ad_group AS ad_group,
    i.latest.ad AS ad,
    i.latest.campaign_type AS campaign_type,
    i.latest.ad_age AS ad_age,
    l.life_spend,
    n.campaign_name_key IN (SELECT campaign_name_key FROM retargeting) AS is_retargeting,
    n.spend_5, n.spend_7,
    n.adj_d0, n.ord_d0, n.adj_d1, n.ord_d1, n.adj_d2, n.ord_d2,
    pk.peak_cac
  FROM ad_now AS n
  JOIN ad_info AS i USING (campaign_name_key, adset_name_key, ad_name_key)
  JOIN lifetime AS l USING (campaign_name_key, adset_name_key, ad_name_key)
  LEFT JOIN peak AS pk USING (campaign_name_key, adset_name_key, ad_name_key)
),
-- Account blend: every live ad's CAC over the 5-day window, retargeting ads together and all
-- other ads together.
blend AS (
  SELECT is_retargeting, SAFE_DIVIDE(SUM(adj_d0), SUM(ord_d0)) AS blend_cac
  FROM facts
  GROUP BY 1
),
flags AS (
  SELECT
    f.*,
    b.blend_cac,
    (
      f.life_spend >= c.floor_life_spend
      AND f.ad_age >= c.floor_age_days
      AND f.spend_5 >= c.floor_daily_spend * c.current_days
    ) AS eligible,
    f.adj_d0 >= c.low_efficiency * b.blend_cac * f.ord_d0 AS is_low_efficiency,
    f.adj_d0 <= c.winner * b.blend_cac * f.ord_d0 AS is_winner,
    -- CAC falling over the last 3 days: lower on d0 than on d2.
    f.adj_d0 * f.ord_d2 < f.adj_d2 * f.ord_d0 AS is_falling,
    (
      f.adj_d0 >= c.fatigued * f.peak_cac * f.ord_d0
      AND f.adj_d1 >= c.fatigued * f.peak_cac * f.ord_d1
      AND f.adj_d2 >= c.fatigued * f.peak_cac * f.ord_d2
    ) AS over_fatigued,
    (
      f.adj_d0 >= c.fatiguing * f.peak_cac * f.ord_d0
      AND f.adj_d1 >= c.fatiguing * f.peak_cac * f.ord_d1
    ) AS over_fatiguing,
    f.adj_d0 >= c.improving * f.peak_cac * f.ord_d0 AS over_improving
  FROM facts AS f
  JOIN blend AS b USING (is_retargeting)
  CROSS JOIN cut AS c
),
-- First match wins.
status AS (
  SELECT
    f.*,
    CASE
      WHEN f.eligible IS NOT TRUE THEN 'Ramping'
      WHEN f.is_low_efficiency THEN 'Low efficiency'
      WHEN f.over_fatigued AND NOT f.is_falling THEN 'Fatigued'
      WHEN f.over_fatiguing AND NOT f.is_falling THEN 'Fatiguing'
      WHEN f.over_improving AND f.is_falling THEN 'Improving'
      WHEN f.is_winner THEN 'Winner'
      ELSE 'Healthy'
    END AS status
  FROM flags AS f
),
-- Sizes in a month: (ad CAC - reference CAC) x new orders in the window = adj_spend - reference x
-- orders, run-rated from the 5 days to 30. Never below 0.
sized AS (
  SELECT
    s.*,
    COUNTIF(s.status != 'Ramping') OVER (PARTITION BY s.campaign_name_key, s.adset_name_key)
      AS ad_set_live_ads,
    SUM(s.spend_7) OVER () AS account_spend_7,
    CASE s.status
      WHEN 'Low efficiency' THEN 'Pause'
      WHEN 'Fatigued' THEN 'Pause and Refresh'
      WHEN 'Fatiguing' THEN 'Refresh'
      WHEN 'Winner' THEN 'Iterate'
      ELSE 'Keep'
    END AS recommendation,
    IF(s.status IN ('Low efficiency', 'Fatigued'),
       GREATEST(0, s.adj_d0 - s.blend_cac * s.ord_d0) * c.run_rate_days / c.current_days, NULL)
      AS size_pause,
    IF(s.status IN ('Fatiguing', 'Fatigued'),
       GREATEST(0, s.adj_d0 - s.peak_cac * s.ord_d0) * c.run_rate_days / c.current_days, NULL)
      AS size_refresh,
    IF(s.status = 'Winner', 1 - SAFE_DIVIDE(SAFE_DIVIDE(s.adj_d0, s.ord_d0), s.blend_cac), NULL)
      AS iterate_cac_gap,
    IF(s.status = 'Ramping', NULL,
       CASE
         WHEN s.ord_d0 >= c.high_orders THEN 'High'
         WHEN s.ord_d0 >= c.medium_orders THEN 'Medium'
         ELSE 'Low'
       END) AS confidence
  FROM status AS s
  CROSS JOIN cut AS c
)
SELECT
  campaign_name,
  ad_group,
  ad,
  campaign_type,
  campaign_name_key,
  adset_name_key,
  ad_name_key,
  is_retargeting,
  status,
  ROUND(spend_7, 2) AS spend_7d,
  ROUND(spend_5, 2) AS spend_5d,
  ord_d0 AS new_orders_5d,
  ROUND(SAFE_DIVIDE(adj_d0, ord_d0), 2) AS cac_5d,
  ROUND(peak_cac, 2) AS peak_cac,
  ROUND(blend_cac, 2) AS blend_cac,
  ROUND(life_spend, 2) AS life_spend,
  ad_age,
  recommendation,
  ROUND(size_pause, 0) AS size_pause,
  ROUND(size_refresh, 0) AS size_refresh,
  ROUND(iterate_cac_gap, 3) AS iterate_cac_gap,
  ROUND(SAFE_DIVIDE(spend_7, account_spend_7), 3) AS iterate_spend_share,
  confidence,
  ad_set_live_ads
FROM sized
CROSS JOIN cut AS c
WHERE spend_7 >= c.reported_spend
ORDER BY spend_7 DESC
