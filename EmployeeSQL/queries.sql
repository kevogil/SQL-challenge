-- Select the employee number, last name, first name, sex, and salary of all employees, ordered by employee number
SELECT 
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	e.sex As "Sex",
	s.salary AS "Salary"
FROM employees e
INNER JOIN salaries s ON s.emp_no = e.emp_no
ORDER BY e.emp_no;


-- Select the first name, last name, and hiring date for all employees hired in 1986 
SELECT
	e.first_name AS "First Name",
	e.last_name AS "Last Name",
	e.hire_date AS "Hiring Date"
FROM employees e
WHERE EXTRACT(year FROM e.hire_date) = 1986;


-- Select the department number, department name, employee number, last name, and first name of all managers of each department
SELECT 
	dept_manager.dept_no AS "Dept Number",
	departments.dept_name AS "Dept Name",
	dept_manager.emp_no AS "Employee Number",
	employees.last_name AS "Last Name",
	employees.first_name AS "First Name"
FROM dept_manager
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no;


-- Select the employee number, last name, first name, and department of each employee, ordered by employee number
SELECT 
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name AS "Department"
FROM employees e
INNER JOIN dept_emp ON e.emp_no = dept_emp.emp_no
INNER JOIN departments d ON dept_emp.dept_no = d.dept_no
ORDER BY e.emp_no;


-- Select first name, last name, birth date, and sex of all employees whose first name is "Hercules" and last name begins with a "B"
SELECT
	e.first_name AS "First Name",
	e.last_name AS "Last Name",
	e.birth_date AS "Birth Date",
	e.sex AS "Sex"
FROM employees e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';


-- Select employee number, last name, first name, and department name of all employees in the Sales department, ordered by employee number
SELECT 
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name AS "Department"
FROM employees e
INNER JOIN dept_emp ON e.emp_no = dept_emp.emp_no
INNER JOIN departments d ON dept_emp.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;


-- Select employee number, last name, first name, and department name of all employees in the 'Sales' OR the 'Development' department, ordered by employee number
SELECT
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name AS "Department"
FROM employees e
INNER JOIN dept_emp ON e.emp_no = dept_emp.emp_no
INNER JOIN departments d ON dept_emp.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY e.emp_no;
	

-- Count the number of employees, grouped by last name
SELECT 
	last_name AS "Last Name",
	COUNT(last_name) AS "Num of Employees"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
