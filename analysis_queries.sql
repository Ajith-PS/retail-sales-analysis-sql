-- Total Sales by Each Customer --
 
SELECT c.name, SUM(o.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.name;

-- Top Selling Products --

SELECT p.product_name, SUM(o.quantity) AS total_sold
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

-- Montly Sales Trend --

SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
SUM(quantity * price) AS total_sales
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY month;

-- Customers Who Didn’t Order --

SELECT name
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id FROM orders
);

-- Highest Spending Customer --

SELECT c.name, SUM(o.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 1;

CREATE VIEW sales_summary AS
SELECT c.name, SUM(o.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.name;
 
        -- Revenue By Category --

SELECT 
    p.category,
    SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p 
ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;