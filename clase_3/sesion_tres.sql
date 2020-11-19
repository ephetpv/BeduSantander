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
#¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?
