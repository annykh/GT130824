-- OUTER JOIN - LEFT JOIN, RIGHT JOIN

-- Создать базу данных university
-- 1) Создать таблицу Students
-- с полями:
-- - id целое число первичный ключ автоинкремент
-- - name строка 128 не null
-- - age целое число

-- 2) Создать таблицу Teachers
-- с полями:
-- id целое число первичный ключ автоинкремент
-- name строка 128 не null
-- age целое число

-- 3) Создать таблицу Competencies
-- с полями:
-- id целое число первичный ключ автоинкремент
-- title строка 128 не null

-- 4) Создать таблицу Teachers2Competencies
-- с полями:
-- id целое число первичный ключ автоинкремент
-- teacher_id целое число
-- competencies_id целое число

-- 5) Создать таблицу Courses
-- id целое число первичный ключ автоинкремент
-- teacher_id целое число
-- title строка 128 не null
-- headman_id целое число

-- 6)Создать таблицу Students2Courses
-- id целое число первичный ключ автоинкремент
-- student_id целое число
-- course_id целое число

create database university;
use university;

create table Students(
	id int primary key auto_increment,
    name varchar(128) not null,
    age int
);

create table Teachers(
	id int primary key auto_increment,
    name varchar(128) not null,
    age int
);

create table Competencies(
	id int primary key auto_increment,
	title varchar(128) not null
);

create table Teachers2Competencies(
	id int primary key auto_increment,
	teacher_id int,
    competencies_id int
);

create table Courses(
	id int primary key auto_increment,
    teacher_id int,
	title varchar(128) not null,
    headman_id int
);

create table Students2Courses(
	id int primary key auto_increment,
	student_id int,
    course_id int
);

-- Добавить 6 записей в таблицу Students
-- Анатолий 29
-- Олег 25
-- Семен 27
-- Олеся 28
-- Ольга 31
-- Иван 22

-- Добавить 6 записей в таблицу Teachers
-- Петр 39
-- Максим 35
-- Антон 37
-- Всеволод 38
-- Егор 41
-- Светлана 32

-- Добавить 4 записей в таблицу Competencies
-- Математика 
-- Информатика
-- Программирование
-- Графика

-- Добавьте 6 записей в таблицу Teachers2Competencies
-- 1 1
-- 2 1
-- 2 3
-- 3 2
-- 4 1
-- 5 3

-- Добавьте 5 записей в таблицу Courses
-- 1 Алгебра логики 2
-- 2 Математическая статистика 3
-- 4 Высшая математика 5
-- 5 Javascript 1
-- 5 Базовый Python 1

-- Добавьте 5 записей в таблицу Students2Courses
-- 1 1
-- 2 1
-- 3 2
-- 3 3
-- 4 5

truncate table students;
truncate table Teachers;

insert into students (name, age) values ('Анатолий', 29);
insert into students (name, age) values ('Олег', 25);
insert into students (name, age) values ('Семен', 27);
insert into students (name, age) values ('Олеся', 28);
insert into students (name, age) values ('Ольга', 31);
insert into students (name, age) values ('Иван', 22);

insert into teachers (name, age) values ('Петр', 39);
insert into teachers (name, age) values ('Максим', 35);
insert into teachers (name, age) values ('Антон', 37);
insert into teachers (name, age) values ('Всеволод', 38);
insert into teachers (name, age) values ('Егор', 41);
insert into teachers (name, age) values ('Светлана', 32);

insert into Competencies (title) values ('Математика');
insert into Competencies (title) values ('Информатика');
insert into Competencies (title) values ('Программирование');
insert into Competencies (title) values ('Графика');

insert into Teachers2Competencies (teacher_id, competencies_id) values (1, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (2, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (2, 3);
insert into Teachers2Competencies (teacher_id, competencies_id) values (3, 2);
insert into Teachers2Competencies (teacher_id, competencies_id) values (4, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (5, 3);

insert into courses (teacher_id, title, headman_id) values (1, 'Алгебра логики', 2);
insert into courses (teacher_id, title, headman_id) values (2, 'Математическая статистика', 3);
insert into courses (teacher_id, title, headman_id) values (4, 'Высшая математика', 5);
insert into courses (teacher_id, title, headman_id) values (5, 'Javascript', 1);
insert into courses (teacher_id, title, headman_id) values (5, 'Базовый Python', 1);

insert into students2courses (student_id, course_id) values (1, 1);
insert into students2courses (student_id, course_id) values (2, 1);
insert into students2courses (student_id, course_id) values (3, 2);
insert into students2courses (student_id, course_id) values (3, 3);
insert into students2courses (student_id, course_id) values (4, 5);

select * from students;
select * from teachers;
select * from Competencies;
select * from Teachers2Competencies;
select * from courses;
select * from students2courses;

-- teachers.id = Teachers2Competencies.teacher_id
-- Competencies.id = Teachers2Competencies.competencies_id

-- Вывести имена преподавателей с их компетенциями
select name, title
from teachers as t
join Teachers2Competencies as t2c
on t.id = t2c.teacher_id
join competencies as c
on t2c.competencies_id = c.id;

-- Найти преподавателя(name), у которого нет компетенций
select name
from teachers as t
left join Teachers2Competencies as t2c
on t.id = t2c.teacher_id
where t2c.competencies_id is null;

select name
from teachers as t
left join Teachers2Competencies as t2c
on t.id = t2c.teacher_id
where t2c.teacher_id is null;

