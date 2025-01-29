-- https://github.com/annykh/genTech/blob/main/hr1.txt

use hr;

-- group by
-- having

-- ПОДЗАПРОСЫ 
-- select column1, column2
-- from table1
-- join (SUBSELECT) as table_name2
-- on table_name2.column1 = table1.column1;

-- 1. Из департаментов 10, 30, 50 и 100 вывести те, в которых кол/во сотрудников больше 5. Вывести ид департамента и кол/в сотрудников.
select department_id, count(employee_id) as emp_count
from employees
where department_id in (10, 30, 50, 100)
group by department_id 
having emp_count > 5;


select * from locations;
select * from departments;

-- 2. Посчитать кол/во департаментов в каждом городе(locations.city).
-- Вывести города и кол/во департаментов.
select loc.city, count(dep.department_id)
from locations as loc
join departments as dep
on loc.location_id = dep.location_id
group by loc.city;


-- 3. Найти города, в которых кол/во сотрудников больше 5.
-- Вывести города и кол/во сотрудников.
select loc.city, count(emp.employee_id) as emp_count
from locations as loc
join departments as dep
on loc.location_id = dep.location_id
join employees as emp
on dep.department_id = emp.department_id
group by loc.city
having emp_count > 5;

-- Найти города, в которых максимальная зарплата сотрудника по городам больше 10000.
-- Вывести только города.

select loc.city
from locations as loc
join departments as dep
on loc.location_id = dep.location_id
join employees as emp
on dep.department_id = emp.department_id
where emp.salary > 10000
group by loc.city;

select loc.city
from locations as loc
join (select loc.city, max(emp.salary) as max_salary
		from locations as loc
		join departments as dep
		on loc.location_id = dep.location_id
		join employees as emp
		on dep.department_id = emp.department_id
		group by loc.city
		having max_salary > 10000) as city_max_salary
on loc.city = city_max_salary.city;

-- Найти страны (countries.country_name) в которых минимальня зарплата по странам больше 5000.
-- Вывести название страны.
select cnt.country_name
from countries as cnt
join (select cnt.country_name, min(emp.salary) as min_salary
		from countries as cnt
		join locations as loc
		on cnt.country_id = loc.country_id
		join departments as dep
		on loc.location_id = dep.location_id
		join employees as emp
		on dep.department_id = emp.department_id
		group by cnt.country_name
		having min_salary > 5000) as cnt_min_salary
on cnt.country_name = cnt_min_salary.country_name;
