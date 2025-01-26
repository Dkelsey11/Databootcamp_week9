-- LEFT JOIN TABLE TO ADD SALARY BASED ON EMPLOYEE NUMBER AND THEN ANSWER: List the employee number, last name, first name, sex, and salary of each employee.
	SELECT employees.emp_no, last_name, first_name, sex, salaries.salary
	FROM employees
	LEFT JOIN salaries
	On employees.emp_no=salaries.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.

	SELECT first_name, last_name, hire_date
	FROM employees
	WHERE EXTRACT(YEAR FROM hire_date) = 1986
	ORDER BY hire_date ASC;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.

	SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
	FROM departments d
	JOIN dept_manager dm ON d.dept_no = dm.dept_no
	JOIN employees e ON dm.emp_no = e.emp_no;
	
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

	SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM employees e
	JOIN dept_emp de ON e.emp_no = de.emp_no
	JOIN departments d ON de.dept_no = d.dept_no


--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

	SELECT e.first_name, e.last_name, e.sex
	FROM employees e
	WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.

	SELECT e.emp_no, e.first_name, e.last_name, de.dept_no
	FROM employees e
	JOIN dept_emp de ON e.emp_no = de.emp_no
	JOIN departments d ON de.dept_no = d.dept_no
	WHERE d.dept_name = 'Sales'

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

	SELECT e.emp_no, e.first_name, e.last_name, de.dept_no, d.dept_name
	FROM employees e
	JOIN dept_emp de ON e.emp_no = de.emp_no
	JOIN departments d ON de.dept_no = d.dept_no
	WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

	SELECT last_name, COUNT(*) AS frequency_count
	FROM employees
	GROUP BY last_name
	ORDER BY frequency_count DESC;