---
--MORALES GALINDO KAREN NOHEMI 16210977
CREATE DATABASE DIOSCITOSALVAME
USE  DIOSCITOSALVAME

--1)
CREATE FUNCTION DBO.FECHASS (@DIA DATE)
RETURNS INT
AS
BEGIN
DECLARE  @RE INT
SET @RE=(Select DATEDIFF(DAY,GETDATE(),@DIA) as Datediff)
RETURN @RE
END

SELECT DBO.FECHASS('2018/08/1')

--2)
SELECT REPLACE ('T.B.D','T.B.D','TALLER DE BASE DE DATOS') AS 'PALABRA REMPLAZADA'

--3)
SELECT REPLACE ('xxx.sqlserver.com','x','w')

 
--4)
SELECT LEN ('HOLA') AS CANTIDAD

--5)
use pub select upper(titles.title) from titles

--6)
create function dbo.sueldo(@horas decimal,@sh decimal)
returns  decimal
as begin
declare @st decimal
set @st=(@horas*@sh)
return @st
end

Select dbo.Sueldo(40,150)