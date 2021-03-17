use ejercicio;

create table departamentos (
codDepto VARCHAR(4),
nombreDto VARCHAR(20),
cuidad VARCHAR(15),
codDirector VARCHAR(12));

select * from departamentos;

INSERT INTO departamentos (codDepto, nombreDto, cuidad, codDirector) VALUES ('A1', 'CALIDAD', 'TIJUANA','COD-63');
INSERT INTO departamentos (codDepto,nombreDto,Cuidad,CodDirector) VALUES('B1','INDUSTRIAL', 'MEXICALI','COD-1003');
INSERT INTO departamentos (CodDepto,nombreDto,Cuidad,CodDirector) VALUES('C2','MARKETING','TOLUCA','COD-105');
INSERT INTO departamentos (codDepto, nombreDto, cuidad, codDirector) VALUES ('A10', 'CALIDAD', 'TIJUANA','COD-103');
INSERT INTO departamentos (codDepto,nombreDto,Cuidad,CodDirector) VALUES('B10','INDUSTRIAL', 'YUCATAN','COD-903');
INSERT INTO departamentos (CodDepto,nombreDto,Cuidad,CodDirector) VALUES('C10','MARKETING','SONORA','COD-605');


-- Crear un Index
ALTER TABLE departamentos ADD INDEX CodDepto (nombreDto, cuidad, codDirector);
ALTER TABLE departamentos ADD  CONSTRAINT codDepto_2codDepto  UNIQUE(codDepto) ;
-- BORRAR UN INDEX
ALTER TABLE departamentos DROP INDEX CodDepto;
-- CREAR UNA PK
ALTER TABLE departamentos add Primary key (CodDepto);
 
-- CREAR UNA PK
ALTER TABLE empleados add Primary key (nDIEmp);

-- CREAR UNA PK
ALTER TABLE empleados add Primary key (nDIEmp); 

