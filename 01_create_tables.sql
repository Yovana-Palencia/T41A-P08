--Yovana Isabel Palencia Sánchez 174197
--- Tabla: customers
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
@@ -20,7 +20,7 @@ CREATE INDEX idx_products_name ON products(name);
-- Tabla: orders
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    customer_id INT NOT NULL REFERENCES customers(id),
    order_date DATE NOT NULL
);
CREATE INDEX idx_orders_order_date ON orders(order_date);
@@ -29,8 +29,8 @@ CREATE INDEX idx_orders_customer_id ON orders(customer_id);
-- Tabla: order_items
CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id),
    product_id INT REFERENCES products(id),
    order_id INT NOT NULL REFERENCES orders(id),
    product_id INT NOT NULL REFERENCES products(id),
    quantity INT NOT NULL
);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
