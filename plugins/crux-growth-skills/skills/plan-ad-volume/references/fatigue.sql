-- CLASSIFICATION. Ad x day rows in, one row per ad out: its status as of one day. The status is
-- audit-ads' (the same copy, which must change together with it); this file adds only the day it is
-- read as of. The code port (references/exports.md) follows it, and runs it once for each day of
-- the window to give every ad's status on every day.
-- The file has two parts. The CLASSIFICATION above `judged` judges the ads as of one day, and the
-- code port (references/exports.md) follows it. THE BRAIN PATH below `judged` judges every day of
-- the last 365 in one pass, then draws the curve and works the scalars, so a brain runs the whole
-- file as one statement and the final SELECT is its result. The code port stops at `judged`.
-- Edit 1, in `mart_rows`: the mart's name, and any column list_tables shows under another name.
-- Where the mart has no `adset_id`, write `ad_group` in its place; where it has no `campaign_id`,
-- write `campaign_name` in its place. Nothing else in `mart_rows` changes. On the brain path the
-- mart's name and its ad id column are also written in `video_plays`, and a mart with no
-- `video_views` column takes 0 there, in place of `video_views`.
-- Edit 2, in `retargeting`: the confirmed campaign_keys (ARRAY<STRING>[] when none).
-- Edit 3, in `left_out`: the campaign_keys of the awareness and lead campaigns the intake confirmed,
-- together (ARRAY<STRING>[] when none). Their rows get no status and feed no curve and no spend.
-- Edit 4, in `period`: the as-of day, for the code port only; the brain path leaves it. Replace the
-- one CURRENT_DATE() with DATE_ADD(DATE '<as_of_date>', INTERVAL 1 DAY), so the day judged is
-- <as_of_date>.
-- Timezone: where the brain's own instructions name the store's timezone, write the as-of day in it,
-- and on the brain path write it in the one CURRENT_DATE() of `win`.
-- The grain is the ad's Meta id (ad_key), never a display name: a rename keeps its id, and two ads
-- can share one name. Its ad set and campaign keys are the ones on its latest row (`keyed`), so a
-- renamed ad set or campaign, where a display name stands in as the key, never splits an ad.
-- `reach` is never summed. `purchases` is never read.
-- CAC is spend over new_orders. Day-of-week normalising divides each day's spend by that
-- weekday's index, which is the same as dividing each day's CAC by it, so every window's CAC
-- below is adj_spend over new_orders. Each comparison is written as spend >= multiple x CAC x
-- orders, so an ad with no new orders in the window counts as infinitely above any CAC.
-- Viable, in this skill, is Healthy, Winner or Improving; audit-ads reads Improving as recovering and
-- keeps it out, so the widening sits below the shared block, where the plan reads the status. A day
-- with no spend (Inactive), Ramping, Unknown or any other status is not viable. The model in
-- references/method.md counts every Launched ad at every age it has reached, and reads `spend_on_day`
-- for the day's spend.
WITH
-- BEGIN shared classification
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
-- The one place that names mart columns. The three keys: the ad is its Meta id, and its ad set and
-- campaign are their Meta ids where the mart holds them, else their display names (Edit 1). Rows
-- with no ad (an ad_id of Unknown, which takes in unrendered templates) drop out of judging and
-- out of every blend.
mart_rows AS (
  SELECT
    date AS day,
    campaign_id AS campaign_key,  -- Edit 1: campaign_name where the mart has no campaign_id
    adset_id AS adset_key,        -- Edit 1: ad_group where the mart has no adset_id
    ad_id AS ad_key,
    campaign_name,
    ad_group,
    ad,
    campaign_type,
    COALESCE(spend, 0) AS spend,
    COALESCE(new_orders, 0) AS new_orders,
    ad_age
  FROM `<client>-meta_performance`  -- Edit 1: the mart's name
  WHERE COALESCE(ad_id, 'Unknown') != 'Unknown'
),
-- The campaigns bought for awareness, reach, video views, engagement or traffic, or for leads,
-- sign-ups, giveaways or competitions, rather than purchases. CAC is the wrong measure for them, so
-- they are left out whole, each ad by its latest row's campaign key (`keyed`), so a renamed
-- campaign takes its old-name rows with it. One list holds both kinds.
left_out AS (
  SELECT campaign_key
  FROM UNNEST(ARRAY<STRING>['<campaign_key>']) AS campaign_key  -- Edit 3
),
-- The campaigns the user confirmed as retargeting or existing-customer. Judged against their own
-- Account blend; every other ad against the rest.
retargeting AS (
  SELECT campaign_key
  FROM UNNEST(ARRAY<STRING>['<campaign_key>', '<campaign_key>']) AS campaign_key  -- Edit 2
),
-- Each ad's ad set and campaign keys as its latest row shows them, a serving row first.
ad_keys AS (
  SELECT
    ad_key,
    ARRAY_AGG(STRUCT(campaign_key, adset_key)
      ORDER BY day DESC, spend DESC, campaign_key, adset_key LIMIT 1)[OFFSET(0)] AS k
  FROM mart_rows
  GROUP BY 1
),
-- Every row read, carrying its ad's one ad set and campaign key, less the ads of the awareness and
-- lead campaigns.
keyed AS (
  SELECT s.* REPLACE (k.k.campaign_key AS campaign_key, k.k.adset_key AS adset_key)
  FROM mart_rows AS s
  JOIN ad_keys AS k USING (ad_key)
  WHERE k.k.campaign_key IS NULL OR k.k.campaign_key NOT IN (SELECT campaign_key FROM left_out)
),
daily AS (
  SELECT
    s.day, s.campaign_key, s.adset_key, s.ad_key,
    SUM(s.spend) AS spend, SUM(s.new_orders) AS new_orders
  FROM keyed AS s
  CROSS JOIN period AS p
  WHERE s.day <= p.date_to
  GROUP BY 1, 2, 3, 4
),
-- Spend over the ad's whole life, for the first Eligibility floor.
lifetime AS (
  SELECT campaign_key, adset_key, ad_key, SUM(spend) AS life_spend
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
  SELECT w.campaign_key, w.adset_key, w.ad_key
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
    a.campaign_key, a.adset_key, a.ad_key,
    grid_day AS day,
    COALESCE(w.spend, 0) AS spend,
    COALESCE(w.new_orders, 0) AS new_orders,
    COALESCE(w.spend, 0) / x.dow_index AS adj_spend
  FROM judged_ads AS a
  CROSS JOIN period AS p
  CROSS JOIN UNNEST(GENERATE_DATE_ARRAY(p.date_from, p.date_to)) AS grid_day
  LEFT JOIN window_days AS w
    ON w.campaign_key = a.campaign_key
   AND w.adset_key = a.adset_key
   AND w.ad_key = a.ad_key
   AND w.day = grid_day
  JOIN dow AS x ON x.dow = EXTRACT(DAYOFWEEK FROM grid_day)
),
-- Rolling 5-day (the current window) and 7-day (the Peak CAC window) sums, as each day stood.
rolling AS (
  SELECT
    campaign_key, adset_key, ad_key, day, spend, new_orders, adj_spend,
    SUM(adj_spend) OVER r5 AS adj_spend_5,
    SUM(new_orders) OVER r5 AS orders_5,
    SUM(adj_spend) OVER r7 AS adj_spend_7,
    SUM(new_orders) OVER r7 AS orders_7
  FROM ad_days
  WINDOW
    r5 AS (PARTITION BY campaign_key, adset_key, ad_key ORDER BY day
           ROWS BETWEEN 4 PRECEDING AND CURRENT ROW),
    r7 AS (PARTITION BY campaign_key, adset_key, ad_key ORDER BY day
           ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
),
-- Peak CAC: the lowest rolling 7-day CAC on any of the last 42 days. A window with no new orders
-- has no CAC and is skipped.
peak AS (
  SELECT
    r.campaign_key, r.adset_key, r.ad_key,
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
    r.campaign_key, r.adset_key, r.ad_key,
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
-- Display names and campaign type as the ad's latest row shows them, a serving row first where
-- that day has several. Age is the highest on any row in the 60 days, never the latest row's: a
-- row carrying only orders or visits, with no impressions, reads an age of zero, and is often
-- the latest.
ad_info AS (
  SELECT
    s.campaign_key, s.adset_key, s.ad_key,
    ARRAY_AGG(
      STRUCT(s.campaign_name, s.ad_group, s.ad, s.campaign_type)
      ORDER BY s.day DESC, s.spend DESC, s.ad_age DESC, s.campaign_name, s.ad_group, s.ad LIMIT 1
    )[OFFSET(0)] AS latest,
    MAX(s.ad_age) AS ad_age
  FROM keyed AS s
  CROSS JOIN period AS p
  WHERE s.day BETWEEN p.date_from AND p.date_to
  GROUP BY 1, 2, 3
),
facts AS (
  SELECT
    n.campaign_key, n.adset_key, n.ad_key,
    i.latest.campaign_name AS campaign_name,
    i.latest.ad_group AS ad_group,
    i.latest.ad AS ad,
    i.latest.campaign_type AS campaign_type,
    i.ad_age,
    l.life_spend,
    n.campaign_key IN (SELECT campaign_key FROM retargeting) AS is_retargeting,
    n.spend_5, n.spend_7,
    n.adj_d0, n.ord_d0, n.adj_d1, n.ord_d1, n.adj_d2, n.ord_d2,
    pk.peak_cac
  FROM ad_now AS n
  JOIN ad_info AS i USING (campaign_key, adset_key, ad_key)
  JOIN lifetime AS l USING (campaign_key, adset_key, ad_key)
  LEFT JOIN peak AS pk USING (campaign_key, adset_key, ad_key)
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
-- END shared classification
-- The ads as of the as-of day: the status above, with the day's spend and what the model reads.
judged AS (
  SELECT
    s.campaign_key, s.adset_key, s.ad_key,
    s.campaign_name,
    s.ad_group,
    s.ad,
    s.is_retargeting,
    s.status,
    s.ad_age,
    ROUND(COALESCE(d.spend, 0), 2) AS spend_on_day,
    ROUND(s.spend_5, 2) AS spend_5d,
    ROUND(SAFE_DIVIDE(s.adj_d0, s.ord_d0), 2) AS cac_5d,
    ROUND(s.blend_cac, 2) AS blend_cac
  FROM status AS s
  CROSS JOIN period AS p
  LEFT JOIN daily AS d
    ON d.campaign_key = s.campaign_key
   AND d.adset_key = s.adset_key
   AND d.ad_key = s.ad_key
   AND d.day = p.date_to
),
-- THE BRAIN PATH. It reads `cut`, `keyed` and `retargeting` from the shared block and nothing
-- else of it: every window and floor is `cut`'s, and the lines below add only the plan's own. It
-- restates `status` for every day in one pass instead of one day, so the CASE in `ad_day_status`
-- must change together with `status` above and with audit-ads. Everything is bounded to the window.
plan_cut AS (
  SELECT
    365 AS window_days,
    3 AS curve_min_ads,
    28 AS hit_days,
    1.20 AS hit_cac_ratio,
    300 AS spend_bar_floor,
    3 AS spend_bar_days,
    3 AS pipeline_months,
    8 AS format_weeks,
    6 AS warmup_weeks,
    0.25 AS thin_week_share,
    1.20 AS viable_share_headroom,
    0.50 AS loaded_share,
    10 AS best_min_ads,
    4 AS best_min_months,
    60 AS quarter_age_days,
    10 AS best_min_hits,
    2 AS best_min_quarters,
    0.80 AS on_track_share,
    1.20 AS volume_reach,
    90 AS table_days,
    30 AS recent_days,
    30 AS evergreen_age_days,
    5 AS top_ads,
    7 AS week_one_days,
    1 AS outlier_sds,
    10 AS turnover_ads,
    2 AS turnover_min_quarters,
    3 AS power_months,
    42 AS warmup_launch_days,
    28 AS fit_days,
    0.5 AS fit_min,
    2.0 AS fit_max
),
-- The last 365 complete days, ending yesterday. `this_monday` starts the ISO week holding today and
-- `this_month` the calendar month holding today, so the month before it is the last complete month.
win AS (
  SELECT
    DATE_SUB(CURRENT_DATE(), INTERVAL p.window_days DAY) AS date_from,
    DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) AS date_to,
    DATE_TRUNC(CURRENT_DATE(), ISOWEEK) AS this_monday,
    DATE_TRUNC(CURRENT_DATE(), MONTH) AS this_month
  FROM plan_cut AS p
),
win_rows AS (
  SELECT
    s.day, s.campaign_key, s.ad_key,
    s.ad, s.spend, s.new_orders, s.ad_age
  FROM keyed AS s
  CROSS JOIN win AS w
  WHERE s.day BETWEEN w.date_from AND w.date_to
),
-- The first day the mart holds inside the window: an ad first spending on or after it plus
-- warmup_launch_days is a Launched ad.
first_day AS (
  SELECT MIN(day) AS day
  FROM win_rows
),
-- One row per ad per day; life_spend is the ad's spend over the window up to that day, and ad_age
-- the highest on any row up to that day, as `ad_info` reads it: a row with no impressions reads 0.
daily_win AS (
  SELECT
    ad_key, day,
    SUM(spend) AS spend, SUM(new_orders) AS new_orders,
    MAX(MAX(ad_age)) OVER (PARTITION BY ad_key ORDER BY day) AS ad_age,
    SUM(SUM(spend)) OVER (PARTITION BY ad_key ORDER BY day) AS life_spend
  FROM win_rows
  GROUP BY ad_key, day
),
spent AS (
  SELECT *
  FROM daily_win
  WHERE spend > 0
),
-- For each day as the day judged, the account's CAC on each weekday over its CAC on all history_days
-- days to that day; the index every day in that day's windows is divided by.
brain_dow_totals AS (
  SELECT
    d AS as_of, k AS dow,
    COALESCE(SUM(a.spend), 0) AS spend, COALESCE(SUM(a.new_orders), 0) AS new_orders
  FROM win AS w
  CROSS JOIN cut AS c
  CROSS JOIN UNNEST(GENERATE_DATE_ARRAY(w.date_from, w.date_to)) AS d
  CROSS JOIN UNNEST(GENERATE_ARRAY(1, 7)) AS k
  LEFT JOIN (
    SELECT day, EXTRACT(DAYOFWEEK FROM day) AS dow, SUM(spend) AS spend, SUM(new_orders) AS new_orders
    FROM daily_win
    GROUP BY day
  ) AS a
    ON a.dow = k AND a.day BETWEEN DATE_SUB(d, INTERVAL (c.history_days - 1) DAY) AND d
  GROUP BY d, k
),
dow_index AS (
  SELECT
    as_of, dow,
    COALESCE(
      SAFE_DIVIDE(
        SAFE_DIVIDE(spend, new_orders),
        SAFE_DIVIDE(SUM(spend) OVER (PARTITION BY as_of), SUM(new_orders) OVER (PARTITION BY as_of))
      ),
      1
    ) AS dow_index
  FROM brain_dow_totals
),
-- Every ad with spend in the reported_days to a day, for each such day.
judged_days AS (
  SELECT DISTINCT s.ad_key, d AS as_of
  FROM spent AS s
  CROSS JOIN win AS w
  CROSS JOIN cut AS c
  CROSS JOIN UNNEST(GENERATE_DATE_ARRAY(s.day, LEAST(DATE_ADD(s.day, INTERVAL (c.reported_days - 1) DAY), w.date_to))) AS d
),
-- Each such ad's dense days back to the start of its Peak CAC lookback, divided by that day's
-- weekday index. The windows start where the mart starts; there the rows that exist are read.
ad_grid AS (
  SELECT
    j.ad_key, j.as_of, g AS day,
    COALESCE(dw.spend, 0) AS spend,
    COALESCE(dw.new_orders, 0) AS new_orders,
    COALESCE(dw.spend, 0) / x.dow_index AS adj_spend
  FROM judged_days AS j
  CROSS JOIN win AS w
  CROSS JOIN cut AS c
  CROSS JOIN UNNEST(GENERATE_DATE_ARRAY(GREATEST(w.date_from, DATE_SUB(j.as_of, INTERVAL ((c.peak_lookback_days - 1) + (c.reported_days - 1)) DAY)), j.as_of)) AS g
  LEFT JOIN daily_win AS dw ON dw.ad_key = j.ad_key AND dw.day = g
  JOIN dow_index AS x ON x.as_of = j.as_of AND x.dow = EXTRACT(DAYOFWEEK FROM g)
),
grid_rolling AS (
  SELECT
    ad_key, as_of, day, spend,
    SUM(adj_spend) OVER r5 AS adj_spend_5,
    SUM(new_orders) OVER r5 AS orders_5,
    SUM(spend) OVER r5 AS spend_5,
    SUM(adj_spend) OVER r7 AS adj_spend_7,
    SUM(new_orders) OVER r7 AS orders_7
  FROM ad_grid
  WINDOW
    r5 AS (PARTITION BY ad_key, as_of ORDER BY day ROWS BETWEEN 4 PRECEDING AND CURRENT ROW),
    r7 AS (PARTITION BY ad_key, as_of ORDER BY day ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
),
-- The ad as it stood on each day it was judged: the 5-day window on that day (d0) and the two days
-- before it (d1, d2), and the Peak CAC over the peak_lookback_days to it.
ad_day AS (
  SELECT
    r.ad_key, r.as_of,
    MAX(IF(r.day = r.as_of, r.spend_5, NULL)) AS spend_5,
    MAX(IF(r.day = r.as_of, r.adj_spend_5, NULL)) AS adj_d0,
    MAX(IF(r.day = r.as_of, r.orders_5, NULL)) AS ord_d0,
    MAX(IF(r.day = DATE_SUB(r.as_of, INTERVAL 1 DAY), r.adj_spend_5, NULL)) AS adj_d1,
    MAX(IF(r.day = DATE_SUB(r.as_of, INTERVAL 1 DAY), r.orders_5, NULL)) AS ord_d1,
    MAX(IF(r.day = DATE_SUB(r.as_of, INTERVAL 2 DAY), r.adj_spend_5, NULL)) AS adj_d2,
    MAX(IF(r.day = DATE_SUB(r.as_of, INTERVAL 2 DAY), r.orders_5, NULL)) AS ord_d2,
    MIN(IF(r.day > DATE_SUB(r.as_of, INTERVAL c.peak_lookback_days DAY),
           SAFE_DIVIDE(r.adj_spend_7, r.orders_7), NULL)) AS peak_cac
  FROM grid_rolling AS r
  CROSS JOIN cut AS c
  GROUP BY r.ad_key, r.as_of
),
-- One row per ad: `keyed` gives each ad one campaign key, its latest row's.
ad_campaign AS (
  SELECT
    ad_key,
    LOGICAL_OR(campaign_key IN (SELECT campaign_key FROM retargeting)) AS is_retargeting
  FROM win_rows
  GROUP BY ad_key
),
-- Account blend on each day: every ad judged that day, retargeting ads together and all others.
blend_day AS (
  SELECT a.as_of, k.is_retargeting, SAFE_DIVIDE(SUM(a.adj_d0), SUM(a.ord_d0)) AS blend_cac
  FROM ad_day AS a
  JOIN ad_campaign AS k USING (ad_key)
  GROUP BY a.as_of, k.is_retargeting
),
day_flags AS (
  SELECT
    s.ad_key, s.day, s.spend,
    b.blend_cac,
    (
      s.life_spend >= c.floor_life_spend
      AND s.ad_age >= c.floor_age_days
      AND a.spend_5 >= c.floor_daily_spend * c.current_days
    ) AS eligible,
    a.adj_d0 >= c.low_efficiency * b.blend_cac * a.ord_d0 AS is_low_efficiency,
    a.adj_d0 <= c.winner * b.blend_cac * a.ord_d0 AS is_winner,
    a.adj_d0 * a.ord_d2 < a.adj_d2 * a.ord_d0 AS is_falling,
    (
      a.adj_d0 >= c.fatigued * a.peak_cac * a.ord_d0
      AND a.adj_d1 >= c.fatigued * a.peak_cac * a.ord_d1
      AND a.adj_d2 >= c.fatigued * a.peak_cac * a.ord_d2
    ) AS over_fatigued,
    (
      a.adj_d0 >= c.fatiguing * a.peak_cac * a.ord_d0
      AND a.adj_d1 >= c.fatiguing * a.peak_cac * a.ord_d1
    ) AS over_fatiguing,
    a.adj_d0 >= c.improving * a.peak_cac * a.ord_d0 AS over_improving
  FROM spent AS s
  JOIN ad_day AS a ON a.ad_key = s.ad_key AND a.as_of = s.day
  JOIN ad_campaign AS k ON k.ad_key = s.ad_key
  JOIN blend_day AS b ON b.as_of = s.day AND b.is_retargeting = k.is_retargeting
  CROSS JOIN cut AS c
),
-- Every ad's status on every day it spent. First match wins.
ad_day_status AS (
  SELECT
    f.ad_key, f.day, f.spend,
    CASE
      WHEN f.eligible IS NOT TRUE THEN 'Ramping'
      WHEN f.is_low_efficiency THEN 'Low efficiency'
      WHEN f.over_fatigued AND NOT f.is_falling THEN 'Fatigued'
      WHEN f.over_fatiguing AND NOT f.is_falling THEN 'Fatiguing'
      WHEN f.over_improving AND f.is_falling THEN 'Improving'
      WHEN f.is_winner THEN 'Winner'
      ELSE 'Healthy'
    END AS status
  FROM day_flags AS f
),
-- Display names as the ad's latest row shows them, and whether it had any 3-second video plays in
-- the rows read. Format reads these two.
ad_names AS (
  SELECT ad_key, ARRAY_AGG(ad IGNORE NULLS ORDER BY day DESC LIMIT 1)[SAFE_OFFSET(0)] AS ad_name
  FROM win_rows
  GROUP BY ad_key
),
video_plays AS (
  SELECT
    ad_id AS ad_key,
    SUM(COALESCE(video_views, 0)) > 0 AS had_video
  FROM `<client>-meta_performance`
  CROSS JOIN win AS w
  WHERE date BETWEEN w.date_from AND w.date_to
    AND COALESCE(ad_id, 'Unknown') != 'Unknown'
  GROUP BY ad_key
),
-- BEGIN model
-- Reads only ad_day_status, daily_win, win, first_day, plan_cut, and (in the shared format block) win_rows,
-- ad_names and video_plays.
-- BigQuery copies a CTE in full at every place it is used, so the per-day status grid above is read
-- exactly once, in `pack`, and every step after it reads only the step before it, once: `m1` to
-- `m10` each add their measures as subqueries over the arrays already in the row. Never read
-- `ad_day_status`, `daily_win` or a step other than the one before it from a later step, and add a
-- new measure inside the chain the same way: a CTE read in several places multiplies the status grid
-- and the brain refuses the statement ("query is too complex"). The shared format block reads only
-- win_rows, ad_names and video_plays, so it stands alone. Definitions are those of
-- references/method.md; the chain changes how the statement is built, not what it computes.
-- A Launched ad: its first day of spend falls on or after the window's first day plus
-- warmup_launch_days (the first weeks are judged before the weekday index, life spend and Peak CAC
-- warm up). Age is the days since that day, so the first day is age 0.
pack AS (
  SELECT
    ARRAY(
      SELECT AS STRUCT d.ad_key, d.day, d.spend, d.new_orders, d.life_spend, s.status
      FROM daily_win AS d
      LEFT JOIN ad_day_status AS s ON s.ad_key = d.ad_key AND s.day = d.day
    ) AS dw
),
m1 AS (
  SELECT k.dw, (SELECT MIN(x.day) FROM UNNEST(k.dw) AS x) AS first_day
  FROM pack AS k
),
m2 AS (
  SELECT
    m.*,
    ARRAY(
      SELECT AS STRUCT x.ad_key, MIN(x.day) AS first_spend
      FROM UNNEST(m.dw) AS x
      WHERE x.status IS NOT NULL
      GROUP BY x.ad_key
      HAVING MIN(x.day) >= DATE_ADD(m.first_day, INTERVAL p.warmup_launch_days DAY)
    ) AS launched,
    (
      SELECT COALESCE(MAX(IF(t.is_loaded, t.day, NULL)), ANY_VALUE(w.date_to))
      FROM (
        SELECT
          r.day,
          r.spend >= p.loaded_share * AVG(r.spend) OVER prior
            AND r.new_orders >= p.loaded_share * AVG(r.new_orders) OVER prior AS is_loaded
        FROM (
          SELECT g AS day, COALESCE(SUM(x.spend), 0) AS spend, COALESCE(SUM(x.new_orders), 0) AS new_orders
          FROM UNNEST(GENERATE_DATE_ARRAY(DATE_SUB(w.date_to, INTERVAL 20 DAY), w.date_to)) AS g
          LEFT JOIN (SELECT * FROM UNNEST(m.dw)) AS x ON x.day = g
          GROUP BY g
        ) AS r
        WINDOW prior AS (ORDER BY r.day ROWS BETWEEN 7 PRECEDING AND 1 PRECEDING)
      ) AS t
      WHERE t.day > DATE_SUB(w.date_to, INTERVAL 14 DAY)
    ) AS today
  FROM m1 AS m
  CROSS JOIN win AS w
  CROSS JOIN plan_cut AS p
),
m3 AS (
  SELECT
    m.*,
    ARRAY(
      SELECT AS STRUCT
        r.age, r.reached,
        COALESCE(v.viable, 0) AS viable,
        SAFE_DIVIDE(COALESCE(v.viable, 0), r.reached) AS survival,
        COALESCE(v.viable_spend, 0) AS viable_spend
      FROM (
        SELECT a AS age, COUNT(*) AS reached
        FROM UNNEST(m.launched) AS l
        CROSS JOIN UNNEST(GENERATE_ARRAY(0, DATE_DIFF(w.date_to, l.first_spend, DAY))) AS a
        GROUP BY a
      ) AS r
      LEFT JOIN (
        SELECT DATE_DIFF(x.day, l.first_spend, DAY) AS age, COUNT(*) AS viable, SUM(x.spend) AS viable_spend
        FROM UNNEST(m.dw) AS x
        JOIN (SELECT * FROM UNNEST(m.launched)) AS l ON l.ad_key = x.ad_key
        WHERE x.status IN ('Healthy', 'Winner', 'Improving')
        GROUP BY age
      ) AS v USING (age)
      WHERE r.reached >= p.curve_min_ads
      ORDER BY r.age
    ) AS curve,
    (
      SELECT AVG(c.age_cleared)
      FROM (
        SELECT age_cleared, ROW_NUMBER() OVER (ORDER BY age_cleared) AS rn, COUNT(*) OVER () AS n
        FROM (
          SELECT DATE_DIFF(MIN(x.day), ANY_VALUE(l.first_spend), DAY) AS age_cleared
          FROM UNNEST(m.launched) AS l
          JOIN (SELECT * FROM UNNEST(m.dw)) AS x ON x.ad_key = l.ad_key
          WHERE x.status != 'Ramping'
          GROUP BY l.ad_key
        )
      ) AS c
      WHERE c.rn IN (DIV(c.n + 1, 2), DIV(c.n + 2, 2))
    ) AS days_to_clear_ramping,
    (
      SELECT AS STRUCT
        COUNTIF(x.status IN ('Healthy', 'Winner', 'Improving')) AS viable_ads,
        COUNTIF(x.status != 'Ramping') AS live_past_ramping,
        COUNTIF(x.status IN ('Fatiguing', 'Fatigued', 'Low efficiency')) AS worn_out_now
      FROM UNNEST(m.dw) AS x
      WHERE x.status IS NOT NULL AND x.day = m.today
    ) AS tc,
    (
      SELECT AS STRUCT c.monthly_spend, c.month_days, c.monthly_spend / c.month_days AS daily_spend
      FROM (
        SELECT
          SUM(x.spend) AS monthly_spend,
          DATE_DIFF(ANY_VALUE(w.this_month), DATE_SUB(ANY_VALUE(w.this_month), INTERVAL 1 MONTH), DAY) AS month_days
        FROM UNNEST(m.dw) AS x
        WHERE x.day >= DATE_SUB(w.this_month, INTERVAL 1 MONTH) AND x.day < w.this_month
      ) AS c
    ) AS cs,
    (
      SELECT AS STRUCT v.*, LEAST(1, v.p90 * p.viable_share_headroom) AS viable_share_target
      FROM (
        SELECT
          ARRAY_LENGTH(GENERATE_DATE_ARRAY(
            DATE_TRUNC(DATE_ADD(m.first_day, INTERVAL 6 DAY), ISOWEEK),
            DATE_SUB(DATE_TRUNC(DATE_ADD(w.date_to, INTERVAL 1 DAY), ISOWEEK), INTERVAL 7 DAY),
            INTERVAL 7 DAY)) AS complete_weeks,
          COUNT(*) AS weeks_counted,
          MAX(IF(s.rn = DIV(9 * s.n + 9, 10), s.viable_share, NULL)) AS p90,
          MAX(s.median_ramping) AS ramping_share,
          MAX(s.median_worn_out) AS worn_out_share
        FROM (
          SELECT
            q.viable_share,
            ROW_NUMBER() OVER (ORDER BY q.viable_share) AS rn,
            COUNT(*) OVER () AS n,
            PERCENTILE_CONT(q.ramping_share, 0.5) OVER () AS median_ramping,
            PERCENTILE_CONT(q.worn_out_share, 0.5) OVER () AS median_worn_out
          FROM (
            SELECT
              SAFE_DIVIDE(k.viable_spend, k.spend) AS viable_share,
              SAFE_DIVIDE(k.ramping_spend, k.spend) AS ramping_share,
              SAFE_DIVIDE(k.worn_out_spend, k.spend) AS worn_out_share
            FROM (
              SELECT c.*, PERCENTILE_CONT(c.spend, 0.5) OVER () AS median_spend
              FROM (
                SELECT
                  g AS week_start,
                  ROW_NUMBER() OVER (ORDER BY g) AS week_no,
                  COALESCE(k.spend, 0) AS spend,
                  COALESCE(k.viable_spend, 0) AS viable_spend,
                  COALESCE(k.ramping_spend, 0) AS ramping_spend,
                  COALESCE(k.worn_out_spend, 0) AS worn_out_spend
                FROM UNNEST(GENERATE_DATE_ARRAY(
                  DATE_TRUNC(DATE_ADD(m.first_day, INTERVAL 6 DAY), ISOWEEK),
                  DATE_SUB(DATE_TRUNC(DATE_ADD(w.date_to, INTERVAL 1 DAY), ISOWEEK), INTERVAL 7 DAY),
                  INTERVAL 7 DAY)) AS g
                LEFT JOIN (
                  SELECT
                    DATE_TRUNC(x.day, ISOWEEK) AS week_start,
                    SUM(x.spend) AS spend,
                    SUM(IF(x.status IN ('Healthy', 'Winner', 'Improving'), x.spend, 0)) AS viable_spend,
                    SUM(IF(x.status = 'Ramping', x.spend, 0)) AS ramping_spend,
                    SUM(IF(x.status IN ('Fatiguing', 'Fatigued', 'Low efficiency'), x.spend, 0)) AS worn_out_spend
                  FROM UNNEST(m.dw) AS x
                  WHERE x.status IS NOT NULL
                  GROUP BY week_start
                ) AS k ON k.week_start = g
              ) AS c
              WHERE c.week_no > p.warmup_weeks
            ) AS k
            WHERE k.spend > 0 AND k.spend >= p.thin_week_share * k.median_spend
          ) AS q
        ) AS s
      ) AS v
    ) AS st,
    (
      SELECT AS STRUCT
        SAFE_DIVIDE(SUM(IF(r.recency <= p.pipeline_months, r.launches, 0)), COUNTIF(r.recency <= p.pipeline_months)) AS current_pipeline,
        COUNTIF(r.recency <= p.pipeline_months) AS months_used,
        SUM(IF(r.recency <= p.pipeline_months, r.launches, 0)) AS pipeline_launches,
        SUM(IF(r.recency <= p.pipeline_months, r.month_days, 0)) AS pipeline_days,
        MAX(IF(r.months_in_frame = p.pipeline_months, r.avg_launches, NULL)) AS launches_best
      FROM (
        SELECT
          month_start, month_days, launches,
          ROW_NUMBER() OVER (ORDER BY month_start DESC) AS recency,
          AVG(launches) OVER r3 AS avg_launches,
          COUNT(*) OVER r3 AS months_in_frame
        FROM (
          SELECT
            g AS month_start,
            DATE_DIFF(DATE_ADD(g, INTERVAL 1 MONTH), g, DAY) AS month_days,
            COUNTIF(l.ad_key IS NOT NULL) AS launches
          FROM UNNEST(GENERATE_DATE_ARRAY(
            DATE_ADD(DATE_TRUNC(m.first_day, MONTH), INTERVAL 1 MONTH),
            DATE_SUB(w.this_month, INTERVAL 1 MONTH),
            INTERVAL 1 MONTH)) AS g
          LEFT JOIN (SELECT * FROM UNNEST(m.launched)) AS l ON DATE_TRUNC(l.first_spend, MONTH) = g
          GROUP BY g
        )
        WINDOW r3 AS (ORDER BY month_start ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
      ) AS r
    ) AS pl,
    (
      SELECT AS STRUCT
        SAFE_DIVIDE(SUM(a.aged_spend), SUM(a.spend)) AS evergreen_share,
        SAFE_DIVIDE(SUM(IF(a.rk <= p.top_ads, a.spend, 0)), SUM(a.spend)) AS top5_concentration
      FROM (
        SELECT ad_key, spend, aged_spend, ROW_NUMBER() OVER (ORDER BY spend DESC, ad_key) AS rk
        FROM (
          SELECT
            d.ad_key,
            SUM(d.spend) AS spend,
            SUM(IF(l.ad_key IS NULL OR DATE_DIFF(d.day, f.first_spend, DAY) >= p.evergreen_age_days, d.spend, 0)) AS aged_spend
          FROM UNNEST(m.dw) AS d
          JOIN (
            SELECT x.ad_key, MIN(x.day) AS first_spend
            FROM UNNEST(m.dw) AS x
            WHERE x.spend > 0
            GROUP BY x.ad_key
          ) AS f ON f.ad_key = d.ad_key
          LEFT JOIN (SELECT * FROM UNNEST(m.launched)) AS l ON l.ad_key = d.ad_key
          WHERE d.spend > 0
            AND d.day BETWEEN DATE_SUB(m.today, INTERVAL (p.recent_days - 1) DAY) AND m.today
          GROUP BY d.ad_key
        )
      ) AS a
    ) AS rs,
    ARRAY(
      SELECT AS STRUCT l.ad_key, l.first_spend, SUM(d.spend) AS spend
      FROM UNNEST(m.launched) AS l
      JOIN (SELECT * FROM UNNEST(m.dw) WHERE spend > 0) AS d ON d.ad_key = l.ad_key
      GROUP BY l.ad_key, l.first_spend
    ) AS launched_spend,
    ARRAY(
      SELECT AS STRUCT r.quarter_start, SUM(SAFE_DIVIDE(COALESCE(v.viable, 0), r.reached)) AS quarter_lifespan
      FROM (
        SELECT DATE_TRUNC(l.first_spend, QUARTER) AS quarter_start, a AS age, COUNT(*) AS reached
        FROM UNNEST(m.launched) AS l
        CROSS JOIN UNNEST(GENERATE_ARRAY(0, DATE_DIFF(w.date_to, l.first_spend, DAY))) AS a
        GROUP BY quarter_start, age
      ) AS r
      LEFT JOIN (
        SELECT
          DATE_TRUNC(l.first_spend, QUARTER) AS quarter_start,
          DATE_DIFF(x.day, l.first_spend, DAY) AS age,
          COUNT(*) AS viable
        FROM UNNEST(m.dw) AS x
        JOIN (SELECT * FROM UNNEST(m.launched)) AS l ON l.ad_key = x.ad_key
        WHERE x.status IN ('Healthy', 'Winner', 'Improving')
        GROUP BY quarter_start, age
      ) AS v USING (quarter_start, age)
      WHERE r.reached >= p.curve_min_ads
      GROUP BY r.quarter_start
    ) AS quarter_w,
    (
      SELECT AS STRUCT
        COUNT(*) AS complete_quarters,
        ARRAY_AGG(STRUCT(t.quarter_start, t.new_ads, t.top_ads_counted, t.new_spend_share) ORDER BY t.quarter_start) AS quarters
      FROM (
        SELECT
          u.quarter_start,
          COUNT(*) AS top_ads_counted,
          COUNTIF(u.is_new) AS new_ads,
          SAFE_DIVIDE(SUM(IF(u.is_new, u.spend, 0)), ANY_VALUE(u.quarter_spend)) AS new_spend_share
        FROM (
          SELECT
            k.quarter_start, k.spend, k.quarter_spend,
            l.ad_key IS NOT NULL AND DATE_TRUNC(l.first_spend, QUARTER) = k.quarter_start AS is_new
          FROM (
            SELECT
              q.quarter_start, q.ad_key, q.spend,
              ROW_NUMBER() OVER (PARTITION BY q.quarter_start ORDER BY q.spend DESC, q.ad_key) AS rk,
              SUM(q.spend) OVER (PARTITION BY q.quarter_start) AS quarter_spend
            FROM (
              SELECT DATE_TRUNC(x.day, QUARTER) AS quarter_start, x.ad_key, SUM(x.spend) AS spend
              FROM UNNEST(m.dw) AS x
              WHERE x.spend > 0
              GROUP BY quarter_start, x.ad_key
            ) AS q
            WHERE q.quarter_start >= m.first_day AND LAST_DAY(q.quarter_start, QUARTER) <= w.date_to
          ) AS k
          -- New in a quarter is any ad first spending in it after the window's first day, warm-up
          -- launches included: Top-10 turnover keeps its own quarter rule, not the Launched ad's.
          LEFT JOIN (
            SELECT x.ad_key, MIN(x.day) AS first_spend
            FROM UNNEST(m.dw) AS x
            WHERE x.status IS NOT NULL
            GROUP BY x.ad_key
            HAVING MIN(x.day) > m.first_day
          ) AS l ON l.ad_key = k.ad_key
          WHERE k.rk <= p.turnover_ads
        ) AS u
        GROUP BY u.quarter_start
      ) AS t
    ) AS tt,
    (
      SELECT AS STRUCT
        COUNT(*) AS months_counted,
        ARRAY_AGG(STRUCT(t.month_start, t.spend, t.new_orders, SAFE_DIVIDE(t.spend, t.new_orders) AS cac) ORDER BY t.month_start) AS months,
        IF(COUNT(*) >= 2 * p.power_months,
           SAFE_DIVIDE(
             SUM(IF(t.recency <= p.power_months, t.spend, 0)),
             SUM(IF(t.recency > p.power_months AND t.recency <= 2 * p.power_months, t.spend, 0))
           ) - 1,
           NULL) AS spend_change,
        IF(COUNT(*) >= 2 * p.power_months,
           SAFE_DIVIDE(
             SAFE_DIVIDE(
               SUM(IF(t.recency <= p.power_months, t.spend, 0)),
               SUM(IF(t.recency <= p.power_months, t.new_orders, 0))
             ),
             SAFE_DIVIDE(
               SUM(IF(t.recency > p.power_months AND t.recency <= 2 * p.power_months, t.spend, 0)),
               SUM(IF(t.recency > p.power_months AND t.recency <= 2 * p.power_months, t.new_orders, 0))
             )
           ) - 1,
           NULL) AS cac_change
      FROM (
        SELECT
          g AS month_start,
          ROW_NUMBER() OVER (ORDER BY g DESC) AS recency,
          SUM(x.spend) AS spend,
          SUM(x.new_orders) AS new_orders
        FROM UNNEST(GENERATE_DATE_ARRAY(
          DATE_ADD(DATE_TRUNC(m.first_day, MONTH), INTERVAL 1 MONTH),
          DATE_SUB(w.this_month, INTERVAL 1 MONTH),
          INTERVAL 1 MONTH)) AS g
        JOIN (SELECT * FROM UNNEST(m.dw)) AS x ON DATE_TRUNC(x.day, MONTH) = g
        GROUP BY g
      ) AS t
    ) AS spw,
    (
      SELECT AS STRUCT
        SUM(IF(g.grp = 'viable', g.spend, 0)) AS spend_viable,
        SUM(IF(g.grp = 'test_phase', g.spend, 0)) AS spend_test_phase,
        SUM(IF(g.grp = 'worn_out', g.spend, 0)) AS spend_worn_out,
        SUM(IF(g.grp = 'other', g.spend, 0)) AS spend_other,
        SUM(IF(g.grp = 'viable', g.customers, 0)) AS customers_viable,
        SUM(IF(g.grp = 'test_phase', g.customers, 0)) AS customers_test_phase,
        SUM(IF(g.grp = 'worn_out', g.customers, 0)) AS customers_worn_out,
        SUM(IF(g.grp = 'other', g.customers, 0)) AS customers_other,
        SUM(g.spend) AS spend_total,
        SUM(g.customers) AS customers_total
      FROM (
        SELECT
          CASE
            WHEN x.status IN ('Healthy', 'Winner', 'Improving') THEN 'viable'
            WHEN x.status = 'Ramping' THEN 'test_phase'
            WHEN x.status IN ('Fatiguing', 'Fatigued', 'Low efficiency') THEN 'worn_out'
            ELSE 'other'
          END AS grp,
          SUM(x.spend) AS spend,
          SUM(x.new_orders) AS customers
        FROM UNNEST(m.dw) AS x
        WHERE x.status IS NOT NULL
          AND x.day BETWEEN DATE_SUB(m.today, INTERVAL (p.table_days - 1) DAY) AND m.today
        GROUP BY grp
      ) AS g
    ) AS gw
  FROM m2 AS m
  CROSS JOIN win AS w
  CROSS JOIN plan_cut AS p
),
m4 AS (
  SELECT
    m.*,
    (
      SELECT AS STRUCT
        COUNT(*) AS curve_ages,
        SUM(c.survival) AS viable_lifespan,
        SAFE_DIVIDE(SUM(c.viable_spend), SUM(c.viable)) AS spend_per_viable_ad,
        MIN(IF(c.age > k.p.age AND c.viable * 2 * k.p.reached < c.reached * k.p.viable, c.age, NULL)) AS healthy_lifespan,
        MIN(IF(c.age > k.p.age AND c.viable * 4 * k.p.reached < c.reached * k.p.viable * 3, c.age, NULL)) AS age_below_75,
        MIN(IF(c.age > k.p.age AND c.viable * 4 * k.p.reached < c.reached * k.p.viable, c.age, NULL)) AS age_below_25,
        ARRAY_AGG(c.viable * 4 >= c.reached ORDER BY c.age DESC LIMIT 1)[SAFE_OFFSET(0)] AS w_is_lower_bound
      FROM UNNEST(m.curve) AS c
      CROSS JOIN (
        SELECT ARRAY_AGG(STRUCT(b.age, b.viable, b.reached) ORDER BY SAFE_DIVIDE(b.viable, b.reached) DESC, b.age LIMIT 1)[SAFE_OFFSET(0)] AS p
        FROM UNNEST(m.curve) AS b
      ) AS k
    ) AS ls,
    (
      SELECT AS STRUCT s.*, s.mean_spend + p.outlier_sds * s.sd_spend AS outlier_line
      FROM (
        SELECT
          COUNT(*) AS ads,
          AVG(spend) AS mean_spend,
          MAX(median_spend) AS median_spend,
          STDDEV_POP(spend) AS sd_spend,
          MAX(spend) AS max_spend,
          SUM(spend) AS total_spend
        FROM (SELECT o.spend, PERCENTILE_CONT(o.spend, 0.5) OVER () AS median_spend FROM UNNEST(m.launched_spend) AS o)
      ) AS s
    ) AS sl
  FROM m3 AS m
  CROSS JOIN plan_cut AS p
),
m5 AS (
  SELECT
    m.*,
    GREATEST(p.spend_bar_floor, p.spend_bar_days * m.ls.spend_per_viable_ad) AS spend_bar,
    ARRAY(
      SELECT AS STRUCT
        h.ad_key, h.first_spend, h.spend_28d,
        h.was_viable AND h.spend_28d >= GREATEST(p.spend_bar_floor, p.spend_bar_days * m.ls.spend_per_viable_ad) AND h.cac_within AS is_hit,
        h.spend_28d < GREATEST(p.spend_bar_floor, p.spend_bar_days * m.ls.spend_per_viable_ad) AS is_low_spend,
        h.spend_28d >= GREATEST(p.spend_bar_floor, p.spend_bar_days * m.ls.spend_per_viable_ad) AND NOT (h.was_viable AND h.cac_within) AS is_spent_bar_not_hit
      FROM (
        -- cac_within: the ad's spend over its first 28 days over its new orders in them is within
        -- hit_cac_ratio times the account's over the same 28 calendar days (every ad in daily_win).
        -- An ad with no new orders fails. The window's frame is hit_days - 1 days ahead.
        SELECT
          g.*,
          COALESCE(SAFE_DIVIDE(g.spend_28d, g.orders_28d) <= p.hit_cac_ratio * a.account_cac_28d, FALSE) AS cac_within
        FROM (
          SELECT
            l.ad_key,
            ANY_VALUE(l.first_spend) AS first_spend,
            COALESCE(LOGICAL_OR(x.status IN ('Healthy', 'Winner', 'Improving')
                                AND DATE_DIFF(x.day, l.first_spend, DAY) < p.hit_days), FALSE) AS was_viable,
            COALESCE(SUM(IF(DATE_DIFF(x.day, l.first_spend, DAY) < p.hit_days, x.spend, 0)), 0) AS spend_28d,
            COALESCE(SUM(IF(DATE_DIFF(x.day, l.first_spend, DAY) < p.hit_days, x.new_orders, 0)), 0) AS orders_28d
          FROM UNNEST(m.launched) AS l
          LEFT JOIN (SELECT * FROM UNNEST(m.dw)) AS x ON x.ad_key = l.ad_key
          WHERE l.first_spend <= DATE_SUB(w.date_to, INTERVAL (p.hit_days - 1) DAY)
          GROUP BY l.ad_key
        ) AS g
        LEFT JOIN (
          SELECT
            t.day,
            SAFE_DIVIDE(SUM(t.spend) OVER f, SUM(t.new_orders) OVER f) AS account_cac_28d
          FROM (
            SELECT x.day, SUM(x.spend) AS spend, SUM(x.new_orders) AS new_orders
            FROM UNNEST(m.dw) AS x
            GROUP BY x.day
          ) AS t
          WINDOW f AS (ORDER BY UNIX_DATE(t.day) RANGE BETWEEN CURRENT ROW AND 27 FOLLOWING)
        ) AS a ON a.day = g.first_spend
      ) AS h
    ) AS hit_ads,
    (
      SELECT AS STRUCT
        (SELECT COUNT(*) FROM UNNEST(m.launched_spend) AS o WHERE o.spend >= m.sl.outlier_line) AS outliers,
        (SELECT COALESCE(SUM(o.spend), 0) FROM UNNEST(m.launched_spend) AS o WHERE o.spend >= m.sl.outlier_line) AS outlier_spend,
        MAX(IF(r.rn = DIV(r.n + 3, 4), r.days_to_line, NULL)) AS days_to_line_p25,
        AVG(IF(r.rn IN (DIV(r.n + 1, 2), DIV(r.n + 2, 2)), r.days_to_line, NULL)) AS days_to_line_median,
        MAX(IF(r.rn = DIV(3 * r.n + 3, 4), r.days_to_line, NULL)) AS days_to_line_p75
      FROM (
        SELECT days_to_line, ROW_NUMBER() OVER (ORDER BY days_to_line, ad_key) AS rn, COUNT(*) OVER () AS n
        FROM (
          SELECT o.ad_key, MIN(DATE_DIFF(d.day, o.first_spend, DAY)) AS days_to_line
          FROM UNNEST(m.launched_spend) AS o
          JOIN (SELECT * FROM UNNEST(m.dw) WHERE spend > 0) AS d ON d.ad_key = o.ad_key
          WHERE o.spend >= m.sl.outlier_line AND d.life_spend >= m.sl.outlier_line
          GROUP BY o.ad_key
        )
      ) AS r
    ) AS os
  FROM m4 AS m
  CROSS JOIN win AS w
  CROSS JOIN plan_cut AS p
),
m6 AS (
  SELECT
    m.*,
    (
      SELECT AS STRUCT
        COUNT(*) AS hit_rate_ads,
        COUNTIF(h.is_hit) AS hits,
        COUNTIF(h.is_low_spend) AS low_spend_ads,
        COUNTIF(h.is_spent_bar_not_hit) AS spent_bar_not_hit_ads,
        SAFE_DIVIDE(COUNTIF(h.is_hit), COUNT(*)) AS hit_rate,
        SAFE_DIVIDE(COUNTIF(h.is_low_spend), COUNT(*)) AS low_spend_rate
      FROM UNNEST(m.hit_ads) AS h
    ) AS hr,
    (
      SELECT AS STRUCT
        COUNT(*) AS hit_rate_months,
        IF(COUNT(*) >= p.best_min_months, ARRAY_AGG(c.month_hit_rate ORDER BY c.month_hit_rate)[SAFE_OFFSET(CAST(CEIL(0.9 * COUNT(*)) AS INT64) - 1)], NULL) AS hit_rate_best
      FROM (
        SELECT
          DATE_TRUNC(h.first_spend, MONTH) AS month_start,
          COUNT(*) AS launched_ads,
          SAFE_DIVIDE(COUNTIF(h.is_hit), COUNT(*)) AS month_hit_rate
        FROM UNNEST(m.hit_ads) AS h
        GROUP BY month_start
      ) AS c
      WHERE LAST_DAY(c.month_start, MONTH) <= DATE_SUB(m.today, INTERVAL p.hit_days DAY)
        AND c.launched_ads >= p.best_min_ads
        AND c.month_start >= DATE_ADD(m.first_day, INTERVAL (p.warmup_weeks * 7) DAY)
    ) AS hb,
    (
      SELECT AS STRUCT
        COUNT(*) AS dvph_quarters,
        IF(COUNT(*) >= p.best_min_quarters, MAX(SAFE_DIVIDE(q.quarter_lifespan, h.quarter_hit_rate)), NULL) AS days_viable_per_hit_best
      FROM (
        SELECT
          DATE_TRUNC(h.first_spend, QUARTER) AS quarter_start,
          SAFE_DIVIDE(COUNTIF(h.is_hit), COUNT(*)) AS quarter_hit_rate,
          COUNTIF(h.is_hit) AS hits
        FROM UNNEST(m.hit_ads) AS h
        GROUP BY quarter_start
      ) AS h
      JOIN (SELECT * FROM UNNEST(m.quarter_w)) AS q USING (quarter_start)
      WHERE LAST_DAY(h.quarter_start, QUARTER) <= DATE_SUB(m.today, INTERVAL p.quarter_age_days DAY)
        AND h.hits >= p.best_min_hits
    ) AS db,
    (
      SELECT AVG(r.degradation)
      FROM (
        SELECT degradation, ROW_NUMBER() OVER (ORDER BY degradation, ad_key) AS rn, COUNT(*) OVER () AS n
        FROM (
          SELECT
            h.ad_key,
            SAFE_DIVIDE(
              SUM(IF(DATE_DIFF(d.day, h.first_spend, DAY) >= p.week_one_days
                     AND DATE_DIFF(d.day, h.first_spend, DAY) < p.hit_days, d.spend, 0)) / (p.hit_days - p.week_one_days),
              SUM(IF(DATE_DIFF(d.day, h.first_spend, DAY) < p.week_one_days, d.spend, 0)) / p.week_one_days
            ) - 1 AS degradation
          FROM UNNEST(m.hit_ads) AS h
          JOIN (SELECT * FROM UNNEST(m.dw) WHERE spend > 0) AS d ON d.ad_key = h.ad_key
          GROUP BY h.ad_key
        )
      ) AS r
      WHERE r.rn IN (DIV(r.n + 1, 2), DIV(r.n + 2, 2))
    ) AS spend_degradation,
    (
      SELECT AS STRUCT
        COUNT(DISTINCT h.ad_key) AS week_one_hits,
        COUNT(DISTINCT IF(s.status IN ('Healthy', 'Winner', 'Improving'), h.ad_key, NULL)) AS week_one_viable,
        SAFE_DIVIDE(
          COUNT(DISTINCT IF(s.status IN ('Healthy', 'Winner', 'Improving'), h.ad_key, NULL)),
          COUNT(DISTINCT h.ad_key)
        ) AS viable_after_week_1
      FROM UNNEST(m.hit_ads) AS h
      LEFT JOIN (SELECT * FROM UNNEST(m.dw) WHERE status IS NOT NULL) AS s
        ON s.ad_key = h.ad_key AND s.day = DATE_ADD(h.first_spend, INTERVAL p.hit_days DAY)
      WHERE h.is_hit AND h.first_spend <= DATE_SUB(w.date_to, INTERVAL p.hit_days DAY)
    ) AS wo
  FROM m5 AS m
  CROSS JOIN win AS w
  CROSS JOIN plan_cut AS p
),
-- The Recent fit: over the last fit_days complete days to today, actual is the mean daily count of
-- viable Launched ads, and predicted the mean daily sum, over Launched ads first spent on or before
-- that day, of the curve's survival rate at their age that day (an age past the curve reads 0). The
-- fit is actual over predicted, held between fit_min and fit_max, and 1 where predicted is 0. It reads
-- only `launched`, `curve`, `dw` and `today`, carried from the steps before.
m7 AS (
  SELECT
    m.*,
    (
      SELECT AS STRUCT
        f.actual, f.predicted,
        IF(f.predicted > 0, LEAST(p.fit_max, GREATEST(p.fit_min, SAFE_DIVIDE(f.actual, f.predicted))), 1) AS recent_fit
      FROM (
        SELECT
          (
            SELECT COUNT(*)
            FROM UNNEST(m.dw) AS x
            JOIN (SELECT * FROM UNNEST(m.launched)) AS l ON l.ad_key = x.ad_key
            WHERE x.status IN ('Healthy', 'Winner', 'Improving')
              AND x.day BETWEEN DATE_SUB(m.today, INTERVAL (p.fit_days - 1) DAY) AND m.today
          ) / p.fit_days AS actual,
          (
            SELECT COALESCE(SUM(c.survival), 0)
            FROM UNNEST(GENERATE_DATE_ARRAY(DATE_SUB(m.today, INTERVAL (p.fit_days - 1) DAY), m.today)) AS g
            CROSS JOIN (SELECT * FROM UNNEST(m.launched)) AS l
            JOIN (SELECT * FROM UNNEST(m.curve)) AS c ON c.age = DATE_DIFF(g, l.first_spend, DAY)
          ) / p.fit_days AS predicted
      ) AS f
    ) AS fit
  FROM m6 AS m
  CROSS JOIN plan_cut AS p
),
m8 AS (
  SELECT
    m.*,
    m.ls.viable_lifespan * m.fit.recent_fit AS sc_w,
    m.hr.hit_rate AS sc_h,
    SAFE_DIVIDE(m.ls.viable_lifespan * m.fit.recent_fit, m.hr.hit_rate) AS sc_d,
    SAFE_DIVIDE(m.cs.daily_spend * m.st.viable_share_target, m.ls.spend_per_viable_ad) AS sc_l,
    m.cs.month_days AS sc_days,
    SAFE_DIVIDE(m.gw.spend_viable, m.gw.customers_viable) AS cac_viable,
    SAFE_DIVIDE(m.gw.spend_test_phase, m.gw.customers_test_phase) AS cac_test_phase,
    SAFE_DIVIDE(m.gw.spend_worn_out, m.gw.customers_worn_out) AS cac_worn_out,
    SAFE_DIVIDE(m.gw.spend_other, m.gw.customers_other) AS cac_other,
    SAFE_DIVIDE(m.gw.spend_viable, m.gw.spend_total) AS v0,
    SAFE_DIVIDE((1 - m.st.viable_share_target) * m.gw.spend_total, m.gw.spend_total - m.gw.spend_viable) AS non_viable_scale,
    (
      SELECT AS STRUCT
        IF(COUNT(u.sub_score) = COUNT(*), ROUND(ROUND(AVG(u.sub_score), 9)), NULL) AS creative_score,
        ARRAY_AGG(STRUCT(u.measure, u.value, u.sub_score) ORDER BY u.ord) AS sub_scores
      FROM (
        SELECT
          b.ord, b.measure, v.value,
          LEAST(100, GREATEST(0, IF(
            SAFE_DIVIDE(v.value - b.average, b.good - b.average) >= 0,
            50 + 50 * SAFE_DIVIDE(v.value - b.average, b.good - b.average),
            50 * SAFE_DIVIDE(v.value - b.poor, b.average - b.poor)
          ))) AS sub_score
        FROM UNNEST([
          STRUCT(1 AS ord, 'evergreen_share' AS measure, 0.10 AS poor, 0.30 AS average, 0.50 AS good),
          STRUCT(2, 'spend_degradation', -0.80, -0.55, -0.30),
          STRUCT(3, 'viable_after_week_1', 0.15, 0.35, 0.60),
          STRUCT(4, 'top5_concentration', 0.70, 0.45, 0.20),
          STRUCT(5, 'outlier_rate', 0.01, 0.03, 0.06),
          STRUCT(6, 'hit_rate', 0.02, 0.05, 0.10),
          STRUCT(7, 'low_spend_rate', 0.95, 0.85, 0.70)
        ]) AS b
        JOIN UNNEST([
          STRUCT('evergreen_share' AS measure, m.rs.evergreen_share AS value),
          STRUCT('spend_degradation', m.spend_degradation),
          STRUCT('viable_after_week_1', m.wo.viable_after_week_1),
          STRUCT('top5_concentration', m.rs.top5_concentration),
          STRUCT('outlier_rate', SAFE_DIVIDE(m.os.outliers, m.sl.ads)),
          STRUCT('hit_rate', m.hr.hit_rate),
          STRUCT('low_spend_rate', m.hr.low_spend_rate)
        ]) AS v ON v.measure = b.measure
      ) AS u
    ) AS crs
  FROM m7 AS m
),
m9 AS (
  SELECT
    m.*,
    CEIL(ROUND(SAFE_DIVIDE(m.sc_l * m.sc_days, m.sc_w), 9)) AS sc_n0,
    CEIL(ROUND(SAFE_DIVIDE(m.sc_l * m.sc_days, m.hb.hit_rate_best * m.sc_d), 9)) AS sc_n1,
    COALESCE(SAFE_DIVIDE(m.hb.hit_rate_best, m.sc_h), 0) AS sc_room_h,
    COALESCE(SAFE_DIVIDE(m.db.days_viable_per_hit_best, m.sc_d), 0) AS sc_room_d,
    SAFE_DIVIDE(m.sc_l * m.sc_days, m.sc_d * m.pl.launches_best) AS sc_h_need,
    SAFE_DIVIDE(m.sc_l * m.sc_days, m.sc_h * m.pl.launches_best) AS sc_d_need,
    COALESCE(m.cac_viable, m.cac_test_phase, m.cac_worn_out, m.cac_other) AS used_viable,
    COALESCE(m.cac_test_phase, m.cac_worn_out, m.cac_other) AS used_test_phase,
    COALESCE(m.cac_worn_out, m.cac_other) AS used_worn_out,
    m.cac_other AS used_other
  FROM m8 AS m
),
m10 AS (
  SELECT
    m.*,
    CASE
      WHEN m.tc.viable_ads >= p.on_track_share * m.sc_l AND m.sc_n0 <= m.pl.current_pipeline THEN 'On track'
      WHEN m.sc_n0 <= p.volume_reach * m.pl.launches_best THEN 'Volume'
      WHEN m.sc_n1 <= p.volume_reach * m.pl.launches_best THEN 'Both'
      WHEN m.sc_room_h >= m.sc_room_d THEN 'Finding hits'
      ELSE 'Keeping hits'
    END AS limiting_factor,
    m.v0 >= m.st.viable_share_target AS nothing_on_the_table,
    IF(m.v0 >= m.st.viable_share_target, NULL,
       SAFE_DIVIDE(m.st.viable_share_target * m.gw.spend_total, m.used_viable)
       + COALESCE(SAFE_DIVIDE(m.gw.spend_test_phase * m.non_viable_scale, m.used_test_phase), 0)
       + COALESCE(SAFE_DIVIDE(m.gw.spend_worn_out * m.non_viable_scale, m.used_worn_out), 0)
       + COALESCE(SAFE_DIVIDE(m.gw.spend_other * m.non_viable_scale, m.used_other), 0)) AS customers_target
  FROM m9 AS m
  CROSS JOIN plan_cut AS p
),
-- The block fenced below as shared format is, byte for byte, in references/intake.sql, which gives
-- the intake the Format split default before this file runs. The two change together.
-- BEGIN shared format
-- The last complete ISO weeks (format_weeks, or fewer where the window holds fewer) that the Format
-- split default reads.
recent_weeks AS (
  SELECT
    LEAST(p.format_weeks, DIV(DATE_DIFF(w.this_monday, f.day, DAY), 7)) AS weeks_used,
    w.this_monday
  FROM win AS w
  CROSS JOIN first_day AS f
  CROSS JOIN plan_cut AS p
),
-- Spend per ad over those weeks, every ad that spent counted (Launched or not) outside the awareness
-- and lead campaigns: the split is the share of spend, not of launches.
recent_spend AS (
  SELECT s.ad_key, SUM(s.spend) AS spend
  FROM win_rows AS s
  CROSS JOIN recent_weeks AS r
  WHERE s.day >= DATE_SUB(r.this_monday, INTERVAL (r.weeks_used * 7) DAY)
    AND s.day < r.this_monday
  GROUP BY s.ad_key
  HAVING SUM(s.spend) > 0
),
-- Format from the ad name alone: whole words, any other character a break. A name with neither
-- kind of word, or both, takes video where the ad had any 3-second video plays, else image.
recent_words AS (
  SELECT
    k.spend,
    COALESCE(REGEXP_CONTAINS(LOWER(n.ad_name), r'(^|[^\p{L}\p{N}])(video|vid|reel)([^\p{L}\p{N}]|$)'), FALSE) AS video_word,
    COALESCE(REGEXP_CONTAINS(LOWER(n.ad_name), r'(^|[^\p{L}\p{N}])(image|img|static|still|carousel)([^\p{L}\p{N}]|$)'), FALSE) AS image_word,
    COALESCE(v.had_video, FALSE) AS had_video
  FROM recent_spend AS k
  LEFT JOIN ad_names AS n USING (ad_key)
  LEFT JOIN video_plays AS v USING (ad_key)
),
recent_formats AS (
  SELECT
    spend,
    video_word != image_word AS named,
    CASE
      WHEN video_word AND NOT image_word THEN 'video'
      WHEN image_word AND NOT video_word THEN 'image'
      WHEN had_video THEN 'video'
      ELSE 'image'
    END AS format
  FROM recent_words
),
format_split AS (
  SELECT
    COUNT(*) AS recent_spending_ads,
    CAST(ROUND(100 * SAFE_DIVIDE(SUM(IF(format = 'video', spend, 0)), SUM(spend))) AS INT64) AS video_pct,
    CAST(ROUND(100 * SAFE_DIVIDE(SUM(IF(named, spend, 0)), SUM(spend))) AS INT64) AS name_coverage_pct
  FROM recent_formats
)
-- END shared format
-- END model
SELECT
  w.date_from AS window_from,
  w.date_to AS window_to,
  m.today AS today_date,
  m.first_day,
  DATE_SUB(w.this_month, INTERVAL 1 MONTH) AS current_month_from,
  DATE_SUB(w.this_month, INTERVAL 1 DAY) AS current_month_to,
  ARRAY_LENGTH(m.launched) AS launched_ads,
  m.ls.curve_ages,
  m.sc_w AS viable_lifespan,
  m.ls.viable_lifespan AS viable_lifespan_curve,
  m.fit.actual AS fit_actual,
  m.fit.predicted AS fit_predicted,
  m.fit.recent_fit,
  m.ls.w_is_lower_bound,
  m.spend_bar,
  m.hr.hit_rate,
  m.hr.low_spend_rate,
  m.sc_d AS days_viable_per_hit,
  m.ls.spend_per_viable_ad * m.sc_d AS viable_spend_per_hit,
  m.hr.hit_rate_ads,
  m.hr.hits,
  m.hr.low_spend_ads,
  m.hr.spent_bar_not_hit_ads,
  m.ls.spend_per_viable_ad,
  m.ls.healthy_lifespan,
  m.ls.age_below_75,
  m.ls.age_below_25,
  m.days_to_clear_ramping,
  m.cs.daily_spend AS current_spend,
  m.cs.monthly_spend AS current_monthly_spend,
  m.cs.month_days AS current_month_days,
  m.pl.current_pipeline,
  m.pl.months_used AS pipeline_months_used,
  m.pl.pipeline_launches,
  m.pl.pipeline_days,
  m.st.p90 AS viable_share_p90,
  m.st.viable_share_target,
  m.st.weeks_counted AS viable_share_weeks,
  m.st.complete_weeks - m.st.weeks_counted AS viable_share_weeks_left_out,
  m.st.ramping_share,
  m.st.worn_out_share,
  m.sc_l AS viable_ad_stock,
  m.sc_n0 AS steady_state_number,
  m.tc.viable_ads,
  m.tc.live_past_ramping,
  m.tc.worn_out_now,
  m.pl.launches_best,
  m.hb.hit_rate_best,
  m.hb.hit_rate_months,
  m.db.days_viable_per_hit_best,
  m.db.dvph_quarters,
  m.limiting_factor,
  m.sc_n1 AS launches_at_best_hit_rate,
  m.sc_h_need AS hit_rate_needed,
  m.sc_h_need > m.hb.hit_rate_best AS hit_rate_needed_beyond_best,
  m.sc_d_need AS days_viable_per_hit_needed,
  m.sc_d_need > m.db.days_viable_per_hit_best AS days_viable_per_hit_needed_beyond_best,
  m.gw.spend_viable / m.gw.spend_total AS share_viable,
  m.gw.spend_test_phase / m.gw.spend_total AS share_test_phase,
  m.gw.spend_worn_out / m.gw.spend_total AS share_worn_out,
  m.gw.spend_other / m.gw.spend_total AS share_other,
  m.gw.customers_viable,
  m.gw.customers_test_phase,
  m.gw.customers_worn_out,
  m.gw.customers_other,
  m.cac_viable,
  m.cac_test_phase,
  m.cac_worn_out,
  m.cac_other,
  ARRAY(
    SELECT grp.g
    FROM UNNEST([
      STRUCT('viable' AS g, m.gw.spend_viable AS spend, m.gw.customers_viable AS customers),
      STRUCT('test phase', m.gw.spend_test_phase, m.gw.customers_test_phase),
      STRUCT('worn out', m.gw.spend_worn_out, m.gw.customers_worn_out),
      STRUCT('other', m.gw.spend_other, m.gw.customers_other)
    ]) AS grp
    WHERE grp.spend > 0 AND grp.customers = 0
  ) AS groups_without_customers,
  m.nothing_on_the_table,
  m.gw.customers_total / p.table_days * 7 AS customers_week,
  m.customers_target / p.table_days * 7 AS customers_week_at_target,
  (m.customers_target - m.gw.customers_total) / p.table_days * 7 AS customers_week_gain,
  SAFE_DIVIDE(m.gw.spend_total, m.gw.customers_total) AS blended_cac,
  SAFE_DIVIDE(m.gw.spend_total, m.customers_target) AS blended_cac_at_target,
  SAFE_DIVIDE(m.gw.customers_total, m.customers_target) - 1 AS blended_cac_change,
  IF(m.gw.spend_test_phase > m.gw.spend_worn_out, 'test phase', 'worn out') AS biggest_waste,
  fs.video_pct,
  100 - fs.video_pct AS image_pct,
  fs.name_coverage_pct,
  m.curve AS survival_table,
  m.crs.creative_score,
  m.crs.sub_scores AS creative_sub_scores,
  m.rs.evergreen_share,
  m.spend_degradation,
  m.wo.viable_after_week_1,
  m.wo.week_one_hits,
  m.wo.week_one_viable,
  m.rs.top5_concentration,
  SAFE_DIVIDE(m.os.outliers, m.sl.ads) AS outlier_rate,
  m.os.outliers,
  SAFE_DIVIDE(m.os.outlier_spend, m.sl.total_spend) AS outlier_spend_share,
  m.sl.mean_spend AS launched_spend_mean,
  m.sl.median_spend AS launched_spend_median,
  m.sl.sd_spend AS launched_spend_sd,
  m.sl.outlier_line,
  m.sl.max_spend AS launched_spend_max,
  m.os.days_to_line_p25,
  m.os.days_to_line_median,
  m.os.days_to_line_p75,
  m.spw.months_counted AS spending_power_months,
  m.spw.spend_change AS spending_power_spend_change,
  m.spw.cac_change AS spending_power_cac_change,
  m.spw.months AS spending_power,
  m.tt.complete_quarters,
  ARRAY(
    SELECT AS STRUCT q.quarter_start, q.new_ads, q.top_ads_counted, q.new_spend_share
    FROM UNNEST(m.tt.quarters) AS q
    WHERE m.tt.complete_quarters >= p.turnover_min_quarters
    ORDER BY q.quarter_start
  ) AS top10_turnover
FROM m10 AS m
CROSS JOIN win AS w
CROSS JOIN plan_cut AS p
CROSS JOIN format_split AS fs
