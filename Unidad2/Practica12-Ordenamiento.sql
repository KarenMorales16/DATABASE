create database Ordenamiento
use Ordenamiento


ALTER  PROCEDURE Orde
    @A int,
    @B int, 
    @C int 
AS
BEGIN
DECLARE @NumM INT
DECLARE @NumM2 INT
DECLARE @NumM3 INT
IF(@A >= @B AND @B>=@C)
BEGIN
SET @NumM= @A
SET @NumM2= @B
SET @NumM3= @C
END

ELSE IF(@B >= @A AND @A>=@C)
BEGIN
SET @NumM= @B
SET @NumM2= @A
SET @NumM3= @C
END

ELSE IF(@C >= @A AND @A>=@B)
BEGIN
SET @NumM= @C
SET @NumM2= @A
SET @NumM3= @B
END


ELSE IF(@A >= @C AND @C>=@B)
BEGIN
SET @NumM= @A
SET @NumM2= @C
SET @NumM3= @B
END



ELSE IF(@B >= @C AND @C>=@A)
BEGIN
SET @NumM= @B
SET @NumM2= @C
SET @NumM3= @A
END


ELSE IF(@C >= @B AND @B>=@A)
BEGIN 
SET @NumM= @C
SET @NumM2= @B
SET @NumM3= @A
END
SELECT   @NumM  as 'Numero Mayor' ,@NumM2 as 'Numero Medio' ,@NumM3 as 'Numero Menor', @A AS 'Num 1', @B AS 'Num2', @C AS ' Num3';
END

 execute  Orde @A=50, @B=5, @C=90  
 execute  Orde @A=50, @B=50, @C=90
 execute  Orde @A=1000, @B=5, @C=90  
 execute  Orde @A=50, @B=5, @C=800  
