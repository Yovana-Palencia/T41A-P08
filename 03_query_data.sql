--Yovana Isabel Palencia Sánchez 174197
-- Clientes y sus órdenes
SELECT
    c.name AS customer_name,
    o.id AS order_id,
    o.order_date
FROM customers c
JOIN orders o ON c.id = o.customer_id
ORDER BY c.name, o.order_date;

-- Órdenes y sus productos
SELECT
    o.id AS order_id,
    p.name AS product_name,
    oi.quantity,
    p.price,
    (oi.quantity * p.price) AS total_price
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
ORDER BY o.id;

-- Total gastado por cliente
SELECT
    c.name AS customer_name,
    SUM(oi.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
GROUP BY c.name
ORDER BY total_spent DESC;
