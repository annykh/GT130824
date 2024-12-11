CREATE DATABASE store;
USE store;

-- Таблица клиентов
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

-- Таблица товаров
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

-- Таблица категорий товаров
CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100)
);

-- Таблица заказов
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total DECIMAL(10, 2)
);

-- Таблица деталей заказа
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2)
);


-- Заполнение таблицы клиентов
INSERT INTO customers (first_name, last_name, email) VALUES
('John', 'Doe', 'john@example.com'),
('Jane', 'Smith', 'jane@example.com'),
('Alice', 'Johnson', 'alice@example.com'),
('Bob', 'Brown', 'bob@example.com'),
('Ben', 'King', 'ben@example.com'),
('Mike', 'Cors', 'mike@example.com'),
('Jack', 'Smith', 'jack@example.com'),
('Emma', 'King', 'emma@example.com');

-- Заполнение таблицы категорий товаров
INSERT INTO categories (category_name) VALUES
('Electronics'),
('Furniture'),
('Clothing'),
('Toys');

-- Заполнение таблицы товаров
INSERT INTO products (product_name, price, category_id) VALUES
('Laptop', 1000.00, 1),
('Table', 150.00, 2),
('T-shirt', 20.00, 3),
('Bed', 100.00, 2),
('Phone', 1520.00, 1),
('Skirt', 50.00, 3);

-- Заполнение таблицы заказов
INSERT INTO orders (customer_id, order_date, total) VALUES
(1, '2024-09-10', 1020.00),
(2, '2024-09-12', 170.00),
(3, '2024-09-09', 70.00),
(4, '2024-08-09', 1520.00);

-- Заполнение таблицы деталей заказа
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1000.00),
(1, 3, 1, 20.00),
(2, 2, 1, 150.00),
(2, 3, 1, 20.00),
(3, 3, 1, 20.00),
(3, 6, 1, 50.00),
(4, 5, 1, 1520.00);
