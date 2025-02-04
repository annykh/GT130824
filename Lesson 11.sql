drop database store;

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


select * from customers;
select * from products;
select * from categories;
select * from orders;
select * from order_items;

-- min
-- max
-- sum
-- avg
-- count

-- Найти кол/во продуктов в магазине
select count(product_id)
from products;

-- Найти среднюю стоимость всех товаров.
select avg(price)
from products;

-- Вывести название товара с минимальной стоимостью.
-- Вариант 1 (order by и limit)
select product_name
from products
order by price
limit 1;

-- Вариант 2 (subselect)
select product_name
from products
where price = (select min(price) from products);

-- Найти среднюю стоимость товаров в каждой категории(category_id).
select avg(price), category_id
from products
group by category_id;

-- Найти самую дорогую и самую дешевую цену товара в каждой категории(category_id)
select max(price), min(price), category_id
from products
group by category_id;

-- Найти категории(category_id) товаров, в которых средняя цена товара выше 100.
select category_id, avg(price) as avg_price
from products
group by category_id
having avg_price > 100;

-- Определите количество проданных единиц каждого товара.
select product_id, sum(quantity)
from order_items
group by product_id;

-- Найти среднюю стоимость товаров в каждой категории(category_name).
select cat.category_name, avg(pro.price)
from categories as cat
join products as pro
on cat.category_id = pro.category_id
group by cat.category_name;

-- Определите количество проданных единиц каждого товара. Вывести название товара и кол/во.
select pro.product_name, sum(o_i.quantity)
from products as pro
join order_items as o_i
on pro.product_id = o_i.product_id
group by pro.product_name;

-- Вывести названия товаров, цена которых выше средней стоимости всех товаров.
select product_name
from products
where price > (select avg(price) from products);

-- Найти кол/во товаров, цена которых выше средней стоимости всех товаров.
select count(product_id)
from products
where price > (select avg(price) from products);
