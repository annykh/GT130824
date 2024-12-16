-- INNER JOIN 

use hr;

select first_name, last_name, department_name
from employees as emp
join departments as dep
on emp.department_id = dep.department_id;

select * from departments;
select * from employees
order by department_id;


-- OUTER JOINS - LEFT/RIGHT

-- Второй распространенный вариант — внешнее соединение. 
-- Если внутреннее объединение имеет сходство с бинарным «и», то внешнее — несколько вариаций бинарного
-- «или». Такой JOIN более гибкий, он возвращает не только строгое пересечение между двумя таблицами, 
-- но и отдельные элементы, которые принадлежат только одному из множеств. Какому — зависит от типа.

-- Left Join. Возвращает пересечение множеств и все элементы из левой таблицы. 
-- Например, человек хочет посмотреть кино, но на русский фильм согласен, только если это боевик. 
-- Фильтр вернет ему все фильмы из множества «боевики», фильмы из подмножества «русские боевики», 
-- но других фильмов из множества «русские» там не будет.

-- Right Join. Работает по тому же принципу, но вместо левой таблицы — правая. 
-- То есть человек получит в результатах боевики, только если они русские.

-- Left Join с NULL. Возвращает данные из левой таблицы, но без пересечений с правой. 
-- Человеку покажутся все боевики, но русского кино и в частности русских боевиков среди них не будет.

-- Right Join с NULL. Соответственно, работает так же, но по отношению к «правой», второй таблице.

-- Вывести всех сотрудников, и их департаменты, если департамент не указан вывести null.
select first_name, last_name, department_name
from employees as emp -- left table
left join departments as dep -- right table
on emp.department_id = dep.department_id;

select first_name, last_name, department_name
from departments as dep -- left table
right join employees as emp -- right table
on emp.department_id = dep.department_id;

-- Вывести сотрудников, которые ни в каких департаментах не работают 
select first_name, last_name
from employees as emp 
left join departments as dep 
on emp.department_id = dep.department_id
where department_name is null;

select first_name, last_name
from employees
where department_id is null;

-- Вывести департаменты в которых никто не работает.
select department_name, emp.* -- все поля из employees
from departments as dep
left join employees as emp
on dep.department_id = emp.department_id
where employee_id is null;

select department_name
from departments as dep
left join employees as emp
on dep.department_id = emp.department_id
where employee_id is null;

-- Вывести все страны из таблицы countries и города из locations,
-- если в locations нет города в этой стране, вывести null.
select * from countries;

select * from locations
order by country_id;

select country_name, city
from countries as cnt
left join locations as loc
on cnt.country_id = loc.country_id;

select country_name, city, location_id, street_address, postal_code
from locations as cnt
right join countries as loc
on cnt.country_id = loc.country_id;

-- Вывести из таблицы countries те страны, которых нет в locations
select country_name
from countries as cnt
left join locations as loc
on cnt.country_id = loc.country_id
where city is null;

select country_name
from countries as cnt
left join locations as loc
on cnt.country_id = loc.country_id
where location_id is null;

select country_name
from countries as cnt
left join locations as loc
on cnt.country_id = loc.country_id
where loc.country_id is null;

-- Вывести все города, в которых нет департаментов
select * from locations;
select * from departments;

select city
from locations as loc
left join departments as dep
on loc.location_id = dep.location_id
where department_id is null;

-- Вывести название стран и городов, где нет департаментов.
select cnt.country_name, loc.city
from countries as cnt
join locations as loc
on cnt.country_id = loc.country_id
left join departments as dep
on loc.location_id = dep.location_id
where dep.department_id is null;

-- Вывести имена и фамилии сотрудников и должность(job_title), которые не работают ни в каком департаменте. 
select first_name, last_name, job_title
from employees as emp
join jobs as jb
on emp.job_id = jb.job_id
left join departments as dep
on emp.department_id = dep.department_id
where dep.department_name is null;

select first_name, last_name, job_title
from employees as emp
join jobs as jb
on emp.job_id = jb.job_id
where department_id is null;

-- Вывести название(department_name) и адресс(street_address) тех департаментов, в которых никто не работает.
select department_name, street_address
from departments as dep
join locations as loc
on dep.location_id = loc.location_id
left join employees as emp
on dep.department_id = emp.department_id
where emp.employee_id is null;
