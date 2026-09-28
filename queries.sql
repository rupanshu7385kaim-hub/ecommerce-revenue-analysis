-- 1. Create the Staging Table
-- All columns were initially imported as VARCHAR to prevent copy errors, 
-- with data types handled dynamically during analysis.
CREATE TABLE sales_data (
    user_id VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    "Price (Rs.)" VARCHAR(50),
    "Discount (%)" VARCHAR(50),
    "Final_Price(Rs.)" VARCHAR(50),
    payment_method VARCHAR(50),
    purchase_date VARCHAR(50)
);

-- 2. Verify Data Import
SELECT * 
FROM sales_data;

-- 3. Calculate Total Gross Revenue
SELECT 
    SUM(CAST("Final_Price(Rs.)" AS DECIMAL)) AS total_revenue 
FROM sales_data;

-- 4. Calculate Total Order Volume
SELECT 
    COUNT(DISTINCT product_id) AS total_orders 
FROM sales_data;

-- 5. Analyze Revenue by Category (Top Performers)
SELECT 
    category, 
    SUM(CAST("Final_Price(Rs.)" AS DECIMAL)) AS category_revenue
FROM sales_data
GROUP BY category
ORDER BY category_revenue DESC;

-- 6. Analyze Payment Gateway Distribution
SELECT 
    payment_method, 
    SUM(CAST("Final_Price(Rs.)" AS DECIMAL)) AS gateway_revenue,
    COUNT(product_id) AS transaction_count
FROM sales_data
GROUP BY payment_method
ORDER BY gateway_revenue DESC;