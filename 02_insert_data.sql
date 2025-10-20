--Yovana Isabel Palencia Sánchez 174197
-- Insertar datos en customers
INSERT INTO customers (name, email, city, signup_date) VALUES
('Juan Pérez', 'juan.perez@email.com', 'Madrid', '2024-01-15'),
('María García', 'maria.garcia@email.com', 'Barcelona', '2024-02-20'),
('Carlos López', 'carlos.lopez@email.com', 'Madrid', '2024-03-10'),
('Ana Martínez', 'ana.martinez@email.com', 'Valencia', '2024-01-25');
('Juan Pérez', 'correo1@gmail.com', 'Ciudad de México', '2023-01-15'),
('Ana García', 'correo2@gmail.com', 'Guadalajara', '2023-02-20'),
('Luis Martínez', 'correo3@gmail.com', 'Monterrey', '2023-03-10'),
('Sofía Fernandez', 'alice@example.com', 'Puebla', '2023-04-05');

-- Insertar datos en products
INSERT INTO products (name, price) VALUES
('Laptop Gaming', 899.99),
('Smartphone', 599.50),
('Tablet', 299.99),
('Auriculares Bluetooth', 89.99);
('Laptop', 25000.50),
('Mouse', 750.00),
('Teclado', 1800.75),
('Monitor', 8500.00);

-- Insertar datos en orders
INSERT INTO orders (customer_id, order_date) VALUES
(1, '2024-03-01'),
(2, '2024-03-02'),
(3, '2024-03-03'),
(1, '2024-03-04');
(1, '2024-05-10'),
(2, '2024-05-12'),
(1, '2024-06-15'),
(3, '2024-06-20');

-- Insertar datos en order_items
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 3, 1),
(2, 2, 2),
(3, 4, 3),
(4, 1, 1),
(4, 2, 1);
(1, 1, 1), 
(1, 2, 1), 
(2, 4, 2), 
(3, 3, 1),
(4, 1, 1), 
(4, 2, 2);

ANALYZE;
ALTER DATABASE test_db SET random_page_cost = 1.1;
ALTER DATABASE test_db SET seq_page_cost = 100;
ALTER DATABASE test_db SET enable_mergejoin = off;
