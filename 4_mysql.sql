-- Joining 2 tables
WITH table_1 AS (
SELECT b.CLIENT_ID, b.BONUS_DATE, b.BONUS_CNT, m.MCC_CATEGORY
    FROM BONUS AS b
    JOIN MCC_CATEGORIES AS m
        ON b.MCC_CODE = m.MCC_CODE
    WHERE m.MCC_CATEGORY IN ('Авиабилеты', 'Отели')
),
-- Summarizing bonuses over CLIENT_ID and BONUS_DATE
table_2 AS (
  SELECT
      CLIENT_ID,
      BONUS_DATE,
      MCC_CATEGORY,
      SUM(BONUS_CNT) OVER (PARTITION BY CLIENT_ID ORDER BY BONUS_DATE) AS BON_SUM
  FROM table_1
)
-- Keeping data with summarized bonuses >= 1000, grouping by CLIENT_ID, ordering by DATE, and Keeping top 1000 values
SELECT
    CLIENT_ID,
    MIN(BONUS_DATE) DATE
FROM table_2
WHERE BON_SUM >= 1000
GROUP BY CLIENT_ID
ORDER BY DATE
LIMIT 1000;
