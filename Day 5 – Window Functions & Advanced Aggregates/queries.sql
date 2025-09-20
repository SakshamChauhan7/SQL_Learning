-- =====================================================
-- Day 5 – Window Functions & Advanced Aggregates
-- File: day5_queries.sql
-- Example queries (1-5) with code + hands-on queries (6-10) descriptions only
-- =====================================================

-- ==============================
-- Example Queries (1-5)
-- ==============================

-- 1. Assign row numbers to employees ordered by salary (ROW_NUMBER)
SELECT name, department, salary,
       ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;

-- 2. Rank employees within each department by salary (RANK)
SELECT name, department, salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM employees;

-- 3. Show cumulative total salary by department (SUM with window)
SELECT name, department, salary,
       SUM(salary) OVER (PARTITION BY department ORDER BY salary DESC) AS running_total
FROM employees;

-- 4. Show difference between an employee's salary and department average
SELECT name, department, salary,
       salary - AVG(salary) OVER (PARTITION BY department) AS diff_from_avg
FROM employees;

-- 5. Show highest salary in each department (MAX with window)
SELECT name, department, salary,
       MAX(salary) OVER (PARTITION BY department) AS max_in_dept
FROM employees;

-- ==============================
-- Hands-On Practice Queries (6-10)
-- ==============================

-- 6. List the top 2 employees by salary in each department using ROW_NUMBER.
-- Note: Changed ORDER BY to DESC to get highest salaries first
WITH avg_salary_cte AS (
	SELECT 
		e.name, 
		e.salary, 
		e.department,
	    ROW_NUMBER() OVER(
			PARTITION BY e.department
			ORDER BY e.salary DESC  -- DESC ensures top salaries first
		) AS rn
	FROM employees e
)
SELECT * 
FROM avg_salary_cte
WHERE rn <= 2;  -- Only top 2 per department


-- 7. Show employees whose salary equals the maximum salary in their department.
WITH max_salary AS (
	SELECT 
		e.name,
		e.department,
		e.salary,
		MAX(e.salary) OVER (PARTITION BY e.department) AS ms  -- Max salary per department
	FROM employees e
)
SELECT * 
FROM max_salary m
WHERE m.salary = m.ms;  -- Only employees with salary = max in their department


-- 8. Show cumulative count of employees by department ordered by salary.
SELECT 
	name,
	department,
	salary,
	COUNT(*) OVER (PARTITION BY department ORDER BY salary DESC) AS cumulative_count
	-- Counts number of employees seen so far in each department ordered by salary descending
FROM employees;


-- 9. Show each employee’s salary as a percentage of the department’s total salary.
WITH total_sal_dep AS (
	SELECT
		department,
		SUM(salary) AS dep_salary  -- Total salary per department
	FROM employees
	GROUP BY department
)
SELECT 
	e.name,
	e.department,
	e.salary,
	t.dep_salary AS department_salary,
	ROUND((e.salary * 1.0 / t.dep_salary) * 100, 2) AS dep_percentage
	-- Multiply by 1.0 to force decimal division, then multiply by 100 and round to 2 decimals
FROM employees e
LEFT JOIN total_sal_dep t
	ON e.department = t.department
ORDER BY department;


-- 10. For each department, find the difference between the highest and lowest salaries using a window function.
SELECT
	name,
	department,
	salary,
	(MAX(salary) OVER (PARTITION BY department) - 
	 MIN(salary) OVER (PARTITION BY department)) AS difference
	-- Difference between highest and lowest salary in the department
FROM employees;
