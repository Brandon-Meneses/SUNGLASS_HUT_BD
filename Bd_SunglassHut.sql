-- Crear la base de datos BD_SUNGLASS_HUT
CREATE DATABASE BD_SUNGLASS_HUT
GO
-- Cambiar al contexto de la base de datos BD_SUNGLASS_HUT
USE BD_SUNGLASS_HUT
GO
-- Crear la tabla Distritos
CREATE TABLE Distritos (
   Distrito INT PRIMARY KEY,
   Nombre NVARCHAR(50)
)
GO

-- Crear la tabla Provincia
CREATE TABLE Provincia (
   Codigo INT PRIMARY KEY,
   Nombre NVARCHAR(50)
)
GO

-- Crear la tabla Vendedor
CREATE TABLE Vendedor (
   COD_VENDEDOR VARCHAR(20) PRIMARY KEY,
   DNI VARCHAR(8),
   NOMBRE VARCHAR(30),
   TELEFONO INT,
   CORREO VARCHAR(30),
   DIRECCION VARCHAR(30),
   Distrito INT,
   Provincia INT,
   FOREIGN KEY (Distrito) REFERENCES Distritos(Distrito),
   FOREIGN KEY (Provincia) REFERENCES Provincia(Codigo)
)
GO

-- Crear la tabla Cliente
CREATE TABLE Cliente (
   COD_CLIENTE VARCHAR(20) PRIMARY KEY,
   DNI VARCHAR(8),
   NOMBRE VARCHAR(30),
   TELEFONO INT,
   CORREO VARCHAR(30),
   DIRECCION VARCHAR(30),
   Distrito INT,
   Provincia INT,
   FOREIGN KEY (Distrito) REFERENCES Distritos(Distrito),
   FOREIGN KEY (Provincia) REFERENCES Provincia(Codigo)
)
GO

-- Crear la tabla Sucursal
CREATE TABLE Sucursal (
   CODIGO_SUCURSAL int PRIMARY KEY,
   NOMBRE VARCHAR(50) NOT NULL,
   DIRECCION VARCHAR(70) NOT NULL,
   Distrito INT,
   Provincia INT,
   TELEFONO INT NOT NULL,
   CORREO VARCHAR(40) NOT NULL,
   CATEGORIA VARCHAR(20) NOT NULL,
   COD_VENDEDOR VARCHAR(20) NOT NULL,
   FOREIGN KEY (COD_VENDEDOR) REFERENCES Vendedor(COD_VENDEDOR),
   FOREIGN KEY (Distrito) REFERENCES Distritos(Distrito),
   FOREIGN KEY (Provincia) REFERENCES Provincia(Codigo)
)
GO

-- Crear la tabla Proveedor
CREATE TABLE Proveedor (
   COD_PROVEE INT PRIMARY KEY,
   NOM_PROVEE VARCHAR(50),
   DIRECCION VARCHAR(70),
   SucursalID INT,
   FOREIGN KEY (SucursalID) REFERENCES Sucursal(CODIGO_SUCURSAL)
)
GO

-- Crear la tabla Producto
CREATE TABLE Producto (
   COD_PRODUCTO VARCHAR(20) PRIMARY KEY,
   STOCK INT,
   PRECIO VARCHAR(20),
   DESCRIPCION VARCHAR(50),
   ProveedorID INT
)
GO

-- Crear la tabla Factura
CREATE TABLE Factura (
   CODIGO_FACTURA INT PRIMARY KEY,
   FECHA_PAGO DATE,
   TIPO VARCHAR(20),
   COD_VENDEDOR VARCHAR(20),
   COD_CLIENTE VARCHAR(20),
   COD_PRODUCTO VARCHAR(20),
   FOREIGN KEY (COD_VENDEDOR) REFERENCES Vendedor(COD_VENDEDOR),
   FOREIGN KEY (COD_CLIENTE) REFERENCES Cliente(COD_CLIENTE)
)
GO

-- Crear la tabla Factura_Producto
CREATE TABLE Factura_Producto (
   COD_FAC_PROD INT PRIMARY KEY,
   NOMBRE_O_CODIGO VARCHAR(50),
   RUC_EMISOR VARCHAR(20),
   NOMBRE_COMERCIAL VARCHAR(50),
   COD_FACTURA INT,
   COD_PRODUCTO VARCHAR(20),
   DESCRIPCION_PRODUCTO VARCHAR(50),
   IMPORTE_VENTA DECIMAL(10,2),
   FECHA_HORA DATETIME,
   FOREIGN KEY (COD_FACTURA) REFERENCES Factura(CODIGO_FACTURA),
   FOREIGN KEY (COD_PRODUCTO) REFERENCES Producto(COD_PRODUCTO)
)
GO

