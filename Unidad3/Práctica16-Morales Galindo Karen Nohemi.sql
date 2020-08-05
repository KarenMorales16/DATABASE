--Practica 16
use Northwind 
go
create proc dbo.OverdueOrders
as
select* from dbo.Orders
where RequiredDate <getdate() and ShippedDate is null
go

alter proc dbo.OverdueOrders
as 
select convert(char(8),RequiredDate,1)RequireDate, CONVERT(char(8),OrderDate,1)OrderDate,OrderID,CustomerID,EmployeeID from Orders
where RequiredDate <GETDATE() and ShippedDate is null order by RequireDate 
go

Drop  proc dbo.OverdueOrders

create procedure dbo.MathTutor
@m1 smallint,
@m2 smallint,
@result int output
as
set @result = @m1 * @m2
go

declare @answer smallint
Execute MathTutor 5,6, @answer
output
select 'The result is: ' as 'Oracion',@answer as 'Resultado'
go
create proc dbo.NewEmployee(@LastName nvarchar (20),@FirstName nvarchar(10)) as insert Employees(LastName,FirstName)
values (@LastName,@FirstName)
return Scope_Identity()
go
declare @NewEmployeeId int
exec @NewEmployeeId=dbo.NewEmployee 
@LastName='Hankin',@FirstName='Alex'
select EmployeeID,LastName,FirstName from Employees where EmployeeID=@NewEmployeeId

