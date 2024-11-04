-- comment

/*
comment
...
*/

/*
CRUD
CREATE - create table, create database
READ - select 
UPDATE - alter table, update
DELETE - drop database, drop table, delete 
*/

-- ВЫБОРКИ (SELECT)

/* 
SELECT поле1, поле2
FROM название_таблицы; 

select поле1, поле2
from название_таблицы;

select поле1, поле2 from название_таблицы; 
*/

-- CUSTOMERS = customers = Customers

/*
select *
from название_таблицы;

* - все поля
*/

-- Вывести все из таблицы Customers
/* select *
from customers; */

-- Вывести только имена и фамилии покупателей из Customers
/*  select first_name, last_name
from customers; */

/* select поле1, поле2
from название_таблицы
where Условие; */

-- Вывести покупателей, которым больше 25.
/* select *
from customers
where age > 25; */

-- Вывести всех покупателей, кроме Betty.
/* select *
from customers
where first_name != 'Betty'; */

-- Вывести всех покупателей, кроме Betty и John.
/* select *
from customers
where first_name != 'Betty' and first_name != 'John'; */

/* select *
from customers
where first_name not in ('Betty', 'John'); */

-- Вывести покупателей с именами John и Betty.
/* select *
from customers
where first_name = 'John' or first_name = 'Betty'; */

/* select * 
from customers
where first_name in ('John', 'Betty'); */


-- Вывести покупателей в возрасте от 25 до 30(вкл. концы).
/* select *
from customers
where age >= 25 and age <= 30; */

-- поле between min and max (min, max вкл.)

/* select * 
from customers
where age between 25 and 30; */

-- Вывести покупателей, которым меньше 25 или больше 30.
/* select *
from customers
where age < 25 or age > 30; */

/* select *
from customers
where age not between 25 and 30; */

-- Вывести таблицу Orders 
/* select *
from orders; */

-- Вывести те заказы, где сумма заказа(amount) больше 1000
/* select *
from orders
where amount > 1000; */

-- Вывести только имена товаров и ид покупателей из таблицы Orders
/* select item, customer_id
from orders; */

-- Вывести имена тех товаров из Orders, сумма заказа которых больше/равна 500 и меньше/равна 1000 .
/* select item
from orders
where amount between 500 and 1000; */

-- Вывести покупателей из USA или из UK.
/* select *
from customers
where country in ('USA', 'UK'); */


-- 'd%' - строка, которая начинается на D
-- '%.com' - строка, которая заканчивается на .com
-- '_b%' - строка, где вторая буква B
-- '___' - строка из 3 символов
-- '___a' - строка из 4 символов, где последняя буква А
-- '%ab%' - строка, которая содержит подстроку 'ab'

-- Вывести покупателей у которых фамилия начинаетя на R.
/* select *
from customers
where last_name like 'r%'; */

-- Вывести покупателей у которых фамилия заканчивается на E
/* select *
from customers
where last_name like '%e'; */

-- Вывести покупателей у которых имя содержит букву B.
/* select *
from customers
where first_name like '%b%'; */

-- Вывести покупателей, у которых в имени  встречаются сочетания 'oh' или 'tt'.
/* select *
from customers
where first_name like '%oh%' or first_name like '%tt%'; */

-- Вывести покупателей, которым больше 20 и фамилия начинается на D.
/* select *
from customers
where age > 20 and last_name like 'd%'; */

-- Вывести покупателей, которым от 20 до 30(вкл.), или их имена начинаются на B, или они из USA.
/* select *
from customers
where (age between 20 and 30) or (first_name like 'b%') or (country = 'USA'); */

-- Вывести покупателей с id 2 или 3, которым больше 20.
/* select *
from customers
where (customer_id = 2 or customer_id = 3) and age > 20; */

/* select *
from customers
where customer_id in (2, 3) and age > 20; */
