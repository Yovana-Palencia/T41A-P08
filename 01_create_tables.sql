--Yovana Isabel Palencia Sánchez 174197
-- Tabla: customers
-- Configurar para forzar Nested Loops (solo para testing)
SET enable_hashjoin = off;
SET enable_mergejoin = off;

-- 1. Crear tablas
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
@@ -7,39 +11,30 @@ CREATE TABLE customers (
    signup_date DATE NOT NULL
);

-- Índices para optimizar búsquedas
CREATE INDEX idx_customers_city ON customers(city);
CREATE INDEX idx_customers_signup_date ON customers(signup_date);

-- Tabla: products
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE INDEX idx_products_name ON products(name);

-- Tabla: orders
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
    customer_id INTEGER NOT NULL REFERENCES customers(id),
    order_date DATE NOT NULL
);

CREATE INDEX idx_orders_order_date ON orders(order_date);
CREATE INDEX idx_orders_customer_id ON orders(customer_id);

-- Tabla: order_items
CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
    order_id INTEGER NOT NULL REFERENCES orders(id),
    product_id INTEGER NOT NULL REFERENCES products(id),
    quantity INTEGER NOT NULL
);

-- 2. Crear índices
CREATE INDEX idx_customers_city ON customers(city);
CREATE INDEX idx_customers_signup_date ON customers(signup_date);
CREATE INDEX idx_products_name ON products(name);
CREATE INDEX idx_orders_order_date ON orders(order_date);
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);
