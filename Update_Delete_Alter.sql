-- 1. UPDATE
-- Increase Rahul's salary to 50000.

UPDATE employees
SET salary = 50000
WHERE emp_id = 101;


-- 2. UPDATE
-- Change Neha's city to Hyderabad.

UPDATE employees
SET city = 'Hyderabad'
WHERE emp_id = 108;


-- 3. UPDATE
-- Increase salary by 10% for IT employees.

UPDATE employees
SET salary = salary * 1.10
WHERE department = 'IT';


-- 4. DELETE
-- Delete employee with ID 112.

DELETE FROM employees
WHERE emp_id = 112;


-- 5. DELETE
-- Delete employees whose salary is below 45000.

DELETE FROM employees
WHERE salary < 45000;


-- 6. ALTER TABLE
-- Add a phone column.

ALTER TABLE employees
ADD phone VARCHAR(15);


-- 7. ALTER TABLE
-- Modify the phone column.

ALTER TABLE employees
MODIFY phone VARCHAR(20);


-- 8. ALTER TABLE
-- Remove the phone column.

ALTER TABLE employees
DROP COLUMN phone;
