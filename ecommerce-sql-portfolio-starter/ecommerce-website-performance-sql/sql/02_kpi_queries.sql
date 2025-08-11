-- 02_kpi_queries.sql
-- Daily revenue & orders
SELECT DATE(order_date) AS order_day,
       COUNT(DISTINCT order_id) AS orders,
       SUM(total_amount) AS revenue
FROM orders
GROUP BY DATE(order_date)
ORDER BY order_day;

-- AOV
SELECT SUM(total_amount) / NULLIF(COUNT(DISTINCT order_id),0) AS aov FROM orders;

-- Revenue by category (join through order_items)
SELECT p.category,
       SUM(oi.qty * (oi.price - COALESCE(oi.discount,0))) AS revenue
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- Top 10 products
SELECT p.product_id, p.category, p.brand,
       SUM(oi.qty) AS units, 
       SUM(oi.qty * (oi.price - COALESCE(oi.discount,0))) AS revenue
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id
GROUP BY p.product_id, p.category, p.brand
ORDER BY revenue DESC
LIMIT 10;

-- Channel performance (if 'channel' exists on orders)
SELECT channel,
       COUNT(DISTINCT order_id) AS orders,
       SUM(total_amount) AS revenue
FROM orders
GROUP BY channel
ORDER BY revenue DESC;
