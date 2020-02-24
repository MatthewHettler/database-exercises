USE employees;

# write a query that shows each department along with the name of the current manager for that department.
SELECT departments.dept_name AS 'Department Name', concat(first_name, ' ', last_name) AS 'Department Manager'
FROM employees
         JOIN dept_manager
              on employees.emp_no = dept_manager.emp_no
         JOIN departments
              on dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date = '9999-01-01'
ORDER BY  dept_name;

# Find the name of all departments currently managed by women.
SELECT departments.dept_name AS 'Department Name', concat(first_name, ' ', last_name) AS 'Manager Name'
FROM employees
         JOIN dept_manager
              on employees.emp_no = dept_manager.emp_no
         JOIN departments
              on dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date = '9999-01-01' AND gender = 'F'
ORDER BY  dept_name;

# Find the current titles of employees currently working in the Customer Service department.
SELECT title AS 'Title', count(*) AS 'Count'
FROM titles
         JOIN dept_emp
              on titles.emp_no = dept_emp.emp_no
         JOIN departments
              on dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Customer Service' AND dept_emp.to_date = '9999-01-01' AND titles.to_date = '9999-01-01'
GROUP BY title;

# Find the current salary of all current managers.
SELECT departments.dept_name AS 'Department Name', concat(first_name, ' ', last_name) AS 'Name', salaries.salary AS 'Salary'
FROM employees
         JOIN dept_manager
              on employees.emp_no = dept_manager.emp_no
         JOIN departments
              on dept_manager.dept_no = departments.dept_no
         JOIN salaries
              on dept_manager.emp_no = salaries.emp_no
WHERE dept_manager.to_date = '9999-01-01' AND salaries.to_date = '9999-01-01'
ORDER BY  dept_name;