create table empleados(
nDIEmp VARCHAR(12) ,
nomEmp VARCHAR(30),
sexEmp CHAR(1),
fecNac DATE,
fecIncorporation DATE,
SalEmp FLOAT,
comisionE FLOAT,
cargoE VARCHAR(15),
JefeID VARCHAR(12),
CodDepto VARCHAR(4),
 FOREIGN KEY  (CodDepto) REFERENCES departamentos(CodDepto) ON UPDATE CASCADE ON DELETE RESTRICT );
 
 SELECT * FROM empleados;
 
 -- insertar 3 registros
 INSERT INTO empleados (nDIEmp, nomEmp, sexEmp, fecNac, fecIncorporation, SalEmp,comisionE, cargoE, JefeID, CodDepto)
 values('EM01','JUAN LOPEZ','M','1992/06/16','2020/04/20',1555.2,150.6,'CHOFER','COD-605','A1');
 
 INSERT INTO empleados (nDIEmp, nomEmp, sexEmp, fecNac, fecIncorporation, SalEmp,comisionE, cargoE, JefeID, CodDepto)
 values('EM02','CECILIA MORALES','F','1995/06/16','2019/04/15',2000.2,350.6,'SECRETARIA','JF-01','B1');
 
 INSERT INTO empleados (nDIEmp, nomEmp, sexEmp, fecNac, fecIncorporation, SalEmp,comisionE, cargoE, JefeID, CodDepto)
 values('EM03','CECILIA MORALES','F','1995/06/16','2019/04/15',2000.2,350.6,'SECRETARIA','JF-01','B1');
 
 INSERT INTO empleados (nDIEmp, nomEmp, sexEmp, fecNac, fecIncorporation, SalEmp,comisionE, cargoE, JefeID, CodDepto)
 values('EM04','NOHEMY MORALES','F','1995/06/10','2019/04/10',1555.2,350.6,'VENDEDOR','JF-01','B1');
 
 INSERT INTO empleados (nDIEmp, nomEmp, sexEmp, fecNac, fecIncorporation, SalEmp,comisionE, cargoE, JefeID, CodDepto)
 values('EM05','KARINA MORALES','F','1995/06/10','2019/04/10',1555.2,350.6,'VENDEDOR','JF-01','B1');
 
 INSERT INTO empleados (nDIEmp, nomEmp, sexEmp, fecNac, fecIncorporation, SalEmp,comisionE, cargoE, JefeID, CodDepto)
 values('EM06','ADILENE LOPEZ','M','1992/06/16','2020/04/20',1555.2,150.6,'CHOFER','COD-605','A10');
 
 INSERT INTO empleados (nDIEmp, nomEmp, sexEmp, fecNac, fecIncorporation, SalEmp,comisionE, cargoE, JefeID, CodDepto)
 values('EM07','LAURA MORALES','F','1995/06/16','2019/04/15',2000.2,350.6,'SECRETARIA','JF-01','B10');
 
 INSERT INTO empleados (nDIEmp, nomEmp, sexEmp, fecNac, fecIncorporation, SalEmp,comisionE, cargoE, JefeID, CodDepto)
 values('EM08','LAURA MORALES','F','1995/06/10','2019/04/10',1555.2,350.6,'SECRETARIA','JF-01','B10');
 
 INSERT INTO empleados (nDIEmp, nomEmp, sexEmp, fecNac, fecIncorporation, SalEmp,comisionE, cargoE, JefeID, CodDepto)
 values('EM09','JUANA MONTIEL','F','1990/02/16','2020/09/20',2002.2,80.6,'PROGRAMADOR','COD-85','A1');
 
 INSERT INTO empleados (nDIEmp, nomEmp, sexEmp, fecNac, fecIncorporation, SalEmp,comisionE, cargoE, JefeID, CodDepto)
 values('EM10','MARIA MORA','F','1983/02/16','2021/01/10',1000.2,1001.6,'CONTADOR','COD-85','B1');

 INSERT INTO empleados (nDIEmp, nomEmp, sexEmp, fecNac, fecIncorporation, SalEmp,comisionE, cargoE, JefeID, CodDepto)
 values('EM12','MORIAN MONTIEL','F','1984/02/16','2021/02/15',600.2,800.6,'PRACTICANTE','COD-95','B10');
 
 INSERT INTO empleados (nDIEmp, nomEmp, sexEmp, fecNac, fecIncorporation, SalEmp,comisionE, cargoE, JefeID, CodDepto)
 values('EM11','MARISSA MONTIEL','F','1984/02/16','2021/02/15',600.2,900.6,'PRACTICANTE','COD-95','B10');
 
  -- 1. Obtener los datos completos de los empleados.
 SELECT  * FROM empleados;
 
-- 2. Obtener los datos completos de los departamentos.
SELECT  * FROM departamentos;

-- 3. Obtener los datos de los empleados con cargo ‘Secretaria’.
SELECT * FROM empleados Where cargoE='SECRETARIA';

-- 4. Obtener el nombre y salario de los empleados.
SELECT NomEmp, SalEmp from empleados ;

-- 5. Obtener los datos de los empleados vendedores, ordenado por nombre.
SELECT * FROM empleados where lower(cargoE)='VENDEDOR' ORDER BY (NomEmp) ASC;

-- Listar el nombre de los departamentos.
SELECT NombreDto FROM departamentos;

-- Obtener el nombre y cargo de todos los empleados, ordenado por salario.
SELECT e.NomEmp, e.cargoE, SalEmp from Empleados as e order by (SalEmp) DESC;

-- 8. Listar los salarios y comisiones de los empleados del departamento A1, ordenado por comisión.
SELECT e.SalEmp, e.comisionE as comision FROM empleados as e WHERE CodDepto='A1' ORDER BY (comision) DESC;

-- 9. Listar todas las comisiones.
SELECT e.comisionE as Comisiones FROM empleados as e ORDER BY (comisiones) DESC;
select distinct comisionE from empleados;

