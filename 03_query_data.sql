--Yovana Isabel Palencia Sánchez 174197
-- Verificar que las restricciones existen
SELECT 
    tc.table_name, 
    tc.constraint_name, 
    tc.constraint_type,
    kcu.column_name
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu 
    ON tc.constraint_name = kcu.constraint_name
WHERE tc.table_name IN ('customers', 'products', 'orders', 'order_items')
ORDER BY tc.table_name, tc.constraint_type;
-- CONFIGURACIÓN PARA FORZAR NESTED LOOPS (ejecutar esto primero)
SET enable_hashjoin = off;
SET enable_mergejoin = off;

-- Consulta 1: Clientes y sus órdenes
SELECT c.name AS cliente, o.order_date AS fecha_orden
FROM customers c
JOIN orders o ON c.id = o.customer_id;

-- Consulta 2: Órdenes y sus productos
SELECT o.id AS orden_id, p.name AS producto, oi.quantity AS cantidad
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id;

-- Verificar índices
-- Consulta 3: Total gastado por cliente
SELECT 
    tablename, 
    indexname, 
    indexdef 
FROM pg_indexes 
WHERE tablename IN ('customers', 'orders', 'products', 'order_items')
ORDER BY tablename, indexname;
    c.name AS cliente,
    SUM(oi.quantity * p.price) AS total_gastado
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
GROUP BY c.id, c.name
ORDER BY total_gastado DESC;

-- Verificar datos
SELECT 'customers' as table_name, COUNT(*) as count FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items;
-- Restaurar configuración por defecto
SET enable_hashjoin = on;
SET enable_mergejoin = on;