--INSERTANDO VALORES: 
INSERT INTO Distritos (Distrito, Nombre) VALUES (1, 'Cercado de Lima');
INSERT INTO Distritos (Distrito, Nombre) VALUES (3, 'Ate');
INSERT INTO Distritos (Distrito, Nombre) VALUES (4, 'Barranco');
INSERT INTO Distritos (Distrito, Nombre) VALUES (5, 'Breña');
INSERT INTO Distritos (Distrito, Nombre) VALUES (7, 'Comas');
INSERT INTO Distritos (Distrito, Nombre) VALUES (9, 'Chorrillos');
INSERT INTO Distritos (Distrito, Nombre) VALUES (10, 'El Agustino');
INSERT INTO Distritos (Distrito, Nombre) VALUES (11, 'Jesús María');
INSERT INTO Distritos (Distrito, Nombre) VALUES (12, 'La Molina');
INSERT INTO Distritos (Distrito, Nombre) VALUES (13, 'La Victoria');
INSERT INTO Distritos (Distrito, Nombre) VALUES (14, 'Lince');
INSERT INTO Distritos (Distrito, Nombre) VALUES (17, 'Magdalena del Mar');
INSERT INTO Distritos (Distrito, Nombre) VALUES (18, 'Miraflores');
INSERT INTO Distritos (Distrito, Nombre) VALUES (21, 'Pueblo Libre');
INSERT INTO Distritos (Distrito, Nombre) VALUES (22, 'Puente Piedra');
INSERT INTO Distritos (Distrito, Nombre) VALUES (25, 'Rimac');
INSERT INTO Distritos (Distrito, Nombre) VALUES (27, 'San Isidro');
INSERT INTO Distritos (Distrito, Nombre) VALUES (28, 'Independencia');
INSERT INTO Distritos (Distrito, Nombre) VALUES (29, 'San Juan de Miraflores');
INSERT INTO Distritos (Distrito, Nombre) VALUES (30, 'San Luis');
INSERT INTO Distritos (Distrito, Nombre) VALUES (31, 'San Martin de Porres');
INSERT INTO Distritos (Distrito, Nombre) VALUES (32, 'San Miguel');
INSERT INTO Distritos (Distrito, Nombre) VALUES (33, 'Santiago de Surco');
INSERT INTO Distritos (Distrito, Nombre) VALUES (34, 'Surquillo');
INSERT INTO Distritos (Distrito, Nombre) VALUES (35, 'Villa María del Triunfo');
INSERT INTO Distritos (Distrito, Nombre) VALUES (36, 'San Juan de Lurigancho');
INSERT INTO Distritos (Distrito, Nombre) VALUES (38, 'Santa Rosa');
INSERT INTO Distritos (Distrito, Nombre) VALUES (39, 'Los Olivos');
INSERT INTO Distritos (Distrito, Nombre) VALUES (41, 'San Borja');
INSERT INTO Distritos (Distrito, Nombre) VALUES (42, 'Villa El Savador');
INSERT INTO Distritos (Distrito, Nombre) VALUES (43, 'Santa Anita');
go
SELECT * FROM Distritos
go
-- Insertar datos en la tabla Provincia
INSERT INTO Provincia (Codigo, Nombre) VALUES (1, 'Lima y Callao');
INSERT INTO Provincia (Codigo, Nombre) VALUES (41, 'Amazonas');
INSERT INTO Provincia (Codigo, Nombre) VALUES (43, 'Ancash');
INSERT INTO Provincia (Codigo, Nombre) VALUES (83, 'Apurimac');
INSERT INTO Provincia (Codigo, Nombre) VALUES (54, 'Arequipa');
INSERT INTO Provincia (Codigo, Nombre) VALUES (66, 'Ayacucho');
INSERT INTO Provincia (Codigo, Nombre) VALUES (76, 'Cajamarca');
INSERT INTO Provincia (Codigo, Nombre) VALUES (84, 'Cusco');
INSERT INTO Provincia (Codigo, Nombre) VALUES (67, 'Huancavelica');
INSERT INTO Provincia (Codigo, Nombre) VALUES (62, 'Huanuco');
INSERT INTO Provincia (Codigo, Nombre) VALUES (56, 'Ica');
INSERT INTO Provincia (Codigo, Nombre) VALUES (64, 'Junin');
INSERT INTO Provincia (Codigo, Nombre) VALUES (44, 'La Libertad');
INSERT INTO Provincia (Codigo, Nombre) VALUES (74, 'Lambayeque');
INSERT INTO Provincia (Codigo, Nombre) VALUES (65, 'Loreto');
INSERT INTO Provincia (Codigo, Nombre) VALUES (82, 'Madre de Dios');
INSERT INTO Provincia (Codigo, Nombre) VALUES (53, 'Moquegua');
INSERT INTO Provincia (Codigo, Nombre) VALUES (63, 'Pasco');
INSERT INTO Provincia (Codigo, Nombre) VALUES (73, 'Piura');
INSERT INTO Provincia (Codigo, Nombre) VALUES (51, 'Puno');
INSERT INTO Provincia (Codigo, Nombre) VALUES (42, 'San Martin');
INSERT INTO Provincia (Codigo, Nombre) VALUES (52, 'Tacna');
INSERT INTO Provincia (Codigo, Nombre) VALUES (72, 'Tumbes');
INSERT INTO Provincia (Codigo, Nombre) VALUES (61, 'Ucayali');
go
SELECT * FROM Provincia
go
-- Insertar datos en la tabla Vendedor
INSERT INTO Vendedor (COD_VENDEDOR, DNI, NOMBRE, TELEFONO, CORREO, DIRECCION, Distrito, Provincia)
VALUES
    ('VD001', '12345678', 'Juan Pérez', 987654321, 'juan@example.com', 'Calle Principal 123', 1, 41),
    ('VD002', '23456789', 'María Gómez', 987654322, 'maria@example.com', 'Avenida Central 456', 3, 43),
    ('VD003', '34567890', 'Pedro Rodríguez', 987654323, 'pedro@example.com', 'Plaza Mayor 789', 4, 83),
    ('VD004', '45678901', 'Ana López', 987654324, 'ana@example.com', 'Calle Secundaria 987', 5, 54),
    ('VD005', '56789012', 'Carlos García', 987654325, 'carlos@example.com', 'Avenida Norte 654', 7, 66),
    ('VD006', '67890123', 'Laura Fernández', 987654326, 'laura@example.com', 'Calle Sur 321', 9, 76),
    ('VD007', '78901234', 'Miguel Torres', 987654327, 'miguel@example.com', 'Avenida Oeste 789', 10, 84),
    ('VD008', '89012345', 'Sofía Ramírez', 987654328, 'sofia@example.com', 'Plaza Este 456', 11, 67),
    ('VD009', '90123456', 'Eduardo Sánchez', 987654329, 'eduardo@example.com', 'Calle Poniente 123', 13, 62),
    ('VD010', '01234567', 'Isabel Romero', 987654330, 'isabel@example.com', 'Avenida Central 789', 14, 56),
    ('VD011', '11223344', 'Gabriel Vargas', 987654331, 'gabriel@example.com', 'Plaza Principal 456', 17, 64),
    ('VD012', '22334455', 'Valentina Cruz', 987654332, 'valentina@example.com', 'Calle Principal 987', 18, 44),
    ('VD013', '33445566', 'Fernando Mendoza', 987654333, 'fernando@example.com', 'Avenida Central 654', 21, 74),
    ('VD014', '44556677', 'Daniela Torres', 987654334, 'daniela@example.com', 'Calle Norte 321', 25, 65),
    ('VD015', '55667788', 'Roberto Jiménez', 987654335, 'roberto@example.com', 'Plaza Mayor 789', 27, 82);
