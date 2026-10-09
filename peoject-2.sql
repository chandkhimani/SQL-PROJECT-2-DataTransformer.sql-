CREATE DATABASE DataTransformer;


-------> 1. Customers table create

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationDate DATE
);


INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, RegistrationDate)
VALUES
(1, 'Chand', 'Khimani', 'chand@gmail.com', '2024-06-10'),
(2, 'Krisha', 'Patel', 'krisha@gmail.com', '2024-07-15'),
(3, 'Shubham', 'Patel', 'shubham@gmail.com', '2024-08-20'),
(4, 'Abhi', 'Shah', 'abhi@gmail.com', '2024-09-05'),
(5, 'Sonal', 'Desai', 'sonal@gmail.com', '2024-10-12');


SELECT * FROM Customers;

+------------+-----------+----------+-------------------+------------------+
| CustomerID | FirstName | LastName | Email             | RegistrationDate |
+------------+-----------+----------+-------------------+------------------+
|          1 | Chand     | Khimani  | chand@gmail.com   | 2024-06-10       |
|          2 | Krisha    | Patel    | krisha@gmail.com  | 2024-07-15       |
|          3 | Shubham   | Patel    | shubham@gmail.com | 2024-08-20       |
|          4 | Abhi      | Shah     | abhi@gmail.com    | 2024-09-05       |
|          5 | Sonal     | Desai    | sonal@gmail.com   | 2024-10-12       |
+------------+-----------+----------+-------------------+------------------+


-------> 2. Orders table create

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


INSERT INTO Orders
(OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(101, 1, '2023-07-01', 1500.50),
(102, 2, '2023-07-03', 2500.75),
(103, 3, '2023-07-05', 800.00),
(104, 4, '2023-07-08', 3200.00),
(105, 5, '2023-07-10', 1200.25);

SELECT * FROM Customers;
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|     101 |          1 | 2023-07-01 |     1500.50 |
|     102 |          2 | 2023-07-03 |     2500.75 |
|     103 |          3 | 2023-07-05 |      800.00 |
|     104 |          4 | 2023-07-08 |     3200.00 |
|     105 |          5 | 2023-07-10 |     1200.25 |
+---------+------------+------------+-------------+


-------> 3. Employees table create


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);


INSERT INTO Employees
(EmployeeID, FirstName, LastName, Department, HireDate, Salary)
VALUES
(1, 'Chand', 'Khimani', 'IT', '2020-01-15', 50000.00),
(2, 'Krisha', 'Patel', 'HR', '2021-03-20', 55000.00),
(3, 'Shubham', 'Patel', 'Sales', '2019-06-10', 45000.00),
(4, 'Abhi', 'Shah', 'Finance', '2022-02-01', 60000.00),
(5, 'Sonal', 'Desai', 'IT', '2023-05-15', 40000.00);


SELECT * FROM Employees;
+------------+-----------+----------+------------+------------+----------+
| EmployeeID | FirstName | LastName | Department | HireDate   | Salary   |
+------------+-----------+----------+------------+------------+----------+
|          1 | Chand     | Khimani  | IT         | 2020-01-15 | 50000.00 |
|          2 | Krisha    | Patel    | HR         | 2021-03-20 | 55000.00 |
|          3 | Shubham   | Patel    | Sales      | 2019-06-10 | 45000.00 |
|          4 | Abhi      | Shah     | Finance    | 2022-02-01 | 60000.00 |
|          5 | Sonal     | Desai    | IT         | 2023-05-15 | 40000.00 |
+------------+-----------+----------+------------+------------+----------+

------>  Queries to perform


------> 1. INNER JOIN: Retrieve all orders and customer details where orders exist.


SELECT
    Orders.OrderID,
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Orders.OrderDate,
    Orders.TotalAmount
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;

