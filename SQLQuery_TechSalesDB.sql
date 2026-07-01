-- Create the TechSalesDB database
CREATE DATABASE TechSalesDB;

USE TechSalesDB;


-- Create the Products table

CREATE TABLE Productos (
 ID_Producto INT IDENTITY PRIMARY KEY,
 Nombre NVARCHAR(100),
 Precio DECIMAL(10, 2),
 Stock INT,
 Categoria NVARCHAR(50)
);


-- Insert sample data into the Products table

INSERT INTO Productos (Nombre, Precio, Stock,
Categoria) VALUES
('Laptop X100', 1200.00, 15, 'Laptops'),
('Mouse Wireless', 25.50, 50, 'Perif�ricos'),
('Teclado Mec�nico', 80.99, 30, 'Perif�ricos'),
('Monitor 24 pulgadas', 200.00, 20, 'Monitores'),
('Disco Duro SSD 1TB', 150.00, 25,
'Almacenamiento');


-- Create the Customers table
CREATE TABLE Clientes (
 ID_Cliente INT IDENTITY PRIMARY KEY,
 Nombre NVARCHAR(100),
 Email NVARCHAR(100),
 Ciudad NVARCHAR(50)
);

-- Insert sample data into the Customers table

INSERT INTO Clientes (Nombre, Email, Ciudad) VALUES
('Juan P�rez', 'juan.perez@mail.com', 'Madrid'),
('Ana G�mez', 'ana.gomez@mail.com', 'Barcelona'),
('Carlos L�pez', 'carlos.lopez@mail.com',
'Valencia'),
('Mar�a Torres', 'maria.torres@mail.com',
'Sevilla'),
('Luis Mart�nez', 'luis.martinez@mail.com',
'Bilbao');


-- Create the Employees table

CREATE TABLE Empleados (
 ID_Empleado INT IDENTITY PRIMARY KEY,
 Nombre NVARCHAR(100),
 Cargo NVARCHAR(50),
 Fecha_Contratacion DATE
);

-- Insert sample data into the Employees table

INSERT INTO Empleados (Nombre, Cargo,
Fecha_Contratacion) VALUES
('Laura Fern�ndez', 'Vendedora', '2020-03-15'),
('Pedro S�nchez', 'Gerente', '2018-06-01'),
('Marta Rivera', 'Analista', '2021-11-20'),
('Jorge Castillo', 'Soporte T�cnico',
'2019-09-10'),
('Elena Vega', 'Vendedora', '2022-01-05');

-- Create the Sales table

CREATE TABLE Ventas (
 ID_Venta INT IDENTITY PRIMARY KEY,
 Fecha DATE,
 ID_Cliente INT,
 ID_Producto INT,
 Cantidad INT,
 ID_Empleado INT,
 FOREIGN KEY (ID_Cliente) REFERENCES
Clientes(ID_Cliente),
 FOREIGN KEY (ID_Producto) REFERENCES
Productos(ID_Producto),
 FOREIGN KEY (ID_Empleado) REFERENCES
Empleados(ID_Empleado)
);

-- Insert sample data into the Sales table

INSERT INTO Ventas (Fecha, ID_Cliente,
ID_Producto, Cantidad, ID_Empleado) VALUES
('2024-01-10', 1, 1, 2, 1),
('2024-01-12', 2, 3, 1, 2),
('2024-01-15', 3, 2, 3, 3),
('2024-01-18', 4, 4, 2, 4),
('2024-01-20', 5, 5, 1, 5),
('2024-01-22', 1, 2, 1, 2),
('2024-01-25', 3, 1, 1, 1),
('2024-01-27', 4, 5, 3, 3),
('2024-01-29', 2, 3, 2, 4),
('2024-01-31', 5, 4, 1, 5);

-- Create the ErrorLog table for transaction error handling

CREATE TABLE Errores (
 ID_Error INT IDENTITY PRIMARY KEY,
 Tipo NVARCHAR(100),
 Mensaje NVARCHAR(255),
 Fecha DATE
);

-- Mostrar los diferentes productos vendidos.


SELECT DISTINCT ProductID
FROM Sales.SalesOrderDetail;


-- Mostrar todos los productos vendidos y ordenados
--Tablas: Sales.SalesOrderDetail,
--Production.WorkOrder
--Campos: ProductI









