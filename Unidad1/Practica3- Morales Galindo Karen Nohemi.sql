

---CREAR BASE DE DATOS INVESTIGADOR 
create DataBase  Practica3
--USAR BASE DE DATOS
use Practica3

--TABLA AREA CONOCIMIENTO
create table AREACONOC (IdArea Int NOT NULL PRIMARY KEY,  
AreaConc varchar(30))

--TABLA PROGRAMA EDUCATIVO
create table PE (IdPE Int NOT NULL PRIMARY KEY,  
PROGRAMA varchar(30))

--TABLA REVISTA
create table REVISTA (SNNC Int NOT NULL PRIMARY KEY,  
Nombre varchar(40), Base varchar(27), Pais varchar(15))

--TABLA ARTICULOS 
create table ARTICULOS (Id_Art Int NOT NULL PRIMARY KEY,  
Titulo varchar(15), FechaPublicacion date, idRevista Int FOREIGN KEY  REFERENCES  REVISTA(SNNC))

--TABLA TESIS
create Table TESIS (IdTesis Int NOT NULL PRIMARY KEY,  
Titulo varchar(15), Autor varchar(27), IdPE int FOREIGN KEY REFERENCES PE(IdPE))

-- TABLA INVESTIGADOR
Create Table INVESTIGADOR(IdInvestigador Int NOT NULL PRIMARY KEY,
Nombre varchar(30), GradoMaximo varchar(30),Profesion varchar(30), PRODEP char(2),SNI char(2))

--TABLA LIBRO
create Table LIBRO (IdLibro Int Not Null Primary Key, 
Titulo varchar(15), Editorial varchar(15), Edicion varchar(5), FechaEdicion date, ISBN varchar(18))

--TABLA CAPITULOS
Create Table CAPITULOS( IdCap Int NOT NULL Primary Key, Titulo varchar(22),IdLibro Int FOREIGN KEY  REFERENCES LIBRO(IdLibro))

--Mostrar Todas Las Tablas
select name from sysobjects where type='U'

--Mostrar 
SELECT * FROM information_schema.TABLES 
