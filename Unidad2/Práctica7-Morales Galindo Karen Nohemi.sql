--CREAR BASE DE DATOS DE EMPLEADOS
CREATE DATABASE EMPLEADOS

-- 1. Crea un tipo de dato denominado texto que sea varchar (30)
EXEC sp_addtype Texto, 'VARCHAR(30)'

-- 2. Crea un tipo de dato denominado numero que sea tipo entero no nulos
EXEC sp_addtype Numero, 'int' , 'NOT NULL'

-- 3. Crea una tabla denominada empleado, con atributos:
Create Table EMPLEADO(
Id_Empleado int identity,
Nombre varchar(50),
Departamento varchar(50))

-- 4. Crea default denominado departamento que tenga como valor la palabra sistemas.

create default Departamento as 'Sistemas'

-- 5. Enlaza el valor por default al atributo departamento.

exec sp_bindefault Departamento, 'EMPLEADO.Departamento'

-- 6. Crea un valor por default denominado Ciudad, que tenga como dato la palabra Tijuana.
create default cuidad  as 'Tijuana'

-- 8. Enlaza el valor por default al tributo ciudad.
exec sp_bindefault cuidad, 'EMPLEADO.Cuidad'


-- 7. Agrega el atributo ciudad a la tabla empleado, como dato de tipo varchar(15)
ALTER TABLE EMPLEADO ADD Cuidad varchar(15)


-- 9. Agrega a la tabla empleado el atributo bono, con un tipo de dato decimal (8,2)
ALTER TABLE EMPLEADO ADD Bono decimal(8,2)


-- 10. Crea un valor por default denominado bono, que almacena la cantidad de $12,000.00
create default Bono as  '12000.00'



-- 11. Enlaza el var por default denominado bono al atributo bono en la tabla empleado
exec sp_bindefault Bono, 'EMPLEADO.Bono'

--Insertar
insert into EMPLEADO values(default,default,default,default)

--Mirar Tabla
select * from EMPLEADO