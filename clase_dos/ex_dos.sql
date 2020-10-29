/* Ejercicios sesión dos*/
SHOW DATABASES;
USE classicmodels;
SHOW TABLES;
# Dentro de la tabla employees, obten el número de empleado, apellido 
# y nombre de todos los empleados cuyo nombre empiece con a.
DESCRIBE employees;
SELECT * FROM employees;
	/*Se considera el first name como el nombre*/
SELECT employeeNumber, lastName, firstName FROM employees
	WHERE firstName LIKE 'a%';
# Dentro de la tabla employees, obten el número de empleado, apellido y 
# nombre de todos los empleados cuyo nombre termina con on.
SELECT employeeNumber, lastName, firstName FROM employees
	WHERE firstName LIKE '%on';
# Dentro de la tabla employees, obten el número de empleado, apellido y 
# nombre de todos los empleados cuyo nombre incluye la cadena on.
SELECT employeeNumber, lastName, firstName FROM employees
	WHERE firstName LIKE '%on%';
# Dentro de la tabla employees, obten el número de empleado, apellido y 
# nombre de todos los empleados cuyos nombres tienen tres letras e inician 
# con T y finalizan con m.
SELECT employeeNumber, lastName, firstName FROM employees
	WHERE firstName LIKE 'T_m';    
# Dentro de la tabla employees, obten el número de empleado, apellido y 
# nombre de todos los empleados cuyo nombre no inicia con B.
SELECT employeeNumber, lastName, firstName FROM employees
	WHERE firstName NOT LIKE 'B%';   
# Dentro de la tabla products, obten el código de producto y nombre de 
# los productos cuyo código incluye la cadena _20.
DESCRIBE products;
SELECT * FROM products;
SELECT productCode,productName FROM products  WHERE productCode 
	LIKE '%_20%';
# Dentro de la tabla orderdetails, obten el total de cada orden.
DESCRIBE orderdetails;
SELECT * FROM orderdetails;
SELECT orderNumber, sum(quantityOrdered*priceEach) Total 
	FROM orderdetails GROUP BY orderNumber;
# Dentro de la tabla orders obten el número de órdenes por año.
DESCRIBE orders;
SELECT * FROM orders;
SELECT year(orderDate) Año, count(*) Orders FROM orders
	GROUP BY year(orderDate);
# Obten el apellido y nombre de los empleados cuya oficina está 
# ubicada en USA
DESCRIBE employees;
DESCRIBE offices;
SELECT lastName, firstName FROM employees WHERE officeCode IN (SELECT 
	officeCode FROM offices WHERE country='USA') ORDER BY 
		lastName, firstName;
# Obten el número de cliente, número de cheque y cantidad del cliente que
# ha realizado el pago más alto.
DESCRIBE payments;
SELECT * FROM payments;
SELECT customerNumber,checkNumber, amount FROM payments WHERE 
	amount=(SELECT max(amount) FROM payments);
# Obten el número de cliente, número de cheque y cantidad de aquellos clientes
# cuyo pago es más alto que el promedio.
SELECT customerNumber,checkNumber, amount FROM payments WHERE 
	amount>(SELECT (sum(amount)/count(*)) FROM payments) ORDER BY amount DESC;
# Obten el nombre de aquellos clientes que no han hecho ninguna orden.
DESCRIBE customers;
DESCRIBE orders;
SELECT customerNumber,customerName FROM customers WHERE customerNumber NOT IN 
	(SELECT customerNumber FROM orders);
# Obten el máximo, mínimo y promedio del número de productos en las órdenes de 
# venta.
DESCRIBE orderdetails;
SELECT orderNumber,max(quantityOrdered) Máximo,min(quantityOrdered) Mínimo,
	avg(quantityOrdered) Promedio FROM orderdetails GROUP BY orderNumber;
# Dentro de la tabla orders, obten el número de órdenes que hay por cada estado.
DESCRIBE orders;
DESCRIBE customers;
SELECT * FROM orders;
SELECT state, count(*) Orders FROM customers WHERE customerNumber IN 
	(SELECT customerNumber FROM orders) GROUP BY state ORDER BY Orders DESC;