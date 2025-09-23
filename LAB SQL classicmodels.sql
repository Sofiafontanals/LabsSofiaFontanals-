use classicmodels;

-- 1

SELECT officeCode, phone
FROM offices;

SELECT employeeNumber, firstName, lastName, email
FROM employees
WHERE email LIKE '%.es';

SELECT customerNumber, customerName, city, country
FROM customers
WHERE state IS NULL OR state = '';

SELECT customerNumber, checkNumber, paymentDate, amount
FROM payments 
WHERE amount > 20000;


SELECT customerNumber, checkNumber, paymentDate, amount
FROM payments 
WHERE amount > 20000 
AND YEAR(paymentDate) = 2005;


SELECT DISTINCT productCode
FROM orderdetails;


SELECT country, COUNT(*) AS totalpurchases
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
GROUP BY country
ORDER BY totalpurchases DESC;

-- 2

SELECT productLine, LENGTH(textDescription) AS lengthmaslargos
FROM productlines
ORDER BY lengthmaslargos DESC
LIMIT 1;

SELECT e.officeCode, COUNT(c.customerNumber) AS customerstotal
FROM employees e
LEFT JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY e.officeCode;


SELECT DAYNAME(o.orderDate) AS weekday, COUNT(*) AS salestotal
FROM orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode
WHERE p.productLine = 'Classic Cars'
GROUP BY weekday
ORDER BY salestotal DESC
LIMIT 1;


SELECT officeCode, city, 
CASE 
WHEN territory IS NULL OR territory = 'NA' THEN 'USA'
ELSE territory
END AS corrected_territory
FROM offices;


-- 3


 
SELECT anio, mes, AVG(totalCarrito) AS promedioCarrito, SUM(totalArticulos) AS totalArticulos
FROM (SELECT YEAR(o.orderDate) AS anio, MONTH(o.orderDate) AS mes, (od.quantityOrdered * od.priceEach) AS totalCarrito,
od.quantityOrdered AS totalArticulos
FROM employees e
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
WHERE e.lastName = 'Patterson'
AND YEAR(o.orderDate) IN (2004, 2005)

) AS sub
GROUP  BY anio, mes
ORDER BY anio, mes;

 
SELECT DISTINCT o.officeCode, o.city, o.country
FROM offices o
JOIN employees e ON o.officeCode = e.officeCode
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE c.state IS NULL OR c.state = '';

 


