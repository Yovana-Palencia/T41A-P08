--Yovana Isabel Palencia Sánchez 174197
-- Clientes y sus órdenes
SET enable_hashjoin = OFF;
EXPLAIN ANALYZE
SELECT c.name AS cliente, o.id AS orden_id, o.order_date
FROM customers c
JOIN orders o ON c.id = o.customer_id;

-- Órdenes y sus productos
SET enable_hashjoin = OFF;
EXPLAIN ANALYZE
SELECT o.id AS orden_id, p.name AS producto, oi.quantity
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
