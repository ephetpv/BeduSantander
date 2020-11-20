SHOW DATABASES;
USE tienda;
SHOW TABLES;

/* Reto 1
Usando la base de datos tienda, escribe consultas que permitan responder
 las siguientes preguntas. */
DESCRIBE empleado;
SELECT * FROM empleado;
SELECT * FROM puesto;
# ¿Cuál es el nombre de los empleados cuyo sueldo es mayor a $100,000?
SELECT nombre, concat(apellido_paterno,apellido_materno) apellidos
FROM empleado WHERE id_puesto IN (SELECT id_puesto FROM puesto WHERE salario >28000);
# Como ningún empleado gana más de $100,000 se regresa null, por lo que decidí cambiar
# ese salario por $28,000 
# ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
SELECT id_empleado, min(n_ventas) minimo, max(n_ventas) maximo 
FROM (SELECT id_empleado,clave,count(*) n_ventas FROM venta GROUP BY clave, id_empleado) AS sub 
GROUP BY id_empleado ORDER BY maximo DESC, minimo DESC;
# ¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?
DESCRIBE venta;
DESCRIBE articulo;
SELECT clave FROM venta WHERE id_articulo IN (SELECT id_articulo FROM articulo WHERE precio>= 5000)
GROUP BY clave;

# Ejercicio usando JOIN 
SHOW KEYS FROM empleado;
SELECT * FROM empleado AS e JOIN puesto AS p ON e.id_puesto=p.id_puesto;

# Ejercicio usando LEFT JOIN
SHOW KEYS FROM puesto;
SELECT * FROM puesto p LEFT JOIN empleado e ON p.id_puesto=e.id_puesto; 

# Ejercicio usando RIGHT JOIN
SELECT * FROM empleado e RIGHT JOIN puesto p ON e.id_puesto=p.id_puesto;

/* Reto 2
Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.*/
# ¿Cuál es el nombre de los empleados que realizaron cada venta?
SHOW KEYS FROM empleado;
SELECT * FROM venta;
SELECT clave, nombre, concat(apellido_paterno,' ',apellido_materno) apellidos FROM venta v 
JOIN empleado e ON v.id_empleado=e.id_empleado; 
# ¿Cuál es el nombre de los artículos que se han vendido?
SHOW KEYS FROM venta;
SELECT * FROM venta;
SELECT * FROM articulo;
SELECT nombre, id_articulo FROM articulo a JOIN venta v ON a.id_articulo=v.id_articulo; 
# ¿Cuál es el total de cada venta?
SELECT clave, round(sum(precio),2) total FROM venta v JOIN articulo a ON v.id_articulo=a.id_articulo 
GROUP BY clave ORDER BY total DESC;

# Crear una vista
CREATE VIEW tickets074 AS
(SELECT v.clave, v.fecha, a.nombre producto, a.precio, concat(e.nombre, ' ', e.apellido_paterno) empleado 
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
JOIN articulo a
  ON v.id_articulo = a.id_articulo);
SELECT * FROM tickets074;

/* Reto 3
Usando la base de datos tienda, define las siguientes vistas que permitan obtener la siguiente información.*/
SHOW KEYS FROM empleado;
# Obtener el puesto de un empleado.
CREATE VIEW puesto_e074 AS 
(SELECT e.id_puesto,p.nombre nombre_puesto,e.nombre, concat(e.apellido_paterno,' ',e.apellido_materno) apellidos
FROM empleado e 
JOIN puesto p 
	ON e.id_puesto=p.id_puesto);
SELECT * FROM puesto_e074;
# Saber qué artículos ha vendido cada empleado.
SHOW KEYS FROM venta;
CREATE VIEW articulos_e074 AS
(SELECT a.nombre articulo, v.id_articulo, v.id_empleado, e.nombre, concat(e.apellido_paterno,' ',e.apellido_materno) apellidos
FROM venta v 
JOIN empleado e 
	ON v.id_empleado=e.id_empleado 
JOIN articulo a 
	ON v.id_articulo=a.id_articulo);
SELECT * FROM articulos_e074;
# Saber qué puesto ha tenido más ventas.
SHOW KEYS FROM venta;
SHOW KEYS FROM empleado;
SELECT * FROM venta;
CREATE VIEW puesto_v074 AS
(SELECT p.nombre,count(*) ventas 
FROM venta v 
JOIN empleado e 
	ON v.id_empleado=e.id_empleado 
JOIN puesto p 
	ON e.id_puesto=p.id_puesto 
GROUP BY p.nombre
ORDER BY ventas DESC);
SELECT * FROM puesto_v074 LIMIT 1;
