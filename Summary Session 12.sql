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
select max(sum_budget_by_dep.dep_sum_budget) as max_dep_sum_budget
from (select dep_proj_budget.DepartmentID, sum(dep_proj_budget.budget) as dep_sum_budget
		from (select emp.departmentID, proj.projectName, proj.budget
				from employees as emp
				join employeeprojects as emp_proj
				on emp.EmployeeID = emp_proj.EmployeeID
				join projects as proj
				on emp_proj.ProjectID = proj.ProjectID
				group by proj.ProjectName, emp.DepartmentID, proj.budget) as dep_proj_budget
		group by dep_proj_budget.DepartmentID) as sum_budget_by_dep;
        
-- 10.4. Вывести ид депатамента с максимальной суммой бюджета проектов по департаментам.
select dep_proj_budget.DepartmentID, sum(dep_proj_budget.budget) as dep_sum_budget
from (select emp.departmentID, proj.projectName, proj.budget
		from employees as emp
		join employeeprojects as emp_proj
		on emp.EmployeeID = emp_proj.EmployeeID
		join projects as proj
		on emp_proj.ProjectID = proj.ProjectID
		group by proj.ProjectName, emp.DepartmentID, proj.budget) as dep_proj_budget
group by dep_proj_budget.DepartmentID
having dep_sum_budget = (select max(sum_budget_by_dep.dep_sum_budget) as max_dep_sum_budget
						from (select dep_proj_budget.DepartmentID, sum(dep_proj_budget.budget) as dep_sum_budget
								from (select emp.departmentID, proj.projectName, proj.budget
										from employees as emp
										join employeeprojects as emp_proj
										on emp.EmployeeID = emp_proj.EmployeeID
										join projects as proj
										on emp_proj.ProjectID = proj.ProjectID
										group by proj.ProjectName, emp.DepartmentID, proj.budget) as dep_proj_budget
								group by dep_proj_budget.DepartmentID) as sum_budget_by_dep);

-- 10.5. Вывести имя депатамента с максимальной суммой бюджета проектов по департаментам.
select departmentname
from departments as dep
join (select dep_proj_budget.DepartmentID, sum(dep_proj_budget.budget) as dep_sum_budget
		from (select emp.departmentID, proj.projectName, proj.budget
				from employees as emp
				join employeeprojects as emp_proj
				on emp.EmployeeID = emp_proj.EmployeeID
				join projects as proj
				on emp_proj.ProjectID = proj.ProjectID
				group by proj.ProjectName, emp.DepartmentID, proj.budget) as dep_proj_budget
		group by dep_proj_budget.DepartmentID
		having dep_sum_budget = (select max(sum_budget_by_dep.dep_sum_budget) as max_dep_sum_budget
								from (select dep_proj_budget.DepartmentID, sum(dep_proj_budget.budget) as dep_sum_budget
										from (select emp.departmentID, proj.projectName, proj.budget
												from employees as emp
												join employeeprojects as emp_proj
												on emp.EmployeeID = emp_proj.EmployeeID
												join projects as proj
												on emp_proj.ProjectID = proj.ProjectID
												group by proj.ProjectName, emp.DepartmentID, proj.budget) as dep_proj_budget
										group by dep_proj_budget.DepartmentID) as sum_budget_by_dep)) as table2
on dep.departmentid = table2.DepartmentID;

-- 11. Найдите сотрудников, которые работают в департаменте с самой большой суммарной зарплатой среди всех департаментов.
select firstname, lastname
from employees as table1
join (select DepartmentID, sum(salary) as dep_total_salary 
		from employees
		group by DepartmentID
		having dep_total_salary = (select max(total_salary_by_dep.dep_total_salary) as max_dep_total_salary
									from (select DepartmentID, sum(salary) as dep_total_salary 
											from employees
											group by DepartmentID) total_salary_by_dep)) as table2
on table1.DepartmentID = table2.DepartmentID;
