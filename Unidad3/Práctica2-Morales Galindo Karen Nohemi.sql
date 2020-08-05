
--PRACTICA 13

use pubs
use Northwind

-- 1. Genere una lista de la tabla Empleado donde solo se genere una columna de salida y esta contenga los campos: EmployeeID, LastName y FirstName.
CREATE VIEW Lista AS SELECT EmployeeID, LastName, FirstName FROM Employees
SELECT * FROM Lista
 

-- 2. Despliegue aquellos productos (Tabla Products) cuyos valores se encuentran entre los 4 y 20.
 CREATE VIEW Productos AS SELECT * FROM Products WHERE UnitPrice  BETWEEN 4.00 AND 20.00 
SELECT * FROM Productos

-- 3. Liste los campos de la tabla productos que tengan exactamente un precio de 18,19 y 10.
 CREATE VIEW Precios AS SELECT * FROM Products WHERE UnitPrice  IN (10.00,18.00,19.00)
 SELECT * FROM Precios

-- 4. Encontrar todos los apellidos (LastName) en la tabla Employees que comiencen con la letra S.
CREATE VIEW Apellido AS SELECT *FROM Employees WHERE LastName LIKE 'S%'
SELECT * FROM Apellido

-- 5. Despliegue los datos de los empleados cuya primera letra del apellido comienza entre A y M.
CREATE VIEW ApellidosAM  AS SELECT *FROM Employees WHERE LastName BETWEEN 'A%' AND 'M%'
SELECT * FROM ApellidosAM

-- 6. Despliega los datos de un autor cuyo ID comienza con el numero 724, sabiendo que cada ID tiene el formato de tres digitos seguidos por un guion, seguido por dos digitos, otro guion y finalmente cuatro digitos.
CREATE VIEW listadatosAUTOR AS SELECT *FROM authors WHERE au_id LIKE '724-[0-9][0-9]-[0-9][0-9][0-9][0-9]'
SELECT * FROM listadatosAUTOR


-- 7. Liste todos los campos de la tabla Suppliers cuya columna Region sea NULL.
CREATE VIEW ListaSupplier AS SELECT * FROM Suppliers WHERE Region IS NULL
SELECT * FROM ListaSupplier

-- 8. Calcule la suma de las ventas del año hasta la fecha(ytd_sales) de todos los libros de la tabla titles.
CREATE VIEW SUMA AS  SELECT   SUM (ytd_sales) AS ytd_sales FROM titles
SELECT * FROM SUMA

-- 9. Calcule el precio promedio de todos los libros (tabla titles).
CREATE VIEW PROMEDIO AS SELECT AVG (price) AS price FROM titles 
SELECT * FROM PROMEDIO

-- 10. Muestre el mayor valor de las ventas del año (ytd_sales) de todos los libros de la tabla titles.
CREATE VIEW MAYOR AS SELECT MAX (ytd_sales) AS ytd_sales  FROM titles
SELECT * FROM MAYOR

-- 11. Muestre el minimo valor de las ventas del año (ytd_sales) de todos los libros de la tabla titles.
CREATE VIEW MINIMO AS SELECT MIN (ytd_sales) AS ytd_sales FROM titles
SELECT * FROM MINIMO

-- 12. Cuente las filas de la tabla titles.
CREATE VIEW FILAS AS SELECT COUNT (title_id) AS title_id FROM titles
SELECT * FROM FILAS

-- 13. Cuente los datos de la tabla titles, cuyo tipo (TYPE) sea business.
CREATE VIEW DATOS AS SELECT COUNT (type) AS type FROM titles WHERE type = 'business'
SELECT * FROM DATOS

-- 14. Liste la suma de las ventas por año (ytd_sales) de la tabla titles, clasificandolas por tipo (TYPE) de titulo.
CREATE VIEW SUMA AS SELECT SUM (ytd_sales) AS ytd_sales from titles group by type
SELECT * FROM SUMA

-- 15. Combine las tablas stores y disconunts para mostrar que tienda(stor_id) ofrece un descuento y el tipo de descuento (discounttype). (Full Outer Join).
CREATE VIEW F_OUTER_JOIN AS 
( 
SELECT stores.stor_id, stores.stor_name, stores.stor_address, stores.city, stores.state, stores.zip FROM stores
FULL OUTER JOIN discounts
ON stores.stor_id = discounts.stor_id 
)

select * from F_OUTER_JOIN

-- 16. Utilice el mismo ejemplo anterior solo utilice en el from la instruccion LEFT OUTER JOIN.
CREATE VIEW L_OUTER_JOIN AS
(
SELECT stores.stor_id, stores.stor_name, stores.stor_address, stores.city, stores.state, stores.zip FROM stores
LEFT OUTER JOIN discounts
ON stores.stor_id = discounts.stor_id 
)

SELECT * FROM L_OUTER_JOIN

-- 17. Utilice el mismo ejemplo anterior solo utilice en el from la instruccion RIGHT.
CREATE VIEW R_OUTER_JOIN AS 
(
SELECT stores.stor_id, stores.stor_name, stores.stor_address, stores.city, stores.state, stores.zip FROM stores
RIGHT OUTER JOIN discounts
ON stores.stor_id = discounts.stor_id
)

SELECT * FROM R_OUTER_JOIN

-- 18. Muestre los Productos (ID del Producto, Nombre y Precio Unitario) que tengan un precio unitario igual al Maximo.
CREATE VIEW MUESTRE_PRODUCTOS AS select ProductID,ProductName,UnitPrice from Products where UnitPrice = (select max (UnitPrice) from Products)
SELECT * FROM MUESTRE_PRODUCTOS

-- 19. Muestre los Productos (ID del Producto, Nombre y Precio Unitario) que tengan un precio unitario igual al Minimo.
CREATE VIEW SHOW_PRODUCT AS select ProductID,ProductName,UnitPrice from Products where UnitPrice = (select min (UnitPrice) from Products)
SELECT * FROM SHOW_PRODUCT

