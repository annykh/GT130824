-- 1. Что такое MySQL?
-- a) Это текстовый редактор для создания HTML-страниц
-- b) Это реляционная система управления базами данных (СУБД) 
-- c) Это язык программирования для создания мобильных приложений
-- d) Это инструмент для работы с графикой

-- 2. Какой оператор MySQL используется для выбора данных из базы данных?
-- a) GET
-- b) CHOOSE
-- c) SELECT 
-- d) FETCH

-- 3. Какой оператор MySQL используется для обновления данных в базе данных?
-- a) MODIFY
-- b) UPDATE 
-- c) CHANGE
-- d) SET

-- 4. Какой оператор MySQL используется для удаления данных из базы данных?
-- a) REMOVE
-- b) DELETE 
-- c) ERASE
-- d) DROP

-- 5. Какой оператор MySQL используется для вставки новых данных в базу данных?
-- a) INSERT INTO 
-- b) ADD
-- c) INCLUDE
-- d) APPEND

-- 6. Как в MySQL выбрать все столбцы из таблицы с именем "Persons"?
-- a) SELECT * FROM Persons; 
-- b) SELECT ALL FROM Persons;
-- c) SELECT Persons;
-- d) SELECT ALL COLUMNS FROM Persons;

-- 7. Какой оператор MySQL используется для возврата только разных значений?
-- a) DISTINCT 
-- b) UNIQUE
-- c) DIFFERENT
-- d) VARIANCE

-- 8. Оператор OR отображает запись, если выполняются КАКИЕ-ЛИБО из перечисленных условий. Оператор AND отображает запись, если выполняются ВСЕ перечисленные условия
-- a) True
-- b) False

-- 9. Какие функции позволяют получить одновременно текущие дату/время?
-- a) CURTIME()
-- b) TIME()
-- c) NOW()

-- 10. Какой SQL-оператор создаёт базу данных в MySQL?
-- a) INSERT DATABASE dbname;
-- b) ADD DATABASE dbname;
-- c) USE dbname
-- d) CREATE DATABASE dbname;

-- 11. Что значат цифры в описании типа данных колонки DECIMAL(5,2)
-- a) Всего 5 числовых знаков, из них 2 на дробную часть
-- b) Всего 7 числовых знаков, из них 2 на дробную часть
-- c) Всего 7 числовых знаков, из них 0 на дробную часть
-- d) Всего 7 числовых знаков, из них 5 на дробную часть

-- 12. Какие математические функции в MySQL округляют числовые значения?
-- a) POW()
-- b) ROUND()
-- c) RAND()

-- 13. Какая строковая функция отвечает за склейку строк?
-- a) CONCAT()
-- b) SUM()
-- c) REPLACE()
-- d) LOWER()

-- 14. Как можно вернуть количество записей в таблице ''Persons'' с помощью MySQL?
-- a) SELECT LENGTH(*) FROM Persons
-- b) SELECT SUM(*) FROM Persons
-- c) SELECT COUNT(*) FROM Persons
-- d) SELECT ALL(*) FROM Persons

-- 15. С помощью MySQL, как можно вставить ''Olsen'' в качестве ''LastName'' в таблицу ''Persons''?
-- a) INSERT ('Olsen') INTO Persons (LastName)
-- b) INSERT INTO Persons (LastName) VALUES ('Olsen')
-- c) INSERT INTO Persons VALUES ('Olsen')

-- 16. Создать и активировать базу данных tasks. 
create database tasks;
use tasks;


-- 17. Создать таблицу store с полями:  
--     • id — целое число, первичный ключ, автоинкремент.  
--     • title — строка (128 символов), не NULL.  
--     • price — целое число.  
--     • quantity — целое число.  
create table store(
		id int primary key auto_increment,
        title varchar(128) not null,
        price int,
        quantity int
);
     
-- 18. Добавить в таблицу store записи:  
--     • title — 'Skirt', price — 120, quantity — 10.  
--     • title — 'Shirt', price — 55, quantity — 4.  
--     • title — 'Jeanse', price — 135, quantity — 15.  
insert into store (title, price, quantity) values ('Skirt', 120, 10);
insert into store (title, price, quantity) values ('Skirt', 55, 4);
insert into store (title, price, quantity) values ('Jeanse', 135, 15);

-- 19. Из таблицы store вывести те товары, цена которых больше 100.  
select * from store
where price > 100;