+---------+------------+-----------+----------+------------+-------------+
| OrderID | CustomerID | FirstName | LastName | OrderDate  | TotalAmount |
+---------+------------+-----------+----------+------------+-------------+
|     101 |          1 | Chand     | Khimani  | 2023-07-01 |     1500.50 |
|     102 |          2 | Krisha    | Patel    | 2023-07-03 |     2500.75 |
|     103 |          3 | Shubham   | Patel    | 2023-07-05 |      800.00 |
|     104 |          4 | Abhi      | Shah     | 2023-07-08 |     3200.00 |
|     105 |          5 | Sonal     | Desai    | 2023-07-10 |     1200.25 |
+---------+------------+-----------+----------+------------+-------------+

------> 2. LEFT JOIN: Retrieve all customers and their corresponding orders (if any).


SELECT
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Orders.OrderID,
    Orders.OrderDate,
    Orders.TotalAmount
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

+------------+-----------+----------+---------+------------+-------------+
| CustomerID | FirstName | LastName | OrderID | OrderDate  | TotalAmount |
+------------+-----------+----------+---------+------------+-------------+
|          1 | Chand     | Khimani  |     101 | 2023-07-01 |     1500.50 |
|          2 | Krisha    | Patel    |     102 | 2023-07-03 |     2500.75 |
|          3 | Shubham   | Patel    |     103 | 2023-07-05 |      800.00 |
|          4 | Abhi      | Shah     |     104 | 2023-07-08 |     3200.00 |
|          5 | Sonal     | Desai    |     105 | 2023-07-10 |     1200.25 |
+------------+-----------+----------+---------+------------+-------------+

------> 3. RIGHT JOIN: Retrieve all orders and their corresponding customers (if any).


SELECT
    Orders.OrderID,
    Orders.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Orders.OrderDate,
    Orders.TotalAmount
FROM Customers
RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

+---------+------------+-----------+----------+------------+-------------+
| OrderID | CustomerID | FirstName | LastName | OrderDate  | TotalAmount |
+---------+------------+-----------+----------+------------+-------------+
|     101 |          1 | Chand     | Khimani  | 2023-07-01 |     1500.50 |
|     102 |          2 | Krisha    | Patel    | 2023-07-03 |     2500.75 |
|     103 |          3 | Shubham   | Patel    | 2023-07-05 |      800.00 |
|     104 |          4 | Abhi      | Shah     | 2023-07-08 |     3200.00 |
|     105 |          5 | Sonal     | Desai    | 2023-07-10 |     1200.25 |
+---------+------------+-----------+----------+------------+-------------+

------> 4. FULL OUTER JOIN: Retrieve all customers and all orders, regardless of matching.


SELECT
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Orders.OrderID,
    Orders.OrderDate,
    Orders.TotalAmount
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID

UNION

SELECT
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Orders.OrderID,
    Orders.OrderDate,
    Orders.TotalAmount
FROM Customers
RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

+------------+-----------+----------+---------+------------+-------------+
| CustomerID | FirstName | LastName | OrderID | OrderDate  | TotalAmount |
+------------+-----------+----------+---------+------------+-------------+
|          1 | Chand     | Khimani  |     101 | 2023-07-01 |     1500.50 |
|          2 | Krisha    | Patel    |     102 | 2023-07-03 |     2500.75 |
|          3 | Shubham   | Patel    |     103 | 2023-07-05 |      800.00 |
|          4 | Abhi      | Shah     |     104 | 2023-07-08 |     3200.00 |
|          5 | Sonal     | Desai    |     105 | 2023-07-10 |     1200.25 |
+------------+-----------+----------+---------+------------+-------------+

------> 5. Subquery to find customers who have placed orders worth more than the average amount.



SELECT
    CustomerID,
    FirstName,
    LastName
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Orders
    WHERE TotalAmount > (
        SELECT AVG(TotalAmount)
        FROM Orders
    )
);

+------------+-----------+----------+
| CustomerID | FirstName | LastName |
+------------+-----------+----------+
|          2 | Krisha    | Patel    |
|          4 | Abhi      | Shah     |
+------------+-----------+----------+


