-- =====================================================
-- Day 2 – Aggregations & Filtering
-- File: queries.sql
-- Purpose: Hands-on practice with SQL aggregate functions,
-- GROUP BY, HAVING, and sorting.
-- =====================================================

-- ==============================
-- Example Queries
-- ==============================

-- 1. Total employees
SELECT COUNT(*) AS total_employees 
FROM employees;

-- 2. Average salary
SELECT AVG(salary) AS average_salary 
FROM employees;

-- 3. Highest & lowest salary
SELECT MAX(salary) AS highest, MIN(salary) AS lowest 
FROM employees;

-- 4. Salary by department
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- 5. Departments with more than 1 employee
SELECT department, COUNT(*) AS num_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 1
ORDER BY num_employees DESC;

-- ==============================
-- Hands-On Practice Queries
-- ==============================

-- 1. Average salary in the Sales department
SELECT AVG(salary) AS average_salary 
FROM employees
WHERE department = 'Sales';

-- 2. Department with the highest average salary
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC
LIMIT 1;

-- 3. Number of employees per department, sorted by department name
SELECT department, COUNT(*) AS total_employee_per_department
FROM employees
GROUP BY department
ORDER BY department;

-- 4. Departments with total salary greater than 10,000
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 10000;

-- 5. Top 2 highest-paid departments by average salary
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC
LIMIT 2;

-- 6. Show all employees (optional reference)
SELECT * FROM employees;
