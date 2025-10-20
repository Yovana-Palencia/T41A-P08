--Yovana Isabel Palencia Sánchez 174197
-- Clientes y sus órdenes
SELECT 
    c.name AS cliente,
    c.email,
    o.id AS orden_id,
    o.order_date AS fecha_orden
-- Para test_customer_orders_join
SET enable_hashjoin = off;
SET enable_mergejoin = off;

EXPLAIN ANALYZE
SELECT c.name, o.order_date
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
ORDER BY c.name, o.order_date;
JOIN orders o ON c.id = o.customer_id;

-- Órdenes y sus productos
SELECT 
    o.id AS orden_id,
    o.order_date AS fecha_orden,
    c.name AS cliente,
    p.name AS producto,
    oi.quantity AS cantidad,
    p.price AS precio_unitario,
    (oi.quantity * p.price) AS subtotal
-- Para test_order_products_join
EXPLAIN ANALYZE
SELECT o.id, p.name, oi.quantity
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
ORDER BY o.id;
JOIN products p ON oi.product_id = p.id;

-- Total gastado por cliente
SELECT 
    c.name AS cliente,
    c.email,
    SUM(oi.quantity * p.price) AS total_gastado
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
LEFT JOIN order_items oi ON o.id = oi.order_id
LEFT JOIN products p ON oi.product_id = p.id
GROUP BY c.id, c.name, c.email
ORDER BY total_gastado DESC;
-- Restaurar configuración
SET enable_hashjoin = on;
SET enable_mergejoin = on;
