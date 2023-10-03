-- 1.1.
-- It is not essential to track the number of actions performed by each client within a month, 
-- so we can consolidate the data by ensuring that there is no more than one unique CLIENT_ID in a given month.
WITH table_1 AS (
    SELECT DISTINCT CLIENT_ID, DATE_FORMAT(REPORT_MONTH, '%Y-%m-01') AS REPORT_MONTH
    FROM ACTIVE_CLIENTS
), 
-- Next, we can create an additional column indicating the next active month immediately following the current active month, 
-- calculate the month difference taking into account years and assign if the month difference is less than or equal to 3, 
-- than the client is active in the current month, otherwise it is churned.
table_2 AS (
    SELECT
        CLIENT_ID,
        REPORT_MONTH,
        CASE
            WHEN (
                TIMESTAMPDIFF(MONTH, REPORT_MONTH, (LEAD(REPORT_MONTH, 1) OVER (PARTITION BY CLIENT_ID ORDER BY REPORT_MONTH))) <= 3
            ) THEN 'active'
            ELSE 'churned'
        END AS STATUS
    FROM table_1 t
)
-- The last step is to group by 'REPORT_MONTH' and exclude the last 3 months because we cannot determine 
-- if the clients will remain active in the next 3 months.
SELECT REPORT_MONTH,
       STATUS,
       COUNT(*) AS ACT_CLIENT_NUM
FROM table_2
WHERE
    STATUS = 'active'
    AND REPORT_MONTH <= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY
    REPORT_MONTH
ORDER BY
    REPORT_MONTH;

    
-- 1.2.
-- It is not essential to track the number of actions performed by each client within a month, 
-- so we can consolidate the data by ensuring that there is no more than one unique CLIENT_ID in a given month.
WITH table_1 AS (
    SELECT DISTINCT CLIENT_ID, DATE_FORMAT(REPORT_MONTH, '%Y-%m-01') AS REPORT_MONTH
    FROM ACTIVE_CLIENTS
), 
-- Next, we can create an additional column indicating the next active month immediately following the current active month, 
-- calculate the month difference taking into account years and assign if the month difference is less than or equal to 3, 
-- than the client is active in the current month, otherwise it is churned.
table_2 AS (
    SELECT
        CLIENT_ID,
        REPORT_MONTH,
        CASE
            WHEN (
                TIMESTAMPDIFF(MONTH, REPORT_MONTH, (LEAD(REPORT_MONTH, 1) OVER (PARTITION BY CLIENT_ID ORDER BY REPORT_MONTH))) <= 3
            ) THEN 'active'
            ELSE 'churned'
        END AS STATUS
    FROM table_1 t
)
-- The last step is to group by 'REPORT_MONTH' and exclude the last 3 months because we cannot determine 
-- if the clients will remain active in the next 3 months.
SELECT REPORT_MONTH,
       SUM(CASE WHEN STATUS = 'churned' THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS CHUR_FRACTION
FROM table_2
WHERE
    REPORT_MONTH <= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY
    REPORT_MONTH
ORDER BY
    REPORT_MONTH;
