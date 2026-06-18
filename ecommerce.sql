CREATE DATABASE ecommerce;
USE ecommerce;
CREATE TABLE customers(
customer_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
phone VARCHAR(15),
city VARCHAR(50));
CREATE TABLE categories(
category_id INT PRIMARY KEY AUTO_INCREMENT,
category_name VARCHAR(50) NOT NULL);
CREATE TABLE products(
product_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
price DECIMAL(10,2) NOT NULL,
stock INT DEFAULT 0,
category_id INT,
FOREIGN KEY (category_id) REFERENCES categories(category_id));
CREATE TABLE orders(
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
order_date DATE,
status VARCHAR(50) DEFAULT 'pending',
FOREIGN KEY (customer_id) REFERENCES customers(customer_id));
CREATE TABLE order_items(
item_id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT,
product_id INT,
quantity INT NOT NULL,
price DECIMAL(10,2) NOT NULL,
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id));
CREATE TABLE payments(
payment_id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT,
amount DECIMAL(10, 2) NOT NULL,
payment_date DATE,
method VARCHAR(20),
FOREIGN KEY (order_id) REFERENCES orders(order_id));

INSERT INTO customers(name,email,phone,city) VALUES
('Aryan','aryansalkar@gmail.com','4587612325','virar'),
('Gaurav','gauravgurkhe@gmail.com','9854623175','Nallasopara'),
('Dipesh','dipeshbarge@gmail.com','9245785412','Vasai'),
('Anvay','anvayparab@gmail.com','9875463215','Borivali'),
('Kunal','kunalghorui@gmail.com','9654872145','Andheri');

INSERT INTO categories(category_name) VALUES ('Electronics'),('Clothing'),('Food');

INSERT INTO products (name,price,stock,category_id) VALUES
('Shirt',450,10,2),
('T-Shirt',250,12,2),
('tracks',350,8,2),
('Laptop',45000,15,1),
('Keyboard',1600,20,1),
('Mouse',1200,18,1),
('Pizza',150,15,3),
('Burger',80,12,3);

INSERT INTO orders(customer_id,order_date,status) VALUES
(1,'2026-06-17','pending'),
(2,'2026-06-16','Delivered'),
(3,'2026-06-17','pending'),
(4,'2026-06-15','completed'),
(5,'2026-06-16','shipped'),
(2,'2026-06-17','pending');

INSERT INTO order_items(order_id,product_id,quantity,price) VALUES 
(1,1,2,900),
(2,3,3,1050),
(3,7,2,300),
(4,4,1,45000),
(5,2,4,1000),
(6,6,1,1200);

INSERT INTO payments(order_id,amount,payment_date,method) VALUES
(1,900,'2026-06-17','Online'),
(2,1050,'2026-06-18','Cash'),
(3,300,'2026-06-17','Online'),
(4,45000,'2026-06-17','Cash'),
(5,1000,'2026-06-16','Online'),
(6,1200,'2026-06-17','Online');

SELECT order_id, order_date, status, customers.name
FROM orders
LEFT JOIN
customers
ON orders.customer_id = customers.customer_id;

SELECT SUM(amount) AS Total_revenue FROM payments;

SELECT SUM(order_items.quantity) AS total_sold, products.name FROM
order_items
INNER JOIN products
ON order_items.product_id = products.product_id
GROUP BY products.name ORDER BY total_sold DESC LIMIT 3;

SELECT customers.name AS Never_placed_order
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.order_id IS NULL;

SELECT customers.name AS customers, orders.status
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.status = 'pending';

SELECT categories.category_name,COUNT(products.name) AS total_products
FROM categories
LEFT JOIN products
ON categories.category_id = products.category_id
GROUP BY categories.category_name;

SELECT p.name AS expensive_product,
c.category_name,
price
FROM products p
JOIN categories c
ON p.category_id = c.category_id
WHERE p.price = (SELECT MAX(p2.price) FROM products p2 WHERE p2.category_id = p.category_id);

SELECT MONTH(payment_date) AS month,
SUM(amount) AS revenue
FROM payments
GROUP BY MONTH(payment_date)
ORDER BY month;