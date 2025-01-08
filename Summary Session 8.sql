select * from employees;

-- Вывести имена и фамилии сотрудников и имена и фамилии их менеджеров
select all_emp.first_name as emp_name, all_emp.last_name as emp_surname, all_emp.salary as emp_salary,
mng.first_name as mng_name, mng.last_name as mng_surname, mng.salary as mng_salary
from employees as all_emp 
join employees as mng
on all_emp.manager_id = mng.employee_id;

-- Вывести тех сотрудников, которые зарабатывают меньше своих менеджеров.
select all_emp.first_name, all_emp.last_name
from employees as all_emp
join employees as mng
on all_emp.manager_id = mng.employee_id
where all_emp.salary < mng.salary;

-- Вывести тех сотрудников, у которых менеджер Nancy Greenberg
select all_emp.first_name, all_emp.last_name
from employees as all_emp
join employees as mng
on all_emp.manager_id = mng.employee_id
where mng.first_name = 'Nancy' and mng.last_name = 'Greenberg';

-- Вывести тех сотрудников у которых нет менеджера
select all_emp.first_name, all_emp.last_name
from employees as all_emp
left join employees as mng
on all_emp.manager_id = mng.employee_id
where mng.employee_id is null;

-- Вывести имя, фамилию и зарплату первых трех сотрудников, которые зарабатывают меньше чем "Adam" "Fripp"
select salary
from employees
where first_name = 'Adam' and last_name = 'Fripp';

select first_name, last_name, salary
from employees
where salary < (select salary
				from employees
				where first_name = 'Adam' and last_name = 'Fripp')
limit 3;
                
select all_emp.first_name, all_emp.last_name, all_emp.salary
from employees as all_emp
join employees as emp_adam
on emp_adam.first_name = 'Adam' and emp_adam.last_name = 'Fripp' 
	and all_emp.employee_id != emp_adam.employee_id
where all_emp.salary < emp_adam.salary
limit 3;
