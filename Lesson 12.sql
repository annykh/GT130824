-- https://github.com/annykh/genTech/blob/main/CompanyDB.txt
CREATE DATABASE CompanyDB;
USE CompanyDB;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Salary DECIMAL(10, 2),
    DepartmentID INT,
    HireDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    Budget DECIMAL(10, 2)
);

CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT,
    HoursWorked DECIMAL(5, 2),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    PRIMARY KEY (EmployeeID, ProjectID)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Sales'),
(5, 'Marketing');

INSERT INTO Employees (EmployeeID, FirstName, LastName, Salary, DepartmentID, HireDate) VALUES
(1, 'John', 'Doe', 6000, 1, '2021-01-15'),
(2, 'Jane', 'Smith', 7500, 1, '2019-11-23'),
(3, 'Jim', 'Brown', 8000, 2, '2020-03-12'),
(4, 'Jake', 'Williams', 5500, 2, '2022-07-01'),
(5, 'Jess', 'Taylor', 7000, 3, '2018-05-08'),
(6, 'Jill', 'Adams', 6700, 3, '2021-06-22'),
(7, 'James', 'Davis', 9000, 4, '2020-09-30'),
(8, 'Jenny', 'Wilson', 6500, 4, '2019-04-18'),
(9, 'Jerry', 'Moore', 7200, 5, '2018-08-25');

INSERT INTO Projects (ProjectID, ProjectName, Budget) VALUES
(1, 'Website Redesign', 15000),
(2, 'New HR Software', 20000),
(3, 'Financial Audit', 10000),
(4, 'Sales Campaign', 25000),
(5, 'Market Research', 18000);

INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked) VALUES
(1, 1, 120),
(2, 1, 80),
(3, 2, 100),
(4, 2, 60),
(5, 3, 110),
(6, 3, 90),
(7, 4, 150),
(8, 4, 110),
(9, 5, 130);


-- 1. Найдите среднюю зарплату сотрудников в каждом департаменте. Выведите название департамента и среднюю зарплату
select dep.departmentName, avg(emp.salary) as avg_salary
from employees as emp
join departments as dep
on emp.DepartmentID = dep.DepartmentID
group by dep.departmentName;

select dep.departmentName, dep_id_avg_salary.avg_salary
from departments as dep
join (select DepartmentID, avg(salary) as avg_salary
		from employees
        group by DepartmentID) as dep_id_avg_salary
on dep.departmentID = dep_id_avg_salary.DepartmentID;

-- 2. Определите количество сотрудников в каждом департаменте. Выведите название департамента и количество сотрудников.
select dep.departmentName, count(emp.employeeId) as emp_count
from departments as dep
join employees as emp
on dep.DepartmentID = emp.DepartmentID
group by dep.DepartmentName;

-- 3. Найдите минимальную и максимальную зарплаты в каждом департаменте. 
-- Выведите название департамента, минимальную и максимальную зарплату.
select dep.departmentName, max(emp.salary) as max_salary, min(emp.salary) as min_salary
from departments as dep
join employees as emp
on dep.DepartmentID = emp.DepartmentID
group by dep.DepartmentName;

-- 4. Определите общую сумму зарплат в каждом департаменте. Выведите название департамента и общую сумму зарплат.
select dep.departmentName, emp_salary_sum.salary_sum
from departments as dep
join (select DepartmentID, sum(salary) as salary_sum
		from employees
        group by DepartmentID) as emp_salary_sum
on dep.departmentID = emp_salary_sum.DepartmentID;

-- 5. Вывести ID департамента с самой высокой средней зарплатой сотрудников.
select departmentID, avg(salary) as avg_salary
from employees
group by DepartmentID
order by avg_salary desc
limit 1;

-- Первый подзапрос
select departmentID, avg(salary) as avg_salary
from employees
group by DepartmentID;

-- Второй подзапрос - максимальная средняя зарплата
select max(emp_avg_salary.avg_salary)
from (select departmentID, avg(salary) as avg_salary
		from employees
		group by DepartmentID) as emp_avg_salary;

-- Решение
select departmentID, avg(salary) as avg_salary
from employees
group by DepartmentID
having avg_salary = (select max(emp_avg_salary.avg_salary)
					from (select departmentID, avg(salary) as avg_salary
							from employees
							group by DepartmentID) as emp_avg_salary);
                            
                            
-- 6. Вывести имя департамента с самой высокой средней зарплатой сотрудников.
select departmentName
from departments as dep
join (select departmentID, avg(salary) as avg_salary
		from employees
		group by DepartmentID
		having avg_salary = (select max(emp_avg_salary.avg_salary)
							from (select departmentID, avg(salary) as avg_salary
									from employees
									group by DepartmentID) as emp_avg_salary)) as max_avg_salary
on dep.departmentID = max_avg_salary.DepartmentID;

-- 7. Выведите имя, фамилию и зарплату сотрудников, чья зарплата выше средней по их департаменту.
select firstname, lastname, salary
from employees as emp
join (select DepartmentID, avg(salary) as avg_salary
		from employees
        group by DepartmentID) as dep_avg_salary
