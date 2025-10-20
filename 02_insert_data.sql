--Yovana Isabel Palencia Sánchez 174197
INSERT INTO customers (name, email, city, signup_date) VALUES
('Ana Torres', 'ana.torres@example.com', 'Monterrey', '2025-01-15'),
('Luis Gómez', 'luis.gomez@example.com', 'Guadalajara', '2025-02-20'),
('María López', 'maria.lopez@example.com', 'CDMX', '2025-03-05'),
('Carlos Ruiz', 'carlos.ruiz@example.com', 'Puebla', '2025-04-10');

-- Products
INSERT INTO products (name, price) VALUES
('Laptop', 15000.00),
('Mouse', 250.00),
('Teclado', 500.00),
('Monitor', 3000.00);

-- Orders
INSERT INTO orders (customer_id, order_date) VALUES
(1, '2025-05-01'),
(2, '2025-05-03'),
(3, '2025-05-05'),
(1, '2025-05-07');

-- Order Items
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(3, 4, 2),
(4, 2, 1),
(4, 3, 1);
