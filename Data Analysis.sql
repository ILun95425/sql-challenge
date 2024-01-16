--1. List the employee number, last name, first name, sex, and salary of each employee

SELECT
    emp.emp_no AS "Employee Number",
    emp.last_name AS "Last Name",
    emp.first_name AS "First Name",
    emp.sex AS "Sex",
    sal.salary AS "Salary"
FROM
    "M9"."employees" emp
JOIN
    "M9"."salaries" sal USING (emp_no);
	
--2. List the first name, last name, and hire date for the employees who were hired in 1986

SELECT
    first_name AS "First Name",
    last_name AS "Last Name",
    hire_date AS "Hire Date"
FROM
    "M9"."employees"
WHERE
    EXTRACT(YEAR FROM hire_date) = 1986;
	
--3. List the manager of each department along with their department number, department name, employee number, last name, and first name 

SELECT
    dm.dept_no AS "Department Number",
    d.dept_name AS "Department Name",
    dm.emp_no AS "Employee Number",
    e.last_name AS "Last Name",
    e.first_name AS "First Name"
FROM
    "M9"."dept_manager" dm
JOIN
    "M9"."departments" d ON dm.dept_no = d.dept_no
JOIN
    "M9"."employees" e ON dm.emp_no = e.emp_no;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name 

SELECT
    de.emp_no AS "Employee Number",
    e.last_name AS "Last Name",
    e.first_name AS "First Name",
    de.dept_no AS "Department Number",
    d.dept_name AS "Department Name"
FROM
    "M9"."dept_emp" de
JOIN
    "M9"."employees" e ON de.emp_no = e.emp_no
JOIN
    "M9"."departments" d ON de.dept_no = d.dept_no;
	
--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B 

SELECT
    first_name AS "First Name",
    last_name AS "Last Name",
    sex AS "Sex"
FROM
    "M9"."employees"
WHERE
    first_name = 'Hercules' AND last_name LIKE 'B%';

--6. List each employee in the Sales department, including their employee number, last name, and first name

SELECT
    de.emp_no AS "Employee Number",
    e.last_name AS "Last Name",
    e.first_name AS "First Name"
FROM
    "M9"."dept_emp" de
JOIN
    "M9"."employees" e ON de.emp_no = e.emp_no
JOIN
    "M9"."departments" d ON de.dept_no = d.dept_no
WHERE
    d.dept_name = 'Sales';
	
--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name

SELECT
    de.emp_no AS "Employee Number",
    e.last_name AS "Last Name",
    e.first_name AS "First Name",
    d.dept_name AS "Department Name"
FROM
    "M9"."dept_emp" de
JOIN
    "M9"."employees" e ON de.emp_no = e.emp_no
JOIN
    "M9"."departments" d ON de.dept_no = d.dept_no
WHERE
    d.dept_name IN ('Sales', 'Development');
	
--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)

SELECT
    last_name AS "Last Name",
    COUNT(*) AS "Frequency"
FROM
    "M9"."employees"
GROUP BY
    last_name
ORDER BY
    "Frequency" DESC, "Last Name";