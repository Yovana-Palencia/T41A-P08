--Yovana Isabel Palencia Sánchez 174197
SELECT c.name AS cliente, o.id AS orden_id, o.order_date
FROM customers c
JOIN orders o ON c.id = o.customer_id;

-- Órdenes y sus productos
SELECT o.id AS orden_id, p.name AS producto, oi.quantity
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id;

-- Total gastado por cliente
SELECT c.name AS cliente, SUM(p.price * oi.quantity) AS total_gastado
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
GROUP BY c.name;