go
SELECT * FROM Vendedor
go
-- Insertar datos en la tabla Cliente
INSERT INTO Cliente (COD_CLIENTE, DNI, NOMBRE, TELEFONO, CORREO, DIRECCION, Distrito, Provincia)
VALUES
    ('CL001', '12345678', 'Ana Pérez', 987654321, 'ana@example.com', 'Calle Principal 123', 1, 1),
    ('CL002', '23456789', 'Pedro Gómez', 987654322, 'pedro@example.com', 'Avenida Central 456', 3, 43),
    ('CL003', '34567890', 'María Rodríguez', 987654323, 'maria@example.com', 'Plaza Mayor 789', 4, 54),
    ('CL004', '45678901', 'Juan López', 987654324, 'juan@example.com', 'Calle Secundaria 987', 5, 66),
    ('CL005', '56789012', 'Sofía García', 987654325, 'sofia@example.com', 'Avenida Norte 654', 7, 76),
    ('CL006', '67890123', 'Carlos Fernández', 987654326, 'carlos@example.com', 'Calle Sur 321', 9, 84),
    ('CL007', '78901234', 'Laura Torres', 987654327, 'laura@example.com', 'Avenida Oeste 789', 10, 67),
    ('CL008', '89012345', 'Miguel Ramírez', 987654328, 'miguel@example.com', 'Plaza Este 456', 11, 62),
    ('CL009', '90123456', 'Isabel Sánchez', 987654329, 'isabel@example.com', 'Calle Poniente 123', 13, 56),
    ('CL010', '01234567', 'Gabriel Romero', 987654330, 'gabriel@example.com', 'Avenida Central 789', 14, 64),
    ('CL011', '11223344', 'Valentina Vargas', 987654331, 'valentina@example.com', 'Plaza Principal 456', 17, 44),
    ('CL012', '22334455', 'Fernando Cruz', 987654332, 'fernando@example.com', 'Calle Principal 987', 18, 74),
    ('CL013', '33445566', 'Daniela Mendoza', 987654333, 'daniela@example.com', 'Avenida Central 654', 21, 65),
    ('CL014', '44556677', 'Roberto Torres', 987654334, 'roberto@example.com', 'Calle Norte 321', 25, 82),
    ('CL015', '55667788', 'Eduardo Jiménez', 987654335, 'eduardo@example.com', 'Plaza Mayor 789', 27, 51);
go
SELECT * FROM Cliente
go
-- Insertar datos en la tabla Sucursal 
INSERT INTO Sucursal (CODIGO_SUCURSAL, NOMBRE, DIRECCION, Distrito, Provincia, TELEFONO, CORREO, CATEGORIA, COD_VENDEDOR)
VALUES
    (1, 'Sucursal Lima', 'Calle Principal 123', 1, 1, 987654321, 'sucursal_lima@example.com', 'Principal', 'VD001'),
    (2, 'Sucursal Ate', 'Avenida Central 456', 3, 43, 987654322, 'sucursal_ate@example.com', 'Principal', 'VD002'),
    (3, 'Sucursal Barranco', 'Plaza Mayor 789', 4, 54, 987654323, 'sucursal_barranco@example.com', 'Principal', 'VD003'),
    (4, 'Sucursal Breña', 'Calle Secundaria 987', 5, 66, 987654324, 'sucursal_brena@example.com', 'Principal', 'VD004'),
    (5, 'Sucursal Comas', 'Avenida Norte 654', 7, 76, 987654325, 'sucursal_comas@example.com', 'Principal', 'VD005'),
    (6, 'Sucursal Chorrillos', 'Calle Sur 321', 9, 84, 987654326, 'sucursal_chorrillos@example.com', 'Principal', 'VD006'),
    (7, 'Sucursal El Agustino', 'Avenida Oeste 789', 10, 67, 987654327, 'sucursal_elagustino@example.com', 'Principal', 'VD007'),
    (8, 'Sucursal Jesús María', 'Plaza Este 456', 11, 62, 987654328, 'sucursal_jesusmaria@example.com', 'Principal', 'VD008'),
    (9, 'Sucursal La Molina', 'Calle Poniente 123', 13, 56, 987654329, 'sucursal_lamolina@example.com', 'Principal', 'VD009'),
    (10, 'Sucursal La Victoria', 'Avenida Central 789', 14, 64, 987654330, 'sucursal_lavictoria@example.com', 'Principal', 'VD010'),
    (11, 'Sucursal Lince', 'Plaza Principal 456', 17, 44, 987654331, 'sucursal_lince@example.com', 'Principal', 'VD011'),
    (12, 'Sucursal Magdalena del Mar', 'Calle Principal 987', 18, 74, 987654332, 'sucursal_magdalena@example.com', 'Principal', 'VD012'),
    (13, 'Sucursal Miraflores', 'Avenida Central 654', 21, 65, 987654333, 'sucursal_miraflores@example.com', 'Principal', 'VD013'),
    (14, 'Sucursal Pueblo Libre', 'Calle Norte 321', 25, 82, 987654334, 'sucursal_pueblolibre@example.com', 'Principal', 'VD014'),
    (15, 'Sucursal Puente Piedra', 'Plaza Mayor 789', 27, 51, 987654335, 'sucursal_puentepiedra@example.com', 'Principal', 'VD015');
	go

SELECT * FROM Sucursal
go

-- Insertar datos en la tabla Proveedor 
INSERT INTO Proveedor (COD_PROVEE, NOM_PROVEE, DIRECCION, SucursalID)
VALUES

    (1, 'Proveedor A', 'Calle Principal 123', 1),
    (2, 'Proveedor B', 'Avenida Central 456', 2),
    (3, 'Proveedor C', 'Plaza Mayor 789', 3),
    (4, 'Proveedor D', 'Calle Secundaria 987', 4),
    (5, 'Proveedor E', 'Avenida Norte 654', 5),
    (6, 'Proveedor F', 'Calle Sur 321', 6),
    (7, 'Proveedor G', 'Avenida Oeste 789', 7),
    (8, 'Proveedor H', 'Plaza Este 456', 8),
    (9, 'Proveedor I', 'Calle Poniente 123', 9),
    (10, 'Proveedor J', 'Avenida Central 789', 10),
    (11, 'Proveedor K', 'Plaza Principal 456', 11),
    (12, 'Proveedor L', 'Calle Principal 987', 12),
    (13, 'Proveedor M', 'Avenida Central 654', 13),
    (14, 'Proveedor N', 'Calle Norte 321', 14),
    (15, 'Proveedor O', 'Plaza Mayor 789', 15);
go

