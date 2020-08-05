/* SE CREO LA BD*/

CREATE DATABASE BDALUMNO

--USAR BASE DE DATOS
 USE BDALUMNOS

--SE CREO LA TABLA

CREATE TABLE ALUMNO( 
NoCotrol int NOT NULL,
Nombre varchar(30),
RFC    varchar(15),
Edad   int,
CorreoE varchar(2),
Carrera varchar(30))

--MIRAR TABLA
SELECT * FROM ALUMNO

--Agrega Atributo Direccion varchar(30)

ALTER TABLE ALUMNO ADD Direccion varchar(30)

--Eliminar Edad


ALTER TABLE ALUMNO DROP COLUMN EDAD

--Modificar CorreoE por varchar(40)

ALTER TABLE ALUMNO ALTER COLUMN CorreoE varchar(40)


--Modificar Carrrera por int

ALTER TABLE ALUMNO ALTER COLUMN Carrera int




