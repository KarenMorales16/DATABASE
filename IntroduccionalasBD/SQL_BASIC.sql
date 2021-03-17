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
 
 

create table empleados(
nDIEmp VARCHAR(12),
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
 values('EM02','KAREN MORALES','F','1995/06/10','2019/04/10',1555.2,350.6,'SECRETARIA','JF-01','B1');
 
  INSERT INTO empleados (nDIEmp, nomEmp, sexEmp, fecNac, fecIncorporation, SalEmp,comisionE, cargoE, JefeID, CodDepto)
 values('EM03','ADILENE LOPEZ','M','1992/06/16','2020/04/20',1555.2,150.6,'CHOFER','COD-605','A10');
 
 INSERT INTO empleados (nDIEmp, nomEmp, sexEmp, fecNac, fecIncorporation, SalEmp,comisionE, cargoE, JefeID, CodDepto)
 values('EM04','LAURA MORALES','F','1995/06/16','2019/04/15',2000.2,350.6,'SECRETARIA','JF-01','B10');
 
  INSERT INTO empleados (nDIEmp, nomEmp, sexEmp, fecNac, fecIncorporation, SalEmp,comisionE, cargoE, JefeID, CodDepto)
 values('EM05','LAURA MORALES','F','1995/06/10','2019/04/10',1555.2,350.6,'SECRETARIA','JF-01','B10');
 
 
