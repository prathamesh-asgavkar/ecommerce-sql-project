# E-Commerce Order System - MySQL Project

A relational database project built using MySQL that simulates a basic e-commerce platform. This project was created to practice real-world database design and SQL querying.

---

## About the Project

This project models the backend database of an e-commerce application. It includes customers, products, orders, and payments linked together using proper foreign key relationships.

---

## Tables

- customers - stores customer personal details
- categories - stores product categories
- products - stores product name, price and stock
- orders - stores order details with status
- order_items - stores which products are in each order
- payments - stores payment details for each order

---

## Relationships

- One customer can place many orders
- One order can have many items
- One product can appear in many orders
- One category can have many products
- One order has one payment

---

## Queries Covered

1. List all orders with customer name and order status
2. Find total revenue generated
3. Find top 3 best selling products
4. Find customers who never placed an order
5. Find all pending orders
6. Show each category with total number of products
7. Find most expensive product in each category
8. Show monthly revenue using payment date

---

## Concepts Used

- DDL and DML commands
- Primary Key, Foreign Key, Constraints
- Inner Join, Left Join, Right Join
- Subqueries and Correlated Subqueries
- Aggregate Functions
- Group By and Having
- Views, Indexes, Stored Procedures
- Transactions with Commit and Rollback

---

## Tools Used

- MySQL 8.0
- MySQL Workbench

---

## How to Run

1. Open MySQL Workbench
2. Open the ecommerce.sql file
3. Run the full script to create database, tables and insert data
4. Run queries one by one to see results

---

## Author

Prathamesh
BSc IT Graduate | Aspiring Full Stack Java Developer
GitHub: https://github.com/prathamesh-asgavkar
LinkedIn: https://www.linkedin.com/in/prathamesh-asagavkar-469a08408?utm_source=share_via&utm_content=profile&utm_medium=member_android