-- 20. Из таблицы store вывести те товары, название которых начинается на букву 'S'.  
select * from store
where title like 's%';

-- 21. Увеличить количество товара с названием 'Jeanse' на 5.  
set sql_safe_updates = 0;

update store
set quantity = quantity + 5
where title = 'Jeanse';

set sql_safe_updates = 1;

-- 22. Добавить новое поле quality — целое число.  
alter table store
add column quality int;

-- 23. Заполнить поле quality:  
--     • Если цена товара больше 100, установить значение 5.  
--     • Если цена товара меньше или равна 100, установить значение 4.  
set sql_safe_updates = 0;
update store
set quality = case
					when price > 100 then 5
                    when price <= 100 then 4
				end;
                
update store
set quality = case
					when price > 100 then 5
                    else 4
				end ;
                
update store
set quality = if(price > 100, 5, 4);
     
-- 24. Удалить из таблицы store товары, где количество меньше 10.  
delete from store
where quantity < 10;

set sql_safe_updates = 1;

-- 25. Удалить таблицу store.  
drop table store;

-- 26. Удалить базу данных tasks.  
drop database tasks;

-- 27. Создать базу данных shop и заполнить её, используя скрипт:  
--     https://github.com/annykh/GT130824/blob/main/shop.sql
--     
--     Техническое описание этой базы данных доступно по следующей ссылке -  
--     https://github.com/annykh/GT130824/blob/main/%D0%A2%D0%B5%D1%85_%D0%BE%D0%BF%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D0%B5_shop.txt
use shop;
select * from customers;
select * from orders;
select * from sellers;

-- 28. Вывести всех продавцов, чьи имена начинаются на букву 'Л'.  
select sname
from sellers
where sname like 'Л%';

-- 29. Вывести всех клиентов из города Тула с рейтингом больше 100.  
select cname
from customers
where city = 'Тула' and rating > 100;

-- 30. Вывести всех продавцов, чьи комиссии между 0.10 и 0.15 (включительно).  
select sname
from sellers
where comm between 0.10 and 0.15;

-- 31. Вывести заказы, сумма которых меньше 1000 и дата которых после 1 апреля 2022 года.  
select *
from orders
where amt < 1000 and odate > '2022-04-01';

-- 32. Вывести пары покупателей и обслуживших их продавцов из одного города.  
select sname, cname
from sellers as sel
join orders as ord
on sel.sell_id = ord.sell_id
join customers as cus
on cus.cust_id = ord.cust_id
where sel.city = cus.city;

-- 33. Вывести имена продавцов, у которых нет заказов.  
select sname
from sellers as sel
left join orders as ord
on sel.sell_id = ord.sell_id
where ord.order_id is null;

-- 34. Вывести имена всех продавцов, которые продают товары клиентам из Тулы.  
select distinct sname
from sellers as sel
join orders as ord
on sel.sell_id = ord.sell_id
join customers as cus
on cus.cust_id = ord.cust_id
where cus.city = 'Тула';

-- 35. Вывести имена всех клиентов и продавцов, которые сделали заказ в июне 2022 года.
select sname, cname
from sellers as sel
join orders as ord
on sel.sell_id = ord.sell_id
join customers as cus
on cus.cust_id = ord.cust_id
where year(odate) = 2022 and month(odate) = 6;

-- 36. Найти среднюю сумму заказа для каждого клиента.  
select cust_id, avg(amt)
from orders
group by cust_id;

-- 37. Найти общее количество клиентов в каждом городе.
select city, count(cust_id)
from customers
group by city;

-- 38. Вывести города, в которых средняя сумма заказа превышает 2000.
select city, avg(amt) 
from customers as cust
join orders as ord
on cust.cust_id = ord.cust_id
group by city
having avg(amt) > 2000;

-- 39. Вывести продавцов, у которых количество заказов больше 2.
select sel.sname
from sellers as sel
join orders as ord
on sel.sell_id = ord.sell_id
group by sel.sname
having count(ord.order_id) > 2;

select sel.sname
from sellers as sel
join (select sell_id
		from orders
		group by sell_id
		having count(order_id) > 2) as ord_count
on ord_count.sell_id = sel.sell_id;

-- 40. Определить количество заказов, сделанных клиентами из Тулы.
select count(ord.order_id)
from orders as ord
join customers as cust
on ord.cust_id = cust.cust_id
where cust.city = 'Тула';
