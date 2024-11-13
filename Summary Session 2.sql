-- create database db_name;

-- use db_name;

/*
create table table_name1(
	column_name data_type [constraint],
    column_name data_type [constraint]
);
*/

-- insert into table_name1 (column1, column2, ...)
-- values (value1, value2, ...);

-- drop table table_name1;

-- drop database db_name;

-- integer/int - целое число
-- numeric/decimal - числовые данные
-- varchar(N) - N максимальное кол/во символов в строке.
-- char(M) - M фиксированное кол/во символов в строке. 

-- unique - значение в поле должно быть уникальным 
-- not null - значение в поле не может быть незаполненым (null)
-- primary key - not null + unique  - один primary key в таблице 
-- check - соответствует какому_либо условию
-- default - значения по умолчанию
-- auto_increment/autoincrement - позволяет создавать уникальный номер автоматически, когда новая 
-- запись вставляется в таблицу. Часто это поле основного ключа, которое мы хотели бы создать 
-- автоматически каждый раз, когда будет вставлена новая запись.



-- Создать новую бд gt130824.
create database gt130824;

-- Активировать бд gt130824.
use gt130824;

--  Создать таблицу staff с полями:
-- • id – целое число - первичный ключ с автозаполнением 
-- • firstname - строка максимум 60 символов не null
-- • lastname - строка максимум 100 символов не null
-- • position - строка максимум 100 символов
-- • age - целое число - от 0 до 110(вкл.)
-- • has_child – строка с одним символом - либо Y, либо N
-- • username - строка максимум 100 символов - уникальное значение не null

create table staff(
	id int primary key auto_increment,
    firstname varchar(60) not null,
    lastname varchar(100) not null,
    position varchar(100),
    age int check(age between 0 and 110),
    has_child char(1) check(has_child in ('Y', 'N')),
    username varchar(100) unique not null
);

-- Добавить 3 сотрудников:
-- ('Ally' , 'Austin' , 'Junior UI Designer' , 28 , 'N' , 'ally1' )
-- ('Daniel', 'Faviet', 'Senior UX Designer', 43, 'Y', 'favietD')
-- ('Lily', 'Chen', 'Senior Teacher', 25, 'Y', 'lilychen')

insert into staff (firstname, lastname, position, age, has_child, username)
values ('Ally' , 'Austin' , 'Junior UI Designer' , 28 , 'N' , 'ally1' ),
		('Daniel', 'Faviet', 'Senior UX Designer', 43, 'Y', 'favietD'),
		('Lily', 'Chen', 'Senior Teacher', 25, 'Y', 'lilychen');

-- Вывести таблицу staff
select * from staff;



-- Доп. задания.

-- Найти ошибку в коде:
-- insert into staff (firstname, lastname, age, has_child, username)
-- values ('Dave', 'Faviet', 23, 'YY', 'favietDv');

-- Создать и активировать базу данных tasks.

-- В этой базе создать таблицу employees с полями:
 -- • employee_id – целое число - первичный ключ с автозаполнением 
 -- • first_name - строка максимум 128 символов
 -- • last_name - строка максимум 128 символов
 -- • job - строка максимум 50 символов - не пустое
 -- • age - целое число - больше 18
 -- • has_car – строка только один символ, по умолчанию 'N' 
 -- • user_name - строка максимум 128 символов - уникальное значение, не пустое

-- Добавить 5 строк.

-- Удалить таблицу employees.

-- Удалить бд tasks.
