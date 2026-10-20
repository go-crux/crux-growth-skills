-- Put these CTEs ahead of a query, join to `windows`, `calendar`, `target_months` or `baseline_actual`, and drop the final SELECT.
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
windows AS (
  SELECT year, 'baseline' AS `window`, DATE(year, 9, 1) AS date_from, DATE(year, 10, 31) AS date_to
  FROM black_friday
  UNION ALL
  SELECT year, 'lead_in', DATE(year, 11, 1), DATE_SUB(black_friday, INTERVAL 1 DAY)
  FROM black_friday
  UNION ALL
  SELECT year, 'black_friday_weekend', black_friday, DATE_ADD(black_friday, INTERVAL 3 DAY)
  FROM black_friday
  UNION ALL
  SELECT year, 'festive', DATE_ADD(black_friday, INTERVAL 4 DAY), DATE(year, 12, 24)
  FROM black_friday
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
)
SELECT year, `window`, date_from, date_to
FROM windows
ORDER BY year, date_from;
