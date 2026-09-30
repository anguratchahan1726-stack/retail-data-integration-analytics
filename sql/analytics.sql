-- Retail Data Integration & Analytics Pipeline
-- SQL Analytics

-- 1. Overall KPIs
SELECT
    COUNT(DISTINCT InvoiceNo) AS total_orders,
    SUM(Quantity) AS total_quantity,
    ROUND(SUM(Quantity * UnitPrice), 2) AS total_revenue,
    ROUND(
        SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo),
        2
    ) AS average_order_value
FROM sales;


-- 2. Top 10 revenue entries
SELECT
    p.StockCode,
    p.Description,
    ROUND(SUM(s.Quantity * s.UnitPrice), 2) AS revenue
FROM sales s
JOIN products p
    ON s.ProductKey = p.ProductKey
GROUP BY p.StockCode, p.Description
ORDER BY revenue DESC
LIMIT 10;


-- 3. Top 10 countries by revenue
SELECT
    c.Country,
    ROUND(SUM(s.Quantity * s.UnitPrice), 2) AS revenue
FROM sales s
JOIN country c
    ON s.CountryKey = c.CountryKey
GROUP BY c.Country
ORDER BY revenue DESC
LIMIT 10;


-- 4. Top 10 entries by quantity sold
SELECT
    p.StockCode,
    p.Description,
    SUM(s.Quantity) AS total_quantity
FROM sales s
JOIN products p
    ON s.ProductKey = p.ProductKey
GROUP BY p.StockCode, p.Description
ORDER BY total_quantity DESC
LIMIT 10;


-- 5. Revenue by product using a CTE
WITH product_revenue AS (
    SELECT
        p.StockCode,
        p.Description,
        SUM(s.Quantity * s.UnitPrice) AS revenue
    FROM sales s
    JOIN products p
        ON s.ProductKey = p.ProductKey
    GROUP BY p.StockCode, p.Description
)
SELECT
    StockCode,
    Description,
    ROUND(revenue, 2) AS revenue
FROM product_revenue
ORDER BY revenue DESC
LIMIT 10;


-- 6. Product revenue ranking using a window function
WITH product_revenue AS (
    SELECT
        p.StockCode,
        p.Description,
        SUM(s.Quantity * s.UnitPrice) AS revenue
    FROM sales s
    JOIN products p
        ON s.ProductKey = p.ProductKey
    GROUP BY p.StockCode, p.Description
)
SELECT
    StockCode,
    Description,
    ROUND(revenue, 2) AS revenue,
    RANK() OVER (ORDER BY revenue DESC) AS revenue_rank
FROM product_revenue
ORDER BY revenue_rank
LIMIT 10;