-- Insertar datos en la tabla Producto
INSERT INTO Producto (COD_PRODUCTO, STOCK, PRECIO, DESCRIPCION, ProveedorID)
VALUES ('P001', 50, '49.99', 'Gafas de sol Aviador', 1);

INSERT INTO Producto (COD_PRODUCTO, STOCK, PRECIO, DESCRIPCION, ProveedorID)
VALUES ('P002', 30, '39.99', 'Gafas de sol Wayfarer', 2);

INSERT INTO Producto (COD_PRODUCTO, STOCK, PRECIO, DESCRIPCION, ProveedorID)
VALUES ('P003', 20, '59.99', 'Gafas de sol Cat Eye', 3);

INSERT INTO Producto (COD_PRODUCTO, STOCK, PRECIO, DESCRIPCION, ProveedorID)
VALUES ('P004', 40, '69.99', 'Gafas de sol Clubmaster', 4);

INSERT INTO Producto (COD_PRODUCTO, STOCK, PRECIO, DESCRIPCION, ProveedorID)
VALUES ('P005', 35, '79.99', 'Gafas de sol Rectangulares', 5);

INSERT INTO Producto (COD_PRODUCTO, STOCK, PRECIO, DESCRIPCION, ProveedorID)
VALUES ('P006', 25, '89.99', 'Gafas de sol Redondas', 6);

INSERT INTO Producto (COD_PRODUCTO, STOCK, PRECIO, DESCRIPCION, ProveedorID)
VALUES ('P007', 50, '49.99', 'Gafas de sol Deportivas', 7);

INSERT INTO Producto (COD_PRODUCTO, STOCK, PRECIO, DESCRIPCION, ProveedorID)
VALUES ('P008', 30, '59.99', 'Gafas de sol Oversize', 8);

INSERT INTO Producto (COD_PRODUCTO, STOCK, PRECIO, DESCRIPCION, ProveedorID)
VALUES ('P009', 45, '69.99', 'Gafas de sol Retro', 9);

INSERT INTO Producto (COD_PRODUCTO, STOCK, PRECIO, DESCRIPCION, ProveedorID)
VALUES ('P010', 28, '79.99', 'Gafas de sol Polarizadas', 10);

INSERT INTO Producto (COD_PRODUCTO, STOCK, PRECIO, DESCRIPCION, ProveedorID)
VALUES ('P011', 15, '89.99', 'Gafas de sol Cuadradas', 11);

INSERT INTO Producto (COD_PRODUCTO, STOCK, PRECIO, DESCRIPCION, ProveedorID)
VALUES ('P012', 32, '49.99', 'Gafas de sol Vintage', 12);

INSERT INTO Producto (COD_PRODUCTO, STOCK, PRECIO, DESCRIPCION, ProveedorID)
VALUES ('P013', 37, '59.99', 'Gafas de sol Estilo Cateye', 13);

INSERT INTO Producto (COD_PRODUCTO, STOCK, PRECIO, DESCRIPCION, ProveedorID)
VALUES ('P014', 23, '69.99', 'Gafas de sol Deportivas', 14);

INSERT INTO Producto (COD_PRODUCTO, STOCK, PRECIO, DESCRIPCION, ProveedorID)
VALUES ('P015', 41, '79.99', 'Gafas de sol Clásicas', 15);
GO

SELECT * FROM Producto
go

-- Insertar datos en la tabla Factura 
INSERT INTO Factura (CODIGO_FACTURA, FECHA_PAGO, TIPO, COD_VENDEDOR, COD_CLIENTE, COD_PRODUCTO)
VALUES
    (1, '2023-06-01', 'Contado', 'VD001', 'CL001', 'LEN001'),
    (2, '2023-06-02', 'Crédito', 'VD002', 'CL002', 'LEN002'),
    (3, '2023-06-03', 'Contado', 'VD003', 'CL003', 'LEN003'),
    (4, '2023-06-04', 'Crédito', 'VD004', 'CL004', 'LEN004'),
    (5, '2023-06-05', 'Contado', 'VD005', 'CL005', 'LEN005'),
    (6, '2023-06-06', 'Crédito', 'VD006', 'CL006', 'LEN006'),
    (7, '2023-06-07', 'Contado', 'VD007', 'CL007', 'LEN007'),
    (8, '2023-06-08', 'Crédito', 'VD008', 'CL008', 'LEN008'),
    (9, '2023-06-09', 'Contado', 'VD009', 'CL009', 'LEN009'),
    (10, '2023-06-10', 'Crédito', 'VD010', 'CL010', 'LEN010'),
    (11, '2023-06-11', 'Contado', 'VD011', 'CL011', 'LEN011'),
    (12, '2023-06-12', 'Crédito', 'VD012', 'CL012', 'LEN012'),
    (13, '2023-06-13', 'Contado', 'VD013', 'CL013', 'LEN013'),
    (14, '2023-06-14', 'Crédito', 'VD014', 'CL014', 'LEN014'),
    (15, '2023-06-15', 'Contado', 'VD015', 'CL015', 'LEN015');
GO

SELECT * FROM Factura
go

-- Insertar datos en la tabla Factura_Producto
INSERT INTO Factura_Producto (COD_FAC_PROD, NOMBRE_O_CODIGO, RUC_EMISOR, NOMBRE_COMERCIAL, COD_FACTURA, COD_PRODUCTO, DESCRIPCION_PRODUCTO, IMPORTE_VENTA, FECHA_HORA)
VALUES (1, 'Ticket001', '12345678901', 'Empresa A', 1, 'P001', 'Gafas de sol Aviador', 49.99, '2023-07-01 10:30:00');

INSERT INTO Factura_Producto (COD_FAC_PROD, NOMBRE_O_CODIGO, RUC_EMISOR, NOMBRE_COMERCIAL, COD_FACTURA, COD_PRODUCTO, DESCRIPCION_PRODUCTO, IMPORTE_VENTA, FECHA_HORA)
VALUES (2, 'Ticket002', '23456789012', 'Empresa B', 1, 'P002', 'Gafas de sol Wayfarer', 39.99, '2023-07-01 11:15:00');

INSERT INTO Factura_Producto (COD_FAC_PROD, NOMBRE_O_CODIGO, RUC_EMISOR, NOMBRE_COMERCIAL, COD_FACTURA, COD_PRODUCTO, DESCRIPCION_PRODUCTO, IMPORTE_VENTA, FECHA_HORA)
VALUES (3, 'Ticket003', '34567890123', 'Empresa C', 2, 'P003', 'Gafas de sol Cat Eye', 59.99, '2023-07-02 09:45:00');

