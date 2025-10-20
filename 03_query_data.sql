--Yovana Isabel Palencia Sánchez 174197
-- Forzar uso de Nested Loop para verificar el plan de ejecución
-- Forzar uso de Nested Loop para los tests
SET enable_hashjoin = OFF;

-- Test: Clientes y sus órdenes
-- Clientes y sus órdenes
EXPLAIN ANALYZE
SELECT c.name, o.order_date
FROM customers c
JOIN orders o ON c.id = o.customer_id;

-- Test: Órdenes y sus productos
-- Órdenes y sus productos
EXPLAIN ANALYZE
SELECT o.id, p.name, oi.quantity
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id;

-- Test: Total gastado por cliente
-- Total gastado por cliente
SELECT c.name AS cliente, SUM(p.price * oi.quantity) AS total_gastado
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
GROUP BY c.name;

-- Test: Conteo de registros (simulación de asserts)
-- Conteo de registros para simular asserts
SELECT 'customers' AS tabla, COUNT(*) AS total FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items;
