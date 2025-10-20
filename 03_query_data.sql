--Yovana Isabel Palencia Sánchez 174197
-- Para test_customer_orders_join
SET enable_hashjoin = off;
SET enable_mergejoin = off;
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

EXPLAIN ANALYZE
SELECT c.name, o.order_date
FROM customers c
JOIN orders o ON c.id = o.customer_id;
-- Verificar índices
SELECT 
    tablename, 
    indexname, 
    indexdef 
FROM pg_indexes 
WHERE tablename IN ('customers', 'orders', 'products', 'order_items')
ORDER BY tablename, indexname;

-- Para test_order_products_join
EXPLAIN ANALYZE
SELECT o.id, p.name, oi.quantity
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id;

-- Restaurar configuración
SET enable_hashjoin = on;
SET enable_mergejoin = on;
-- Verificar datos
SELECT 'customers' as table_name, COUNT(*) as count FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items;
