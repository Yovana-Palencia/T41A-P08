--Yovana Isabel Palencia Sánchez 174197
-- 1. Crear tablas con todas las restricciones
-- 1. Eliminar tablas si existen (para empezar limpio)
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- 2. Crear tablas con todas las restricciones explícitas
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    email VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    signup_date DATE NOT NULL
    signup_date DATE NOT NULL,
    CONSTRAINT unique_email UNIQUE (email)
);

CREATE TABLE products (
@@ -29,11 +36,18 @@ CREATE TABLE order_items (
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- 2. Crear índices
-- 3. Crear índices específicos para forzar Nested Loop Joins
-- Índices para customers
CREATE INDEX idx_customers_city ON customers(city);
CREATE INDEX idx_customers_signup_date ON customers(signup_date);

-- Índices para products
CREATE INDEX idx_products_name ON products(name);

-- Índices para orders (clave para Nested Loops)
CREATE INDEX idx_orders_customer_id_small ON orders(customer_id) WHERE customer_id < 100;
CREATE INDEX idx_orders_order_date ON orders(order_date);
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);

-- Índices para order_items (clave para Nested Loops)
CREATE INDEX idx_order_items_order_id_small ON order_items(order_id) WHERE order_id < 100;
CREATE INDEX idx_order_items_product_id_small ON order_items(product_id) WHERE product_id < 100;
