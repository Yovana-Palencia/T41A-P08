--Yovana Isabel Palencia Sánchez 174197
-- Customers
INSERT INTO customers (name, email, city, signup_date) VALUES
('Yovana Palencia', '174197@upslp.edu.mx', 'México', '2023-01-15'),
('Alfredo', 'alfredo@gmail.com', 'Barcelona', '2023-02-10'),
('Cecilia Castro', 'cecilia@gmail.com', 'Madrid', '2023-03-05'),
('Citlali Castro', 'citlali@gmail.com', 'Valencia', '2023-04-22');

-- Products
INSERT INTO products (name, price) VALUES
('Laptop', 999.99),
('Smartphone', 499.49),
('Auriculares', 79.99),
('Teclado', 39.95);

-- Orders
INSERT INTO orders (customer_id, order_date) VALUES
(1, '2023-05-01'),
(2, '2023-05-03'),
(1, '2023-05-10'),
(3, '2023-06-01');

-- Order Items
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),  -- Yovana compra 1 Laptop
(1, 3, 2),  -- Yovana compra 2 Auriculares
(2, 2, 1),  -- Alfredo compra 1 Smartphone
(3, 4, 1),  -- Yovana compra 1 Teclado
(3, 3, 1),  -- Yovana compra 1 Auricular
(4, 2, 2);  -- Cecilia compra 2 Smartphones
