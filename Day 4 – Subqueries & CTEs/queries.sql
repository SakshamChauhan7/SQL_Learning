-- =====================================================
-- Day 4 – Subqueries & CTEs
-- File: queries.sql
-- Example queries (1-5) with code + hands-on queries (6-10) descriptions only
-- =====================================================

-- ==============================
-- Example Queries (1-5)
-- ==============================

-- 1. Employees earning more than the average salary (scalar subquery)
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 2. Employees in departments located in New York (subquery in WHERE)
SELECT name, department
FROM employees
WHERE department IN (SELECT department_name FROM departments WHERE location = 'New York');

-- 3. Average salary per department as derived table (subquery in FROM)
SELECT dept, avg_salary
FROM (
    SELECT department AS dept, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
) AS sub;

-- 4. Subquery in SELECT to get department name
SELECT e.name,
       (SELECT department_name FROM departments WHERE department_name = e.department) AS dept_name
FROM employees e;

-- 5. Using CTE to get employees above department average salary
WITH avg_salary_cte AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT e.name, e.salary, a.avg_salary
FROM employees e
INNER JOIN avg_salary_cte a
ON e.department = a.department
WHERE e.salary > a.avg_salary;

-- ==============================
-- Hands-On Practice Queries (6-10) – Descriptions Only
-- ==============================

-- 6. List employees earning less than their department average.
with dpt_avg_cte AS(
	SELECT department, AVG(salary) as avg_salary
	FROM employees
	GROUP BY department
)
SELECT e.name,e.salary,e.department,a.avg_salary
FROM employees e
INNER JOIN dpt_avg_cte a
ON e.department = a.department
WHERE e.salary > a.avg_salary;


-- 7. Find departments where total salary exceeds 15,000.	
WITH total_salary_cte AS (
	SELECT department, SUM(salary) as dpt_tsalary
	FROM employees 
	GROUP By department
)
SELECT department, dpt_tsalary
FROM total_salary_cte a
WHERE dpt_tsalary > 15000;

-- 8. Get the top 2 highest-paid employees per department.
SELECT name, salary, department
FROM (
    SELECT e.name,
           e.salary,
           e.department,
           ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS rn
    FROM employees e
) AS ranked_employees
WHERE rn <= 2
ORDER BY department, salary DESC;
-- 9. Show employees whose salary is above the company average.
WITH avg_salary AS (
	SELECT AVG(salary) as avg_salary
	From employees
)
SELECT e.name, e.salary 
FROM employees e
CROSS JOIN avg_salary a
WHERE e.salary > a.avg_salary;


-- 10. Compute average salary per department location using a CTE.
