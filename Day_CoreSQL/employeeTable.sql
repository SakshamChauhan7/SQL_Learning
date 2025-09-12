**This is the query used to add the initial table to the database**

  
CREATE TABLE employees (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	department VARCHAR(50),
	salary INT
);

INSERT INTO employees(name,department,salary) VALUES
('Alice', 'Sales', 6000),
('Bob', 'Engineering', 7000),
('Charlie', 'HR', 5000),
('Diana', 'Sales', 6500),
('Evan', 'Engineering', 7200);
