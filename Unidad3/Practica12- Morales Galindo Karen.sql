Create database PRAC12
use PRAC12

CREATE table ALUMNO(
NoControl int primary key,
Nombre varchar (30),
Carrera varchar(20),
)

Create table CALIFICACIONES(
idCalificacion int primary key,
Examen1 int,
Examen2 int,
Examen3 int,
Practica1 int,
Practica2 int,
Practica3 int,
Participacion1 int,
Participacion2 int,
Participacion3 int,
NoControl int foreign key  references Alumno (NoControl)
)

create table MATERIA(
idMateria int primary key,
materia varchar (15),
NoControl int foreign key  references Alumno(NoControl),
idCalificacion int Foreign key (idCalificacion) references Calificaciones (idCalificacion)
)

insert into Alumno values (16210977,'MARYURI CHAVEZ','ISC')
insert into Calificaciones values (1,90,80,100,90,97,95,80,90,100,1)
insert into materia values (1,'BD',1,1)

insert into Alumno values (2,'KAREN MORALES','ISC')
insert into Calificaciones values (2,80,90,100,100,100,100,100,100,90,2)
insert into materia values (2,'TBD',2,2)


create function dbo.PRO(@Exa1 int,@Exa2 int,@Exa3 int,@Pract1 int,@Pract2 int, @Pract3 int,@Par1 int, @Par2 int,@Par3 int)
returns int
begin
declare @PROM int
set @PROM=(((@Exa1+@Exa2+@Exa3)/3)*.60)+(((@Pract1+@Pract2+@Pract3)/3)*0.3)+(((@Par1+@Par2+@Par3)/3)*0.1)
return @PROM
end

Select Alumno.NoControl,Alumno.Nombre,materia.materia,
dbo.PRO(Examen1,Examen2,Examen3,Practica1,Practica2,Practica3,Participacion1,Participacion2,Participacion3) as 'Promedio'
from ((Calificaciones inner join materia on Calificaciones.NoControl=materia.NoControl)inner join Alumno on Calificaciones.NoControl=Alumno.NoControl)
