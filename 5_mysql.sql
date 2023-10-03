SELECT POWER(10,SUM(LOG10(value)))
FROM my_table;

-- or

SELECT EXP(SUM(LN(value)))
FROM my_table;
