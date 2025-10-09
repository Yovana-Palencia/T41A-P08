--Yovana Isabel Palencia Sánchez 174197
-- customers (4 registros, 1 email duplicado intencional para probar UNIQUE)
INSERT INTO customers (name, email, city, signup_date) VALUES
('Ana López', 'ana@example.com', 'Madrid', '2023-01-15'),
('Carlos Ruiz', 'carlos@example.com', 'Barcelona', '2023-02-10'),
('Lucía Gómez', 'lucia@example.com', 'Madrid', '2023-03-05'),
('Javier Pérez', 'ana@example.com', 'Valencia', '2023-04-22'); -- email duplicado a propósito

-- products
INSERT INTO products (name, price) VALUES
('Laptop', 999.99),
('Smartphone', 499.49),
('Auriculares', 79.99),
('Teclado', 39.95);

-- orders
INSERT INTO orders (customer_id, order_date) VALUES
(1, '2023-05-01'),
(2, '2023-05-03'),
(1, '2023-05-10'),
(3, '2023-06-01');

-- order_items (6 registros)
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(3, 4, 1),
(3, 3, 1),
(4, 2, 2);
