Create database Buenaspracticas1;
use buenaspracticas1;
-- UNSIGNED SOLO VALORES POSITIVOS
-- UNIQUE ESPECIAL Y UNICA ESE CAMPO
-- TINY INT 
-- ZEROFILL
-- ENUM("F","M")
create table USUARIO(
ID_USUARIO INT UNSIGNED PRIMARY KEY,
NOMBRE VARCHAR(50) NOT NULL UNIQUE,
FECHA_RENOCACION DATE NOT NULL,
MES_CADUCIDAD TINYINT(2) UNSIGNED ZEROFILL CHECK( MES_CADUCIDAD >=1 AND MES_CADUCIDAD<=12),
ANHO_CADUCIDAD YEAR CHECK(ANHO_CADUCIDAD >=2021),
GENERO ENUM("F","M") NOT NULL,
TIPO_USUARIO ENUM("GRATIS","PAGO") NOT NULL DEFAULT "GRATIS")

-- DESCRIBE TABLA
DESC USUARIO;

show tables;
select *from empleado;
select * from trabaja;
select * from pelicula;

-- Desplegar los empleados nombre y nacionalidad y las peliculas
-- Donde trabajaron (identificador de pelicula) utilizando el PC

Select  empleado.codigo_emp, empleado.Nombre_emp as Nombre,empleado.Nacionalidad as Nacionalidad, trabaja.cargo,trabaja.Identificador, pelicula.titulo_original
from empleado 
inner join trabaja on empleado.codigo_emp = trabaja.Codigo_emp 
inner join  pelicula on pelicula.Identificador = trabaja.Identificador
order by Nombre desc




