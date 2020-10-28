/*Aquí se hacen las consultas*/
SHOW DATABASES;			
/* Lista las bases en el servidor, en este servidor solo
   hay una base de datos: tienda. */
USE tienda;			 
/* Sirve para hacer conexión con la base de datos*/
SHOW TABLES; 		 
/* Muestra todas las tablas que hay en la base de datos 
   'tienda'*/
DESCRIBE empleado;  
/* Regresa los campos que tiene la tabla y el tipo de datos
   que contienen*/

/* Reto1
Usando la base de datos tienda, muestra la descripción de las 
tablas articulo, puesto y venta. Por cada tipo de dato que 
encuentras llena la siguiente tabla, a mano.alter
*/

DESCRIBE articulo;
/* Tipos de dato en articulo: int, varchar(n), double.*/
DESCRIBE puesto;
/* Tipos de dato en puesto: int, varchar(n), double*/
DESCRIBE venta;
/* Tipos de dato en venta: int, varchar(n), timestamp*/

/*
int: De tipo numérico, enteros postivos o negativos.
varchar: De tipo cadenas, longitud variable (char tiene longitud fija)
double: De tipo numérico, números con decimales (más precisión que float)
timestamp: De tipo fecha, combinación de fecha y hora
*/

SELECT nombre FROM empleado;
/* Muestra el campo llamado nombre de la tabla empleado
   SELECT <campo> FROM <tabla> */
SELECT * FROM empleado WHERE id_puesto >= 100 
	AND id_puesto <= 200;
  /* Para filtrar los resultados se utiliza la intrucción
     WHERE seguido de una sentencia lógica. El asterisco se
     utiliza seleccionar todos los campos.*/
  
/* Reto 2
Usando la base de datos tienda, escribe consultas que permitan
responder las siguientes preguntas.
¿Cuál es el nombre de los empleados con el puesto 4?
¿Qué puestos tienen un salario mayor a $10,000?
¿Qué articulos tienen un precio mayor a $1,000 y un iva mayor a 100?
¿Qué ventas incluyen los artículo 135 o 963 y fueron hechas por los 
empleados 835 o 369?*/

SELECT nombre FROM empleado WHERE id_empleado=4;
/* Nombre de empleado: Cassey*/
SELECT id_puesto FROM puesto WHERE salario>10000;
SELECT id_articulo, nombre FROM articulo WHERE precio>1000 
	AND iva>100;
SELECT id_venta FROM venta WHERE id_articulo IN (135,963) 
	AND id_empleado IN (835,369);
/* Es útil usar describe para saber el nombre de los campos 
y SELECT * FROM <tabla> para visualizar la tabla*/

SELECT * FROM puesto ORDER BY salario DESC LIMIT 5,10;
/* El ordenamiento es ascendente por lo que puede omitirse
y LIMIT sirva para limitar cuantas filas regresará la consulta
LIMIT indicador_nfila, numfilas*/

/* Reto 3
Usando la base de datos tienda, escribe una consulta que 
permita obtener el top 5 de puestos por salarios.*/

SELECT id_puesto FROM puesto ORDER BY salario DESC LIMIT 5;