INSERT INTO Factura_Producto (COD_FAC_PROD, NOMBRE_O_CODIGO, RUC_EMISOR, NOMBRE_COMERCIAL, COD_FACTURA, COD_PRODUCTO, DESCRIPCION_PRODUCTO, IMPORTE_VENTA, FECHA_HORA)
VALUES (4, 'Ticket004', '45678901234', 'Empresa D', 2, 'P004', 'Gafas de sol Clubmaster', 69.99, '2023-07-02 14:20:00');

INSERT INTO Factura_Producto (COD_FAC_PROD, NOMBRE_O_CODIGO, RUC_EMISOR, NOMBRE_COMERCIAL, COD_FACTURA, COD_PRODUCTO, DESCRIPCION_PRODUCTO, IMPORTE_VENTA, FECHA_HORA)
VALUES (5, 'Ticket005', '56789012345', 'Empresa E', 3, 'P005', 'Gafas de sol Rectangulares', 79.99, '2023-07-03 12:10:00');

INSERT INTO Factura_Producto (COD_FAC_PROD, NOMBRE_O_CODIGO, RUC_EMISOR, NOMBRE_COMERCIAL, COD_FACTURA, COD_PRODUCTO, DESCRIPCION_PRODUCTO, IMPORTE_VENTA, FECHA_HORA)
VALUES (6, 'Ticket006', '67890123456', 'Empresa F', 3, 'P006', 'Gafas de sol Redondas', 89.99, '2023-07-03 16:45:00');

INSERT INTO Factura_Producto (COD_FAC_PROD, NOMBRE_O_CODIGO, RUC_EMISOR, NOMBRE_COMERCIAL, COD_FACTURA, COD_PRODUCTO, DESCRIPCION_PRODUCTO, IMPORTE_VENTA, FECHA_HORA)
VALUES (7, 'Ticket007', '78901234567', 'Empresa G', 4, 'P007', 'Gafas de sol Deportivas', 49.99, '2023-07-04 10:30:00');

INSERT INTO Factura_Producto (COD_FAC_PROD, NOMBRE_O_CODIGO, RUC_EMISOR, NOMBRE_COMERCIAL, COD_FACTURA, COD_PRODUCTO, DESCRIPCION_PRODUCTO, IMPORTE_VENTA, FECHA_HORA)
VALUES (8, 'Ticket008', '89012345678', 'Empresa H', 4, 'P008', 'Gafas de sol Oversize', 59.99, '2023-07-04 11:45:00');

INSERT INTO Factura_Producto (COD_FAC_PROD, NOMBRE_O_CODIGO, RUC_EMISOR, NOMBRE_COMERCIAL, COD_FACTURA, COD_PRODUCTO, DESCRIPCION_PRODUCTO, IMPORTE_VENTA, FECHA_HORA)
VALUES (9, 'Ticket009', '90123456789', 'Empresa I', 5, 'P009', 'Gafas de sol Retro', 69.99, '2023-07-05 09:20:00');

INSERT INTO Factura_Producto (COD_FAC_PROD, NOMBRE_O_CODIGO, RUC_EMISOR, NOMBRE_COMERCIAL, COD_FACTURA, COD_PRODUCTO, DESCRIPCION_PRODUCTO, IMPORTE_VENTA, FECHA_HORA)
VALUES (10, 'Ticket010', '01234567890', 'Empresa J', 5, 'P010', 'Gafas de sol Polarizadas', 79.99, '2023-07-05 14:50:00');

INSERT INTO Factura_Producto (COD_FAC_PROD, NOMBRE_O_CODIGO, RUC_EMISOR, NOMBRE_COMERCIAL, COD_FACTURA, COD_PRODUCTO, DESCRIPCION_PRODUCTO, IMPORTE_VENTA, FECHA_HORA)
VALUES (11, 'Ticket011', '12345678901', 'Empresa A', 6, 'P011', 'Gafas de sol Cuadradas', 89.99, '2023-07-06 11:10:00');

INSERT INTO Factura_Producto (COD_FAC_PROD, NOMBRE_O_CODIGO, RUC_EMISOR, NOMBRE_COMERCIAL, COD_FACTURA, COD_PRODUCTO, DESCRIPCION_PRODUCTO, IMPORTE_VENTA, FECHA_HORA)
VALUES (12, 'Ticket012', '23456789012', 'Empresa B', 6, 'P012', 'Gafas de sol Vintage', 49.99, '2023-07-06 13:40:00');

INSERT INTO Factura_Producto (COD_FAC_PROD, NOMBRE_O_CODIGO, RUC_EMISOR, NOMBRE_COMERCIAL, COD_FACTURA, COD_PRODUCTO, DESCRIPCION_PRODUCTO, IMPORTE_VENTA, FECHA_HORA)
VALUES (13, 'Ticket013', '34567890123', 'Empresa C', 7, 'P013', 'Gafas de sol Estilo Cateye', 59.99, '2023-07-07 09:15:00');

INSERT INTO Factura_Producto (COD_FAC_PROD, NOMBRE_O_CODIGO, RUC_EMISOR, NOMBRE_COMERCIAL, COD_FACTURA, COD_PRODUCTO, DESCRIPCION_PRODUCTO, IMPORTE_VENTA, FECHA_HORA)
VALUES (14, 'Ticket014', '45678901234', 'Empresa D', 7, 'P014', 'Gafas de sol Deportivas', 69.99, '2023-07-07 15:30:00');

INSERT INTO Factura_Producto (COD_FAC_PROD, NOMBRE_O_CODIGO, RUC_EMISOR, NOMBRE_COMERCIAL, COD_FACTURA, COD_PRODUCTO, DESCRIPCION_PRODUCTO, IMPORTE_VENTA, FECHA_HORA)
VALUES (15, 'Ticket015', '56789012345', 'Empresa E', 8, 'P015', 'Gafas de sol Clásicas', 79.99, '2023-07-08 12:45:00');
GO

SELECT * FROM Factura_Producto
go

--Consultas normales: 
--Mostrar todos los registros de la tabla clientes.
 
SELECT * FROM Cliente
GO
--Mostrar los campos COD_CLIENTE, DNI, NOMBRE de la tabla CLIENTE
SELECT COD_CLIENTE,DNI,NOMBRE  from Cliente
GO

