--Crear Base de Datos
create database X
use X
--Crear Tabla
create table Equipo(
Clave int identity,
Descripcion varchar(40),
Marca varchar(30) not null default 'APPLE',
Precio decimal(6,2),
Cantidad tinyint default 0)

--Insercciones
Insert into Equipo values('Telefono galaxy s8','Sansumg',700.00,2)
Insert into Equipo values('Telefono galaxy s6','Sansumg',900.00,5)
Insert into Equipo values('Iphone X',default,1000.00,default)
Insert into Equipo values('Iphone X','Mac',1000.00,2)

-- Ver Tabla
select * from Equipo

--Crear Tabla Alumno
Create Table Alumno(
NumeroControl int not null default 16210977,
Nombre varchar(50)  default 'Karen Nohemi Morales Galindo',
Carrera  varchar(50) ,
CorreoElect varchar(55) default 'karen.morales16@tectijuana.edu.mx',
RFC varchar(50) default 'MOGK971019256',
Escuela varchar(50) default 'Instituto tecnologico de Tijuana',
)
--Inserccion
insert into Alumno values( default, default, default,default,default ,default)
insert into Alumno values( default, default, default,default,default ,default)

--Ver Tabla
select * from Alumno

--Crear Default Carrera
create default Carrera as 'Tecnologias'
exec sp_bindefault Carrera, 'Alumno.Carrera'
