--Yovana Isabel Palencia Sánchez 174197
-- 3. Insertar datos
INSERT INTO customers (name, email, city, signup_date) VALUES
('Juan Pérez', 'juan.perez@email.com', 'Madrid', '2024-01-15'),
('María García', 'maria.garcia@email.com', 'Barcelona', '2024-02-20'),
('Carlos López', 'carlos.lopez@email.com', 'Madrid', '2024-03-10'),
('Ana Martínez', 'ana.martinez@email.com', 'Valencia', '2024-01-25');
INSERT INTO products (name, price) VALUES
('Laptop Gaming', 899.99),
('Smartphone', 599.50),
('Tablet', 299.99),
('Auriculares Bluetooth', 89.99);
INSERT INTO orders (customer_id, order_date) VALUES
(1, '2024-03-01'),
(2, '2024-03-02'),
(3, '2024-03-03'),
(1, '2024-03-04');
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 3, 1),
(2, 2, 2),
(3, 4, 3),
(4, 1, 1),
(4, 2, 1);

-- Restaurar configuración
SET enable_hashjoin = on;
SET enable_mergejoin = on;
