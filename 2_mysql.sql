-- First, we can create a temporary table with all the dates of 2018.
WITH RECURSIVE Dates AS (
    SELECT DATE('2018-01-01') AS DATE
    UNION ALL
    SELECT DATE_ADD(DATE, INTERVAL 1 DAY)
    FROM Dates
    WHERE DATE < '2018-12-31'
)
-- Next, we join the Dates table with the OFFERS table and assign an 'OFFER_ID' if the date falls within the offer period 
-- (between OFFER_START_DATE and OFFER_EXPIRATION_DATE) for each 'OFFER_ID'. 
-- Finally, we get the count of 'OFFER_ID' for each date grouping by DATE.
SELECT D.DATE,
       COUNT(O.OFFER_ID) AS ACTIVE_OFFER_COUNT
FROM Dates D
LEFT JOIN OFFERS O 
    ON D.DATE BETWEEN O.OFFER_START_DATE AND O.OFFER_EXPIRATION_DATE
GROUP BY D.DATE;
