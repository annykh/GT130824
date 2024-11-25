-- alter table table_name
-- add column column_name data_type [constraint],
-- drop column column_name,
-- modify column column_name new_data_type,
-- change column column_name new_column_name data_type;

-- set sql_safe_updates = 0;

-- update table_name
-- set column = new_value
-- where ...;

-- delete from table_name
-- where ...;

-- set sql_safe_updates = 1;

use gt130824;
drop table employees;

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
 
 
-- Сортировка 

-- order by column_name -- по возр.
-- order by column_name desc -- по убыв.

-- Отсортировать сотруников по именам и вывести имена и фамилии.
select first_name, last_name
from employees
order by first_name;

-- Отсортировать сотрудников по зарплате - от самой большой зарплаты до самой маленькой
select *
from employees
order by salary desc;

-- Вывести сотрудников, чьи имена начинаются на букву K и отсортировать их в алфавитном порядке по фамилии
select *
from employees
where first_name like 'k%'
order by last_name;

-- Вывести имена, фамилии и зарплаты сотрудников, у которых зарплаты больше 5000. Отсортировать по зарплатам по возр..
select first_name, last_name, salary
from employees
where salary > 5000
order by salary;

-- Получение диапазона строк

-- limit N - N кол/во строк, которое нужно вывести 
-- limit M, N - M кол/во строк, которое нужно пропустить, N кол/во строк, которое нужно вывести 

-- Вывести первых трех сотрудников из таблицы employees.
select * 
from employees
limit 3;

-- Вывести двух сотрудников, пропуская первых трех.
select *
from employees
limit 3, 2;

-- вывести первых двух сотрудников из отдела IT.
select *
from employees 
where department = 'IT'
limit 2;

-- Вывести сотрудника с максимальной зарплатой.
select *
from employees
order by salary desc
limit 1;

-- Вывести сотрудника с минимальной зарплатой.
select *
from employees
order by salary
limit 1;

-- Вывести первых трех сотрудников, чьи имена начинаются на A, отсортировать по возрастанию зарплат.
select * 
from employees
where first_name like 'A%'
order by salary
limit 3;


-- Оператор AS - alias
-- Вывести имена и фамилии сотрудников как name и surname.
select first_name as name, last_name as surname
from employees;

-- Вывести зарплаты сотрудников и зарплата - 10% 
select salary, salary - (salary * 10 / 100) as new_salary
from employees;

select 5;

select 'Hello';

-- Функции для работы с числами

-- round :  округляет число. В качестве первого параметра передается число. 
-- Второй параметр указывает на длину. Если длина представляет положительное число, то оно указывает,
-- до какой цифры после запятой идет округление. Если длина представляет отрицательное число, то оно указывает, 
-- до какой цифры с конца числа до запятой идет округление
select round(12.35); -- 12
select round(12.57); -- 13
select round(12.3456784, 2); -- 12.35

-- ceiling: возвращает наименьшее целое число, которое больше или равно текущему значению.
select ceiling(12.35); -- 13
select ceiling(12.57); -- 13
select ceiling(12.1); -- 13

-- floor: возвращает наибольшее целое число, которое меньше или равно текущему значению.
select floor(12.35); -- 12
select floor(12.57); -- 12
select floor(12.9); -- 12

select round(salary - (salary * 10 / 100)) as int_new_salary
from employees;

-- abs: возвращает абсолютное значение числа.
select abs(-12); -- 12

-- power: возводит число в определенную степень.
select power(5, 2); -- 25
select pow(5, 3); -- 125

-- sqrt: получает квадратный корень числа.
select sqrt(225); -- 15

-- rand: генерирует случайное число с плавающей точкой в диапазоне от 0 до 1.
select rand(); -- диапазон 0 - 1
select round(rand()*10); -- целые числа от 0 до 10
select rand() * 3 + 5; -- от 5 до 8


-- Функции для работы со строками

-- concat: объединяет строки. В качестве параметра принимает от 2-х и более строк, которые надо соединить:
select concat('John', ' ', 'Smith');

select concat(first_name, ' ', last_name) as full_name
from employees;


-- length: возвращает количество символов в строке. В качестве параметра в функцию передается строка, для которой надо найти длину:
select length('John Smith'); -- 10

-- trim: удаляет начальные и конечные пробелы из строки. В качестве параметра принимает строку:
select trim('  John Smith '); -- 'John Smith'

-- ltrim: удаляет начальные пробелы из строки. В качестве параметра принимает строку:
select ltrim('  John Smith '); -- 'John Smith '

-- rtrim: удаляет конечные пробелы из строки. В качестве параметра принимает строку:
select rtrim('  John Smith '); -- '  John Smith'

-- left: вырезает с начала строки определенное количество символов. Первый параметр функции - строка, а второй - количество символов, которые надо вырезать с начала строки:
select left('telephone', 4); -- 'tele'

-- right: вырезает с конца строки определенное количество символов. Первый параметр функции - строка, а второй - количество символов, которые надо вырезать с конца строки:
select right('telephone', 4); -- 'hone'

-- substring(str, start[, length]): вырезает из строки str подстроку, начиная с позиции start. Третий необязательный параметр передает количество вырезаемых символов:
select substring('iphone 16 pro max', 8); -- '16 pro max'
select substring('iphone 16 pro max', 8, 2); -- '16'

-- substring_index(str, delimeiter, count): вырезает из строки str подстроку. 
-- Параметр delimiter определяет разделитель внутри строки. 
-- А параметр count определяет, до какого вхождения разделителя надо вырезать подстроку. 
-- Если count положительный, то подстрока вырезается с начала, если count отрицательный, то с конца строки str:
select substring_index('iphone 16 pro max', ' ', 1); -- 'iphone'
select substring_index('iphone 16 pro max', ' ', 2); -- 'iphone 16'
select substring_index('iphone 16 pro max', ' ', -2); -- 'pro max'

-- replace(search, find, replace): заменяет в строке search подстроку find на подстроку replace. Первый параметр функции - строка, второй - подстрока, которую надо заменить, а третий - подстрока, на которую надо заменить:
select replace('iphone 16 pro max', '16', '15'); -- 'iphone 15 pro max'

select replace(department, 'Human Resources', 'HR')
from employees;

-- reverse: переворачивает строку наоборот:
select reverse('John'); -- 'nhoJ'

-- lower: переводит строку в нижний регистр:
select lower('Iphone 13 Pro Max'); -- 'iphone 13 pro max'

-- upper: переводит строку в верхний регистр
select upper('Iphone 13 Pro Max'); -- 'IPHONE 13 PRO MAX'

-- В таблице employees создать поле full_name, которое будет содержать имена и фамилии сотрудников 
-- по шаблону 'first_name last_name'
alter table employees
add column full_name varchar(128);

select * from employees;

set sql_safe_updates = 0;

update employees
set full_name = concat(first_name, ' ', last_name);

select * from employees;

-- Создать поле new_department, где вместо Human Resources записан HR.
alter table employees
add column new_department varchar(128);

update employees
set new_department = replace(department, 'Human Resources', 'HR');

select * from employees;

-- Из таблицы employees вывести первые четыре символа из email в нижнем регистре
select lower(left(email, 4))
from employees;
