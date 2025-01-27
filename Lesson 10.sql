-- https://github.com/annykh/genTech/blob/main/hr1.txt

-- group by
-- having

-- SELECT  column1, column2
-- FROM table1
-- WHERE condition1
-- JOIN table2
-- ON condition2
-- GROUP BY column_name1
-- HAVING condition3
-- ORDER BY column_name2
-- LIMIT ...

-- Посчитать кол/во сотрудников в каждом департаменте. Вывести department_id(кроме null) и кол/во сотрудников.
select department_id, count(employee_id)
from employees
where department_id is not null
group by department_id;

-- Вывести департаменты, в которых кол/во сотрудников больше 10.
select department_id, count(employee_id) as emp_count
from employees
where department_id is not null
group by department_id
having emp_count > 10;

-- Посчитать кол/во сотрудников в каждом департаменте. Вывести название департамента и кол/во сотрудников.
select dep.department_name, count(emp.employee_id)
from departments as dep
join employees as emp
on dep.department_id = emp.department_id
group by dep.department_name;

-- Вывести названия департаментов и среднюю зарплату в каждом из них.
select dep.department_name, avg(emp.salary)
from departments as dep
join employees as emp
on dep.department_id = emp.department_id
group by dep.department_name;

-- Найти департаменты, где средняя зарплата выше 10000. Вывести название департамента и среднюю зарплату.
select dep.department_name, avg(emp.salary) as avg_salary
from departments as dep
join employees as emp
on dep.department_id = emp.department_id
group by dep.department_name
having avg_salary > 10000;

-- Найти максимальные зарплаты по департаментам. Вывести название департамента и максимальную зарплату.
select dep.department_name, max(emp.salary)
from departments as dep
join employees as emp
on emp.department_id = dep.department_id
group by dep.department_name;

-- Найти суммы зарплат в департаментах IT, Sales, Finance и Shipping. Вывести названия департаментов и суммы зарплат.
select dep.department_name, sum(emp.salary)
from departments as dep
join employees as emp
on dep.department_id = emp.department_id
where dep.department_name in ('IT', 'Sales', 'Finance', 'Shipping')
group by dep.department_name;

-- ПОДЗАПРОСЫ 
-- select column1, column2
-- from table1
-- join (SUBSELECT) as table_name2
-- on table_name2.column1 = table1.column1;

-- Найти имена и фамили сотрудников, которые получают максимальную зарплату в своих департаментах.

-- 1. Найти максимальные зарплаты по департаментам.
select department_id, max(salary)
from employees
where department_id is not null
group by department_id;

select emp.first_name, emp.last_name
from employees as emp
join (select department_id, max(salary) as max_salary
		from employees
		where department_id is not null
		group by department_id) as dep_max_salary
on emp.department_id = dep_max_salary.department_id
where emp.salary = dep_max_salary.max_salary;

-- Вывести имена, фамилии и зарплаты сотрудников, которые получают больше чем средняя зарплата в их департаментах.
select department_id, avg(salary) as avg_salary
from employees
where department_id is not null
group by department_id;

select emp.first_name, emp.last_name, emp.salary
from employees as emp
join (select department_id, avg(salary) as avg_salary
		from employees
		where department_id is not null
		group by department_id) as dep_avg_salary
on emp.department_id = dep_avg_salary.department_id
where emp.salary > dep_avg_salary.avg_salary;

-- Вывести только названия департаментов, в которых кол/во сотрудников больше 5.
-- Самый быстрый 
select department_id, count(employee_id) as emp_count
from employees
where department_id is not null
group by department_id
having emp_count > 5;

select dep.department_name
from departments as dep
join (select department_id, count(employee_id) as emp_count
		from employees
		where department_id is not null
		group by department_id
		having emp_count > 5) as dep_emp_count
on dep.department_id = dep_emp_count.department_id;

-- Работает медленее, 27 строк join 11 строк
select dep.department_name
from departments as dep
join (select department_id, count(employee_id) as emp_count
		from employees
		where department_id is not null
		group by department_id) as dep_emp_count
on dep.department_id = dep_emp_count.department_id
where dep_emp_count.emp_count > 5;

-- Работает медленее, имеем 2 join- а
-- Шаг 1(подзапрос)
select dep.department_name, count(emp.employee_id) as emp_count
from departments as dep
join employees as emp
on dep.department_id = emp.department_id
group by dep.department_name
having emp_count > 5;

select dep.department_name
from departments as dep
join (select dep.department_name, count(emp.employee_id) as emp_count
		from departments as dep
		join employees as emp
		on dep.department_id = emp.department_id
		group by dep.department_name
        having emp_count > 5) as dep_count_emp
on dep.department_name = dep_count_emp.department_name;

-- Вывести только названия департаментов, в которых минимальная зарплата меньше 5000.
select dep.department_name
from departments as dep
join (select department_id, min(salary) as min_salary
		from employees
        where department_id is not null
        group by department_id
        having min_salary < 5000) as dep_min_salary
on dep.department_id = dep_min_salary.department_id;
