/*1. Mostrar el ID de los empleados que tienen
más de 90 horas de vacaciones.
*/

SELECT VacationHours, BusinessEntityID
FROM HumanResources.Employee
WHERE VacationHours > 90;



/*2.Mostrar el nombre, precio de lista y precio de
lista con IVA de los productos con precio
distinto de cero.*/

SELECT Name, ListPrice, ListPrice * 1.21 AS IVAPrice
FROM Production.Product
WHERE ListPrice > 0;



/*3.Mostrar precio de lista y nombre de los
productos 776, 777, 778
*/

SELECT ProductID, Name, ListPrice
FROM Production.Product
WHERE ProductID IN (776, 777, 778);



/*4.Mostrar el nombre concatenado con el
apellido de las personas cuyo apellido sea
Johnson*/

SELECT FirstName + ' ' + LastName 
FROM Person.Person
WHERE LastName = 'Johnson';



/*5.Mostrar todos los productos cuyo precio de
lista sea inferior a $150 de color rojo o cuyo
precio de lista sea mayor a $500 de color
negro.
*/

SELECT ProductID, ListPrice, Color
FROM Production.Product
WHERE (ListPrice < 150 AND Color = 'Red') OR (ListPrice > 500 AND Color = 'Black');



 /*6.Mostrar el ID, fecha de ingreso y horas de
vacaciones de los empleados que ingresaron
a partir del año 2000.
*/

SELECT BusinessEntityID, HireDate,
VacationHours
FROM HumanResources.Employee
WHERE HireDate >= '2000-01-01';



/*7. Mostrar los representantes de ventas
(vendedores) que no tienen definido el número
de territorio
*/

SELECT BusinessEntityID, TerritoryID
FROM Sales.SalesPerson
WHERE TerritoryID is NULL;



/*8.Mostrar el peso de todos los artículos. Si el
peso no estuviese definido, reemplazar por
cero.
*/

SELECT ProductID, ISNULL(Weight, 0) AS Weight
FROM Production.Product;



/*9.Mostrar el nombre, precio y color de los
accesorios para asientos, las bicicletas cuyo
precio sea mayor a 100 pesos.
*/

SELECT Name, ListPrice, Color
FROM Production.Product
WHERE Name like '%seat%' AND ListPrice < 100;



/*10Mostrar el nombre de los productos que
tengan cualquier combinación de ´mountain
bike´.
*/

SELECT Name
FROM Production.Product
WHERE Name LIKE '%mountain bike%';



/*11.Mostrar las personas que en la segunda letra
de su apellido tienen una ´s´.
*/

SELECT LastName
FROM Person.Person
WHERE LastName LIKE '_s%';



 /*12.Mostrar el nombre concatenado con el
apellido de las personas cuyo apellido
terminen en ´ez´.
*/

SELECT CONCAT(FirstName, ' ',LastName) 
FROM Person.Person
WHERE LastName LIKE '%ez';



/*13.Mostrar los nombres de los productos que
terminen en un número.
*/

SELECT Name 
FROM Production.Product
WHERE Name LIKE '%[0-9]';



/*14.Mostrar las personas cuyo nombre tenga una
´C´ como primer caracter, cualquier otro
como segundo caracter, ni ´d´   ni ´e´  ni ´f´  ni ´g´ 
como tercer caracter, cualquiera entre ´j´ y ´r´  o
entre ´s´ y ´w´ como cuarto caracter y el resto
sin restricciones
*/

SELECT FirstName 
FROM Person.Person
WHERE FirstName LIKE 'C_[^defg][j-rw]%';



/*15Mostrar todos los productos cuyo precio de
lista esté entre 200 y 300.
*/

SELECT ListPrice 
FROM Production.Product 
WHERE ListPrice BETWEEN 200 AND 300;



/*Mostrar todos los empleados que nacieron
entre 1970 y 1985.*/

SELECT BirthDate
FROM HumanResources.Employee
WHERE YEAR (BirthDate) BETWEEN 1970 AND 1985;



 /*Mostrar la fecha, número de cuenta y subtotal
de las órdenes de venta efectuadas en los
años 2005 y 2006
*/

SELECT OrderDate, AccountNumber, SubTotal
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2005-01-01' AND '2006-12-31';



 /*Mostrar todas las órdenes de venta cuyo
Subtotal no está entre 50 y 70
*/

SELECT OrderDate, AccountNumber, SubTotal
FROM Sales.SalesOrderHeader
WHERE SubTotal NOT BETWEEN 50 AND 70;



/*Mostrar los códigos de orden de venta, código
de producto, cantidad vendida y precio
unitario de los productos 750, 753 y 770.
*/

SELECT SalesOrderID, ProductID, OrderQty, UnitPrice
FROM Sales.SalesOrderDetail
WHERE ProductID IN (750, 753, 770);



/*Mostrar todos los productos cuyo color sea
verde, blanco y azul.
*/

SELECT Color AS Color_del_Producto
from Production.Product
WHERE Color IN ('White', 'Green', 'Blue');



 /*Mostrar las personas ordenadas, primero por
su apellido y luego por su nombre.*/

SELECT *
FROM Person.Person
ORDER BY Lastname, Firstname

/*Mostrar los cinco productos más caros y su
nombre, ordenados en forma alfabética.*/

SELECT TOP 5 *
FROM Production.Product
ORDER BY ListPrice desc, name

