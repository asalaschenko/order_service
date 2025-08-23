CREATE SCHEMA IF NOT EXISTS inventory_service;

CREATE TABLE IF NOT EXISTS inventory_service.products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    sku VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS inventory_service.stock (
    id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES inventory_service.products(id),
    warehouse_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 0,
    reserved_quantity INTEGER NOT NULL DEFAULT 0,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Тестовые данные (опционально)
INSERT INTO inventory_service.products (name, sku, description, price) VALUES 
    ('Laptop Dell', 'DELL-001', 'Gaming laptop', 999.99),
    ('Mouse Logitech', 'LOG-001', 'Wireless mouse', 29.99);

INSERT INTO inventory_service.stock (product_id, warehouse_id, quantity) VALUES 
    (1, 1, 50),
    (2, 1, 200);