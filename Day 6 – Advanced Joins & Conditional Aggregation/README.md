# Day 6 – Advanced Joins & Conditional Aggregation

## 1. Goal of the Day
- Learn advanced join types and their practical usage:
  - LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN
  - Self joins
  - Set operations: UNION, INTERSECT, EXCEPT
- Understand conditional aggregation:
  - Using `CASE WHEN` inside aggregation functions
  - Counting or summing based on conditions
- Start practicing scenarios combining joins and aggregation.

## 2. Key Concepts

- **LEFT JOIN / RIGHT JOIN / FULL OUTER JOIN**: Include unmatched rows from one or both tables.
- **Self Join**: Join a table with itself to compare rows (e.g., employees and managers).
- **Set Operations**:
  - `UNION`: Combine two result sets, remove duplicates.
  - `INTERSECT`: Rows present in both result sets.
  - `EXCEPT`: Rows in first set but not in second.
- **Conditional Aggregation**:
  - Use `SUM(CASE WHEN ...)` or `COUNT(CASE WHEN ...)`.
  - Allows counting or summing only rows meeting specific conditions.

## 3. Example Queries (1-5)
1. LEFT JOIN employees with departments
2. FULL OUTER JOIN employees and contractors
3. Self join: employees earning more than someone else in same department
4. Conditional aggregation: count employees with salary > 5000 per department
5. UNION example: list all unique department names from employees and contractors

## 4. Hands-On Practice (6-10)
6. List employees and their managers using a self join  
7. Show departments with no employees using RIGHT or FULL OUTER JOIN  
8. List all employees who are also contractors using INTERSECT  
9. Find employees present in employees table but not in contractors table using EXCEPT  
10. Count employees in each location with salary > 6000 using conditional aggregation

## 5. Certification Relevance
- PostgreSQL Associate  
- BigQuery / Snowflake SQL sections  
- Any SQL role requiring joins, self joins, conditional counts, and set operations
