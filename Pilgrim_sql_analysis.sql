CREATE DATABASE pilgrim_assignment;
USE pilgrim;
-- =====================================================
-- Question 1
-- =====================================================
SELECT
    c.customer_segment,
    COUNT(o.order_id) AS total_orders,
    AVG(o.MRP) AS avg_MRP
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_segment
ORDER BY total_orders DESC;


-- =====================================================
-- Question 2
-- =====================================================
SELECT
    o.product_name,
    SUM(o.quantity * o.MRP * (1 - COALESCE(p.discount_pct, 0) / 100.0)) AS total_revenue
FROM orders o
LEFT JOIN product_pricing p
    ON o.product_name = p.product_name
    AND o.channel = p.channel
GROUP BY o.product_name
ORDER BY total_revenue DESC;


-- =====================================================
-- Question 3
-- =====================================================
SELECT
    o.channel,
    AVG(p.discount_pct) AS avg_discount_pct
FROM orders o
JOIN product_pricing p
    ON o.product_name = p.product_name
    AND o.channel = p.channel
GROUP BY o.channel
ORDER BY avg_discount_pct DESC;