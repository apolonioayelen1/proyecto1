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

 /*Mostrar los diferentes productos vendidos.
*/

SELECT DISTINCT ProductID
FROM Sales.SalesOrderDetail; 

/*Mostrar todos los productos vendidos y
ordenados.*/

SELECT ProductID
FROM Sales.SalesOrderDetail
UNION ALL
SELECT ProductID
FROM Production.WorkOrder;


/*Mostrar los diferentes productos vendidos y
ordenados
--Tablas: Sales.SalesOrderDetail,
--Production.WorkOrder
--Campos: ProductID*/


SELECT DISTINCT ProductID
FROM Sales.SalesOrderDetail
UNION
SELECT ProductID
FROM Production.WorkOrder;

/*Obtener el ID y una columna denominada
sexo cuyo valores disponibles sean
“Masculino” y ”Femenino”.
*/


SELECT BusinessEntityID,
CASE WHEN Gender='F' THEN 'Femenino' ELSE
'Masculino' END Sexo
FROM HumanResources.Employee;


/*Mostrar el ID de los empleados, si tiene salario
deberá mostrarse descendente, de lo
contrario ascendente.*/

SELECT 
    BusinessEntityID, 
    SalariedFlag 
FROM 
    HumanResources.Employee 
ORDER BY 
    SalariedFlag DESC, 
    -- Si es asalariado (1), ordena por ID descendente
    CASE WHEN SalariedFlag = 1 THEN BusinessEntityID END DESC,
    -- Si no es asalariado (0), ordena por ID ascendente
    CASE WHEN SalariedFlag = 0 THEN BusinessEntityID END ASC;


/*1. Mostrar la fecha más reciente de venta.
*/

SELECT MAX (OrderDate) AS Fecha_mas_reciente
FROM Sales.SalesOrderHeader;


 /*Mostrar el precio más barato de todas las
bicicletas.

--Tablas: Production.Product
--Campos: ListPrice, Name*/

SELECT MIN(ListPrice) AS Precio
FROM Production.Product
WHERE Name LIKE '%BIKE%';

/*Mostrar la fecha de nacimiento del empleado
más joven
*/

SELECT MIN(BirthDate) 
FROM HumanResources.Employee;


/*Mostrar el promedio del listado de precios de
productos.
*/


SELECT AVG(ListPrice) AS Promedio_de_productos
FROM Production.Product;


/*Mostrar la cantidad de ventas y el total
vendido
*/

SELECT COUNT(1) AS Cantidad,
SUM(LineTotal) AS Total
FROM Sales.SalesOrderDetail;


/*Mostrar el código de subcategoría y el precio
del producto más barato de cada una de ellas*/

SELECT ProductSubcategoryID, ListPrice, ProductID
FROM Production.Product PP
WHERE ListPrice=(SELECT MIN(ListPrice) ListPrice
FROM Production.Product PP1
WHERE
PP.ProductSubcategoryID=PP1.ProductSubcategoryID)
ORDER BY ProductSubcategoryID

/*Mostrar los productos y la cantidad total
vendida de cada uno de ellos.*/

SELECT ProductID, SUM(OrderQty) AS Cantidad
FROM Sales.SalesOrderDetail
GROUP BY ProductID;


/*Mostrar los productos y el total vendido de
cada uno de ellos, ordenados por el total
vendido.*/

SELECT ProductID, SUM(LineTotal) AS Total 
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY SUM(LineTotal);


/*Mostrar el promedio vendido por factura.*/

SELECT SalesOrderID, AVG(LineTotal) AS
Promedio
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID;


/*Mostrar todas las facturas realizadas y
el total facturado de cada una de ellas
ordenado por número de factura pero sólo de
aquellas órdenes superen un total de $10.000.*/

SELECT SalesOrderID, SUM(LineTotal) AS Total
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING SUM(LineTotal) > 10000;


/*Mostrar la cantidad de facturas que vendieron
más de 20 unidades.*/

SELECT SalesOrderID, SUM(OrderQty) AS Total
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING SUM(OrderQty) > 20;

 /*Mostrar las subcategorías de los productos
que tienen dos o más productos que cuestan
menos de $150.*/

SELECT ProductSubcategoryID,
COUNT(ProductSubcategoryID) AS Cantidad
FROM Production.Product
WHERE ListPrice < 150
GROUP BY ProductSubcategoryID
HAVING COUNT(ProductSubcategoryID) > 2


  /*Mostrar todos los códigos de subcategorías
existentes junto con la cantidad para los
productos cuyo precio de lista sea mayor a
$70 y el precio promedio sea mayor a $ 300.*/

SELECT ProductSubcategoryID,
COUNT(ProductSubcategoryID) AS Cantidad,
AVG(ListPrice) AS Promedio
FROM Production.Product
WHERE ListPrice > 70
GROUP BY ProductSubcategoryID
HAVING AVG(ListPrice) > 300;


/*Mostrar el número de factura, el monto
vendido, y al final, totalizar la facturación.*/

SELECT SalesOrderID, SUM(UnitPrice * OrderQty)
AS Total
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID WITH ROLLUP;









