-- Агрегатные функции

-- min(поле) - вычисляет наименьшее значенние (int/integer, numeric/decimal)
-- max(поле) - вычисляет наибольшее значенние (int/integer, numeric/decimal)
-- sum(поле) - вычисляет сумму значений (int/integer, numeric/decimal)
-- avg(поле) - вычисляет среднее значение (int/integer, numeric/decimal)
-- count(*/поле) - вычисляет кол/во строк в запросе/в поле (all data types)

-- Все агрегатные функции за исключением COUNT(*) игнорируют значения NULL.

-- Безопасный режим группировки
-- Вкл.
-- SET sql_mode=(SELECT CONCAT(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- Выкл.
-- SET sql_mode=(SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));

select * from employees;

-- Вывести максимальную зарплату в компании
select salary
from employees
order by salary desc
limit 1;

select max(salary)
from employees; 

-- Вывести минимальную зарплату в компании
select salary
from employees
order by salary 
limit 1;

select min(salary)
from employees;

-- Ошибка 
select min(salary), first_name, last_name
from employees;

-- Error Code: 1140. In aggregated query without GROUP BY, expression #2 of SELECT list contains nonaggregated column 'hr.employees.first_name'; this is incompatible with sql_mode=only_full_group_by	0.031 sec
-- 2100.00	Steven	King -- либо получаем ошибочный результат

select max(salary), first_name, last_name
from employees;

-- Error Code: 1140. In aggregated query without GROUP BY, expression #2 of SELECT list contains nonaggregated column 'hr.employees.first_name'; this is incompatible with sql_mode=only_full_group_by	0.031 sec
-- 24000.00	Steven	King -- либо получаем ошибочный результат

-- Вывести минимальную зарплату и максимальную
select min(salary), max(salary)
from employees;


-- ПОДЗАПРОСЫ / SUBSELECT

-- Подзапросы с where
-- select column1, column2
-- from table1
-- where column = (SUBSELECT);

-- Подзапросы с from, join 

-- Вывести имена и фамилии сотрудников, которые получают больше чем Adam Fripp
-- select first_name, last_name
-- from employees 
-- where salary > (select salary
-- 				from employees
-- 				where first_name = 'Adam' and last_name = 'Fripp');

-- Вывести сотрудников, которые получают максимальную зарплату в компании
select first_name, last_name
from employees
where salary = (select max(salary)
				from employees);
                

-- Вывести сумму зарплат всех сотрудников.
select sum(salary)
from employees;

-- Вывести среднюю зарплату.
select avg(salary)
from employees;

-- Вывести кол/во строк в таблице employees
select count(*)
from employees;

-- Вывести кол/во сотрудников 
select count(employee_id)
from employees;

-- Вывести максимальную зарплату средни сотрудников которые платят комиссии. (commission_pct is not null)
select max(salary)
from employees
where commission_pct is not null;

-- Вывести сумму зарплат сотрудников, которые получают больше 10000
select sum(salary)
from employees
where salary > 10000;

-- Найти кол/во сотрудников, у которых имя начинается на 'А'.
select count(employee_id) as emp_count
from employees
where first_name like 'a%';

-- Найти среднюю зарплату среди сотрудников, у которых ид департамента 100.
select round(avg(salary), 2) as avg_salary
from employees
where department_id = 100;

-- Вывести сотрудников из департамента 'IT'.
select first_name, last_name
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
where dep.department_name = 'IT';

-- Найти кол/во сотрудников из департамента IT.
select count(employee_id)
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
where dep.department_name = 'IT';

-- Вывести сумму зарплат сотрудников из департамента Sales
select sum(salary)
from employees as emp
join departments  as dep
on emp.department_id = dep.department_id
where dep.department_name = 'Sales';

-- Найти средную зарплату сотрудников из 'United States of America'(country_name)
select avg(salary)
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
join locations as loc
on dep.location_id = loc.location_id
join countries as cnt
on loc.country_id = cnt.country_id
where cnt.country_name = 'United States of America';


-- Найти сотрудников, у которых зарплата меньше средней зарплаты по компании
-- 1. Средняя зарплата
select avg(salary)
from employees;

-- 2. Сотрудники, которые получают меньше средней
select first_name, last_name
from employees
where salary < (select avg(salary)
				from employees);
                
-- Найти кол/во сотрудников, у которых зарплата меньше средней зарплаты по компании
select count(employee_id)
from employees
where salary < (select avg(salary)
				from employees);
                
-- Найти количество сотрудников из департамента с ID 60, которые зарабатывают больше средней зарплаты по компании.
select count(employee_id)
from employees
where department_id = 60 and salary > (select avg(salary) from employees);

-- Ошибка 
select count(employee_id)
from employees
where department_id = 60 and salary > avg(salary);
-- Error Code: 1111. Invalid use of group function	0.000 sec

-- Найти сотрудников, у которых зарплата меньше чем половина суммы зарплат всех сотрудников
select sum(salary)/2
from employees;

select first_name, last_name
from employees
where salary < (select sum(salary)/2 from employees);

-- Вывести список сотрудников с должностью 'Programmer'(job_title), 
-- чья зарплата выше средней зарплаты среди всех сотрудников с этой должностью.

select avg(salary)
from employees as emp
join jobs as jb
on emp.job_id = jb.job_id
where jb.job_title = 'Programmer';

select first_name, last_name
from employees as emp
join jobs as jb
on emp.job_id = jb.job_id
where jb.job_title = 'Programmer' and salary > (select avg(salary)
												from employees as emp
												join jobs as jb
												on emp.job_id = jb.job_id
												where jb.job_title = 'Programmer');
