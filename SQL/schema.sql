use stock
--daily_return
;WITH stock_calc AS (
    SELECT 
        Stock,
        Date,
        Price,
        LAG(Price) OVER (PARTITION BY Stock ORDER BY Date) AS prev_price
    FROM stock_data
)
SELECT 
    Stock,
    Date,
    Price,
    prev_price,
    (Price - prev_price) / prev_price AS daily_return
FROM stock_calc
ORDER BY Stock, Date;
--average return per stock
WITH stock_calc AS (
    SELECT 
        Stock,
        Date,
        Price,
        LAG(Price) OVER (PARTITION BY Stock ORDER BY Date) AS prev_price
    FROM stock_data
),
returns AS (
    SELECT 
        Stock,
        Date,
        (Price - prev_price) / prev_price AS daily_return
    FROM stock_calc
    WHERE prev_price IS NOT NULL
)
SELECT 
    Stock,
    AVG(daily_return) AS avg_daily_return
FROM returns
GROUP BY Stock
ORDER BY avg_daily_return DESC;
--volatile stock
WITH stock_calc AS (
    SELECT 
        Stock,
        Date,
        Price,
        LAG(Price) OVER (PARTITION BY Stock ORDER BY Date) AS prev_price
    FROM stock_data
),
returns AS (
    SELECT 
        Stock,
        (Price - prev_price) / prev_price AS daily_return
    FROM stock_calc
    WHERE prev_price IS NOT NULL
)
SELECT 
    Stock,
    STDEV(daily_return) AS volatility
FROM returns
GROUP BY Stock
ORDER BY volatility DESC;
--best and wrost day
WITH stock_calc AS (
    SELECT 
        Stock,
        Date,
        Price,
        LAG(Price) OVER (PARTITION BY Stock ORDER BY Date) AS prev_price
    FROM stock_data
),
returns AS (
    SELECT 
        Stock,
        Date,
        (Price - prev_price) / prev_price AS daily_return
    FROM stock_calc
    WHERE prev_price IS NOT NULL
)
SELECT 'Best Day' AS type, *
FROM returns
WHERE daily_return = (SELECT MAX(daily_return) FROM returns)

UNION ALL

SELECT 'Worst Day' AS type, *
FROM returns
WHERE daily_return = (SELECT MIN(daily_return) FROM returns);
--monthly performances
WITH monthly_prices AS (
    SELECT 
        Stock,
        YEAR(Date) AS yr,
        MONTH(Date) AS mn,
        FIRST_VALUE(Price) OVER (
            PARTITION BY Stock, YEAR(Date), MONTH(Date) 
            ORDER BY Date
        ) AS first_price,
        LAST_VALUE(Price) OVER (
            PARTITION BY Stock, YEAR(Date), MONTH(Date) 
            ORDER BY Date 
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) AS last_price
    FROM stock_data
)
SELECT DISTINCT
    Stock,
    yr,
    mn,
    first_price,
    last_price,
    (last_price - first_price) / first_price AS monthly_return
FROM monthly_prices
ORDER BY Stock, yr, mn;