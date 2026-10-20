-- The only place Black Friday dates are computed. Put every CTE below ahead of a query, join to
-- `windows` (or `calendar` where days are aligned), and drop the final SELECT. `window` is a
-- reserved word in BigQuery, so it stays in backticks.
-- Black Friday is the last Friday of November (BigQuery DAYOFWEEK: Sunday = 1, Friday = 6).
WITH years AS (
  SELECT year
  FROM UNNEST(GENERATE_ARRAY(EXTRACT(YEAR FROM CURRENT_DATE()) - 2, EXTRACT(YEAR FROM CURRENT_DATE()))) AS year
),
black_friday AS (
  SELECT
    year,
    DATE_SUB(
      DATE(year, 11, 30),
      INTERVAL MOD(EXTRACT(DAYOFWEEK FROM DATE(year, 11, 30)) + 1, 7) DAY
    ) AS black_friday
  FROM years
),
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
-- One row per date from 1 Sep to 24 Dec of each year: its window and its offset from that
-- year's Black Friday (0 on Black Friday, 3 on Cyber Monday, negative before).
calendar AS (
  SELECT
    w.year,
    day AS date,
    w.`window`,
    DATE_DIFF(day, b.black_friday, DAY) AS days_from_black_friday
  FROM windows AS w
  JOIN black_friday AS b USING (year)
  CROSS JOIN UNNEST(GENERATE_DATE_ARRAY(w.date_from, w.date_to)) AS day
)
SELECT year, `window`, date_from, date_to
FROM windows
ORDER BY year, date_from;
