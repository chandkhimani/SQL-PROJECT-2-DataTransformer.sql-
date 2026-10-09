# 🔄 Data Transformer — SQL

### A Practical MySQL Project for Joins, Subqueries, Functions & Data Analysis

<p align="center">
  <img src="https://img.shields.io/badge/Database-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL">
  <img src="https://img.shields.io/badge/Language-SQL-336791?style=for-the-badge&logo=mysql&logoColor=white" alt="SQL">
  <img src="https://img.shields.io/badge/Queries-17-6C63FF?style=for-the-badge" alt="17 SQL queries">
  <img src="https://img.shields.io/badge/Project-Academic-F39C12?style=for-the-badge" alt="Academic Project">
</p>

<p align="center">
  <strong>📚 BCA Final Year</strong> •
  <strong>📊 Data Analysis Course</strong> •
  <strong>👨‍💻 Developed by Chand Khimani</strong>
</p>

<p align="center">
  <strong>🎓 Guided by Prof. Girish Gondaliya</strong>
</p>

---

## 📌 Table of Contents

- [🌟 Project Overview](#-project-overview)
- [🎯 Project Objectives](#-project-objectives)
- [🏗️ Database Architecture](#️-database-architecture)
- [🔗 Relationship Flow](#-relationship-flow)
- [🧩 Database Schema](#-database-schema)
- [🧠 SQL Concepts Demonstrated](#-sql-concepts-demonstrated)
- [📋 Assignment Query Coverage](#-assignment-query-coverage)
- [📊 Sample Data & Expected Results](#-sample-data--expected-results)
- [🛠️ Technologies Used](#️-technologies-used)
- [🚀 How to Run](#-how-to-run)
- [📁 Repository Structure](#-repository-structure)
- [🧠 Learning Outcomes](#-learning-outcomes)
- [✨ Key Highlights](#-key-highlights)
- [🎓 Academic Information](#-academic-information)
- [🙏 Acknowledgement](#-acknowledgement)

---

## 🌟 Project Overview

**Data Transformer — SQL** is a practical MySQL assignment focused on retrieving, combining, transforming, and analyzing relational data.

The project uses three connected tables — `Customers`, `Orders`, and `Employees` — to demonstrate the 17 SQL tasks provided in the assignment.

### 🧱 Core Tables

| # | Table | Purpose |
|---|---|---|
| 01 | 👥 `Customers` | Stores customer names, email addresses, and registration dates |
| 02 | 🧾 `Orders` | Stores order dates, customer references, and order amounts |
| 03 | 🧑‍💼 `Employees` | Stores employee names, departments, hire dates, and salaries |

> 🎯 **Project Goal:** Practice the assigned SQL queries using relational data and learn how to join tables, use subqueries, apply built-in functions, and perform basic analytical calculations.

---

## 🎯 Project Objectives

| Area | Concepts Covered |
|---|---|
| 🔗 Table Relationships | `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN` |
| 🌐 Full Result Combination | Simulating `FULL OUTER JOIN` with `UNION` in MySQL |
| 🧩 Nested Queries | Subqueries with `AVG()` |
| 📅 Date & Time | `YEAR()`, `MONTH()`, `CURDATE()`, `DATEDIFF()`, `DATE_FORMAT()` |
| 🔤 String Functions | `CONCAT()`, `REPLACE()`, `UPPER()`, `LOWER()`, `TRIM()` |
| 📈 Window Functions | `SUM() OVER()`, `RANK() OVER()` |
| 🧮 Conditional Logic | `CASE` expressions for discounts and salary categories |

---

## 🏗️ Database Architecture

```text
                     ┌──────────────────────────┐
                     │   DATA TRANSFORMER SQL   │
                     │       DATABASE           │
                     └────────────┬─────────────┘
                                  │
                 ┌────────────────┼────────────────┐
                 │                │                │
                 ▼                ▼                ▼
          ┌─────────────┐  ┌─────────────┐  ┌─────────────┐
          │  CUSTOMERS  │  │    ORDERS   │  │  EMPLOYEES  │
          ├─────────────┤  ├─────────────┤  ├─────────────┤
          │ CustomerID  │◄─┤ CustomerID  │  │ EmployeeID  │
          │ FirstName   │  │ OrderID     │  │ FirstName   │
          │ LastName    │  │ OrderDate   │  │ LastName    │
          │ Email       │  │ TotalAmount │  │ Department  │
          │ Registration│  └─────────────┘  │ HireDate    │
          │ Date        │                   │ Salary      │
          └─────────────┘                   └─────────────┘
```

### 🔑 Relationship Logic

```text
Customers.CustomerID
          │
          │ one customer can be linked to an order
          ▼
Orders.CustomerID
```

- `Customers.CustomerID` is the primary key in `Customers`.
- `Orders.CustomerID` is a foreign key referencing `Customers.CustomerID`.
- `Employees` is a separate table used for salary-related subqueries and employee string functions.

The sample dataset contains five customers, five orders, and five employees.

---

## 🧩 Database Schema

### 1️⃣ Customers

| Field | Data Type | Key / Purpose |
|---|---|---|
| `CustomerID` | `INT` | 🔑 Primary Key |
| `FirstName` | `VARCHAR(50)` | Customer's first name |
| `LastName` | `VARCHAR(50)` | Customer's last name |
| `Email` | `VARCHAR(100)` | Customer email |
| `RegistrationDate` | `DATE` | Customer registration date |

### 2️⃣ Orders

| Field | Data Type | Key / Purpose |
|---|---|---|
| `OrderID` | `INT` | 🔑 Primary Key |
| `CustomerID` | `INT` | 🔗 Foreign Key referencing `Customers` |
| `OrderDate` | `DATE` | Date the order was placed |
| `TotalAmount` | `DECIMAL(10,2)` | Total order value |

### 3️⃣ Employees

| Field | Data Type | Key / Purpose |
|---|---|---|
| `EmployeeID` | `INT` | 🔑 Primary Key |
| `FirstName` | `VARCHAR(50)` | Employee's first name |
| `LastName` | `VARCHAR(50)` | Employee's last name |
| `Department` | `VARCHAR(50)` | Employee department |
| `HireDate` | `DATE` | Employee hire date |
| `Salary` | `DECIMAL(10,2)` | Employee salary |

---

## 🧠 SQL Concepts Demonstrated

### 🔗 JOIN Operations

- **INNER JOIN:** Returns rows with matching customer and order records.
- **LEFT JOIN:** Returns every customer and any matching order.
- **RIGHT JOIN:** Returns every order and its matching customer.
- **FULL OUTER JOIN result:** MySQL does not directly support `FULL OUTER JOIN`; the assignment result is simulated using `LEFT JOIN`, `RIGHT JOIN`, and `UNION`.

### 🧩 Subqueries

Subqueries compare each order amount or employee salary against the relevant average calculated by `AVG()`.

### 📅 Date Functions

- `YEAR()` and `MONTH()` extract date parts.
- `CURDATE()` returns the current date.
- `DATEDIFF()` calculates the difference in days.
- `DATE_FORMAT()` displays a date in the requested format.

### 🔤 String Functions

- `CONCAT()` combines first and last names.
- `REPLACE()` returns text with a matching string replaced.
- `UPPER()` converts text to uppercase.
- `LOWER()` converts text to lowercase.
- `TRIM()` removes leading and trailing spaces.

### 📈 Window Functions

- `SUM() OVER (ORDER BY ...)` calculates a running total.
- `RANK() OVER (ORDER BY ...)` ranks rows according to order amount.

### 🧮 CASE Expressions

`CASE` assigns a discount percentage to each order and a salary category to each employee based on the assignment's conditions.

---

## 📋 Assignment Query Coverage

The project covers the 17 assigned tasks in the original assignment order.

| # | Assigned Question / Task | SQL Concept |
|---:|---|---|
| 01 | Retrieve all orders and customer details where orders exist | `INNER JOIN` |
| 02 | Retrieve all customers and their corresponding orders, if any | `LEFT JOIN` |
| 03 | Retrieve all orders and their corresponding customers, if any | `RIGHT JOIN` |
| 04 | Retrieve all customers and all orders, regardless of matching | `FULL OUTER JOIN` simulation using `UNION` |
| 05 | Find customers who have placed orders worth more than the average amount | Subquery + `AVG()` |
| 06 | Find employees with salaries above the average salary | Subquery + `AVG()` |
| 07 | Extract year and month from `OrderDate` | `YEAR()`, `MONTH()` |
| 08 | Calculate days between `OrderDate` and the current date | `CURDATE()`, `DATEDIFF()` |
| 09 | Format `OrderDate` as `DD-MM-YYYY` | `DATE_FORMAT()` |
| 10 | Concatenate `FirstName` and `LastName` to create a full name | `CONCAT()` |
| 11 | Replace `abhi` with `vipul` in the `FirstName` column | `REPLACE()` |
| 12 | Convert `FirstName` to uppercase and `LastName` to lowercase | `UPPER()`, `LOWER()` |
| 13 | Remove leading and trailing spaces from `FirstName` | `TRIM()` |
| 14 | Calculate the running total of `TotalAmount` for each order | `SUM() OVER()` |
| 15 | Rank orders based on `TotalAmount` using `RANK()` | `RANK() OVER()` |
| 16 | Assign a discount: 10% above 3000, 5% from 1000 to 3000, and 0% otherwise | `CASE` |
| 17 | Classify salaries as High, Medium, or Low using the given salary ranges | `CASE` |

> 📌 **Assignment scope:** The SQL topics above follow the assigned tasks. No unrelated SQL modules are required for this project.

---

## 📊 Sample Data & Expected Results

The following highlights are based on the five sample orders and five sample employees inserted into the project tables.

### 🧾 Order Amount Analysis

| Order ID | Customer ID | Total Amount |
|---:|---:|---:|
| 101 | 1 | 1,500.50 |
| 102 | 2 | 2,500.75 |
| 103 | 3 | 800.00 |
| 104 | 4 | 3,200.00 |
| 105 | 5 | 1,200.25 |

### 🔎 Subquery Results

| Query | Expected Result |
|---|---|
| Orders above average amount | Customers associated with orders 102 and 104 |
| Employees above average salary | Krisha Patel and Abhi Shah |

### 📈 Running Total

| Order ID | Total Amount | Running Total |
|---:|---:|---:|
| 101 | 1,500.50 | 1,500.50 |
| 102 | 2,500.75 | 4,001.25 |
| 103 | 800.00 | 4,801.25 |
| 104 | 3,200.00 | 8,001.25 |
| 105 | 1,200.25 | 9,201.50 |

### 🏷️ Discount Categories

| Order Amount Condition | Discount |
|---|---:|
| Greater than 3,000 | 10% |
| Between 1,000 and 3,000, inclusive | 5% |
| All other amounts | 0% |

### 🧑‍💼 Salary Categories

| Salary Condition | Category |
|---|---|
| Greater than 60,000 | High |
| 40,000 to 60,000, inclusive | Medium |
| Less than 40,000 | Low |

> ℹ️ The date-difference query uses `CURDATE()`, so its result changes according to the date when the query is run. The string replacement query displays the transformed value using `SELECT`; it does not permanently update the stored customer record.

---

## 🛠️ Technologies Used

| Technology / Concept | Purpose |
|---|---|
| 🐬 **MySQL** | Relational database management |
| 💻 **SQL** | Querying and transforming data |
| 🔑 **Primary & Foreign Keys** | Data integrity and table relationships |
| 🧩 **Subqueries** | Comparisons against average values |
| 📅 **Date & String Functions** | Formatting and transforming values |
| 📈 **Window Functions** | Running totals and ranking |
| 🧮 **CASE Expressions** | Conditional classifications |

---

## 🚀 How to Run

### 1. 🐬 Open MySQL

Use a compatible MySQL environment, such as:

- MySQL Command Line Client
- MySQL Workbench

### 2. 📄 Open the SQL Script

Open `DataTransformer.sql` in your SQL editor, or paste the script into the MySQL command-line client.

### 3. 🗄️ Create and Select the Database

The setup section creates and selects the project database:

```sql
CREATE DATABASE DataTransformer;
USE DataTransformer;
```

### 4. ▶️ Execute the Setup Statements

Run the database, table-creation, and sample-data statements in order before running the 17 assignment queries.

### 5. 🔍 Verify the Active Database

```sql
SELECT DATABASE();
```

Expected database:

```text
DataTransformer
```

### 6. ✅ Run the Assignment Queries

Execute each query in the same order as the assignment and review the returned result set.

> ⚠️ **Compatibility note:** The running-total and ranking queries use window functions, so run them on a MySQL version that supports window functions (MySQL 8.0 or later).

---

## 📁 Repository Structure

```text
📦 Data-Transformer-SQL
│
├── 📄 README.md
└── 🗄️ DataTransformer.sql
```

- `README.md` — project introduction, schema, query coverage, sample results, and run instructions.
- `DataTransformer.sql` — database setup, table definitions, sample records, and the 17 assignment queries.

---

## 🧠 Learning Outcomes

By completing **Data Transformer — SQL**, the following skills are practiced:

- ✅ Combining related records using JOIN operations
- ✅ Understanding the difference between inner and outer joins
- ✅ Simulating a full outer join result in MySQL
- ✅ Writing subqueries with aggregate functions
- ✅ Extracting and formatting date values
- ✅ Calculating date differences
- ✅ Transforming text with string functions
- ✅ Calculating running totals with window functions
- ✅ Ranking rows based on numeric values
- ✅ Applying conditional logic with `CASE`
- ✅ Reading and interpreting SQL result sets

---

## ✨ Key Highlights

```text
┌──────────────────────────────────────────────────────┐
│              DATA TRANSFORMER — SQL                 │
├──────────────────────────────────────────────────────┤
│ 🔗  JOIN operations across related tables           │
│ 🧩  Subqueries using average values                 │
│ 📅  Date extraction, difference & formatting       │
│ 🔤  String concatenation and transformation         │
│ 📈  Running total and ranking window functions      │
│ 🧮  CASE-based discounts and salary categories      │
│ 📋  17 assigned SQL tasks                           │
│ 🧱  GitHub-ready documentation structure            │
└──────────────────────────────────────────────────────┘
```

---

## 🎓 Academic Information

| Detail | Information |
|---|---|
| 👨‍💻 Student | **Chand Khimani** |
| 🎓 Program | **BCA — Final Year** |
| 📊 Course | **Data Analysis** |
| 👨‍🏫 Guide | **Prof. Girish Gondaliya** |
| 🗂️ Project | **Data Transformer — SQL** |
| 🐬 Database | **MySQL** |
| 📋 Assignment Tasks | **17** |

---

## 🌱 What This Project Represents

> **Data Transformer — SQL is practical work with relational data, query logic, and data transformation.**

The project demonstrates a simple analytical workflow:

**Connect → Retrieve → Compare → Transform → Calculate → Classify**

These skills form a useful foundation for:

- 📊 Data Analysis
- 🗄️ Database Management
- 💻 Backend Development
- 📈 Reporting and Business Intelligence

---

## 🙏 Acknowledgement

I sincerely thank **Prof. Girish Gondaliya** for the guidance and support provided throughout this practical assignment.

This project helped strengthen my practical understanding of:

**SQL • MySQL • Relational Data • Querying • Data Transformation • Basic Analysis**

---

## 💬 Project Philosophy

> **Every query answers a question.**  
> **Every result helps explain the data.**  
> **Every project builds practical skills.**

<p align="center">
  <strong>💻 Built with SQL & Curiosity</strong><br>
  <strong>📊 Driven by Data</strong><br>
  <strong>🚀 Created by Chand Khimani</strong>
</p>

<p align="center">
  ⭐ <strong>Thank you for visiting Data Transformer — SQL!</strong> ⭐
</p>

<p align="center">
  🌱 <em>Learn • Practice • Query • Analyze • Grow</em> 🌱
</p>
