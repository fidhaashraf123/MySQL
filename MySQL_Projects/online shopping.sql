#online shopping database
create database onlineshopping;
use onlineshopping;
#CREATE TABLE:-
# PRODUCTS TABLE
create table Products(product_id int auto_increment primary key,Name varchar(255) not null,
price int,stock int,category varchar(255) not null);

# customers table
create table Customers(customer_id int auto_increment primary key,Name varchar(255) not null,
email varchar(255),phone_number varchar(255));

#orders table
create table orders(order_id int auto_increment primary key,customer_id int,order_date date default (current_date),total_amount int, 
foreign key(customer_id)references customers(customer_id));

#orderdetails table
create table orderdetails(orderdetails_id int auto_increment primary key,
order_id int,product_id int,quantity int,
foreign key (order_id)references orders(order_id),
foreign key(product_id)references products(product_id));

#2- insert sample data
#products
use onlineshopping;
INSERT INTO Products(product_id,Name,price,stock,category)values
(1,'phone',40000,4,'electronics'),
(2,'kurthi',1000,3,'clothes'),
(3,'watch',10000,2,'accessories'),
(4,'clock',15000,1,'electronics'),
(5,'laptop',50000,2,'electronics'),
(6,'jeans',1500,3,'clothes');


INSERT INTO Customers(customer_id,Name,email,phone_number)values
(1,'fidha','fidhaashraf31@gmail.com','9497472815'),
(2,'fathima','abc12@gmail.com','7865964378'),
(3,'nandhana','efg345@gmail.com','9567345278'),
(4,'sana','wer56@gmail.com','7658930245'),
(5,'adil','asd12@gmail.com','9806754630'),
(6,'sam','sam123@gmail.com','7890567843');

INSERT INTO Orders (Order_id, Customer_id, Order_date, total_amount) VALUES
(1, 1, '2026-01-20', 56500.00),
(2, 2, '2026-01-21', 2500.00),
(3,3,'2026-01-22',15000.00),
(4,4,'2026-01-19',15000.00),
(5,5,'2026-02-01',52000.00),
(6,6,'2026-01-25',3000.00);

insert into orderdetails(orderdetails_id,order_id,product_id,quantity)values
(1,1,1,1),
(2,2,2,3),
(3,3,3,2),
(4,4,4,1),
(5,5,5,1),
(6,6,6,2);

#to find top 5 selling product
SELECT p.product_id,p.Name,
SUM(od.Quantity) AS Quantity
FROM Products p
JOIN orderdetails od ON p.product_id = od.product_id
GROUP BY p.product_id, p.Name
ORDER BY Quantity DESC
LIMIT 5;

#to Get all orders made in the last 30 days
select* from orders
where order_date>'2026-01-01'-interval 30 day;

#Calculate total sales revenue
select sum(total_amount)
from orders;