------> 6. Subquery to find employees with salaries above the average salary.


SELECT
    EmployeeID,
    FirstName,
    LastName,
    Department,
    Salary
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
);

+------------+-----------+----------+------------+----------+
| EmployeeID | FirstName | LastName | Department | Salary   |
+------------+-----------+----------+------------+----------+
|          2 | Krisha    | Patel    | HR         | 55000.00 |
|          4 | Abhi      | Shah     | Finance    | 60000.00 |
+------------+-----------+----------+------------+----------+


------> 7. Extract year and month from the OrderDate.


SELECT
    OrderID,
    OrderDate,
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth
FROM Orders;

+---------+------------+-----------+------------+
| OrderID | OrderDate  | OrderYear | OrderMonth |
+---------+------------+-----------+------------+
|     101 | 2023-07-01 |      2023 |          7 |
|     102 | 2023-07-03 |      2023 |          7 |
|     103 | 2023-07-05 |      2023 |          7 |
|     104 | 2023-07-08 |      2023 |          7 |
|     105 | 2023-07-10 |      2023 |          7 |
+---------+------------+-----------+------------+

------> 8. Calculate the number of days between OrderDate and the current date.


SELECT
    OrderID,
    OrderDate,
    CURDATE() AS CurrentDate,
    DATEDIFF(CURDATE(), OrderDate) AS DaysDifference
FROM Orders;

+---------+------------+-------------+----------------+
| OrderID | OrderDate  | CurrentDate | DaysDifference |
+---------+------------+-------------+----------------+
|     101 | 2023-07-01 | 2026-10-09  |           1196 |
|     102 | 2023-07-03 | 2026-10-09  |           1194 |
|     103 | 2023-07-05 | 2026-10-09  |           1192 |
|     104 | 2023-07-08 | 2026-10-09  |           1189 |
|     105 | 2023-07-10 | 2026-10-09  |           1187 |
+---------+------------+-------------+----------------+

------> 9. Format the OrderDate in DD-MM-YYYY format.


SELECT
    OrderID,
    OrderDate,
    DATE_FORMAT(OrderDate, '%d-%m-%Y') AS FormattedDate
FROM Orders;

+---------+------------+---------------+
| OrderID | OrderDate  | FormattedDate |
+---------+------------+---------------+
|     101 | 2023-07-01 | 01-07-2023    |
|     102 | 2023-07-03 | 03-07-2023    |
|     103 | 2023-07-05 | 05-07-2023    |
|     104 | 2023-07-08 | 08-07-2023    |
|     105 | 2023-07-10 | 10-07-2023    |
+---------+------------+---------------+

------> 10. Concatenate FirstName and LastName to create a full name.


SELECT
    EmployeeID,
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM Employees;

+------------+---------------+
| EmployeeID | FullName      |
+------------+---------------+
|          1 | Chand Khimani |
|          2 | Krisha Patel  |
|          3 | Shubham Patel |
|          4 | Abhi Shah     |
|          5 | Sonal Desai   |
+------------+---------------+

------> 11. Replace 'abhi' with 'vipul' in the FirstName column.


SELECT
    CustomerID,
    REPLACE(FirstName, 'Abhi', 'Vipul') AS FirstName
FROM Customers;

+------------+-----------+
| CustomerID | FirstName |
+------------+-----------+
|          1 | Chand     |
|          2 | Krisha    |
|          3 | Shubham   |
|          4 | Vipul     |
|          5 | Sonal     |
+------------+-----------+

------> 12. Convert FirstName to uppercase and LastName to lowercase.


SELECT
    CustomerID,
    UPPER(FirstName) AS FirstName_Uppercase,
    LOWER(LastName) AS LastName_Lowercase
FROM Customers;

+------------+---------------------+--------------------+
| CustomerID | FirstName_Uppercase | LastName_Lowercase |
+------------+---------------------+--------------------+
|          1 | CHAND               | khimani            |
|          2 | KRISHA              | patel              |
|          3 | SHUBHAM             | patel              |
|          4 | ABHI                | shah               |
|          5 | SONAL               | desai              |
+------------+---------------------+--------------------+

