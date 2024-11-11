-- comment

-- CRUD
/*
-- CREATE - create database, create table
-- READ - select ... from 
-- UPDATE - alter table, update ... set
-- DELETE - drop database, drop table, delete..from
*/

-- Запуск кода
-- Вторая молния - только одну команду ctrl + enter
-- Первая молния - запускает весь выделенный скрипт ctrl+shift+enter 

-- Создание базы данных 
-- create database название_бд;
create database gt130824;

-- Переключение между базами данных
use gt130824;

-- Создание таблицы 
-- create table название_таблицы(
-- 	название_поля1 тип_данных [ограничения],
-- 	название_поля2 тип_данных [ограничения],
--  название_поля3 тип_данных [ограничения]
-- );


-- Простые типы данных 

-- integer/int - целое число
-- numeric/decimal - числовые данные
-- varchar(N) - N максимальное кол/во символов в строке.
-- char(M) - M фиксированное кол/во символов в строке. 


-- Ограничение - атрибуты 

-- unique - значение в поле должно быть уникальным 
-- not null - значение в поле не может быть незаполненым (null)
-- primary key - not null + unqie  - один primary key в таблице 
-- check - соответствует какому_либо условию
-- default - значения по умолчанию
-- auto_increment/autoincrement - позволяет создавать уникальный номер автоматически, когда новая 
-- запись вставляется в таблицу. Часто это поле основного ключа, которое мы хотели бы создать 
-- автоматически каждый раз, когда будет вставлена новая запись.

-- Создать таблицу students
-- id целое число, уникальное значение, не null, автозаполнение 
-- firstname varchar not null
-- lastname varchar not null
-- class integer от 1 до 10 (вкл)
-- subject_name varchar not null
-- mark integer от 0 до 5 (вкл)
-- school_no integer по умолч. 0
-- checked char(1) значение Y либо N

create table students(
	id int primary key auto_increment,
    firstname varchar(60) not null,
    lastname varchar(100) not null,
    class int check(class between 1 and 10),
    subject_name varchar(60) not null,
    mark int check(mark between 0 and 5),
    school_no int default 0,
    -- checked char(1) check(checked = 'Y' or checked = 'N')
    checked char(1) check(checked in ('Y', 'N'))
);

-- Вывести таблицу students
select * from students;

-- заполнение таблицы 
-- insert into название_таблицы (поле1, поле2, поле3, ...)
-- values (значение1, значение2, значение3, ...);

-- insert into название_таблицы (поле1, поле2, поле3, ...)
-- values (значение1, значение2, значение3, ...), 
-- (значение1, значение2, значение3, ...), 
-- (значение1, значение2, значение3, ...);

insert into students (firstname, lastname, class, subject_name, mark, school_no, checked)
values ('John', 'Smith', 5, 'Math', 4, 34, 'Y');

select * from students;

insert into students (firstname, lastname, class, subject_name, mark, school_no, checked)
values ('Bob', 'Brown', 3, 'Informatics', 5, 34, 'N'),
('Lily', 'Jameson', 6, 'Math', 3, 23, 'Y');


-- Ошибки 

insert into students
values ('Alex', 'Jameson', 2, 'Math', 3, 23, 'N');
-- Error Code: 1136. Column count doesn't match value count at row 1

insert into students (firstname, lastname, class, subject_name, mark, school_no, checked)
values (2, 'John', 'Math', 10, 45, 'Y', 'Smith');
-- Error Code: 1366. Incorrect integer value: 'Math' for column 'class' at row 1	0.016 sec

insert into students (lastname, class, subject_name, mark, school_no, checked)
values ('Jameson', 2, 'Math', 3, 23, 'N');
-- Error Code: 1364. Field 'firstname' doesn't have a default value	0.000 sec

insert into students (firstname, lastname, class, subject_name, mark, school_no, checked)
values ('Alex', 'Jameson', 12, 'Math', 3, 23, 'N');
-- Error Code: 3819. Check constraint 'students_chk_1' is violated.	0.000 sec

insert into students (firstname, lastname, class, subject_name, mark, school_no, checked)
values ('Alex', 'Jameson', 2, 'Math', 3, 23, 'M');
-- Error Code: 3819. Check constraint 'students_chk_3' is violated.	0.000 sec

insert into students (firstname, lastname, class, subject_name, mark, school_no, checked)
values ('Alex', 'Jameson', 2, 'Math', 3, 23, 'YN');
-- Error Code: 1406. Data too long for column 'checked' at row 1	0.000 sec

insert into students (firstname, lastname, class, subject_name, mark, school_no, checked)
values ('AlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAleAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexxAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlexAlex', 
'Jameson', 2, 'Math', 3, 23, 'Y');
-- Error Code: 1406. Data too long for column 'firstname' at row 1	0.000 sec

insert into students (first_name, lastname, class, subject_name, mark, school_no, checked)
values ('Alex', 'Jameson', 2, 'Math', 3, 23, 'Y');
-- Error Code: 1054. Unknown column 'first_name' in 'field list'	0.000 sec

-- Удаление таблицы 
-- drop table название_таблицы;

drop table students;

-- Удаление базы данных 
-- drop database название_бд;

drop database gt130824;

