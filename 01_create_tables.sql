--Yovana Isabel Palencia Sánchez 174197
-- Eliminar tablas si existen
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- Tabla: customers
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    signup_date DATE NOT NULL,
    CONSTRAINT unique_email UNIQUE (email)
    id SERIAL PRIMARY KEY, -- Identificador único autoincremental
    name VARCHAR(255) NOT NULL, -- Nombre del cliente (obligatorio)
    email VARCHAR(255) UNIQUE NOT NULL, -- Email único y obligatorio
    city VARCHAR(255) NOT NULL, -- Ciudad del cliente (obligatorio)
    signup_date DATE NOT NULL -- Fecha de registro (obligatoria)
);
-- Índices para optimizar búsquedas
CREATE INDEX idx_customers_city ON customers(city);        -- Índice para búsquedas por ciudad
CREATE INDEX idx_customers_signup_date ON customers(signup_date); -- Índice para rangos de fechas

-- Tabla: products
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
    id SERIAL PRIMARY KEY, -- Identificador único autoincremental
    name VARCHAR(255) NOT NULL, -- Nombre del producto (obligatorio)
    price NUMERIC(10, 2) NOT NULL -- Precio del producto (obligatorio, admite decimales)
);
CREATE INDEX idx_products_name ON products(name); -- Índice para búsquedas por nombre

-- Tabla: orders
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
    id  SERIAL PRIMARY KEY, -- Identificador único autoincremental
    customer_id INTEGER NOT NULL REFERENCES customers(id), -- Relación con cliente (clave foránea)
    order_date DATE NOT NULL -- Fecha de la orden (obligatoria)
);
CREATE INDEX idx_orders_order_date ON orders(order_date); -- Índice para rangos de fechas
CREATE INDEX idx_orders_customer_id ON orders(customer_id); -- Índice para búsquedas por cliente

-- Tabla: order_items
CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
    id SERIAL PRIMARY KEY, -- Identificador único autoincremental
    order_id INTEGER NOT NULL REFERENCES orders(id), -- Relación con orden (clave foránea)
    product_id INTEGER NOT NULL REFERENCES products(id), -- Relación con producto (clave foránea)
    quantity INTEGER NOT NULL -- Cantidad del producto (obligatoria)
);

-- Crear índices
CREATE INDEX idx_customers_city ON customers(city);
CREATE INDEX idx_customers_signup_date ON customers(signup_date);
CREATE INDEX idx_products_name ON products(name);
CREATE INDEX idx_orders_order_date ON orders(order_date);
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);
CREATE INDEX idx_order_items_order_id ON order_items(order_id); -- Índice para búsquedas por orden
CREATE INDEX idx_order_items_product_id ON order_items(product_id); -- Índice para búsquedas por producto
