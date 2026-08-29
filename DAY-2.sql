-- Question 1: Find Total Order Amount for Each Day

CREATE TABLE orders (
    id INT PRIMARY KEY,
    order_date DATE,
    order_amount INT
);
INSERT INTO orders (id, order_date, order_amount)
VALUES
    (1, '2023-05-09', 1250),
    (2, '2023-05-09', 900),
    (3, '2023-05-10', 1810),
    (4, '2023-05-11', 650),
    (5, '2023-05-11', 100);

SELECT * FROM orders;
--Find Total Order Amount for Each Day

SELECT
    order_date,
    SUM(order_amount) AS total_order_amount
FROM orders
GROUP BY order_date;

-- Question 2: Find Total Orders and Order Amount for Each Month

INSERT INTO orders (id, order_date, order_amount)
VALUES
    (6, '2023-11-09', 1250),
    (7, '2023-11-09', 900);

SELECT
    EXTRACT(MONTH FROM order_date) AS month_number,
    COUNT(order_amount) AS total_orders,
    SUM(order_amount) AS total_order_amount
FROM orders
GROUP BY EXTRACT(MONTH FROM order_date);


-- Question 3: Customer and Orders Analysis


DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customer;
```

## Create Customer Table

```sql
CREATE TABLE customer (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(100) NOT NULL,
    city VARCHAR(100)
);
```

## Create Orders Table

```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    cust_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_amount DECIMAL(10, 2) NOT NULL,

    CONSTRAINT fk_customer
        FOREIGN KEY (cust_id)
        REFERENCES customer(cust_id)
        ON DELETE CASCADE
);
```

## Insert Customer Data

```sql
INSERT INTO customer (cust_id, cust_name, city)
VALUES
    (1, 'Alice Smith', 'New York'),
    (2, 'Bob Johnson', 'Chicago'),
    (3, 'Charlie Brown', 'New York'),
    (4, 'Diana Prince', 'San Francisco'),
    (5, 'Evan Wright', 'Chicago'),
    (6, 'Fiona Gallagher', 'Miami');
```

## Insert Order Data

```sql
INSERT INTO orders (order_id, cust_id, order_date, order_amount)
VALUES
    (101, 1, '2023-07-04', 150.00),
    (102, 2, '2023-07-06', 300.00),
    (103, 3, '2023-07-04', 450.00),

    (104, 1, '2023-06-15', 200.00),
    (105, 4, '2023-06-20', 1200.00),

    (106, 1, CURRENT_DATE - INTERVAL 5 DAY, 120.00),
    (107, 1, CURRENT_DATE - INTERVAL 10 DAY, 80.00),
    (108, 2, CURRENT_DATE - INTERVAL 2 DAY, 500.00),
    (109, 2, CURRENT_DATE - INTERVAL 12 DAY, 250.00),
    (110, 3, CURRENT_DATE - INTERVAL 7 DAY, 90.00),

    (111, 4, '2023-05-10', 850.00),
    (112, 5, '2023-07-15', 210.00);
```

## Display All Data

```sql
SELECT * FROM customer;

SELECT * FROM orders;
```

---

# Query 1: Find Total Number of Orders Placed by Each Customer Excluding Orders Placed in June

```sql
SELECT
    c.cust_id,
    c.cust_name,
    COUNT(o.order_id) AS total_orders
FROM customer c
JOIN orders o
    ON c.cust_id = o.cust_id
WHERE EXTRACT(MONTH FROM o.order_date) <> 6
GROUP BY
    c.cust_id,
    c.cust_name;
```

---

# Query 2: List Orders Placed on 2023-07-04 and 2023-07-06

```sql
SELECT
    order_date,
    COUNT(order_id) AS total_orders
FROM orders
WHERE order_date = '2023-07-04'
GROUP BY order_date

UNION

SELECT
    order_date,
    COUNT(order_id) AS total_orders
FROM orders
WHERE order_date = '2023-07-06'
GROUP BY order_date;
```

### Alternative Using `IN`

```sql
SELECT
    order_date,
    COUNT(order_id) AS total_orders
FROM orders
WHERE order_date IN ('2023-07-04', '2023-07-06')
GROUP BY order_date;
```

---

# Query 3: Find Average Order Value for Each City

```sql
SELECT
    c.city,
    ROUND(COALESCE(AVG(o.order_amount), 0), 2) AS average_order_amount
FROM customer c
LEFT JOIN orders o
    ON c.cust_id = o.cust_id
GROUP BY c.city;
```

---

# Query 4: Identify Customers Who Have Not Placed Any Orders

```sql
SELECT
    c.cust_id,
    c.cust_name
FROM customer c
LEFT JOIN orders o
    ON c.cust_id = o.cust_id
WHERE o.order_id IS NULL;
```

---

# Query 5: Find the Month with the Highest Total Order Value

```sql
SELECT
    EXTRACT(MONTH FROM order_date) AS month_number,
    SUM(order_amount) AS total_order_value
FROM orders
GROUP BY EXTRACT(MONTH FROM order_date)
ORDER BY total_order_value DESC
LIMIT 1;
```

---

# Query 6: Display the Top 2 Customers with the Most Orders in the Last 30 Days

```sql
SELECT
    c.cust_name,
    COUNT(o.order_id) AS total_orders
FROM customer c
JOIN orders o
    ON c.cust_id = o.cust_id
WHERE o.order_date >= CURRENT_DATE - INTERVAL 30 DAY
GROUP BY
    c.cust_id,
    c.cust_name
ORDER BY total_orders DESC
LIMIT 2;
```

---

# Query 7: List All Orders Placed on Specific Dates with Customer Names

## Dates: 2023-07-04 and 2023-07-06

```sql
SELECT
    o.order_id,
    o.order_date,
    c.cust_name,
    o.order_amount
FROM orders o
JOIN customer c
    ON o.cust_id = c.cust_id
WHERE o.order_date IN ('2023-07-04', '2023-07-06');
```

---

# Concepts Covered

* `CREATE TABLE`
* `INSERT INTO`
* Primary Key
* Foreign Key
* `ON DELETE CASCADE`
* `SELECT`
* `WHERE`
* `GROUP BY`
* `ORDER BY`
* `COUNT()`
* `SUM()`
* `AVG()`
* `ROUND()`
* `COALESCE()`
* `INNER JOIN`
* `LEFT JOIN`
* `UNION`
* `EXTRACT()`
* `CURRENT_DATE`
* `INTERVAL`
* `LIMIT`
