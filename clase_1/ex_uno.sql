/* Ejercicios sesión uno*/

SHOW DATABASES;
USE classicmodels; # 1 conexión a classicmodels
SHOW TABLES;  # Muestra todas las tables en la BD
DESCRIBE employees;
SELECT * FROM employees; /*Visualizar la tabla*/
SELECT lastName FROM employees; # 2 apellidos
SELECT lastName, firstName, jobTitle FROM employees; # 3 
SELECT * FROM employees; # 4 todos los campos de la tabla
SELECT lastName, firstName, jobTitle FROM employees 
	WHERE jobTitle='Sales Rep'; # 5 filtro por puesto
SELECT lastName, firstName, jobTitle, officeCode FROM employees 
	WHERE jobTitle='Sales Rep' and officeCode=1; # 6
/*El inciso 7 es igual al anterior*/
SELECT lastName, firstName, officeCode FROM employees 
	WHERE officeCode IN (1,2,3); # 8
SELECT lastName, firstName, jobTitle FROM employees 
	WHERE jobTitle!='Sales Rep'; # 9 != diferente a
SELECT lastName, firstName, officeCode FROM employees 
	WHERE officeCode>5; # 10
SELECT lastName, firstName, officeCode FROM employees 
	WHERE officeCode<=4; # 11
DESCRIBE customers;
SELECT * FROM customers; /*Visualizar la tabla*/
SELECT customerName, country, state FROM customers
	WHERE country='USA' AND state='CA'; # 12
SELECT customerName, country, state, creditLimit FROM customers
	WHERE country='USA' AND state='CA' AND creditLimit>100000; # 13
SELECT customerName, country FROM customers WHERE country='USA'
	OR country='France'; # 14
SELECT customerName, country, creditLimit FROM customers WHERE (country='USA'
	OR country='France') and creditLimit>100000; # 15
DESCRIBE offices;
SELECT * FROM offices; /*Visualizar la tabla*/
SELECT officeCode, city, phone, country FROM offices 
	WHERE country='USA' OR country='France'; # 16
SELECT officeCode, city, phone, country FROM offices 
	WHERE country!='USA' AND country!='France'; # 17
DESCRIBE orders;
SELECT * FROM orders; /*Visualizar la tabla*/
SELECT orderNumber, customerNumber, status, shippedDate FROM orders
	WHERE orderNumber IN (10165,10287,10310); # 18
SELECT contactLastName, contactFirstName FROM customers 
	ORDER BY contactLastName; # 19
SELECT contactLastName, contactFirstName FROM customers 
	ORDER BY contactLastName DESC; #20
SELECT contactLastName, contactFirstName FROM customers 
	ORDER BY contactLastName DESC, contactFirstName; # 21
SELECT customerNumber, customerName, creditLimit FROM customers
	ORDER BY creditLimit DESC LIMIT 5; # 22
SELECT customerNumber, customerName, creditLimit FROM customers
	ORDER BY creditLimit LIMIT 5; # 23


