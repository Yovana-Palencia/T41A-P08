--Yovana Isabel Palencia Sánchez 174197
-- Customers
-- Insertar 4 clientes
INSERT INTO customers (name, email, city, signup_date) VALUES
('Ana Torres', 'ana.torres@example.com', 'Monterrey', '2025-01-15'),
('Luis Gómez', 'luis.gomez@example.com', 'Guadalajara', '2025-02-20'),
('María López', 'maria.lopez@example.com', 'CDMX', '2025-03-05'),
('Carlos Ruiz', 'carlos.ruiz@example.com', 'Puebla', '2025-04-10');
('Juan Pérez', 'juan.perez@email.com', 'Madrid', '2024-01-15'),
('María García', 'maria.garcia@email.com', 'Barcelona', '2024-02-20'),
('Carlos López', 'carlos.lopez@email.com', 'Madrid', '2024-03-10'),
('Ana Martínez', 'ana.martinez@email.com', 'Valencia', '2024-01-25');

-- Products
-- Insertar 4 productos
INSERT INTO products (name, price) VALUES
('Laptop', 15000.00),
('Mouse', 250.00),
('Teclado', 500.00),
('Monitor', 3000.00);
('Laptop Gaming', 899.99),
('Smartphone', 599.50),
('Tablet', 299.99),
('Auriculares Bluetooth', 89.99);

-- Orders
-- Insertar 4 órdenes
INSERT INTO orders (customer_id, order_date) VALUES
(1, '2025-05-01'),
(2, '2025-05-03'),
(3, '2025-05-05'),
(1, '2025-05-07');
(1, '2024-03-01'),
(2, '2024-03-02'),
(3, '2024-03-03'),
(1, '2024-03-04');

-- Order Items
-- Insertar 6 items de órdenes
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(3, 4, 2),
(4, 2, 1),
(4, 3, 1);

-- Insert previo para probar UNIQUE en email
INSERT INTO customers (name, email, city, signup_date) VALUES
('Test', 'duplicate@example.com', 'TestCity', '2025-06-01');

-- Datos para probar restricción UNIQUE
-- Este insert es válido
INSERT INTO customers (name, email, city, signup_date) VALUES
('Test', 'duplicate@example.com', 'TestCity', '2025-06-01');


(1, 1, 1),   -- Orden 1: 1 Laptop
(1, 3, 1),   -- Orden 1: 1 Tablet
(2, 2, 2),   -- Orden 2: 2 Smartphones
(3, 4, 3),   -- Orden 3: 3 Auriculares
(4, 1, 1),   -- Orden 4: 1 Laptop
(4, 2, 1);   -- Orden 4: 1 Smartphone
