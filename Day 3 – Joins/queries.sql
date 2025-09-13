-- =====================================================
-- Day 3 – Joins
-- File: queries.sql
-- Hands-on practice with INNER, LEFT, RIGHT, FULL OUTER, CROSS joins
-- =====================================================

-- ==============================
-- Example Tables
-- ==============================
CREATE TABLE IF NOT EXISTS departments (
    dept_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments (department_name, location) VALUES
('Sales', 'New York'),
('Engineering', 'San Francisco'),
('HR', 'Chicago'),
('Marketing', 'Boston')
ON CONFLICT DO NOTHING;

-- ==============================
-- Example Queries
-- ==============================

-- 1. INNER JOIN: only matching employees and departments
SELECT e.name, e.salary, d.department_name, d.location
FROM employees e
INNER JOIN departments d
ON e.department = d.department_name;

-- 2. LEFT JOIN: all employees, NULL if department missing
SELECT e.name, e.salary, d.department_name, d.location
FROM employees e
LEFT JOIN departments d
ON e.department = d.department_name;

-- 3. RIGHT JOIN: all departments, NULL if no employees
SELECT e.name, e.salary, d.department_name, d.location
FROM employees e
RIGHT JOIN departments d
ON e.department = d.department_name;

-- 4. FULL OUTER JOIN: all employees and all departments
SELECT e.name, e.salary, d.department_name, d.location
FROM employees e
FULL OUTER JOIN departments d
ON e.department = d.department_name;

-- 5. CROSS JOIN: Cartesian product
SELECT e.name, d.department_name
FROM employees e
CROSS JOIN departments d;

-- ==============================
-- Hands-On Practice Queries
-- ==============================

-- 6. Employees in 'Sales' department with department location
SELECT e.name,
       e.department,
       d.location
FROM employees AS e
INNER JOIN departments AS d
ON e.department = d.department_name
WHERE e.department = 'Sales';
-- ✅ Correct. Could also select d.department_name for clarity.

-- 7. List all employees, even if their department info is missing
SELECT e.name,
       d.dept_id,
       d.department_name,
       d.location
FROM employees AS e
LEFT JOIN departments AS d
ON e.department = d.department_name;
-- ✅ Correct. Optional: add e.department in SELECT for reference.

-- 8. List all departments and total salary of employees in each (including departments with no employees)
SELECT d.department_name,
       SUM(e.salary) AS total_salary
FROM departments d
LEFT JOIN employees e
ON d.department_name = e.department
GROUP BY d.department_name;
-- ⚠️ Best practice: include all non-aggregated columns in GROUP BY if selecting more, e.g., dept_id, location

-- 9. Employees and departments where salary > 6500
SELECT e.name,
       e.salary,
       d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department = d.department_name
WHERE e.salary > 6500;
-- ✅ Correct. Filtering on e.salary after join.

-- 10. Top 2 employees with department info ordered by salary
SELECT e.name,
       e.salary,
       d.department_name,
       d.dept_id,
       d.location
FROM employees e
LEFT JOIN departments d
ON e.department = d.department_name
ORDER BY e.salary DESC
LIMIT 2;
-- ✅ Correct. LEFT JOIN ensures employees without department are included.
