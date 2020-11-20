
# Para estas consultas usa RIGHT JOIN

# Obten el código de producto, nombre de producto y descripción de todos los productos.
USE classicmodels;
SHOW KEYS FROM products;
SELECT * FROM products;
SELECT productCode, productName, productDescription FROM products;
# Obten el número de orden, estado y costo total de cada orden.
SHOW KEYS FROM orderdetails;
SELECT * FROM orders;
SELECT * FROM orderdetails;
SELECT od.orderNumber,o.status, sum(od.quantityOrdered*od.priceEach) total 
FROM orderdetails od RIGHT JOIN orders o ON o.orderNumber=od.orderNumber
GROUP BY o.orderNumber ORDER BY total DESC;
# Obten el número de orden, fecha de orden, línea de orden, nombre del producto, cantidad ordenada y precio de 
# cada pieza que muestre los detalles de cada orden.
SHOW KEYS FROM products;
SELECT o.orderNumber,o.orderDate, od.orderLineNumber,od.quantityOrdered,p.productName,od.priceEach
FROM orders o RIGHT JOIN orderdetails od ON o.orderNumber=od.orderNumber
RIGHT JOIN products p ON p.productCode=od.productCode
WHERE o.comments IS NOT NULL;
# Obtén el número de orden, nombre del producto, el precio sugerido de fábrica (msrp) y precio de cada pieza.
SELECT o.orderNumber, p.productName, p.MSRP, od.priceEach
FROM orders o RIGHT JOIN orderdetails od ON o.orderNumber=od.orderNumber
RIGHT JOIN products p ON od.productCode=p.productCode; 

# Para estas consultas usa LEFT JOIN

# Obtén el número de cliente, nombre de cliente, número de orden y estado de cada cliente.
SHOW KEYS FROM orders;
SELECT o.orderNumber, c.customerName, o.orderNumber, c.state
FROM orders o LEFT JOIN customers c ON o.customerNumber=c.customerNumber;
# Obtén los clientes que no tienen una orden asociada.
SELECT *
FROM customers c LEFT JOIN orders o ON o.customerNumber=c.customerNumber;
# Obtén el apellido de empleado, nombre de empleado, nombre de cliente, número de cheque y total, es decir, los clientes 
# asociados a cada empleado.
SHOW KEYS FROM customers;
SHOW KEYS FROM payments;
SELECT e.lastName, e.firstName, c.customerName, p.checkNumber, p.amount
FROM customers c LEFT JOIN employees e ON c.salesRepEmployeeNumber=e.employeeNumber
RIGHT JOIN payments p ON p.customerNumber=c.customerNumber;

# Para estas consultas usa RIGHT JOIN

# Repite los ejercicios 5 a 7 usando RIGHT JOIN.
# Obtén el número de cliente, nombre de cliente, número de orden y estado de cada cliente.
SHOW KEYS FROM orders;
SELECT o.orderNumber, c.customerName, o.orderNumber, c.state
FROM orders o RIGHT JOIN customers c ON o.customerNumber=c.customerNumber;
# Obtén los clientes que no tienen una orden asociada.
SELECT *
FROM customers c RIGHT JOIN orders o ON o.customerNumber=c.customerNumber;
# Obtén el apellido de empleado, nombre de empleado, nombre de cliente, número de cheque y total, es decir, los clientes 
# asociados a cada empleado.
SHOW KEYS FROM customers;
SHOW KEYS FROM payments;
SELECT e.lastName, e.firstName, c.customerName, p.checkNumber, p.amount
FROM customers c RIGHT JOIN employees e ON c.salesRepEmployeeNumber=e.employeeNumber
RIGHT JOIN payments p ON p.customerNumber=c.customerNumber;
# Escoge 3 consultas de los ejercicios anteriores, crea una vista y escribe una consulta para cada una.

