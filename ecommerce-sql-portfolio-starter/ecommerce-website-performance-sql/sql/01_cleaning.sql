-- 01_cleaning.sql
-- Basic row counts and date ranges
SELECT 'orders' AS table_name, COUNT(*) AS rows, MIN(order_date) AS min_dt, MAX(order_date) AS max_dt FROM orders
UNION ALL
SELECT 'order_items', COUNT(*), NULL, NULL FROM order_items
UNION ALL
SELECT 'customers', COUNT(*), MIN(signup_date), MAX(signup_date) FROM customers
UNION ALL
SELECT 'products', COUNT(*), NULL, NULL FROM products;

-- Duplicates check
SELECT order_id, COUNT(*) FROM orders GROUP BY order_id HAVING COUNT(*) > 1;
SELECT customer_id, COUNT(*) FROM customers GROUP BY customer_id HAVING COUNT(*) > 1;
SELECT product_id, COUNT(*) FROM products GROUP BY product_id HAVING COUNT(*) > 1;

-- Null checks on business-critical columns
SELECT COUNT(*) AS null_orders FROM orders WHERE customer_id IS NULL OR total_amount IS NULL;
SELECT COUNT(*) AS null_items FROM order_items WHERE product_id IS NULL OR qty IS NULL OR price IS NULL;

-- Conformance check: order totals ≈ sum of items
SELECT o.order_id, o.total_amount, SUM(oi.qty * (oi.price - COALESCE(oi.discount,0))) AS items_total
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY o.order_id
HAVING ABS(o.total_amount - SUM(oi.qty * (oi.price - COALESCE(oi.discount,0)))) > 0.01;
