-- Try these in pgAdmin one by one:

-- Show all employees in Engineering.

-- Show employees with salary > 6000.

-- Show the lowest-paid employee.

-- Sort employees alphabetically by name.
-- QUERY ->
SELECT * FROM employees
WHERE department = 'Engineering';

SELECT * FROM employees
WHERE salary > 6000;

SELECT * FROM employees
ORDER BY salary
LIMIT 1;

SELECT * FROM employees
ORDER BY name;
