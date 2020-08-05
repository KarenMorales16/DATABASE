/* Tipo de datos 
EXEC: procedimiento de datos 
Podemos Crear Darle Nombre a los Tipos de Datos
 */

 --Crear DASE DATOS
CREATE DATABASE BD
USE BD
--TextP VARCHAR(2)
EXEC sp_addtype TextP, 'VARCHAR(2)', 'NOT NULL'
--Texto Varchar(30)
EXEC sp_addtype Texto, 'VARCHAR(30)', 'NOT NULL'
--NUMEROS INT
EXEC sp_addtype Numeros, 'int' , 'NOT NULL'
--MONEDA MONEY
EXEC sp_addtype Moneda, money , 'NOT NULL'
--FECHA DATE
EXEC sp_addtype Fecha, date, 'NOT NULL'

Create Table EMPLEADO ( NomEmp  Numeros, 
Nombre  Texto, Sexo Textp, Sueldo Moneda, FechaCont Fecha)


--Inserta 3 Registro
Insert into EMPLEADO values(1,'Juan Perez','M',12334,'9999-12-31')

Insert into EMPLEADO values(2,'Maria Juana','F',16000,'1997-10-27')

Insert into EMPLEADO values(3,'Karen Nohemi','F',72000,'1980-02-05')

Insert into EMPLEADO values(4,'Maryuri','F',2000,'1970-02-10'),(5,'Yahara','F',52000,'1950-10-30');

Insert into EMPLEADO values(7,'Miguel Morales','M',6000,'2000-07-17'),(8,'Manuel Javier','M',7000,'1999-09-17');


--Ver Todo los Empleados
select * from EMPLEADO

--Modificar La Tabla Empleado 50000
UPDATE  EMPLEADO SET  Sueldo=50000 WHERE NomEmp=3

--Modificar La decha 02/Enero/2018
UPDATE EMPLEADO SET FechaCont='2018-01-02' WHERE NomEmp=5

--Borrado NumEmp=8
DELETE FROM EMPLEADO WHERE NomEmp=8
