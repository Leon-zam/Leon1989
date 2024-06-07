-- Crear la base de datos
CREATE DATABASE Libreria;

-- Usar la base de datos creada
USE Libreria;
-- Crear la tabla de Autores
CREATE TABLE Autores (
    AutorID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100),
    Nacionalidad VARCHAR(50)
);

-- Crear la tabla de Libros
CREATE TABLE Libros (
    LibroID INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(200),
    AutorID INT,
    Genero VARCHAR(50),
    Precio DECIMAL(10, 2),
    FOREIGN KEY (AutorID) REFERENCES Autores(AutorID)
);

-- Crear la tabla de Clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100),
    Email VARCHAR(100)
);

-- Crear la tabla de Ventas
CREATE TABLE Ventas (
    VentaID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT,
    LibroID INT,
    Fecha DATE,
    Cantidad INT,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (LibroID) REFERENCES Libros(LibroID)
);

-- Insertar datos en la tabla de Autores
INSERT INTO Autores (Nombre, Nacionalidad) VALUES 
('Gabriel Garcia Marquez', 'Colombiano'),
('Isabel Allende', 'Chilena');

-- Insertar datos en la tabla de Libros
INSERT INTO Libros (Titulo, AutorID, Genero, Precio) VALUES 
('Cien Años de Soledad', 1, 'Realismo Mágico', 19.99),
('La Casa de los Espíritus', 2, 'Realismo Mágico', 18.50);

-- Insertar datos en la tabla de Clientes
INSERT INTO Clientes (Nombre, Email) VALUES 
('Juan Perez', 'juan.perez@example.com'),
('Maria Lopez', 'maria.lopez@example.com');

-- Insertar datos en la tabla de Ventas
INSERT INTO Ventas (ClienteID, LibroID, Fecha, Cantidad) VALUES 
(1, 1, '2024-06-25', 1),
(2, 2, '2024-03-06', 2);

SELECT L.Titulo, A.Nombre AS Autor, L.Genero, L.Precio
FROM Libros L
JOIN Autores A ON L.AutorID = A.AutorID;

SELECT V.VentaID, C.Nombre AS Cliente, L.Titulo AS Libro, V.Fecha, V.Cantidad
FROM Ventas V
JOIN Clientes C ON V.ClienteID = C.ClienteID
JOIN Libros L ON V.LibroID = L.LibroID;

SELECT A.Nombre AS Autor, SUM(V.Cantidad) AS LibrosVendidos
FROM Ventas V
JOIN Libros L ON V.LibroID = L.LibroID
JOIN Autores A ON L.AutorID = A.AutorID
GROUP BY A.Nombre;

SELECT Titulo, Precio
FROM Libros
WHERE Precio > 18;
