SELECT c.CLIENT_ID, c.CARD_ID
FROM CARDS c
JOIN (
    SELECT CLIENT_ID, MAX(OPEN_DATE) AS MAX_OPEN_DATE
    FROM CARDS
    WHERE CARD_TYPE = 'DC'
        AND OPEN_DATE <= '2018-09-01' 
        AND (CLOSE_DATE IS NULL OR CLOSE_DATE > '2018-09-01')
    GROUP BY CLIENT_ID
) max_dates
ON c.CLIENT_ID = max_dates.CLIENT_ID AND c.OPEN_DATE = max_dates.MAX_OPEN_DATE
WHERE c.CARD_TYPE = 'DC'
    AND c.OPEN_DATE <= '2018-09-01' 
    AND (c.CLOSE_DATE IS NULL OR c.CLOSE_DATE > '2018-09-01');
