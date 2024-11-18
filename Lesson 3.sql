-- Доп. задания.

use gt130824;

--  Создать таблицу staff с полями:
-- • id – целое число - первичный ключ с автозаполнением 
-- • firstname - строка максимум 60 символов не null
-- • lastname - строка максимум 100 символов не null
-- • position - строка максимум 100 символов
-- • age - целое число - от 0 до 110(вкл.)
-- • has_child – строка с одним символом - либо Y, либо N
-- • username - строка максимум 100 символов - уникальное значение не null

-- Найти ошибку в коде:
-- insert into staff (firstname, lastname, age, has_child, username)
-- values ('Dave', 'Faviet', 23, 'YY', 'favietDv');
-- Error Code: 1406. Data too long for column 'has_child' at row 1	0.047 sec

-- Создать и активировать базу данных tasks.
create database tasks;

use tasks;

-- В этой базе создать таблицу employees с полями:
 -- • employee_id – целое число - первичный ключ с автозаполнением 
 -- • first_name - строка максимум 128 символов
 -- • last_name - строка максимум 128 символов
 -- • job - строка максимум 50 символов - не пустое
 -- • age - целое число - больше 18
 -- • has_car – строка только один символ, по умолчанию 'N' 
 -- • user_name - строка максимум 128 символов - уникальное значение, не пустое

create table employees(
	employee_id int primary key auto_increment,
    first_name varchar(128),
    last_name varchar(128),
    job varchar(50) not null,
    age int check(age > 18),
    has_car char(1) default 'N',
    user_name varchar(128) unique not null
);

-- Добавить 5 строк.
insert into employees (first_name, last_name, job, age, has_car, user_name)
values ('John', 'Smith', 'Programmer', 45, 'Y', 'john123'),
('Bob', 'Smith', 'SMM', 43, 'Y', 'bob123'),
('Lily', 'Jameson', 'Programmer', 23, 'N', 'lily123'),
('Jane', 'Austin', 'QA', 19, 'Y', 'jane123'),
('Den', 'Brown', 'QA', 24, 'Y', 'den123');

insert into employees (first_name, last_name, job, age, user_name)
values ('John', 'Smith', 'Programmer', 45, 'john1234');

select * from employees;

-- Удалить таблицу employees.
drop table employees;

-- Удалить бд tasks.
drop database tasks;


use gt130824;

create table products (
	id int primary key auto_increment,
    title varchar(128) not null,
    quantity int check(quantity > 0)
);

insert into products(title, quantity)
values ('Apple', 4),
('Banana', 5),
('Kiwi', 10),
('Avocado', 5),
('Mango', 2),
('Mandarin', 12);

select * from products;


-- Изменение таблиц и столбцов

-- alter table table_name
-- add column column_name data_type constraint -- добавление столбца

-- alter table table_name
-- drop column column_name -- удаление столбца

-- alter table table_name
-- modify column column_name new_data_type -- изменение типа данных 

-- alter table table_name
-- change column column_name new_column_name data_type -- переименовать поле


-- Добавить новое поле price целое число по умолч. 0
alter table products
add column price int default 0;

select * from products;

-- Изменить тип поля price на numeric
alter table products
modify column price numeric;

-- Переименовать поле price на item_price
alter table products
change column price item_price numeric;

-- Удалить поле item_price
alter table products
drop column item_price;


-- Создать поле quality целое число
-- Изменить тип поля quantity на decimal

alter table products
add column quality int,
modify column quantity decimal;


-- Изменить тип поля quality на decimal
-- Переименовать поле title на item_title
-- Удалить поле quality

alter table products
modify column quality decimal,
change column title item_title varchar(128);

alter table products
drop column quality;

-- Создать таблицу students1 с полями
-- name строка(60) (не null)
-- lastname строка(100) (не null)
-- avg_mark целое число (от 0 до 5 вкл.)
-- gender строка(128) (или 'M' или 'F')

create table students1(
	name varchar(60) not null,
    lastname varchar(100) not null,
    avg_mark int check(avg_mark between 0 and 5),
    gender varchar(128) check(gender in ('M', 'F'))
);

-- first - в начало
-- after column_name - после поля
-- before column_name - до поля

