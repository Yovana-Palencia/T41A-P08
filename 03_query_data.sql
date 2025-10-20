--Yovana Isabel Palencia Sánchez 174197
-- CONFIGURACIÓN PARA FORZAR NESTED LOOPS (ejecutar esto primero)
SET enable_hashjoin = off;
SET enable_mergejoin = off;
SELECT
    c.name AS customer_name,
    o.id AS order_id,
    o.order_date
FROM
    customers c
JOIN
    orders o ON c.id = o.customer_id;

-- Consulta 1: Clientes y sus órdenes
SELECT c.name AS cliente, o.order_date AS fecha_orden
FROM customers c
JOIN orders o ON c.id = o.customer_id;

-- Consulta 2: Órdenes y sus productos
SELECT o.id AS orden_id, p.name AS producto, oi.quantity AS cantidad
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id;

-- Consulta 3: Total gastado por cliente
SELECT 
    c.name AS cliente,
    SUM(oi.quantity * p.price) AS total_gastado
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
GROUP BY c.id, c.name
ORDER BY total_gastado DESC;
SELECT
    o.id AS order_id,
    p.name AS product_name,
    oi.quantity
FROM
    orders o
JOIN
    order_items oi ON o.id = oi.order_id
JOIN
    products p ON oi.product_id = p.id;

-- Restaurar configuración por defecto
SET enable_hashjoin = on;
SET enable_mergejoin = on;

SELECT
    c.name AS customer_name,
    SUM(p.price * oi.quantity) AS total_spent
FROM
    customers c
JOIN
    orders o ON c.id = o.customer_id
JOIN
    order_items oi ON o.id = oi.order_id
JOIN
    products p ON oi.product_id = p.id
GROUP BY
    c.name
ORDER BY
    total_spent DESC;
