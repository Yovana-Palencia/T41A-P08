--Yovana Isabel Palencia Sánchez 174197
-- Forzar uso de Nested Loop
SET enable_hashjoin = OFF;

-- Clientes y sus órdenes
EXPLAIN ANALYZE
SELECT c.name, o.order_date
SELECT 
    c.name AS cliente,
    c.email,
    o.id AS orden_id,
    o.order_date AS fecha_orden
FROM customers c
JOIN orders o ON c.id = o.customer_id;
LEFT JOIN orders o ON c.id = o.customer_id
ORDER BY c.name, o.order_date;

-- Órdenes y sus productos
EXPLAIN ANALYZE
SELECT o.id, p.name, oi.quantity
SELECT 
    o.id AS orden_id,
    o.order_date AS fecha_orden,
    c.name AS cliente,
    p.name AS producto,
    oi.quantity AS cantidad,
    p.price AS precio_unitario,
    (oi.quantity * p.price) AS subtotal
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id;
JOIN products p ON oi.product_id = p.id
ORDER BY o.id;

-- Total gastado por cliente
SELECT c.name AS cliente, SUM(p.price * oi.quantity) AS total_gastado
SELECT 
    c.name AS cliente,
    c.email,
    SUM(oi.quantity * p.price) AS total_gastado
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
GROUP BY c.name;

-- Conteo de registros para simular asserts
SELECT 'customers' AS tabla, COUNT(*) AS total FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items;
LEFT JOIN orders o ON c.id = o.customer_id
LEFT JOIN order_items oi ON o.id = oi.order_id
LEFT JOIN products p ON oi.product_id = p.id
GROUP BY c.id, c.name, c.email
ORDER BY total_gastado DESC;