--MOSTRAR TODOS LOS PRODUCTOS Y SU DESCRIPCIÓN EN LA QUE SU STOCK ESTÉ ENTRE 25 Y 50
 
SELECT STOCK, DESCRIPCION FROM PRODUCTO WHERE (STOCK>=25 and STOCK<=50) ORDER BY STOCK ASC
GO

-- Actualizar los datos de tipo varchar de la tabla producto, suprimiendo el signo de “S/.” y los “0” a la derecha del punto decimal:

UPDATE PRODUCTO
SET PRECIO = CAST(SUBSTRING(REPLACE(PRECIO, 'S/.', ''), 1, CHARINDEX('.', REPLACE(PRECIO, 'S/.', '')) - 1) AS INT)
SELECT precio from Producto ORDER by PRECIO ASC
GO 

--Mostrar todos los productos que el precio sea menor que 1000.
 
SELECT P. * FROM Producto P WHERE P.PRECIO <100 order by PRECIO asc
GO

--Mostrar todas las fechas de los comprobantes de pago de manera ascendente.
 
SELECT F. * FROM FACTURA F ORDER BY F.FECHA_PAGO ASC
Go

--MOSTRAR LA TABLA TICKET PEDIDO DONDE EL IMPORTE DE VENTA SEA MAYOR A 130 
SELECT * FROM Factura_Producto WHERE (IMPORTE_VENTA > 13) ORDER BY IMPORTE_VENTA ASC
GO

--Mostrar los productos que tengan stock entre 5 y 20 
 
SELECT P. * FROM PRODUCTO P WHERE P.STOCK >=5 and P.STOCK <=20 
Go

--Mostrar todos los productos que terminen en R  
 
SELECT * FROM PRODUCTO  WHERE DESCRIPCION LIKE '%r'
go

--CONSULTAS DE LA TABLA PROVINCIA--
--MOSTRAR LAS PROVINCIAS EN ORDEN ALFABÉTICO INVERSO.
SELECT Nombre
FROM Provincia
ORDER BY  Nombre DESC
GO

-- Mostrar a todos los clientes con su dirección y su código de distrito
SELECT NOMBRE, DIRECCION, Distrito FROM Cliente
GO

--MOSTRAR EL NÚMERO TOTAL DE PROVINCIAS
SELECT COUNT(*) AS TotalProvincias
FROM Provincia
GO

--MOSTRAR TODOS LOS NOMBRES DE LA TABLA PROVINCIA QUE EMPIECEN CON LA LETRA A--
SELECT Nombre FROM Provincia  WHERE Nombre like 'A%'
GO

-- MOSTRAR TODOS LOS CÓDIGOS DE LAS PROVINCIAS QUE SEAN INFERIORES A 60 DE FORMA ASCENDENTE--
SELECT * FROM Provincia WHERE Codigo < '60' ORDER BY Codigo ASC
GO

--CONSULTAS DE LA TABLA DISTRITOS–
--DISTRITOS QUE NO TIENEN LA LETRA "a" EN SU NOMBRE.

SELECT Distrito, Nombre
FROM Distritos
WHERE Nombre NOT LIKE '%a%'
GO

 -- SELECCIONAR DE LA TABLA LOS NOMBRES QUE EMPIEZAN CON C Y EL NÚMERO DE DISTRITO SEAN MENORES A 20--
SELECT * FROM Distritos WHERE (Nombre like 'C%') or (Distrito < 20)
go

-- MOSTRAR LOS NOMBRES QUE EMPIECEN CON LA LETRA S Y QUE EL NÚMERO DE DISTRITO SEA MAYOR A 25--
SELECT * FROM Distritos WHERE Distrito > 25 AND Nombre LIKE 'S%'
GO

--Mostrar código,  nombre, dni, telefono y correo del vendedor en la que la factura tenga el código de vendedor “VD013”
SELECT COD_VENDEDOR, NOMBRE, DNI, TELEFONO, CORREO
FROM Vendedor
WHERE COD_VENDEDOR IN (SELECT COD_VENDEDOR FROM FACTURA WHERE COD_VENDEDOR='VD013')
GO

--Mostrar el nombre de la tabla CLIENTE, el código de producto de la tabla PRODUCTO y la descripción del producto de la tabla PRODUCTO
SELECT c.NOMBRE AS Nombre_Cliente, p.COD_PRODUCTO, p.DESCRIPCION
FROM Cliente c
INNER JOIN Factura f ON c.COD_CLIENTE = f.COD_CLIENTE
INNER JOIN Factura_Producto fp ON f.CODIGO_FACTURA = fp.COD_FACTURA
INNER JOIN Producto p ON fp.COD_PRODUCTO = p.COD_PRODUCTO;
go
--Convertir el precio a Real y actualizar el Precio de venta de todos los registros de la tabla producto incrementando en un 20%
ALTER TABLE Producto
ALTER COLUMN PRECIO REAL

UPDATE Producto
SET PRECIO = PRECIO*1.20

SELECT PRECIO FROM Producto
 go

--SUBCONSULTAS DE LA TABLA PROVINCIA--
--NOMBRE DE LA PROVINCIA CON EL CÓDIGO MÁS ALTO 
SELECT Nombre
FROM Provincia
WHERE Codigo = (
  SELECT MAX(Codigo)
  FROM Provincia
)
go

--SUBCONSULTAS DE LA TABLA PROVINCIA–
--PROVINCIA QUE TIENE EL NOMBRE MÁS CORTO EN TÉRMINOS DE CARACTERES.
SELECT Nombre
FROM Provincia
WHERE LEN(Nombre)= (
  SELECT MIN(LEN(Nombre))
  FROM Provincia)
  go
--SUBCONSULTA DE LA TABLA DISTRITOS--
--MOSTRAR LOS DISTRITOS CUYO CÓDIGO ES PAR Y TIENEN LA PALABRA “SAN” EN SU NOMBRE
SELECT Distrito, Nombre
FROM Distritos
WHERE Distrito % 2 = 0 AND NOMBRE LIKE 'SAN%'
GO

--Obtener los productos con un precio de venta superior a cualquier precio de venta registrado en la tabla Factura_Producto:
SELECT *
FROM Producto
WHERE PRECIO > ANY (SELECT IMPORTE_VENTA
                    FROM Factura_Producto)
GO

