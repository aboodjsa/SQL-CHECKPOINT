/*
   SQL DQL QUERIES PROJECT
   Student: Abood Jamal
   Relational Model:
   Customer (Customer_id, Customer_Name, Customer_Tel)
   Product  (Product_id, Product_name, Category, Price)
   Orders   (Customer_id, Product_id, OrderDate, quantity, total_amount)
    */



-- 1. Display all the data of customers

SELECT * 
FROM Customer;


-- 2. Display product_name and category for productswith price between 5000 and 10000

SELECT Product_name, Category
FROM Product
WHERE Price BETWEEN 5000 AND 10000;


-- 3. Display all products sorted by price in descending order

SELECT * 
FROM Product
ORDER BY Price DESC;



-- 4. Display total number of orders, average amount,
--    highest total amount, and lowest total amount

SELECT 
    COUNT(*) AS total_orders,
    AVG(total_amount) AS average_amount,
    MAX(total_amount) AS highest_amount,
    MIN(total_amount) AS lowest_amount
FROM Orders;



-- 5. For each product_id, display the number of orders

SELECT Product_id, COUNT(*) AS number_of_orders
FROM Orders
GROUP BY Product_id;



-- 6. Display customer_id who has more than 2 orders

SELECT Customer_id
FROM Orders
GROUP BY Customer_id
HAVING COUNT(*) > 2;



-- 7. For each month of the year 2020, display number of orders
-- (SQLite / Programmiz version)

SELECT YEAR(OrderDate), MONTH(OrderDate), COUNT(*)
FROM Orders
WHERE YEAR(OrderDate) = 2020
GROUP BY YEAR(OrderDate), MONTH(OrderDate);

-- 8. For each order, display product name, customer name, and order date

SELECT 
    Product.Product_name,
    Customer.Customer_Name,
    Orders.OrderDate
FROM Orders
JOIN Product  ON Orders.Product_id = Product.Product_id
JOIN Customer ON Orders.Customer_id = Customer.Customer_id;



-- 9. Display all orders made three months ago
-- (SQLite / Programmiz version)

SELECT *
FROM Orders
WHERE OrderDate >= date('now','-3 months')
  AND OrderDate <  date('now','-2 months');



-- 10. Display customers who have never ordered a product

SELECT Customer_id
FROM Customer
WHERE Customer_id NOT IN (
    SELECT Customer_id FROM Orders
);