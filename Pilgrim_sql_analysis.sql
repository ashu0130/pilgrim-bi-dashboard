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

Result:
    customer_segment    total_orders     avg_MRP
    Gold                22               1327.64
    Silver              18               1282.11
    Bronze              10               1282.90
    
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

Top result: Vitamin C Serum (₹30,730.35), Collagen Supplement (₹20,429.18), Conditioner (₹14,298.75) etc...
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

Answer: Amazon has the highest average discount at 17.43%, followed by Instagram (11.36%), Website (9.25%), WhatsApp (7.11%), App (5.53%).
