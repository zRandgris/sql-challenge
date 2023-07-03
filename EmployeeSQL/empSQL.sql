--List the employee number, last name, first name, sex, and salary of each employee

SELECT employees.emp_no as "Employee Name",
last_name as "Last Name",
first_name as "First Name",
sex as "Gender",
salaries.salary as "Salary"
FROM employees

INNER JOIN salaries ON
salaries.emp_no = employees.emp_no;


-- List the first name, last name, and hire date for the employees who were hired in 1986

SELECT first_name as "First Name",
last_name as "Last Name",
hire_date as "Hire Date"
FROM employees

WHERE hire_date LIKE '__/__/1986';


-- List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT e.first_name,
e.last_name,
e.emp_no,
dm.dept_no,
d.dept_name

FROM dept_manager as dm
INNER JOIN departments as d ON
dm.dept_no = d.dept_no
INNER JOIN employees as e ON
dm.emp_no = e.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name

SELECT e.emp_no as "Employee Number",
e.last_name as "Last Name",
e.first_name as "First Name",
d.dept_name as "Department Name",
d.dept_no as "Department #"

FROM dept_employee as de
INNER JOIN employees as e ON
de.emp_no = e.emp_no
INNER JOIN departments as d ON
de.dept_no = d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name as "First Name",
last_name as "Last Name",
sex as "Gender"
FROM employees
WHERE last_name like 'B%' ;

-- List each employee in the Sales department, including their employee number, last name, and first name

SELECT d.dept_name,
e.emp_no,
e.last_name,
e.first_name

FROM dept_employee as de
INNER JOIN employees as e ON
de.emp_no = e.emp_no
INNER JOIN departments as d ON
de.dept_no = d.dept_no
WHERE dept_name = 'Sales'

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT d.dept_name,
e.emp_no,
e.last_name,
e.first_name

FROM dept_employee as de
INNER JOIN employees as e ON
de.emp_no = e.emp_no
INNER JOIN departments as d ON
de.dept_no = d.dept_no
WHERE dept_name = 'Sales'
OR
dept_name = 'Development'

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)

SELECT last_name As "LAST NAME", COUNT(last_name) as "Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Frequency" DESC;

