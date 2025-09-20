-- ==============================
-- Example Queries (1-5)
-- ==============================

-- 1. LEFT JOIN employees with departments to include all employees
-- Ensures every employee is shown, even if their department info is missing
SELECT e.name, e.salary, d.department_name, d.location
FROM employees e
LEFT JOIN departments d
  ON e.department = d.department_name;

-- 2. FULL OUTER JOIN employees and contractors to get all personnel
-- Combines both tables, including unmatched rows from both
SELECT e.name AS emp_name, c.name AS contractor_name
FROM employees e
FULL OUTER JOIN contractors c
  ON e.department = c.department;

-- 3. Self join: employees earning more than someone else in same department
-- Compares each employee with every other in the same department
SELECT e1.name, e1.salary, e2.name AS lower_paid
FROM employees e1
INNER JOIN employees e2
  ON e1.department = e2.department AND e1.salary > e2.salary;

-- 4. Conditional aggregation: count employees with salary > 5000 per department
-- SUM(CASE WHEN ...) counts only employees meeting the condition
SELECT department,
       COUNT(*) AS total_employees,
       SUM(CASE WHEN salary > 5000 THEN 1 ELSE 0 END) AS high_earners
FROM employees
GROUP BY department;

-- 5. UNION example: list all unique department names from employees and contractors
-- UNION removes duplicates automatically
SELECT department FROM employees
UNION
SELECT department FROM contractors;

-- ==============================
-- Hands-On Practice Queries (6-10)
-- ==============================

-- 6. List employees and their managers using a self join.
-- Hint: Employees table has manager_id column referencing employee_id
SELECT e.employee_id,
       e.name AS employee_name,
       e.department,
       e.manager_id,
       m.name AS manager_name
FROM employees e
JOIN employees m
  ON e.manager_id = m.employee_id;

-- 7. Show departments with no employees using RIGHT or FULL OUTER JOIN.
-- Join departments with employees and look for NULLs
SELECT d.department_name
FROM departments d
LEFT JOIN employees e
  ON e.department = d.department_name
WHERE e.employee_id IS NULL;

-- 8. List all employees who are also contractors using INTERSECT.
-- Returns only names present in both tables
SELECT name FROM employees
INTERSECT
SELECT name FROM contractors;

-- 9. Find employees present in employees table but not in contractors table using EXCEPT.
-- Returns names only in employees
SELECT name FROM employees
EXCEPT
SELECT name FROM contractors;

-- 10. Count employees in each location with salary > 6000 using conditional aggregation.
-- SUM(CASE WHEN ...) counts only those earning > 6000
SELECT d.location,
       SUM(CASE WHEN e.salary > 6000 THEN 1 ELSE 0 END) AS high_earner
FROM employees e
JOIN departments d
  ON e.department = d.department_name
GROUP BY d.location;
