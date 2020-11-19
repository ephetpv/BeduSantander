SHOW DATABASES;
USE tienda;
SHOW TABLES;
/* Work sesión 2*/
SELECT * FROM empleado;
SELECT * FROM empleado WHERE nombre LIKE 'M%';
SELECT * FROM empleado WHERE nombre LIKE '%A';
SELECT * FROM empleado WHERE nombre LIKE 'M%AR%A';
SELECT * FROM empleado WHERE nombre LIKE 'M_losa';

/* Reto 1
Usando la base de datos tienda, escribe consultas que permitan responder
 las siguientes preguntas. */
DESCRIBE articulo;
SELECT * FROM articulo;
#¿Qué artículos incluyen la palabra Pasta en su nombre?
SELECT id_articulo,nombre FROM articulo WHERE nombre LIKE '%pasta%';
#¿Qué artículos incluyen la palabra Cannelloni en su nombre?
SELECT id_articulo,nombre FROM articulo WHERE nombre LIKE '%Cannelloni%';
#¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
SELECT id_articulo,nombre FROM articulo WHERE nombre LIKE '%-%';
#¿Qué puestos incluyen la palabra Designer?
SELECT id_puesto,nombre FROM puesto WHERE nombre LIKE '%Designer%';
#¿Qué puestos incluyen la palabra Developer?
SELECT id_puesto,nombre FROM puesto WHERE nombre LIKE '%Developer%';

SELECT (1+7)*(10/(6-4));
SELECT * FROM articulo;
SELECT avg(precio) AS promedio_precio FROM articulo;
SELECT count(*) AS conteo_articulos FROM articulo;
SELECT max(precio) AS precio_maximo FROM articulo;
SELECT min(precio) AS precio_minimo FROM articulo;
SELECT sum(precio) AS suma_precios FROM articulo;

/*  Reto 2
Usando la base de datos tienda, escribe consultas que permitan responder 
	las siguientes preguntas. */
DESCRIBE puesto;
SELECT * FROM puesto;
#¿Cuál es el promedio de salario de los puestos?
SELECT round(avg(salario)) Promedio FROM puesto;
#¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT count(*) nArticulos FROM articulo WHERE nombre LIKE '%pasta%';
#¿Cuál es el salario mínimo y máximo?
SELECT min(salario) Mínimo,max(salario)Máximo FROM puesto;
#¿Cuál es la suma del salario de los últimos cinco puestos agregados?
SELECT max(id_puesto)-5 ID_END5 FROM puesto; 
/* Ya que sabemos el id de las últimas entradas podemos hacer una consulta
de la suma de las últimas entradas*/
SELECT sum(salario) Salario FROM puesto WHERE id_puesto>995;
#Otra
SELECT SUM(salario) Salario FROM (SELECT salario 
	FROM puesto ORDER BY id_puesto DESC LIMIT 5) AS a;
/*Igual puede hacerse con usando una subconsulta*/
SELECT sum(salario) Salario FROM puesto 
	WHERE id_puesto > (SELECT max(id_puesto)-5 ID_END5 FROM puesto); 

SELECT * FROM articulo;
SELECT nombre, sum(precio) precio_total FROM articulo GROUP BY nombre;
SELECT nombre, count(*) cantidad FROM articulo GROUP BY nombre ORDER BY cantidad DESC;
SELECT nombre, min(salario) salario_minimo, max(salario) AS salario_maximo 
	FROM puesto GROUP BY nombre;
SELECT nombre, sum(precio+iva) total FROM articulo GROUP BY nombre ORDER BY nombre;

/* Reto 3
Usando la base de datos tienda, escribe consultas que permitan responder las 
	siguientes preguntas.*/
DESCRIBE puesto;
#¿Cuántos registros hay por cada uno de los puestos?
SELECT nombre,count(*) Registros FROM puesto GROUP BY nombre ORDER BY nombre;
#¿Cuánto dinero se paga en total por puesto?
SELECT nombre,round(sum(salario)) suma_salarios FROM puesto 
	GROUP BY nombre ORDER BY suma_salarios DESC;
#¿Cuál es el número total de ventas por vendedor?
DESCRIBE venta;
SELECT * FROM venta;
SELECT id_empleado, count(*) ventas_totales FROM venta GROUP BY id_empleado
	ORDER BY ventas_totales DESC;
#¿Cuál es el número total de ventas por artículo?
SELECT id_articulo, count(*) ventas_articulos FROM venta GROUP BY id_articulo 
	ORDER BY ventas_articulos DESC;