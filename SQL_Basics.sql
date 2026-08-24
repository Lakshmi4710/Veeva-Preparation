/*
===========================================================
                 SQL BASICS
                 VEEVA PREPARATION
===========================================================
*/


-- 1. DATABASE & TABLE CREATION

CREATE DATABASE VEEVA_SQL_PRACTICE;

USE VEEVA_SQL_PRACTICE;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    age INT,
    gender VARCHAR(10),
    salary DECIMAL(10,2),
    department VARCHAR(50),
    city VARCHAR(50),
    joining_date DATE,
    email VARCHAR(100),
    manager_id INT
);


-- 2. INSERT

INSERT INTO employees
(emp_id, emp_name, age, gender, salary, department,
 city, joining_date, email, manager_id)
VALUES
(101, 'Rahul', 24, 'Male', 45000, 'IT',
 'Hyderabad', '2023-06-15', 'rahul@gmail.com', 105),
(102, 'Priya', 27, 'Female', 60000, 'HR',
 'Chennai', '2022-04-10', 'priya@gmail.com', 106),
(103, 'Arjun', 29, 'Male', 75000, 'IT',
 'Hyderabad', '2021-08-20', 'arjun@gmail.com', 105),
(104, 'Sneha', 25, 'Female', 50000, 'Finance',
 'Bangalore', '2023-01-12', 'sneha@gmail.com', 107),
(105, 'Kiran', 35, 'Male', 95000, 'IT',
 'Hyderabad', '2018-03-05', 'kiran@gmail.com', NULL),
(106, 'Anjali', 32, 'Female', 85000, 'HR',
 'Chennai', '2019-07-18', 'anjali@gmail.com', NULL),
(107, 'Vikram', 38, 'Male', 100000, 'Finance',
 'Bangalore', '2017-11-25', 'vikram@gmail.com', NULL),
(108, 'Neha', 23, 'Female', 40000, 'Sales',
 'Mumbai', '2024-02-01', 'neha@gmail.com', 109),
(109, 'Ravi', 31, 'Male', 70000, 'Sales',
 'Mumbai', '2020-09-14', 'ravi@gmail.com', NULL),
(110, 'Meena', 26, 'Female', 55000, 'Marketing',
 'Pune', '2022-12-10', 'meena@gmail.com', 111),
(111, 'Suresh', 36, 'Male', 90000, 'Marketing',
 'Pune', '2018-06-22', 'suresh@gmail.com', NULL),
(112, 'Divya', 28, 'Female', 65000, 'IT',
 'Hyderabad', '2021-05-17', NULL, 105);

-- 3. SELECT
-- Display all employees.

SELECT *
FROM employees;

-- Display only employee name and salary.

SELECT emp_name, salary
FROM employees;

-- 4. DISTINCT
-- Display all unique departments.

SELECT DISTINCT department
FROM employees;

-- Display all unique cities.

SELECT DISTINCT city
FROM employees;

-- 5. WHERE CLAUSE
-- Find employees whose salary is greater than 60000.

SELECT *
FROM employees
WHERE salary > 60000;

-- Find employees from IT department.

SELECT *
FROM employees
WHERE department = 'IT';

-- 6. AND / OR / NOT
-- Employees from IT AND salary greater than 60000.

SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 60000;

-- Employees from IT OR HR.

SELECT *
FROM employees
WHERE department = 'IT'
OR department = 'HR';

-- Employees NOT from IT.

SELECT *
FROM employees
WHERE NOT department = 'IT';

-- 7. COMPARISON OPERATORS
-- Greater than

SELECT *
FROM employees
WHERE salary > 70000;

-- Less than

SELECT *
FROM employees
WHERE salary < 50000;

-- Greater than or equal to

SELECT *
FROM employees
WHERE salary >= 75000;

-- Less than or equal to

SELECT *
FROM employees
WHERE salary <= 50000;

-- Equal to

SELECT *
FROM employees
WHERE salary = 60000;

-- Not equal to

SELECT *
FROM employees
WHERE salary <> 60000;

-- 8. BETWEEN
-- Salary between 50000 and 80000.

SELECT *
FROM employees
WHERE salary BETWEEN 50000 AND 80000;

-- Age between 25 and 30.

SELECT *
FROM employees
WHERE age BETWEEN 25 AND 30;

-- 9. IN
-- Employees from IT, HR or Sales.

SELECT *
FROM employees
WHERE department IN ('IT', 'HR', 'Sales');

-- Employees from Hyderabad or Chennai.

SELECT *
FROM employees
WHERE city IN ('Hyderabad', 'Chennai');

-- 10. LIKE
-- Names starting with A.

SELECT *
FROM employees
WHERE emp_name LIKE 'A%';

-- Names ending with a.

SELECT *
FROM employees
WHERE emp_name LIKE '%a';

-- Names containing 'an'.

SELECT *
FROM employees
WHERE emp_name LIKE '%an%';

-- Gmail addresses.

SELECT *
FROM employees
WHERE email LIKE '%@gmail.com';

-- 11. IS NULL / IS NOT NULL
-- Employees without an email.

SELECT *
FROM employees
WHERE email IS NULL;

-- Employees having an email.

SELECT *
FROM employees
WHERE email IS NOT NULL;

-- Employees without a manager.

SELECT *
FROM employees
WHERE manager_id IS NULL;

-- 12. ORDER BY
-- Lowest salary to highest.

SELECT *
FROM employees
ORDER BY salary ASC;

-- Highest salary to lowest.

SELECT *
FROM employees
ORDER BY salary DESC;

-- Sort by department and then salary.

SELECT *
FROM employees
ORDER BY department ASC, salary DESC;

-- 13. LIMIT / OFFSET
-- Top 5 highest-paid employees.

SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;

-- Second highest-paid employee.

SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;


