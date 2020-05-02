-- # Data Analysis
-----Queries

select * from Department_Manager;
select * from Department_Employer;
select * from Salaries;
select * from Employees;
select * from Departments;
select * from Titles;

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

Select Employees.emp_no, 
	Employees.last_name,
	Employees.first_name,
	Employees.sex,
	Salaries.salary
From Employees
JOIN Salaries on
Employees.emp_no = Salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

Select first_name, last_name, hire_date
FROM Employees
WHERE hire_date 
Between '1986/01/01' and '1986/12/31';

-- 3. List the manager of each department with the following information: 
--    department number, department name, the manager's employee number, last name, first name.


Select Departments.dept_no, 
	Departments.dept_name,
	Department_Manager.emp_no,
	Employees.last_name,
	Employees.first_name
From Departments
	JOIN Department_Manager 
	on(Departments.dept_no = Department_Manager.dept_no)
		JOIN Employees 
		on(Department_Manager.emp_no = Employees.emp_no);

-- 4. List the department of each employee with the following information: 
--    employee number, last name, first name, and department name.

Select Department_Employer.emp_no, 
	Employees.last_name,
	Employees.first_name,
	Departments.dept_name
From Departments
	JOIN Department_Employer 
	on(Departments.dept_no = Department_Employer.dept_no)
		JOIN Employees 
		on(Department_Employer.emp_no = Employees.emp_no);


-- 5. List first name, last name, and sex 
--    for employees whose first name is "Hercules" and last names begin with "B."

Select first_name, last_name, sex
from Employees
where first_name = 'Hercules'
and last_name like 'B%';

-- 6. List all employees in the Sales department, 
--    including their employee number, last name, first name, and department name.

Select Department_Employer.emp_no,
	Employees.last_name,
	Employees.first_name,
	Departments.dept_name
From Departments
	JOIN Department_Employer 
	on(Departments.dept_no = Department_Employer.dept_no)
		JOIN Employees 
		on(Department_Employer.emp_no = Employees.emp_no)
		where dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, 
--    including their employee number, last name, first name, and department name.

Select Department_Employer.emp_no,
	Employees.last_name,
	Employees.first_name,
	Departments.dept_name
From Departments
	JOIN Department_Employer 
	on(Departments.dept_no = Department_Employer.dept_no)
		JOIN Employees 
		on(Department_Employer.emp_no = Employees.emp_no)
		where dept_name = 'Sales' or dept_name = 'Development';

-- 8. In descending order, list the frequency,
--    count of employee last names, i.e., how many employees share each last name.

Select last_name, count(last_name)
from Employees
group by last_name
order by count(last_name) desc;