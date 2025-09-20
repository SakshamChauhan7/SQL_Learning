# Day 5 – Window Functions & Advanced Aggregates

## 1. Goal of the Day
- Learn advanced SQL concepts using **window functions** in PostgreSQL:
  - `ROW_NUMBER()` – assign sequential numbers within a partition
  - `RANK()` / `DENSE_RANK()` – ranking within groups
  - `SUM() OVER`, `AVG() OVER`, `MAX() OVER`, `MIN() OVER` – perform calculations across partitions
  - Cumulative counts and percentages
- Understand how to calculate **top-N per group**, **running totals**, and **differences within partitions**.
- Save queries and results in the SQL portfolio.

## 2. Example Queries (1-5)
- Assign row numbers to employees ordered by salary (`ROW_NUMBER`).
- Rank employees within each department (`RANK`).
- Show cumulative salary by department (`SUM() OVER`).
- Show difference from department average (`AVG() OVER`).
- Find highest salary in each department (`MAX() OVER`).

*(See `queries.sql` file for full code examples.)*

## 3. Hands-On Practice (6-10) – Descriptions Only
- **6.** List the top 2 employees by salary in each department using `ROW_NUMBER()`.
- **7.** Show employees whose salary equals the maximum salary in their department.
- **8.** Show cumulative count of employees by department ordered by salary.
- **9.** Show each employee’s salary as a percentage of the department’s total salary.
- **10.** For each department, find the difference between the highest and lowest salaries using a window function.

## 4. Reflection & Certification Notes
- Learned how to use **window functions** for ranking, running totals, and percentage calculations.
- Key skills for:
  - PostgreSQL Associate
  - BigQuery SQL basics
  - Snowflake/Synapse SQL sections
- Understanding window functions is essential for advanced analytics and reporting in SQL.

