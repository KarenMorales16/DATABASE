 create database practica14
 use practica14
 
 create table Libros(
 titulo varchar(30),
 editorial varchar(30),
 Precio decimal,
 autor varchar(30)
 )

 insert into Libros values ('Calculo','Santillana',400,'Larson'),('Calculo II','Gandhi',523.23,'Karen')
 
 create procedure par_libros_autor
  @autor varchar(30) 
 as
  select titulo, editorial,precio
   from Libros
   where autor= @autor;

 exec pa_libros_autor 'Larson';

 insert into Libros values ('El principito','Planeta',501,'Richard Bach')
  create procedure pa_libros_autor_editorial
  @autor varchar(30),
  @editorial varchar(20) 
 as
  select titulo, precio
   from libros
   where autor= @autor and
   editorial=@editorial;

    exec pa_libros_autor_editorial 'Richard Bach','Planeta';
	exec pa_libros_autor_editorial @editorial='Planeta', @autor='Richard Bach';

	create proc pa_libros_autor_editorial3
  @autor varchar(30) = '%',
  @editorial varchar(30) = '%'
 as 
  select titulo,autor,editorial,precio
   from Libros
   where autor like @autor or
   editorial like @editorial;

   exec pa_libros_autor_editorial3 'P%';

   create procedure pa_promedio
  @n1 decimal(4,2),
  @n2 decimal(4,2),
  @resultado decimal(4,2) output
  as 
   select @resultado=(@n1+@n2)/2;

   declare @variable decimal(4,2)
  execute pa_promedio 5,6, @variable output
  select @variable;


   create procedure pa_autor_sumaypromedio
  @autor varchar(30)='%',
  @suma decimal(6,2) output,
  @promedio decimal(6,2) output
  as 
   select titulo,editorial,precio
   from libros
   where autor like @autor
  select @suma=sum(precio)
   from libros
   where autor like @autor
  select @promedio=avg(precio)
   from libros
   where autor like @autor;

   declare @s decimal(6,2)
     declare @p decimal(6,2)
 execute pa_autor_sumaypromedio 'Richard Bach', @s output, @p output
 select @s as total, @p as promedio;
