/*MORALES GALINDO KAREN NOHEMI*/
--PRACTICA#1 UNIDAD 3
use pubs
use Northwind

-- 1. Genere una lista de la tabla Empleado donde solo se genere una columna de salida y esta contenga los campos: EmployeeID, LastName y FirstName.
SELECT EmployeeID, LastName, FirstName FROM Employees

-- 2. Despliegue aquellos productos (Tabla Products) cuyos valores se encuentran entre los 4 y 20.

SELECT *FROM Products WHERE UnitPrice  BETWEEN 4.00 AND 20.00

-- 3. Liste los campos de la tabla productos que tengan exactamente un precio de 18,19 y 10.
SELECT *FROM Products WHERE UnitPrice IN (10.00,18.00,19.00)

-- 4. Encontrar todos los apellidos (LastName) en la tabla Employees que comiencen con la letra S.
SELECT *FROM Employees WHERE LastName LIKE 'S%'

-- 5. Despliegue los datos de los empleados cuya primera letra del apellido comienza entre A y M.
SELECT *FROM Employees WHERE LastName BETWEEN 'A%' AND 'M%'


-- 6. Despliega los datos de un autor cuyo ID comienza con el numero 724, sabiendo que cada ID tiene el formato de tres digitos seguidos por un guion, seguido por dos digitos, otro guion y finalmente cuatro digitos.
SELECT * FROM authors WHERE au_id LIKE '724-[0-9][0-9]-[0-9][0-9][0-9][0-9]'

-- 7. Liste todos los campos de la tabla Suppliers cuya columna Region sea NULL.
SELECT *FROM Suppliers WHERE Region IS NULL

-- 8. Calcule la suma de las ventas del año hasta la fecha(ytd_sales) de todos los libros de la tabla titles.
SELECT SUM (ytd_sales) FROM titles

-- 9. Calcule el precio promedio de todos los libros (tabla titles).
SELECT AVG (price) FROM titles 

-- 10. Muestre el mayor valor de las ventas del año (ytd_sales) de todos los libros de la tabla titles.
SELECT MAX (ytd_sales) FROM titles

-- 11. Muestre el minimo valor de las ventas del año (ytd_sales) de todos los libros de la tabla titles.
SELECT MIN (ytd_sales) FROM titles

-- 12. Cuente las filas de la tabla titles.
SELECT COUNT (title_id) FROM titles

-- 13. Cuente los datos de la tabla titles, cuyo tipo (TYPE) sea business.
SELECT COUNT (type) FROM titles WHERE type = 'business'

-- 14. Liste la suma de las ventas por año (ytd_sales) de la tabla titles, clasificandolas por tipo (TYPE) de titulo.
select sum (ytd_sales) from titles group by type

-- 15. Combine las tablas stores y disconunts para mostrar que tienda(stor_id) ofrece un descuento y el tipo de descuento (discounttype). (Full Outer Join).
SELECT *
FROM stores
FULL OUTER JOIN discounts
ON stores.stor_id = discounts.stor_id

-- 16. Utilice el mismo ejemplo anterior solo utilice en el from la instruccion LEFT OUTER JOIN.
SELECT *
FROM stores
LEFT OUTER JOIN discounts
ON stores.stor_id = discounts.stor_id

-- 17. Utilice el mismo ejemplo anterior solo utilice en el from la instruccion RIGHT.
SELECT *
FROM stores
RIGHT OUTER JOIN discounts
ON stores.stor_id = discounts.stor_id

-- 18. Muestre los Productos (ID del Producto, Nombre y Precio Unitario) que tengan un precio unitario igual al Maximo.
select ProductID,ProductName,UnitPrice from Products where UnitPrice = (select max (UnitPrice) from Products)

-- 19. Muestre los Productos (ID del Producto, Nombre y Precio Unitario) que tengan un precio unitario igual al Minimo.
select ProductID,ProductName,UnitPrice from Products where UnitPrice = (select min (UnitPrice) from Products)

