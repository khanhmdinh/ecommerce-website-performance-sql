-- 03_ad_hoc_questions.sql
-- 1) Which month has the highest revenue and what categories drive it?
-- 2) How does weekend vs weekday conversion differ?
-- 3) Do discounts improve revenue or just shift demand?
-- 4) What is the repeat purchase rate within 30/60/90 days?
-- 5) Which channels have the highest ROAS (requires ad spend)?

-- Example: Monthly revenue by category
SELECT DATE_TRUNC('month', o.order_date) AS month,
       p.category,
       SUM(oi.qty * (oi.price - COALESCE(oi.discount,0))) AS revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
GROUP BY month, p.category
ORDER BY month, revenue DESC;
