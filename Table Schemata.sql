-- # Data Engineering
------Table Schema

CREATE TABLE Departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE Titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE Employees (
    emp_no INTEGER   NOT NULL,
    emp_title_id VARCHAR   NOT NULL,
    birth_date DATE   NOT NULL,
	first_Name VARCHAR   NOT NULL,
    last_Name VARCHAR   NOT NULL,
	sex VARCHAR   NOT NULL,
	hire_date DATE   NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY(emp_title_id) REFERENCES Titles (title_id)
);

CREATE TABLE Salaries (
    emp_no INTEGER   NOT NULL,
    salary INTEGER   NOT NULL,
	PRIMARY KEY (emp_no, salary),
    FOREIGN KEY(emp_no) REFERENCES Employees (emp_no)  
);

CREATE TABLE Department_Employer (
    emp_no INTEGER   NOT NULL,
    dept_no VARCHAR   NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY(emp_no) REFERENCES Employees (emp_no),
    FOREIGN KEY(dept_no) REFERENCES Departments (dept_no)
);

CREATE TABLE Department_Manager (
    dept_no VARCHAR   NOT NULL,
    emp_no INTEGER   NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY(dept_no) REFERENCES Departments (dept_no),
	FOREIGN KEY(emp_no) REFERENCES Employees (emp_no)
);

select * from Department_Manager;
select * from Department_Employer;
select * from Salaries;
select * from Employees;
select * from Departments;
select * from Titles;
