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
-- Viable is Healthy or Winner. A day with no spend (Inactive), Ramping, Unknown or any other status
-- is not viable. The model in references/method.md counts every Launched ad at every age it has
-- reached, and reads `spend_on_day` for the day's spend.
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
    8 AS pipeline_weeks,
    6 AS warmup_weeks,
    0.25 AS thin_week_share,
    1.20 AS viable_share_headroom
),
-- The last 365 complete days, ending yesterday. `this_monday` starts the ISO week holding today.
win AS (
  SELECT
    DATE_SUB(CURRENT_DATE(), INTERVAL p.window_days DAY) AS date_from,
    DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) AS date_to,
    DATE_TRUNC(CURRENT_DATE(), ISOWEEK) AS this_monday
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
-- The first day the mart holds inside the window: an ad first spending after it is a Launched ad.
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
-- Reads only ad_day_status, daily_win, ad_names, video_plays, win, first_day and plan_cut.
-- A Launched ad: its first day of spend falls after the window's first day. Age is the days since
-- that day, so the first day is age 0.
launched AS (
  SELECT ad_key, MIN(day) AS first_spend
  FROM ad_day_status
  GROUP BY ad_key
  HAVING MIN(day) > (SELECT day FROM first_day)
),
-- The Survival curve. A Launched ad has reached age a when its first spend is at least a days before
-- the last complete day, so `age_reach` counts every Launched ad at every age it has reached inside
-- the window. An ad that stopped spending or is still Ramping stays in the count.
age_reach AS (
  SELECT a AS age, COUNT(*) AS reached
  FROM launched AS l
  CROSS JOIN win AS w
  CROSS JOIN UNNEST(GENERATE_ARRAY(0, DATE_DIFF(w.date_to, l.first_spend, DAY))) AS a
  GROUP BY a
),
-- The viable ad-days (Healthy or Winner) at each age, with their spend. A day with no spend has no
-- row in ad_day_status, so it is not viable.
viable_days AS (
  SELECT
    DATE_DIFF(s.day, l.first_spend, DAY) AS age,
    COUNT(*) AS viable,
    SUM(s.spend) AS viable_spend
  FROM ad_day_status AS s
  JOIN launched AS l USING (ad_key)
  WHERE s.status IN ('Healthy', 'Winner')
  GROUP BY age
),
curve AS (
  SELECT
    r.age,
    r.reached,
    COALESCE(v.viable, 0) AS viable,
    SAFE_DIVIDE(COALESCE(v.viable, 0), r.reached) AS survival,
    COALESCE(v.viable_spend, 0) AS viable_spend
  FROM age_reach AS r
  LEFT JOIN viable_days AS v USING (age)
  CROSS JOIN plan_cut AS p
  WHERE r.reached >= p.curve_min_ads
),
-- The Hit rate: over the Launched ads whose first spend is at least hit_days - 1 days before the last
-- complete day (ages 0 to 27 all inside the window), the share viable on at least one of those days.
hit_ads AS (
  SELECT
    l.ad_key,
    COALESCE(LOGICAL_OR(s.status IN ('Healthy', 'Winner')
                        AND DATE_DIFF(s.day, l.first_spend, DAY) < p.hit_days), FALSE) AS was_viable
  FROM launched AS l
  CROSS JOIN win AS w
  CROSS JOIN plan_cut AS p
  LEFT JOIN ad_day_status AS s ON s.ad_key = l.ad_key
  WHERE l.first_spend <= DATE_SUB(w.date_to, INTERVAL (p.hit_days - 1) DAY)
  GROUP BY l.ad_key
),
hit_rate AS (
  SELECT
    COUNT(*) AS hit_rate_ads,
    SAFE_DIVIDE(COUNTIF(was_viable), COUNT(*)) AS hit_rate
  FROM hit_ads
),
-- The curve's peak: its highest rate, at the first such age. The Healthy lifespan reads from there.
brain_peak AS (
  SELECT ARRAY_AGG(STRUCT(age, viable, reached) ORDER BY SAFE_DIVIDE(viable, reached) DESC, age LIMIT 1)[SAFE_OFFSET(0)] AS p
  FROM curve
),
-- W (viable_lifespan), Spend per viable ad and the Healthy lifespan with its quartile range. The
-- Healthy lifespan is the first age after the peak at which the rate is below half the peak rate, and
-- the quartiles the first ages below 75% and 25% of it. The thresholds compare whole counts
-- (viable x 2 x peak reached < reached x peak viable), so a rate of exactly half is not below.
lifespans AS (
  SELECT
    COUNT(*) AS curve_ages,
    SUM(c.survival) AS viable_lifespan,
    SAFE_DIVIDE(SUM(c.viable_spend), SUM(c.viable)) AS spend_per_viable_ad,
    MIN(IF(c.age > k.p.age AND c.viable * 2 * k.p.reached < c.reached * k.p.viable, c.age, NULL)) AS healthy_lifespan,
    MIN(IF(c.age > k.p.age AND c.viable * 4 * k.p.reached < c.reached * k.p.viable * 3, c.age, NULL)) AS age_below_75,
    MIN(IF(c.age > k.p.age AND c.viable * 4 * k.p.reached < c.reached * k.p.viable, c.age, NULL)) AS age_below_25,
    ARRAY_AGG(c.viable * 4 >= c.reached ORDER BY c.age DESC LIMIT 1)[SAFE_OFFSET(0)] AS w_is_lower_bound
  FROM curve AS c
  CROSS JOIN brain_peak AS k
),
-- Days to clear Ramping: the median, over Launched ads, of the age of the first day not Ramping.
cleared AS (
  SELECT
    l.ad_key,
    DATE_DIFF(MIN(s.day), l.first_spend, DAY) AS age_cleared
  FROM launched AS l
  JOIN ad_day_status AS s USING (ad_key)
  WHERE s.status != 'Ramping'
  GROUP BY l.ad_key, l.first_spend
),
cleared_ranked AS (
  SELECT age_cleared, ROW_NUMBER() OVER (ORDER BY age_cleared) AS rn, COUNT(*) OVER () AS n
  FROM cleared
),
clear_ramping AS (
  SELECT AVG(age_cleared) AS days_to_clear_ramping
  FROM cleared_ranked
  WHERE rn IN (DIV(n + 1, 2), DIV(n + 2, 2))
),
-- The ads on the last complete day.
today_counts AS (
  SELECT
    COUNTIF(s.status IN ('Healthy', 'Winner')) AS viable_ads,
    COUNTIF(s.status != 'Ramping') AS live_past_ramping,
    COUNTIF(s.status IN ('Fatiguing', 'Fatigued', 'Low efficiency')) AS worn_out_now,
    COUNTIF(s.status = 'Improving') AS improving_now
  FROM ad_day_status AS s
  CROSS JOIN win AS w
  WHERE s.day = w.date_to
),
-- Current spend: the last complete ISO week's spend over 7.
current_spend AS (
  SELECT SUM(d.spend) / 7 AS daily_spend
  FROM daily_win AS d
  CROSS JOIN win AS w
  WHERE d.day >= DATE_SUB(w.this_monday, INTERVAL 7 DAY) AND d.day < w.this_monday
),
-- The Viable share. A week's viable share is its spend on viable ad-days (Healthy or Winner) over its
-- spend, counting every ad, Launched or not; `ad_day_status` already leaves out the awareness and lead
-- campaigns through `keyed`. The weeks are the complete ISO weeks of the window: Monday to Sunday, both
-- inside it, the first Monday on or after `first_day` to the last Sunday on or before `date_to`. A week
-- with no spend still counts as a week, so the median below reads it.
week_spend AS (
  SELECT
    DATE_TRUNC(s.day, ISOWEEK) AS week_start,
    SUM(s.spend) AS spend,
    SUM(IF(s.status IN ('Healthy', 'Winner'), s.spend, 0)) AS viable_spend,
    SUM(IF(s.status = 'Ramping', s.spend, 0)) AS ramping_spend,
    SUM(IF(s.status IN ('Fatiguing', 'Fatigued', 'Low efficiency'), s.spend, 0)) AS worn_out_spend
  FROM ad_day_status AS s
  GROUP BY week_start
),
complete_weeks AS (
  SELECT
    m AS week_start,
    ROW_NUMBER() OVER (ORDER BY m) AS week_no,
    COALESCE(k.spend, 0) AS spend,
    COALESCE(k.viable_spend, 0) AS viable_spend,
    COALESCE(k.ramping_spend, 0) AS ramping_spend,
    COALESCE(k.worn_out_spend, 0) AS worn_out_spend
  FROM win AS w
  CROSS JOIN first_day AS f
  CROSS JOIN UNNEST(GENERATE_DATE_ARRAY(
    DATE_TRUNC(DATE_ADD(f.day, INTERVAL 6 DAY), ISOWEEK),
    DATE_SUB(DATE_TRUNC(DATE_ADD(w.date_to, INTERVAL 1 DAY), ISOWEEK), INTERVAL 7 DAY),
    INTERVAL 7 DAY)) AS m
  LEFT JOIN week_spend AS k ON k.week_start = m
),
-- The window's first warmup_weeks complete weeks are left out: the weekday index, life spend and Peak
-- CAC warm up from the window's first day, so those weeks lean towards Ramping. Of the weeks left, one
-- below thin_week_share of their median weekly spend is left out too: a thin week gives a noisy share.
-- The weeks counted are what remains. Shares are fractions of 1, like `hit_rate`.
counted_weeks AS (
  SELECT
    k.week_start,
    SAFE_DIVIDE(k.viable_spend, k.spend) AS viable_share,
    SAFE_DIVIDE(k.ramping_spend, k.spend) AS ramping_share,
    SAFE_DIVIDE(k.worn_out_spend, k.spend) AS worn_out_share
  FROM (
    SELECT c.*, PERCENTILE_CONT(c.spend, 0.5) OVER () AS median_spend
    FROM complete_weeks AS c
    CROSS JOIN plan_cut AS p
    WHERE c.week_no > p.warmup_weeks
  ) AS k
  CROSS JOIN plan_cut AS p
  WHERE k.spend > 0 AND k.spend >= p.thin_week_share * k.median_spend
),
-- P90 is the nearest-rank 90th percentile: the weekly viable share at rank ceil(0.9 x n) from the
-- lowest, counted in whole numbers. `ramping_share` and `worn_out_share` are the median weekly shares
-- of spend on Ramping ads and on Fatiguing, Fatigued and Low efficiency ads over the same weeks.
share_ranked AS (
  SELECT
    viable_share,
    ROW_NUMBER() OVER (ORDER BY viable_share) AS rn,
    COUNT(*) OVER () AS n,
    PERCENTILE_CONT(ramping_share, 0.5) OVER () AS median_ramping,
    PERCENTILE_CONT(worn_out_share, 0.5) OVER () AS median_worn_out
  FROM counted_weeks
),
share_stats AS (
  SELECT
    (SELECT COUNT(*) FROM complete_weeks) AS complete_weeks,
    COUNT(*) AS weeks_counted,
    MAX(IF(rn = DIV(9 * n + 9, 10), viable_share, NULL)) AS p90,
    MAX(median_ramping) AS ramping_share,
    MAX(median_worn_out) AS worn_out_share
  FROM share_ranked
),
-- The Viable share target: the smaller of 1 and the P90 times the headroom. Null with no week counted,
-- where the run stops.
share_target AS (
  SELECT
    v.*,
    LEAST(1, v.p90 * p.viable_share_headroom) AS viable_share_target
  FROM share_stats AS v
  CROSS JOIN plan_cut AS p
),
-- The block fenced below as shared format is, byte for byte, in references/intake.sql, which gives
-- the intake the Format split default before this file runs. The two change together.
-- BEGIN shared format
-- The last complete ISO weeks (pipeline_weeks, or fewer where the window holds fewer) that the
-- Current pipeline and the Format split default read.
recent_weeks AS (
  SELECT
    LEAST(p.pipeline_weeks, DIV(DATE_DIFF(w.this_monday, f.day, DAY), 7)) AS weeks_used,
    w.this_monday
  FROM win AS w
  CROSS JOIN first_day AS f
  CROSS JOIN plan_cut AS p
),
-- Format from the ad name alone: whole words, any other character a break. A name with neither
-- kind of word, or both, takes video where the ad had any 3-second video plays, else image.
recent_words AS (
  SELECT
    COALESCE(REGEXP_CONTAINS(LOWER(n.ad_name), r'(^|[^\p{L}\p{N}])(video|vid|reel)([^\p{L}\p{N}]|$)'), FALSE) AS video_word,
    COALESCE(REGEXP_CONTAINS(LOWER(n.ad_name), r'(^|[^\p{L}\p{N}])(image|img|static|still|carousel)([^\p{L}\p{N}]|$)'), FALSE) AS image_word,
    COALESCE(v.had_video, FALSE) AS had_video
  FROM launched AS l
  CROSS JOIN recent_weeks AS r
  LEFT JOIN ad_names AS n USING (ad_key)
  LEFT JOIN video_plays AS v USING (ad_key)
  WHERE l.first_spend >= DATE_SUB(r.this_monday, INTERVAL (r.weeks_used * 7) DAY)
    AND l.first_spend < r.this_monday
),
recent_formats AS (
  SELECT
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
    COUNT(*) AS recent_launched_ads,
    CAST(ROUND(100 * SAFE_DIVIDE(COUNTIF(format = 'video'), COUNT(*))) AS INT64) AS video_pct,
    CAST(ROUND(100 * SAFE_DIVIDE(COUNTIF(named), COUNT(*))) AS INT64) AS name_coverage_pct
  FROM recent_formats
)
-- END shared format
-- END model
SELECT
  w.date_from AS window_from,
  w.date_to AS window_to,
  f.day AS first_day,
  DATE_SUB(w.this_monday, INTERVAL 7 DAY) AS current_week_from,
  DATE_SUB(w.this_monday, INTERVAL 1 DAY) AS current_week_to,
  (SELECT COUNT(*) FROM launched) AS launched_ads,
  ls.curve_ages,
  ls.viable_lifespan,
  ls.w_is_lower_bound,
  hr.hit_rate,
  SAFE_DIVIDE(ls.viable_lifespan, hr.hit_rate) AS days_viable_per_hit,
  hr.hit_rate_ads,
  ls.spend_per_viable_ad,
  ls.healthy_lifespan,
  ls.age_below_75,
  ls.age_below_25,
  cr.days_to_clear_ramping,
  cs.daily_spend AS current_spend,
  SAFE_DIVIDE(fs.recent_launched_ads, r.weeks_used) AS current_pipeline,
  r.weeks_used AS pipeline_weeks_used,
  st.p90 AS viable_share_p90,
  st.viable_share_target,
  st.weeks_counted AS viable_share_weeks,
  st.complete_weeks - st.weeks_counted AS viable_share_weeks_left_out,
  st.ramping_share,
  st.worn_out_share,
  SAFE_DIVIDE(cs.daily_spend * st.viable_share_target, ls.spend_per_viable_ad) AS viable_ad_stock,
  CEIL(ROUND(SAFE_DIVIDE(SAFE_DIVIDE(cs.daily_spend * st.viable_share_target, ls.spend_per_viable_ad) * 7, ls.viable_lifespan), 9)) AS steady_state_number,
  tc.viable_ads,
  tc.live_past_ramping,
  tc.worn_out_now,
  tc.improving_now,
  SAFE_DIVIDE(tc.viable_ads * 14, SAFE_DIVIDE(ls.viable_lifespan, hr.hit_rate)) AS wearing_out_2_weeks,
  fs.video_pct,
  100 - fs.video_pct AS image_pct,
  fs.name_coverage_pct,
  ARRAY(
    SELECT AS STRUCT c.age, c.reached, c.viable, c.survival, c.viable_spend
    FROM curve AS c
    ORDER BY c.age
  ) AS survival_table
FROM win AS w
CROSS JOIN first_day AS f
CROSS JOIN lifespans AS ls
CROSS JOIN hit_rate AS hr
CROSS JOIN clear_ramping AS cr
CROSS JOIN current_spend AS cs
CROSS JOIN recent_weeks AS r
CROSS JOIN today_counts AS tc
CROSS JOIN format_split AS fs
CROSS JOIN share_target AS st

