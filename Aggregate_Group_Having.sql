-- Aggregate functions are SQL functions that take multiple rows and produce one result.

-- 1. COUNT()
-- =========================================================

-- Q1. Find the total number of employees.
SELECT COUNT(*) AS total_employees
FROM employees;


-- Q2. Find the total number of female employees.
SELECT COUNT(*) AS female_employees
FROM employees
WHERE gender = 'Female';


-- Q3. Find the number of employees in the IT department.
SELECT COUNT(*) AS it_employees
FROM employees
WHERE department = 'IT';


-- Q4. Find the number of employees who have provided an email.
SELECT COUNT(email) AS employees_with_email
FROM employees;


-- Q5. Find the number of employees who do not have a manager.
SELECT COUNT(*) AS employees_without_manager
FROM employees
WHERE manager_id IS NULL;

-- 2. SUM()
-- =========================================================

-- Q6. Find the total salary paid to all employees.
SELECT SUM(salary) AS total_salary
FROM employees;


-- Q7. Find the total salary paid to IT employees.
SELECT SUM(salary) AS it_total_salary
FROM employees
WHERE department = 'IT';


-- Q8. Find the total salary paid to female employees.
SELECT SUM(salary) AS female_total_salary
FROM employees
WHERE gender = 'Female';

-- 3. AVG()
-- =========================================================

-- Q9. Find the average salary of all employees.
SELECT AVG(salary) AS average_salary
FROM employees;


-- Q10. Find the average salary of employees in IT.
SELECT AVG(salary) AS it_average_salary
FROM employees
WHERE department = 'IT';


-- Q11. Find the average age of all employees.
SELECT AVG(age) AS average_age
FROM employees;

-- 4. MIN()
-- =========================================================

-- Q12. Find the lowest salary among all employees.
SELECT MIN(salary) AS lowest_salary
FROM employees;


-- Q13. Find the youngest employee.
SELECT MIN(age) AS youngest_age
FROM employees;


-- Q14. Find the earliest joining date.
SELECT MIN(joining_date) AS earliest_joining_date
FROM employees;

-- 5. MAX()
-- =========================================================

-- Q15. Find the highest salary among all employees.
SELECT MAX(salary) AS highest_salary
FROM employees;

-- Q16. Find the oldest employee.
SELECT MAX(age) AS oldest_age
FROM employees;

-- Q17. Find the latest joining date.
SELECT MAX(joining_date) AS latest_joining_date
FROM employees;

-- 6. GROUP BY
-- =========================================================

-- Q18. Find the number of employees in each department.
SELECT
    department,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department;


-- Q19. Find the average salary of employees in each department.
SELECT
    department,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department;

-- Q20. Find the highest salary in each department.

SELECT
    department,
    MAX(salary) AS highest_salary
FROM employees
GROUP BY department;


-- Q21. Find the number of employees in each city.

SELECT
    city,
    COUNT(*) AS employee_count
FROM employees
GROUP BY city;

-- Q22. Find the number of male and female employees.

SELECT
    gender,
    COUNT(*) AS employee_count
FROM employees
GROUP BY gender;

-- 7. GROUP BY + ORDER BY
-- =========================================================

-- Q23. Display departments in descending order
-- of employee count.

SELECT
    department,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department
ORDER BY employee_count DESC;


-- Q24. Display cities from highest to lowest
-- based on employee count.

SELECT
    city,
    COUNT(*) AS employee_count
FROM employees
GROUP BY city
ORDER BY employee_count DESC;

-- 8. HAVING
-- =========================================================
-- Q25. Find departments having at least 2 employees.

SELECT
    department,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) >= 2;


-- Q26. Find departments whose average salary
-- is greater than 70000.

SELECT
    department,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 70000;


-- Q27. Find departments whose total salary
-- is greater than 200000.

SELECT
    department,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 200000;


-- Q28. Find cities having more than 2 employees.

SELECT
    city,
    COUNT(*) AS employee_count
FROM employees
GROUP BY city
HAVING COUNT(*) > 2;

-- 9. WHERE + GROUP BY + HAVING
-- =========================================================

-- Q29. Find departments having more than 1 employee
-- whose salary is greater than 50000.

SELECT
    department,
    COUNT(*) AS employee_count
FROM employees
WHERE salary > 50000
GROUP BY department
HAVING COUNT(*) > 1;


-- Q30. Find departments whose average salary is
-- greater than 60000, considering employees aged 25 or above.

SELECT
    department,
    AVG(salary) AS average_salary
FROM employees
WHERE age >= 25
GROUP BY department
HAVING AVG(salary) > 60000;

-- Q31. Find departments whose highest salary is greater than 90000.

SELECT
    department,
    MAX(salary) AS highest_salary
FROM employees
GROUP BY department
HAVING MAX(salary) > 90000;