-- 10. Obtener el valor total a pagar que resulta de sumar a los empleados del departamento
-- B1 una bonificación de 500.000, en orden alfabético del empleado
SELECT nomEmp, salEmp, (salEmp+500) as 'Total a pagar' FROM empleados ORDER BY (nomEmp) ASC;

-- 11. Obtener la lista de los empleados que ganan una comisión superior a su sueldo.
SELECT * FROM empleados where (comisionE > salEmp);

-- 12. Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo.
 SELECT * FROM empleados where (comisionE < (SalEmp*0.30));
 
-- 13.Elabore un listado donde para cada fila, figure ‘Nombre’ y ‘Cargo’ antes del valor 
-- respectivo para cada empleado.
Select nomEmp as 'Nombre', cargoE as 'Cargo' from empleados;

-- 14. Hallar el salario y la comisión de aquellos empleados cuyo número de documento de identidad cuyo ID sea menor de EM07
Select nDIEmp,SalEmp, comisionE from empleados where nDIEmp<'EM07';

-- 15. Muestra los empleados cuyo nombre empiece entre las letras J y Z (rango).
-- Liste estos empleados y su cargo por orden alfabético.

16. Listar el salario, la comisión, el salario total (salario + comisión), documento de identidad del empleado y nombre, de aquellos empleados que tienen comisión superior a 1.000.000, ordenar el informe por el número del documento de identidad

Spoiler Inside	SelectShow
17. Obtener un listado similar al anterior, pero de aquellos empleados que NO tienen comisión

Spoiler Inside	SelectShow
18. Hallar los empleados cuyo nombre no contiene la cadena “MA”

Spoiler Inside	SelectShow
19. Obtener los nombres de los departamentos que no sean “Ventas” ni “Investigación” NI
‘MANTENIMIENTO’.

Spoiler Inside	SelectShow
20. Obtener el nombre y el departamento de los empleados con cargo ‘Secretaria’ o ‘Vendedor’, que no trabajan en el departamento de “PRODUCCION”, cuyo salario es superior a $1.000.000,
ordenados por fecha de incorporación.

Spoiler Inside	SelectShow
21. Obtener información de los empleados cuyo nombre tiene exactamente 11 caracteres

Spoiler Inside	SelectShow
22. Obtener información de los empleados cuyo nombre tiene al menos 11 caracteres

Spoiler Inside	SelectShow
23. Listar los datos de los empleados cuyo nombre inicia por la letra ‘M’, su salario es mayor a $800.000 o reciben comisión y trabajan para el departamento de ‘VENTAS’

Spoiler Inside	SelectShow
24. Obtener los nombres, salarios y comisiones de los empleados que reciben un salario situado entre la mitad de la comisión la propia comisión.

Spoiler Inside	SelectShow
25. Mostrar el salario más alto de la empresa.

Spoiler Inside	SelectShow
26. Mostrar cada una de las comisiones y el número de empleados que las reciben. Solo si tiene comision.

Spoiler Inside	SelectShow
27. Mostrar el nombre del último empleado de la lista por orden alfabético.

Spoiler Inside	SelectShow
28. Hallar el salario más alto, el más bajo y la diferencia entre ellos.

Spoiler Inside	SelectShow
29. Mostrar el número de empleados de sexo femenino y de sexo masculino, por departamento.

Spoiler Inside	SelectShow
30. Hallar el salario promedio por departamento.

Spoiler Inside	SelectShow
31. Mostrar la lista de los empleados cuyo salario es mayor o igual que el promedio de la empresa. Ordenarlo por departamento.

Spoiler Inside	SelectShow
32. Hallar los departamentos que tienen más de tres empleados. Mostrar el número de empleados de esos departamentos.

Spoiler Inside	SelectShow
33. Mostrar el código y nombre de cada jefe, junto al número de empleados que dirige. Solo los que tengan mas de dos empleados (2 incluido).

Spoiler Inside	SelectShow
34. Hallar los departamentos que no tienen empleados

Spoiler Inside	SelectShow
35. Mostrar el nombre del departamento cuya suma de salarios sea la más alta, indicando el valor de la suma.
 
