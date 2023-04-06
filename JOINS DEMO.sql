/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

SELECT * FROM categories; --
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM products; --
SELECT * FROM reviews;
SELECT * FROM sales;

 SELECT p.name AS 'Product Name', c.name AS 'Category Name'
 FROM products AS p 
 LEFT JOIN categories AS c
 ON p.CategoryID = c.CategoryID
 -- WHERE c.CategoryID = 1;
 WHERE c.Name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

 SELECT * FROM categories;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM products; --
SELECT * FROM reviews; --
SELECT * FROM sales;

SELECT p.Name, p.Price, r.Rating
FROM products AS p
JOIN reviews AS r
ON p.ProductID = r.ProductID
Where r.Rating = 5;


 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */


SELECT * FROM categories;
SELECT * FROM departments;
SELECT * FROM employees; --
SELECT * FROM products;
SELECT * FROM reviews;
SELECT * FROM sales; --

SELECT SUM(s.Quantity) AS Total, e.FirstName AS 'FN', e.LastName AS 'LN'
FROM employees AS e
JOIN sales AS s
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total DESC
LIMIT 10;




/* joins: find the name of the department, and the name of the category for Appliances and Games */

SELECT * FROM categories; --
SELECT * FROM departments; --
SELECT * FROM employees; 
SELECT * FROM products;
SELECT * FROM reviews;
SELECT * FROM sales; 

SELECT d.Name, c.Name
FROM categories AS c 
JOIN departments AS d 
ON c.DepartmentID = d.DepartmentID
-- WHERE c.CategoryID = 2 OR c.CategoryID = 8;
WHERE c.Name = 'Appliances' OR c.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
SELECT * FROM categories;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM products; --
SELECT * FROM reviews;
SELECT * FROM sales; --

SELECT p.Name, SUM(s.Quantity), p.Price * SUM(s.Quantity) AS 'Total Price Sold'
FROM products AS p 
Join sales AS s
ON p

.ProductID = s.ProductID
WHERE p.ProductID = 97;








/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */



SELECT * FROM categories;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM products;
SELECT * FROM reviews;
SELECT * FROM sales;


SELECT p.Name, r.Reviewer, r.Rating, r.Comment
From products AS p
JOIN reviews AS r
ON p.ProductID = r.ProductID
WHERE r.Rating = 1 AND p.Name LIKE '%Visio%';





-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT * FROM categories;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM products;
SELECT * FROM reviews;
SELECT * FROM sales;

SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, SUM(s.Quantity) AS 'Total Sales'
FROM sales AS s
JOIN employees AS e
ON e.EmployeeID = s.EmployeeID
JOIN products AS p
ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID;




