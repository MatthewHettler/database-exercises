USE employees;

# 1. Find all the employees with the same hire date as employee 101010 using a subquery (69 Rows).
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date IN (
    SELECT hire_date
    FROM employees
    WHERE employees.employees.emp_no = 101010
)
LIMIT 69;

# 2. Find all the titles held by all employees with the first name Aamod (314 total titles, 6 unique titles).
SELECT title AS 'Titles'
FROM titles
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod'
);

# 3. Find all the current department managers that are female.
# SELECT dept_manager.emp_no
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE dept_manager.to_date = '9999-01-01'
      AND gender = 'F'
);

# Bonus: Find all the department names that currently have female managers.
# +-----------------+
# | dept_name       |
# +-----------------+
# | Development     |
# | Finance         |
# | Human Resources |
# | Research        |
# +-----------------+

SELECT dept_name AS 'dept_name'
FROM departments
WHERE dept_no IN (
    SELECT dept_no
    FROM dept_manager
    WHERE emp_no IN (
        SELECT emp_no
        FROM employees
        WHERE gender = 'F' AND to_date > NOW()
        )
);

# Find the first and last name of the employee with the highest salary.
# +------------+-----------+
# | first_name | last_name |
# +------------+-----------+
# | Tokuyasu   | Pesch     |
# +------------+-----------+

SELECT first_name, last_name
FROM employees
WHERE emp_no = (
    SELECT emp_no
    FROM salaries
    ORDER BY salary DESC LIMIT 1
);