--Obtener nombre y correo de los clientes que han realizado una compra en una sucursal ubicada en la provincia de Lima y Callao:
SELECT NOMBRE,CORREO
FROM Cliente
WHERE COD_CLIENTE IN (SELECT COD_CLIENTE
                      FROM Factura
                      WHERE COD_PRODUCTO IN (SELECT COD_PRODUCTO
                                            FROM Sucursal
                                            WHERE Provincia = 1))
GO

--Obtener nombre y dni de vendedores que tienen al menos una factura de tipo "Crédito":
SELECT v.NOMBRE as NombreVendedor, v.DNI as DNI
FROM Vendedor v
WHERE COD_VENDEDOR IN (SELECT COD_VENDEDOR
                       FROM Factura
                       WHERE TIPO = 'Crédito')
GO

--Obtener los productos que son suministrados por proveedores ubicados en la provincia de Lima y Callao:
SELECT *
FROM Producto 
WHERE ProveedorID IN (SELECT COD_PROVEE
                      FROM Proveedor
                      WHERE SucursalID IN (SELECT CODIGO_SUCURSAL
                                           FROM Sucursal
                                           WHERE Provincia = 1))
go

--Obtener el nombre de los vendedores y la cantidad de productos vendidos por cada uno de ellos
SELECT V.NOMBRE AS NombreVendedor, COUNT(FP.COD_PRODUCTO) AS CantidadProductosVendidos
FROM Vendedor V, Factura F, Factura_Producto FP
WHERE V.COD_VENDEDOR = F.COD_VENDEDOR
  AND F.CODIGO_FACTURA = FP.COD_FACTURA
GROUP BY V.NOMBRE
go

--Obtener el nombre de los clientes que han comprado productos suministrados por un proveedor en particular:
SELECT C.NOMBRE AS NombreCliente
FROM Cliente C, Factura F, Factura_Producto FP, Producto P, Proveedor PR
WHERE C.COD_CLIENTE = F.COD_CLIENTE
  AND F.CODIGO_FACTURA = FP.COD_FACTURA
  AND FP.COD_PRODUCTO = P.COD_PRODUCTO
  AND P.ProveedorID = PR.COD_PROVEE
  AND PR.NOM_PROVEE = 'Proveedor A'
go

--PROCEDIMIENTOS:
-- PROCEDIMIENTO PARA OBTENER EL NOMBRE DEL VENDEDOR Y EN LA SUCURSAL QUE SE ENCUENTRA:
 CREATE PROCEDURE VendedorSucursal
AS
BEGIN
	SELECT V.Nombre AS 'Nombre Vendedor', S.Nombre AS 'Nombre Sucursal'
	FROM Vendedor V
	JOIN Sucursal S ON V.COD_VENDEDOR = S.COD_VENDEDOR
END
GO
EXEC VendedorSucursal;
GO

--CUANTAS VENTAS HIZO EL VENDEDOR:
CREATE PROCEDURE ObtenerVentasPorVendedor
AS
BEGIN
	SELECT V.Nombre AS Vendedor, COUNT(*) AS TotalVentas
	FROM Vendedor V
	INNER JOIN Factura F ON V.COD_VENDEDOR = F.COD_VENDEDOR
	GROUP BY V.Nombre;
END;
Go
EXEC ObtenerVentasPorVendedor;
GO
-- PROCEDIMIENTO PARA OBTENER EL NOMBRE DEL VENDEDOR Y EN LA SUCURSAL QUE SE ENCUENTRA:
CREATE PROCEDURE SucursalDistritoProvincia
AS
BEGIN
	SELECT S.Nombre AS 'Nombre Sucursal', D.Nombre AS 'Nombre Distrito', P.Nombre AS 'Nombre Provincia'
	FROM Sucursal S
	JOIN Distritos D ON S.Distrito = D.Distrito
	JOIN Provincia P ON S.Provincia = P.Codigo
END
GO
EXEC SucursalDistritoProvincia;
GO
-- OBTENER EL PRODUCTO QUE TIENE MENOR STOCK:
CREATE PROCEDURE ProductoMenorStock
AS
BEGIN
	SELECT TOP 1 DESCRIPCION AS Producto, Stock
	FROM Producto
	ORDER BY Stock ASC;
END;
go
EXEC ProductoMenorStock;
go

--BUSCAR UNA FACTURA EN ESPECÍFICO MEDIANTE SU FECHA DE PAGO:
DROP PROC BuscarFacturasPorFechadePago
GO
CREATE PROCEDURE BuscarFacturasPorFechadePago
    @FECHA_PAGO DATE
AS
BEGIN
	SELECT COD_CLIENTE,COD_PRODUCTO,CODIGO_FACTURA, FECHA_PAGO
	FROM Factura
	WHERE FECHA_PAGO = @FECHA_PAGO;
END;
go
DECLARE @FechaPago DATE = '2023-06-01';
EXEC BuscarFacturasPorFechadePago @FechaPago;
go
--OBTENER LA CANTIDAD TOTAL DE PRODUCTOS QUE HAY:
 CREATE FUNCTION CantidadTotalProductos()
RETURNS INT
AS
BEGIN
	DECLARE @CantidadTotalProductos INT;
	SELECT @CantidadTotalProductos = SUM(Stock) FROM Producto;
	RETURN @CantidadTotalProductos;
END
go
DECLARE @Resultado INT;
SELECT @Resultado = dbo.CantidadTotalProductos();
PRINT 'La cantidad total de productos es: ' + CAST(@Resultado AS VARCHAR);
go

-- Constraint
-- Esta restriccion UNIQUE es para evitar que haya DNI duplicados en la tabla cliente

ALTER TABLE Cliente
ADD CONSTRAINT UQ_DNI_Cliente
UNIQUE (DNI);
go


-- Esta restriccion UNIQUE es para evitar que haya DNI duplicados en la tabla vendedor

ALTER TABLE Vendedor
ADD CONSTRAINT UQ_DNI_Vendedor
UNIQUE (DNI);
go
--Restricción CHECK para asegurar que el STOCK de los productos sea siempre mayor o igual a cero
ALTER TABLE Producto
ADD CONSTRAINT CHK_STOCK_Producto
CHECK (STOCK >= 0);
go
--Restricción UNIQUE para evitar nombre de proveedor duplicados

ALTER TABLE Proveedor
ADD CONSTRAINT UQ_NOM_PROVEE_Proveedor
UNIQUE (NOM_PROVEE);
go

