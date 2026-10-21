-- Put these CTEs ahead of a query, join to `windows`, `calendar`, `target_months`, `baseline_actual` or `phasing_days`, and drop the final SELECT.
WITH years AS (
  SELECT year
  FROM UNNEST(GENERATE_ARRAY(EXTRACT(YEAR FROM CURRENT_DATE()) - 2, EXTRACT(YEAR FROM CURRENT_DATE()))) AS year
),
-- Last Friday of November; BigQuery DAYOFWEEK has Sunday = 1, Friday = 6.
black_friday AS (
  SELECT
    year,
    DATE_SUB(
      DATE(year, 11, 30),
      INTERVAL MOD(EXTRACT(DAYOFWEEK FROM DATE(year, 11, 30)) + 1, 7) DAY
    ) AS black_friday
  FROM years
),
-- `window` is a reserved word in BigQuery, so it stays in backticks.
-- The alias `b` matters: bare `black_friday` would name the CTE's row, not its date column.
windows AS (
  SELECT b.year, 'baseline' AS `window`, DATE(b.year, 9, 1) AS date_from, DATE(b.year, 10, 31) AS date_to
  FROM black_friday AS b
  UNION ALL
  SELECT b.year, 'lead_in', DATE(b.year, 11, 1), DATE_SUB(b.black_friday, INTERVAL 1 DAY)
  FROM black_friday AS b
  UNION ALL
  SELECT b.year, 'black_friday_weekend', b.black_friday, DATE_ADD(b.black_friday, INTERVAL 3 DAY)
  FROM black_friday AS b
  UNION ALL
  SELECT b.year, 'festive', DATE_ADD(b.black_friday, INTERVAL 4 DAY), DATE(b.year, 12, 24)
  FROM black_friday AS b
),
-- One row per date, 1 Sep to 24 Dec: its window and days from that year's Black Friday.
calendar AS (
  SELECT
    w.year,
    day AS date,
    w.`window`,
    DATE_DIFF(day, b.black_friday, DAY) AS days_from_black_friday
  FROM windows AS w
  JOIN black_friday AS b USING (year)
  CROSS JOIN UNNEST(GENERATE_DATE_ARRAY(w.date_from, w.date_to)) AS day
),
-- Target test periods: November in full, December to the 24th.
target_months AS (
  SELECT year, 'november' AS target_month, DATE(year, 11, 1) AS date_from, DATE(year, 11, 30) AS date_to
  FROM years
  UNION ALL
  SELECT year, 'december', DATE(year, 12, 1), DATE(year, 12, 24)
  FROM years
),
-- Baseline days elapsed: this year's Baseline stops at yesterday while it is still running.
baseline_actual AS (
  SELECT year, date_from, LEAST(date_to, DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)) AS date_to
  FROM windows
  WHERE `window` = 'baseline'
),
-- Daily phasing: each date of this year's target months, its days from Black Friday, and its
-- `shape_date` last year: the same days from Black Friday through Cyber Monday (27 Nov 2026 maps to
-- 28 Nov 2025), then the same days before 24 Dec over Festive, never earlier than last year's Festive.
-- A Festive a day longer than last year's reuses last year's first Festive day for its first day.
phasing_days AS (
  SELECT
    t.target_month,
    day AS date,
    DATE_DIFF(day, b.black_friday, DAY) AS days_from_black_friday,
    CASE
      WHEN day > DATE_ADD(b.black_friday, INTERVAL 3 DAY) THEN GREATEST(
        DATE_SUB(DATE(t.year - 1, 12, 24), INTERVAL DATE_DIFF(DATE(t.year, 12, 24), day, DAY) DAY),
        DATE_ADD(l.black_friday, INTERVAL 4 DAY)
      )
      ELSE DATE_ADD(l.black_friday, INTERVAL DATE_DIFF(day, b.black_friday, DAY) DAY)
    END AS shape_date
  FROM target_months AS t
  JOIN black_friday AS b ON b.year = t.year
  JOIN black_friday AS l ON l.year = t.year - 1
  CROSS JOIN UNNEST(GENERATE_DATE_ARRAY(t.date_from, t.date_to)) AS day
  WHERE t.year = EXTRACT(YEAR FROM CURRENT_DATE())
)
SELECT year, `window`, date_from, date_to
FROM windows
ORDER BY year, date_from;