------> 13. Remove leading and trailing spaces from FirstName using TRIM().


SELECT
    CustomerID,
    TRIM(FirstName) AS FirstName
FROM Customers;

+------------+-----------+
| CustomerID | FirstName |
+------------+-----------+
|          1 | Chand     |
|          2 | Krisha    |
|          3 | Shubham   |
|          4 | Abhi      |
|          5 | Sonal     |
+------------+-----------+

------> 14. Calculate the running total of TotalAmount for each order.


SELECT
    OrderID,
    OrderDate,
    TotalAmount,
    SUM(TotalAmount) OVER (
        ORDER BY OrderDate, OrderID
    ) AS RunningTotal
FROM Orders;

+---------+------------+-------------+--------------+
| OrderID | OrderDate  | TotalAmount | RunningTotal |
+---------+------------+-------------+--------------+
|     101 | 2023-07-01 |     1500.50 |      1500.50 |
|     102 | 2023-07-03 |     2500.75 |      4001.25 |
|     103 | 2023-07-05 |      800.00 |      4801.25 |
|     104 | 2023-07-08 |     3200.00 |      8001.25 |
|     105 | 2023-07-10 |     1200.25 |      9201.50 |
+---------+------------+-------------+--------------+

------> 15. Rank orders based on TotalAmount using RANK().

SELECT
    OrderID,
    CustomerID,
    TotalAmount,
    RANK() OVER (
        ORDER BY TotalAmount DESC
    ) AS OrderRank
FROM Orders;

+---------+------------+-------------+-----------+
| OrderID | CustomerID | TotalAmount | OrderRank |
+---------+------------+-------------+-----------+
|     104 |          4 |     3200.00 |         1 |
|     102 |          2 |     2500.75 |         2 |
|     101 |          1 |     1500.50 |         3 |
|     105 |          5 |     1200.25 |         4 |
|     103 |          3 |      800.00 |         5 |
+---------+------------+-------------+-----------+

------> 16. Use CASE to assign a discount based on TotalAmount (10% for amounts above 3000, 5% for amounts between 1000 and 3000, and 0% otherwise).


SELECT
    OrderID,
    TotalAmount,
    CASE
        WHEN TotalAmount > 3000 THEN 10
        WHEN TotalAmount BETWEEN 1000 AND 3000 THEN 5
        ELSE 0
    END AS DiscountPercentage
FROM Orders;

+---------+-------------+--------------------+
| OrderID | TotalAmount | DiscountPercentage |
+---------+-------------+--------------------+
|     101 |     1500.50 |                  5 |
|     102 |     2500.75 |                  5 |
|     103 |      800.00 |                  0 |
|     104 |     3200.00 |                 10 |
|     105 |     1200.25 |                  5 |
+---------+-------------+--------------------+

------> 17. Use CASE to classify employees based on their salary (High: > 60000, Medium: 40000–60000, Low: < 40000).


SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    CASE
        WHEN Salary > 60000 THEN 'High'
        WHEN Salary BETWEEN 40000 AND 60000 THEN 'Medium'
        WHEN Salary < 40000 THEN 'Low'
    END AS SalaryCategory
FROM Employees;

+------------+-----------+----------+----------+----------------+
| EmployeeID | FirstName | LastName | Salary   | SalaryCategory |
+------------+-----------+----------+----------+----------------+
|          1 | Chand     | Khimani  | 50000.00 | Medium         |
|          2 | Krisha    | Patel    | 55000.00 | Medium         |
|          3 | Shubham   | Patel    | 45000.00 | Medium         |
|          4 | Abhi      | Shah     | 60000.00 | Medium         |
|          5 | Sonal     | Desai    | 40000.00 | Medium         |
+------------+-----------+----------+----------+----------------+


=====THANK YOU=====

