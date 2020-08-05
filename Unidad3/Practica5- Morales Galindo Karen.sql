-- CREACION BD
CREATE DATABASE PEDIDOCLIENTE
-- USAR BD
USE PEDIDOCLIENTE

--TABLA CUSTUMER
CREATE TABLE CUSTUMER(
CustId Int not null primary key,LastName  varchar(15),FirsName  varchar(15),Street    varchar(20),
City      varchar(20),Statee     varchar(20),Zip       Int,CreditLimit money,AreaCode Int,number Int)


--TABLA ORDER
CREATE TABLE ORDERR(OrderNO Int not null primary key,Datee  date,TotalAmount  money,Tax money,Street    varchar(20),
City varchar(20),Statee varchar(20),Zip Int,AreaCode Int,number Int,CustId Int FOREIGN KEY REFERENCES CUSTUMER(CustId))

--TABLA ITEM
CREATE TABLE ITEM(ItemNo Int not null primary key,ItemName varchar(15),UnitPrice  money,qtyOnHand  Int,ReorderPoint  Int )

--TABLA SUPPLIER
CREATE TABLE Supplier(
SupplierNo Int not null primary key,
SupName varchar(30),
CountyCode Int,
AreaCode Int,
number Int,
Street    varchar(20),
City      varchar(20),
Statee     varchar(20),
Zip       Int,
Country varchar(20)
 )


--TABLA BUY	
CREATE TABLE BUYS(
CustId INT FOREIGN KEY REFERENCES CUSTUMER(CustId),
OrderNo Int FOREIGN KEY REFERENCES ORDERR(OrderNO)
)

--MIRAR TABLAS
	SELECT * FROM CUSTUMER
	SELECT * FROM ORDERR
--INSERCIONES TABLA BUY	
INSERT INTO BUYS VALUES(1,2)
INSERT INTO BUYS VALUES(1,3)
INSERT INTO BUYS VALUES(3,1)

--TABLA SUPPLIES
CREATE TABLE SUPPIES (
SupplierNo Int FOREIGN KEY REFERENCES Supplier(SupplierNo),
ItemNo Int FOREIGN KEY REFERENCES ITEM(ItemNo),
UnitCost Money
)
--MIRAR TABLAS
	SELECT * FROM Supplier
	SELECT * FROM ITEM
	SELECT * FROM ITEM
	SELECT * FROM ORDERR
--INSERCIONES TABLA CONSTAINSS	
--TABLA CONSTAINSS
CREATE TABLE CONTAINSS (
OrderNO Int FOREIGN KEY REFERENCES ORDERR(OrderNO),
ItemNo Int FOREIGN KEY REFERENCES ITEM(ItemNo))


--MIRAR TABLAS
	SELECT * FROM ITEM
	SELECT * FROM ORDERR
	SELECT * FROM Supplier
	SELECT * FROM CUSTUMER
	SELECT * FROM BUYS
	SELECT * FROM SUPPIES
	SELECT * FROM CONTAINSS
	
--3.	Crear una regla que garantice que el UnitPrice  del Item sea >1 y menor que 9999.00
CREATE RULE UNITPRICES
AS @ITEM>1 AND @ITEM<9999.00

EXEC SP_BINDRULE UNITPRICE,'ITEM.UnitPrice'

--4.	Crear una regla que garantice que el reorderPoint sea mayor que 5 
CREATE RULE REORDERPOINT
AS @REORDERPOINT>5
EXEC SP_BINDRULE REORDERPOINT,'ITEM.ReorderPoint'

--5.	Crea un valor por default para insertar en el atributo tax de la tabla Order con un valor de 16 
CREATE DEFAULT DF_TAX AS 16
EXEC SP_BINDEFAULT DF_TAX,'ORDERR.Tax'

--6.	Crea un check que asegure  que la ciudad del cliente sea LA o TIJ.
ALTER TABLE DBO.CUSTUMER
ADD
CONSTRAINT CUIDAD
CHECK(City='LA'OR City='TIJ')

--7.	Captura los valores que se agregan a cada tabla.


--INSERCIONES TABLA CUSTUMER
--QUITAMOS LOS PUNTOS DE L.A.
INSERT INTO CUSTUMER VALUES (1,	'Perez'	,'Adan',	'2da'  ,'LA',  'CA'	 ,66100, 619,	64621523,	15000)
INSERT INTO CUSTUMER VALUES (2,	'Lopez'	,'Javier',	'Otay' ,'TIJ', 'B.C.',22000, 664,	66452897,	10000)
INSERT INTO CUSTUMER VALUES (3,	'Juarez','Martha',	'Mesa' ,'TIJ', 'B.C.',22000, 664,	6251879,	20000)

--INSERCIONES TABLA ORDER
INSERT INTO ORDERR VALUES(1004,	'01/06/2017',	1500.00	   ,16     ,	NULL,	NULL,	'Londres',NULL,NULL,NULL,1)
INSERT INTO ORDERR VALUES(1005,	'02/09/2018',	156000.00  ,16     ,	NULL,	NULL,	'Tijuana',NULL,NULL,NULL,1)
INSERT INTO ORDERR VALUES(1006,	'02/09/2017',	240000.00  ,16     ,	NULL,	NULL,	'S.F.'   ,NULL,NULL,NULL,2)
INSERT INTO ORDERR VALUES(1007,	'02/10/2017',	158000.00  ,default,    NULL,	NULL,	'S.D.',	NULL,NULL,NULL,3)
INSERT INTO ORDERR VALUES(1008,	'02/11/2017',	43000.00   ,default,	NULL,	NULL,	'París',NULL,NULL,NULL,3)