-- Restricción CHECK para que el importe de venta sea siempre mayor o igual a cero

ALTER TABLE Factura_Producto
ADD CONSTRAINT CHK_IMPORTE_VENTA_Ticket_Pedido
CHECK (IMPORTE_VENTA >= 0);
go

-- 1.- Mostrar el código, dni, nombre, correo, dirección y distrito del cliente y el código del vendedor --
drop view lista_clientes
go
create view lista_clientes
as
select c.COD_CLIENTE, c.DNI, c.NOMBRE, c.CORREO, c.DIRECCION, v.COD_VENDEDOR, c.Distrito
from Cliente c 
inner join Vendedor v on v.Distrito = c.Distrito
go
select * from lista_clientes

-- 2.- Mostrar el código y dirección de la sucursal, el código del vendedor, el código de distrito y código de provincia --
drop view vista_sucursal
go
create view vista_sucursal
as
select s.CODIGO_SUCURSAL, s.COD_VENDEDOR, s.DIRECCION, s.Distrito as 'Codigo de Distrito', s.Provincia as 'Código de Provincia'
from Sucursal s
inner join Vendedor v on v.COD_VENDEDOR = s.COD_VENDEDOR
inner join Distritos d on d.Distrito = s.Distrito
inner join Provincia p on p.Codigo = s.Provincia
go
select * from vista_sucursal
go

-- 3.- Mostrar el importe de venta que sea mayor a 59, caso contrario; mostrar el código de producto P005 con su código de factura 3, agregando la fecha y hora del importe y la descripción del producto --
drop view importe_fac_prod
go
create view importe_fac_prod
as
select f.IMPORTE_VENTA, f.FECHA_HORA, f.COD_PRODUCTO, f.DESCRIPCION_PRODUCTO, f.COD_FACTURA
from Factura_Producto f
inner join Producto p on p.COD_PRODUCTO = f.COD_PRODUCTO
inner join Factura v on v.CODIGO_FACTURA = f.COD_FACTURA
where (f.IMPORTE_VENTA > 59 ) or (f.COD_PRODUCTO = 'P005') and (COD_FACTURA = '3')
go
select * from importe_fac_prod

-- 4.- Mostrar el código de cliente, su dirección y teléfono, además agregarle la tabla vendedor mostrando su código, correo y código de distrito --
drop view vista_cli_vend
go

create view vista_cli_vend
as
select C.COD_CLIENTE, V.COD_VENDEDOR, C.DIRECCION, V.CORREO, C.TELEFONO, V.Distrito
from Cliente as C 
inner join Vendedor as V on V.Distrito = C.Distrito
go
select * from vista_cli_vend
go
-- 5.- Mostrar los datos de las tablas factura, vendedor y cliente, donde se muestre el codigo de vendedor, código de cliente y que el código de factura sea menor o igual a 10--
drop view tot_tablas
go
create view tot_tablas
as
select f.CODIGO_FACTURA, f.COD_VENDEDOR, f.COD_CLIENTE
from Factura f
inner join Vendedor v on v.COD_VENDEDOR = f.COD_VENDEDOR
inner join Cliente e on e.COD_CLIENTE = f.COD_CLIENTE
where (f.CODIGO_FACTURA <= 10)
go
select * from tot_tablas
go
-- 6.- Mostrar los datos de la tabla Producto en la que el stock sea menor a 30 y su descripción, además de mostrar el código del proveedor --
drop view v_produc
go
create view v_produc
as
select p.STOCK as 'Stock del producto', p.DESCRIPCION as 'Descripcion del producto', p.ProveedorID as 'Codigo de Proveedor'
from Producto p
inner join Proveedor r on r.COD_PROVEE = p.ProveedorID
where p.STOCK < 30
go
select * from v_produc
go
-- 7.- Mostrar los nombres que terminen en "a", dirección y correo de la tabla sucursal, a su vez mostrar los datos del código de la tabla vendedor, mostrar el código de la tabla provincia y en la tabla distrito mostrar solamente los códigos menores a 18 --
drop view suc_vend 
go
create view suc_vend
as
select s.NOMBRE, s.DIRECCION, s.CORREO ,s.COD_VENDEDOR, v.TELEFONO, s.Distrito, s.Provincia
from Sucursal s
inner join Vendedor v on v.COD_VENDEDOR = s.COD_VENDEDOR
inner join Provincia p on p.Codigo = s.Provincia
inner join Distritos d on d.Distrito = s.Distrito
where (s.NOMBRE like '%a') and (d.Distrito < 18)
go
select * from suc_vend
go
-- 8.- Mostrar el nombre del Mes de la fecha y hora en la tabla Factura_Producto, su nombre o código, nombre de la sucursal e importe de venta, agregando los datos de los códigos tanto de las tablas factura y producto --
drop view mes_tick
go
create view mes_tick
as
select datename (month, (f.FECHA_HORA)) as 'Nombre Mes', f.NOMBRE_O_CODIGO, f.NOMBRE_COMERCIAL, f.IMPORTE_VENTA, f.COD_FACTURA, f.COD_PRODUCTO
from Factura_Producto f
inner join Factura a on a.CODIGO_FACTURA = f.COD_FACTURA
inner join Producto p on p.COD_PRODUCTO = f.COD_PRODUCTO
where year(FECHA_HORA) = '2023'
go
select * from mes_tick

-- 9.- Mostrar los stocks máximos de cada producto que suministra cada proveedor con su código --
drop view v_max_stock
go
create view v_max_stock
as
select (max(p.STOCK)) as 'Stock maximo', p.ProveedorID
from Producto p
inner join Proveedor r on r.COD_PROVEE = p.ProveedorID
group by ProveedorID
go
select * from v_max_stock
go

-- 10.- Mostrar el código, nombre, dirección, código y categoría de la tabla Sucursal, donde la dirección debe terminar en el número 9 y mostrar el código de vendedor --
drop view v_sucur_provi
go
create view v_sucur_provi
as
select s.CODIGO_SUCURSAL, s.NOMBRE, s.DIRECCION, p.Codigo, s.CATEGORIA, v.COD_VENDEDOR
from Sucursal s
inner join Provincia p on p.Codigo = s.Provincia
inner join Vendedor v on v.COD_VENDEDOR = s.COD_VENDEDOR
where s.DIRECCION like '%9'
go
select * from v_sucur_provi
go