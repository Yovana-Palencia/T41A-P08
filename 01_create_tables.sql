--Yovana Isabel Palencia Sánchez 174197
-- Tabla: customers
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,                        -- Identificador único autoincremental
    name VARCHAR(100) NOT NULL,                   -- Nombre del cliente (obligatorio)
    email VARCHAR(100) NOT NULL UNIQUE,           -- Email único y obligatorio
    city VARCHAR(100) NOT NULL,                   -- Ciudad del cliente (obligatorio)
    signup_date DATE NOT NULL                     -- Fecha de registro (obligatoria)
);

-- Índices para optimizar búsquedas
CREATE INDEX idx_customers_city ON customers(city);              -- Búsqueda por ciudad
CREATE INDEX idx_customers_signup_date ON customers(signup_date); -- Rango de fechas

-- Tabla: products
CREATE TABLE products (
    id SERIAL PRIMARY KEY,                        -- Identificador único autoincremental
    name VARCHAR(100) NOT NULL,                   -- Nombre del producto (obligatorio)
    price DECIMAL(10,2) NOT NULL                  -- Precio del producto (obligatorio)
);
CREATE INDEX idx_products_name ON products(name); -- Búsqueda por nombre

-- Tabla: orders
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,                        -- Identificador único autoincremental
    customer_id INTEGER NOT NULL REFERENCES customers(id),  -- Relación con cliente
    order_date DATE NOT NULL                      -- Fecha de la orden (obligatoria)
);
CREATE INDEX idx_orders_order_date ON orders(order_date);       -- Rango de fechas
CREATE INDEX idx_orders_customer_id ON orders(customer_id);     -- Búsqueda por cliente

-- Tabla: order_items
CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,                        -- Identificador único autoincremental
    order_id INTEGER NOT NULL REFERENCES orders(id),     -- Relación con orden
    product_id INTEGER NOT NULL REFERENCES products(id), -- Relación con producto
    quantity INTEGER NOT NULL                     -- Cantidad del producto (obligatoria)
);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);     -- Búsqueda por orden
CREATE INDEX idx_order_items_product_id ON order_items(product_id); -- Búsqueda por producto