--INSERCIONES TABLA ITEM
INSERT INTO ITEM VALUES (1, 'Lapiz', 2,1500,500)
INSERT INTO ITEM VALUES (2, 'Plumon', 12,1500,500)
INSERT INTO ITEM VALUES (3, 'Borrador',25,100,20)
--NO PUEDEN SER INSERTADAS POR UNA REGLA QUE EL VALOR DE REORDERPOINT>5
INSERT INTO ITEM VALUES (4, 'Mause', 120,25,5)
INSERT INTO ITEM VALUES (5, 'Impresora', 1200,5,2)
INSERT INTO ITEM VALUES (6, 'Ipod', 5500,5,2)
INSERT INTO ITEM VALUES (7, 'Ipad', 7000,10,1)



--INSERCIONES TABLA SUPPLIER
INSERT INTO Supplier VALUES(100, 'Jones'	,61,	619, 643,'Picadilly'  ,'Londres',	'Londres',	32,	'U.K.')
INSERT INTO Supplier VALUES(101, 'Smith'	,62,	620,  15,'Lombard'	 , 'S.F.'   ,	'CA'	 ,643,	'U.S.A')
INSERT INTO Supplier VALUES(102, 'Martinez'	,52,	52,	2500,'Insurgentes','GDL'    ,  'Jalisco' ,	45,	'México')


--INSERCIONES TABLA SUPPLIES	
INSERT INTO SUPPIES VALUES(	100, 1,	1.50)
INSERT INTO SUPPIES VALUES(	100, 2,	10.00)
INSERT INTO SUPPIES VALUES(	100, 3,	20.00)
INSERT INTO SUPPIES VALUES(	101, 3,	19.00)
---SOLO TENEMOS 1,2,3 SUPPIES
INSERT INTO SUPPIES VALUES(	101, 4,	100.00)
INSERT INTO SUPPIES VALUES(	101, 5,	1000.00)
INSERT INTO SUPPIES VALUES(	101, 6,	4800.00)
INSERT INTO SUPPIES VALUES(	102, 6,5000.00)
INSERT INTO SUPPIES VALUES(	102, 7,6000.00)

--INSERTAR EN TABLA CONTRAINSS
INSERT INTO CONTAINSS VALUES(1004,	1)
INSERT INTO CONTAINSS VALUES(1004,	2)
--NO SE PUEDE INSERTAR ItemNo 1, 2,3
INSERT INTO CONTAINSS VALUES(1005,	6)
INSERT INTO CONTAINSS VALUES(1006,	6)
INSERT INTO CONTAINSS VALUES(1006,	7)
INSERT INTO CONTAINSS VALUES(1007,	4)
INSERT INTO CONTAINSS VALUES(1007,	7)
INSERT INTO CONTAINSS VALUES(1008,	6)

--8.	Crea una consulta que despliegue los datos de los ítems que surte el Supplier Smith
select Supplier.supName,Item.ItemNo,Item.ItemName,Item.unitPrice,Item.qtyOnHand,Item.ReorderPoint  from 
((Item inner join SUPPIES on Item.ItemNo=SUPPIES.ItemNo) 
inner join Supplier on Supplier.supplierNo=SUPPIES.SupplierNo) where supName='Smith'

--9.	Crea una consulta  que despliegue los datos de los Customer cuyo apellido inicia con la letra  J.
select * from CUSTUMER where lastName like 'J%'

--12.	Despliega los datos de los Items en el que el punto de reorden sea mayor que 100
select * from Item where ReorderPoint>100

--13.	Despliega los clientes cuyo límite de crédito sea mayor que 15,000 o la ciudad sea Tijuana
select * from CUSTUMER where creditLimit>15000 or city='TIJ'

--14.	Despliega los datos de los proveedores cuyo país sea UK(Reino Unido)
select * from Supplier where country='U.K.'

--15.	Despliega los datos de los proveedores cuyo nombre inicie con 'S'
select * from Supplier where supName like 'S%'


--16.	Despliega los datos de las ordenes cuyo cliente sea 'Adan Perez'
select ORDERR.orderNO,ORDERR.Datee, ORDERR.totalAmount, ORDERR.tax,ORDERR.street,
ORDERR.zip,ORDERR.city,ORDERR.areaCode,ORDERR.number 
from ORDERR inner join Custumer on Orderr.custId=Custumer.custId 
where Custumer.firsName='Adan' and Custumer.lastName='Perez'  

--17.	Despliega la información de los items(incluyendo) el costo unitario de aquellos productos vendidos por el vendedor, por el proveedor 101
select Item.ItemNo,Item.ItemName,Item.unitPrice,Item.qtyOnHand,Item.ReorderPoint  from 
((Item inner join Suppies on Item.ItemNo=Suppies.ItemNo) 
inner join Supplier on Supplier.supplierNo=Suppies.SupplierNo) 
where Supplier.supplierNo=101

--18.	Despliega los datos de los artículos o items cuyo precio sea mayor que el promedio de precios
select * from Item where unitPrice > (select AVG(Item.unitPrice) FROM Item)

--19.	Calcula el acumulado de costos unitarios de los productos de cada proveedor
select distinct(Suppies.SupplierNo) as 'Proveedor', sum(Suppies.unitCost) as 'suma' from Suppies GROUP by Suppies.SupplierNo

--20.	Despliega los datos de las ordenes, ordenadas por total y fecha
select * from Orderr order by totalAmount,Datee

--21.	Despliega los datos de las ordenes junto a la información de los clientes cuyo totalAmount se encuentre entre 150,000.00 y 200,000.00
select * from Orderr inner join Custumer on orderr.custId=CUSTUMER.custId where totalAmount between 150000.00 and 200000.00


