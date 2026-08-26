-- Consider a product table in database now consider a following scheme of product table ,now find name of the product that has third highest value of price * qty among all the product.
-- (prodcode   prodname     price*qty)

CREATE TABLE Product (
    prodcode INT PRIMARY KEY,
    prodname VARCHAR(50),
    price DECIMAL(10,2),
    qty INT
);
INSERT INTO Product (prodcode, prodname, price, qty)
VALUES
(101, 'Laptop', 50000, 2),
(102, 'Mobile', 20000, 3),
(103, 'Keyboard', 1500, 4),
(104, 'Monitor', 10000, 2),
(105, 'Mouse', 800, 5),
(106, 'Printer', 15000, 2),
(107, 'Headphones', 2500, 4),
(108, 'Tablet', 18000, 2);

-- Query to return 3rd highest price * quantity product name
select prodname from product where price*qty =(select price * qty from product order by price * qty desc limit 1 offset 2);


-- Question-2 
-- 5) Consider following tables :-

-- SALESMAN											CUSTOMER
-- SID        NAME      CITY 								CID        NAME        CITY

CREATE TABLE SALESMAN1 (
    SID INT PRIMARY KEY,
    NAME VARCHAR(50),
    CITY VARCHAR(50)
);
INSERT INTO SALESMAN1 (SID, NAME, CITY)
VALUES
(101, 'Davis', 'Hyderabad'),
(102, 'Camero', 'Mumbai'),
(103, 'Green', 'Delhi'),
(104, 'Johns', 'Chennai'),
(105, 'Smith', 'Hyderabad'),
(106, 'Robert', 'Pune'),
(107, 'Miller', 'Mumbai'),
(108, 'Wilson', 'Bangalore'),
(109, 'Taylor', 'Delhi'),
(110, 'Brown', 'Hyderabad');
CREATE TABLE CUSTOMER1 (
    CID INT PRIMARY KEY,
    NAME VARCHAR(50),
    CITY VARCHAR(50)
);
INSERT INTO CUSTOMER1 (CID, NAME, CITY)
VALUES
(201, 'Alice', 'Hyderabad'),
(202, 'Bob', 'Mumbai'),
(203, 'Charlie', 'Delhi'),
(204, 'Daniel', 'Chennai'),
(205, 'Eva', 'Pune'),
(206, 'Frank', 'Bangalore'),
(207, 'Grace', 'Hyderabad'),
(208, 'Henry', 'Mumbai');

select * from customer1;
select * from salesman1;

-- Query -1 :now find number of salesman living in the same city as 'Davis'.

alter table salesman1 rename column name to salesman_name;
select  count(city) from salesman1
 where city =
 (select city from salesman1 where salesman_name ='Davis');


-- Query 2: find sales people who are not living in the same city as Camero,Green,Johns

select sid,salesman_name,city from salesman1 where city not in 
(select city from salesman1 where salesman_name  in ('Camero','Green','Johns'));