--  Добавить поле id integer primary key auto_increment в начало таблицы 
alter table students1
add column id int primary key auto_increment first;

-- Добавить поле age (тип целое число) после lastname
alter table students1
add column age int after lastname;

-- Поменять тип у gender на char(1)
-- Переименовать поле name на firstname
alter table students1
modify column gender char(1),
change column name firstname varchar(60);


 create table employees(
 	employee_id int primary key auto_increment,
 	first_name varchar(128) not null,
 	last_name varchar(128) not null,
 	email varchar(128) not null,
 	salary int, 
	department varchar(128) not null
 );
 
insert into employees(first_name, last_name, email, salary, department) values("Steven","King",	"SKING", 24000, "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Neena" , "Kochhar" , "NKOCHHAR" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Lex" , "De Haan" , "LDEHAAN" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Hunold" , "AHUNOLD" , 9000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Bruce" , "Ernst" , "BERNST" , 6000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Valli" , "Pataballa" , "VPATABAL" , 4800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Diana" , "Lorentz" , "DIANALO" , 8800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Nancy" , "Greenberg" , "NGREENBE" , 12008 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Daniel" , "Faviet" , "DFAVIET" , 9000 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Jose Manuel" , "Urman" , "JMURMAN" , 7800 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Luis" , "Popp" , "LPOPP" , 6900 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Den" , "Raphaely" , "DRAPHEAL" , 11000 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Khoo" , "AKHOO" , 3100 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Shelli" , "Baida" , "SBAIDA" , 2900 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Sigal" , "Tobias" , "STOBIAS" , 2800 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Matthew" , "Weiss" , "MWEISS" , 8000 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Fripp" , "AFRIPP" , 8200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Payam" , "Kaufling" , "PKAUFLIN" , 7900 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Shanta" , "Vollman" , "SVOLLMAN" , 6500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Kevin" , "Mourgos" , "KMOURGOS" , 5800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Julia" , "Nayer" , "JNAYER" , 3200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Markle" , "SMARKLE" , 2200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Bissot" , "LBISSOT" , 3300 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Mozhe" , "Atkinson" , "MATKINSO" , 2800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Joshua" , "Patel" , "JPATEL" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Trenna" , "Rajs" , "TRAJS" , 3500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("John" , "Russell" , "JRUSSEL" , 14000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Karen" , "Partners" , "KPARTNER" , 13500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Alberto" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Gerald" , "Cambrault" , "GCAMBRAU" , 11000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Eleni" , "Zlotkey" , "EZLOTKEY" , 10500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Vargas" , "PVARGAS" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");
 
 
select * from employees;

-- Обновление и удаление данных 

-- Отключить безопасный режим обновления данных
set sql_safe_updates = 0;

-- update table_name
-- set column1 = new_value, column2 = new_value
-- where ...;


-- Изменить департамент сотрудника Steven King на IT
update employees
set department = 'IT'
where first_name = 'Steven' and last_name = 'King';

-- Повысить зарплату Laura Bissot на 5000.
update employees
set salary = salary + 5000
where first_name = 'Laura' and last_name = 'Bissot';

-- Повысить зарплату работников отдела IT в 2 раза
update employees
set salary = salary * 2
where department = 'IT';

-- Изменить фамилию Luis Popp на Smith
update employees
set last_name = 'Smith'
where first_name = 'Luis' and last_name = 'Popp';

-- John Russell перевели в отдел Marketing и повысили зарплату на 5000. 
-- Измените данные для работника John Russell. 
update employees
set department = 'Marketing', salary = salary + 5000
where first_name = 'John' and last_name = 'Russell';

select * from employees;


-- delete from table_name
-- where ...;

-- Удалить сотрудника Adam Fripp из таблицы
delete from employees
where first_name = 'Adam' and last_name = 'Fripp';

select * from employees;

-- Всех работников отдела shipping уволили. Удалите работников shipping из таблицы.
delete from employees
where department = 'Shipping';

-- Удалить сотрудников с employee_id 2, 7, 10
delete from employees
where employee_id in (2, 7, 10);
-- where employee_id = 2 or employee_id = 7 or employee_id = 10; 

-- Включить безопасный режим обновления данных
set sql_safe_updates = 1;