on emp.DepartmentID = dep_avg_salary.DepartmentID
where emp.salary > dep_avg_salary.avg_salary;

-- 8. Найдите проект с наибольшим количеством сотрудников, проработавших на нем больше 100 часов. Вывести ProjectName.
select projectName
from projects as proj
join employeeprojects as emp_proj
on proj.ProjectID = emp_proj.ProjectID
where emp_proj.HoursWorked > 100
group by proj.ProjectName
order by count(emp_proj.EmployeeID) desc
limit 1;

-- Ид проекта и кол/во сотрудников, которые поработали больше 100 часов.
select projectID, count(employeeID) as emp_count
from employeeprojects
where HoursWorked > 100
group by ProjectID;

-- Максимальное кол/во сотрудников, ...
select max(proj_emp_count.emp_count) as max_emp_count
from (select projectID, count(employeeID) as emp_count
		from employeeprojects
		where HoursWorked > 100
		group by ProjectID) as proj_emp_count;
        
-- Ид проекта с максимальным кол/вом сотрудников.        
select projectID, count(employeeID) as emp_count
from employeeprojects
where HoursWorked > 100
group by ProjectID
having emp_count = (select max(proj_emp_count.emp_count) as max_emp_count
					from (select projectID, count(employeeID) as emp_count
							from employeeprojects
							where HoursWorked > 100
							group by ProjectID) as proj_emp_count);       

-- Названине проекта с макс. кол/вом сотрудников
select projectName
from projects as proj
join (select projectID, count(employeeID) as emp_count
		from employeeprojects
		where HoursWorked > 100
		group by ProjectID
		having emp_count = (select max(proj_emp_count.emp_count) as max_emp_count
							from (select projectID, count(employeeID) as emp_count
									from employeeprojects
									where HoursWorked > 100
									group by ProjectID) as proj_emp_count)) as proj_max_emp_count
on proj.projectID = proj_max_emp_count.projectID;

-- 9. Найдите департамент с наименьшим количеством сотрудников. Выведите название департамента и количество сотрудников.
select departmentName, count(EmployeeID) as emp_count_by_dep_name
from departments as dep
join employees as emp
on dep.DepartmentID = emp.DepartmentID
group by departmentName
having emp_count_by_dep_name = (select min(dep_emp_count.emp_count) as min_emp_count
								from (select departmentID, count(employeeID) as emp_count
										from employees
										group by DepartmentID) as dep_emp_count);

-- второй вариант
select departmentName
from departments as dep
join (select departmentID, count(employeeID) as emp_count_by_dep_id
		from employees
		group by DepartmentID
		having emp_count_by_dep_id = (select min(dep_emp_count.emp_count) as min_emp_count
										from (select departmentID, count(employeeID) as emp_count
												from employees
												group by DepartmentID) as dep_emp_count)) as emp_count_dep_if_table
on dep.departmentID = emp_count_dep_if_table.departmentID;

-- 10. Определите департамент с наибольшим суммарным бюджетом проектов, на которых работают его сотрудники.
-- 10.1. Вывести ид департамента, имена и фамилии сотрудников, имена проектов и их бюджет.
select emp.departmentID, emp.firstname, emp.lastname, proj.projectName, proj.budget
from employees as emp
join employeeprojects as emp_proj
on emp.EmployeeID = emp_proj.EmployeeID
join projects as proj
on emp_proj.ProjectID = proj.ProjectID;

select * from employees;
select * from employeeprojects;
select * from projects;

-- 10.2. Вывести ид депатамента и сумма бюджета проектов по департаментам.
-- Включение строгой группировки 
SET SESSION sql_mode = CONCAT(@@sql_mode, ',ONLY_FULL_GROUP_BY');
-- ONLY_FULL_GROUP_BY, который требует, чтобы все столбцы, указанные в операторе SELECT, 
-- которые не используются в агрегатных функциях (например, SUM, COUNT), присутствовали в операторе GROUP BY.

select dep_proj_budget.DepartmentID, sum(dep_proj_budget.budget) as dep_sum_budget
from (select emp.departmentID, proj.projectName, proj.budget
		from employees as emp
		join employeeprojects as emp_proj
		on emp.EmployeeID = emp_proj.EmployeeID
		join projects as proj
		on emp_proj.ProjectID = proj.ProjectID
		group by proj.ProjectName, emp.DepartmentID, proj.budget) as dep_proj_budget
group by dep_proj_budget.DepartmentID;

-- 10.3. Вывести маскимальную сумму бюджета проектов по департаментам.
-- 10.4. Вывести ид депатамента с максимальной суммой бюджета проектов по департаментам.
-- 10.5. Вывести имя депатамента с максимальной суммой бюджета проектов по департаментам.
-- 11. Найдите сотрудников, которые работают в департаменте с самой большой суммарной зарплатой среди всех департаментов.
