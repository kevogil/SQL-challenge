-- Drop tables if exists
DROP TABLE IF EXISTS titles CASCADE
DROP TABLE IF EXISTS employees CASCADE
DROP TABLE IF EXISTS departments CASCADE
DROP TABLE IF EXISTS dept_manager CASCADE
DROP TABLE IF EXISTS dept_emp CASCADE
DROP TABLE IF EXISTS salaries CASCADE

-- Create the titles table, with a primary id and a title
CREATE TABLE titles (
	title_id CHAR(5) PRIMARY KEY,
	title VARCHAR
)

-- Create an employees table, with the following: 
--    employee number, 
--    employee title id,
--    birth date
--    first name
--    last name
--    sex
--    hire date
-- set the foreign key and primary key relationships accordingly
CREATE TABLE employees (
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title_id CHAR(5),
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
)

-- Create an departments table, with the following: 
--    department number, 
--    department name
-- set the primary key relationships accordingly
CREATE TABLE departments (
	dept_no VARCHAR(5) PRIMARY KEY,
	dept_name VARCHAR
)

-- Create an dept_manager table, with the following: 
--    department number, 
--    employee number
-- set the foreign key and primary key relationships accordingly
CREATE TABLE dept_manager (
	dept_no VARCHAR(5),
	emp_no INT,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
)

-- Create an dept_emp table, with the following: 
--    department number, 
--    employee number
-- set the foreign key and primary key relationships accordingly
CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR(5),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
)

-- Create an salaries table, with the following: 
--    salary 
--    employee number
-- set the foreign key and primary key relationships accordingly
CREATE TABLE salaries (
	emp_no INT,
	salary FLOAT,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
)


SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;
SELECT * FROM salaries;