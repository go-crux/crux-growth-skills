-- THE INTAKE QUERY, for a Growth Brain. Read before the intake message goes out: the Launched ads
-- outside the awareness campaigns, and the Format split default with its Name coverage, so the
-- intake quotes figures the run already holds. It is run with the proposed awareness campaigns, and
-- again with the confirmed ones where the reply changes them. A connector or an export computes the
-- same figures in code (references/exports.md).
-- One row: launched_ads, hit_rate_ads, recent_launched_ads, video_pct, image_pct, name_coverage_pct.
-- hit_rate_ads is the Launched ads at least 28 days old (first spend at least 27 days before the last
-- complete day), the count the first guard of SKILL.md step 2 reads and the denominator of the Hit
-- rate in references/fatigue.sql. The video and image percentages and the Name coverage are NULL
-- where no Launched ad's first spend fell in the last 8 complete weeks.
-- Edit 1: the mart's name in `mart_rows` and in `video_plays`, and any column list_tables shows
-- under another name. Where the mart has no `adset_id`, write `ad_group` in its place; where it has
-- no `campaign_id`, write `campaign_name` in its place; a mart with no `video_views` column takes 0
-- in `video_plays`, in place of `video_views`.
-- Edit 2, in `awareness`: the campaign_keys of the proposed (or confirmed) awareness campaigns
-- (ARRAY<STRING>[] when none).
-- Timezone: where the brain's own instructions name the store's timezone, write it in the one
-- CURRENT_DATE() of `win`, as references/fatigue.sql does.
-- The windows, the Launched ad, the ad keys and the Format below are references/fatigue.sql's, so
-- the figures match what its run returns for the same awareness campaigns. The block fenced as
-- shared format below is the same in both files and changes together with it.
WITH
plan_cut AS (
  SELECT
    365 AS window_days,
    28 AS hit_days,
    8 AS pipeline_weeks
),
-- The last 365 complete days, ending yesterday. `this_monday` starts the ISO week holding today.
win AS (
  SELECT
    DATE_SUB(CURRENT_DATE(), INTERVAL p.window_days DAY) AS date_from,
    DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) AS date_to,
    DATE_TRUNC(CURRENT_DATE(), ISOWEEK) AS this_monday
  FROM plan_cut AS p
),
mart_rows AS (
  SELECT
    date AS day,
    campaign_id AS campaign_key,  -- Edit 1: campaign_name where the mart has no campaign_id
    adset_id AS adset_key,        -- Edit 1: ad_group where the mart has no adset_id
    ad_id AS ad_key,
    ad,
    COALESCE(spend, 0) AS spend
  FROM `<client>-meta_performance`  -- Edit 1: the mart's name
  WHERE COALESCE(ad_id, 'Unknown') != 'Unknown'
),
awareness AS (
  SELECT campaign_key
  FROM UNNEST(ARRAY<STRING>['<campaign_key>']) AS campaign_key  -- Edit 2
),
-- Each ad's campaign key as its latest row shows it, a serving row first.
ad_keys AS (
  SELECT
    ad_key,
    ARRAY_AGG(STRUCT(campaign_key, adset_key)
      ORDER BY day DESC, spend DESC, campaign_key, adset_key LIMIT 1)[OFFSET(0)] AS k
  FROM mart_rows
  GROUP BY 1
),
-- Every row read in the window, less the ads of the awareness campaigns.
win_rows AS (
  SELECT s.day, s.ad_key, s.ad, s.spend
  FROM mart_rows AS s
  JOIN ad_keys AS k USING (ad_key)
  CROSS JOIN win AS w
  WHERE (k.k.campaign_key IS NULL OR k.k.campaign_key NOT IN (SELECT campaign_key FROM awareness))
    AND s.day BETWEEN w.date_from AND w.date_to
),
-- The first day the mart holds inside the window: an ad first spending after it is a Launched ad.
first_day AS (
  SELECT MIN(day) AS day
  FROM win_rows
),
launched AS (
  SELECT ad_key, MIN(day) AS first_spend
  FROM (
    SELECT ad_key, day
    FROM win_rows
    GROUP BY ad_key, day
    HAVING SUM(spend) > 0
  )
  GROUP BY ad_key
  HAVING MIN(day) > (SELECT day FROM first_day)
),
ad_names AS (
  SELECT ad_key, ARRAY_AGG(ad IGNORE NULLS ORDER BY day DESC LIMIT 1)[SAFE_OFFSET(0)] AS ad_name
  FROM win_rows
  GROUP BY ad_key
),
video_plays AS (
  SELECT
    ad_id AS ad_key,
    SUM(COALESCE(video_views, 0)) > 0 AS had_video
  FROM `<client>-meta_performance`  -- Edit 1: the mart's name
  CROSS JOIN win AS w
  WHERE date BETWEEN w.date_from AND w.date_to
    AND COALESCE(ad_id, 'Unknown') != 'Unknown'
  GROUP BY ad_key
),
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
SELECT
  (SELECT COUNT(*) FROM launched) AS launched_ads,
  (
    SELECT COUNT(*)
    FROM launched AS l
    CROSS JOIN win AS w
    CROSS JOIN plan_cut AS p
    WHERE l.first_spend <= DATE_SUB(w.date_to, INTERVAL (p.hit_days - 1) DAY)
  ) AS hit_rate_ads,
  fs.recent_launched_ads,
  fs.video_pct,
  100 - fs.video_pct AS image_pct,
  fs.name_coverage_pct
FROM format_split AS fs
