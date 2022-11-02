/* Base de datos Jugueteria, primera entrega proyecto final */
/* Creamos la base de datos jugueteria y la seleccionamos */

CREATE SCHEMA jugueteria;
USE jugueteria2;

/* Empezamos a crear la tablas de las bases de datos */

CREATE TABLE proveedores(
	id_proveedor INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(60),
    telefono INT NOT NULL,
    email VARCHAR(60),
    direccion VARCHAR(60),
    PRIMARY KEY(id_proveedor)
);

CREATE TABLE juguetes(
	id_juguete INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(60) NOT NULL,
    precio_juguete DECIMAL(11,2) NOT NULL,
    id_proveedor INT NOT NULL, 
    PRIMARY KEY(id_juguete),
    FOREIGN KEY(id_proveedor) REFERENCES proveedores(id_proveedor)
);

CREATE TABLE descripcion(
	id_juguete INT NOT NULL AUTO_INCREMENT,
	descripcion VARCHAR(80) NOT NULL,
    marca VARCHAR(30),
    PRIMARY KEY(id_juguete),
    FOREIGN KEY(id_juguete) REFERENCES juguetes(id_juguete)
);

CREATE TABLE stock(
	id_juguete INT NOT NULL AUTO_INCREMENT,
    stock INT NOT NULL,
    PRIMARY KEY(id_juguete),
    FOREIGN KEY(id_juguete) REFERENCES juguetes(id_juguete)
);

CREATE TABLE ubicaciones(
	id_ubicacion INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(60),
    direccion VARCHAR(60),
    telefono INT NOT NULL,
    mail VARCHAR(60) NOT NULL,
    PRIMARY KEY(id_ubicacion)
);

CREATE TABLE stock_sucursal_1(
    id_juguete INT NOT NULL,
    stock INT NOT NULL,
    FOREIGN KEY(id_juguete) REFERENCES juguetes(id_juguete)
);

CREATE TABLE stock_sucursal_2(
    id_juguete INT NOT NULL,
    stock INT NOT NULL,
    FOREIGN KEY(id_juguete) REFERENCES juguetes(id_juguete)
);

CREATE TABLE stock_deposito(
    id_juguete INT NOT NULL,
    stock INT NOT NULL,
    FOREIGN KEY(id_juguete) REFERENCES juguetes(id_juguete)
);

CREATE TABLE choferes(
	id_chofer INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(60),
    apellido VARCHAR(60) NOT NULL,
    mail VARCHAR(60),
    telefono INT NOT NULL,
    PRIMARY KEY(id_chofer)
);

CREATE TABLE movimientos(
	id_movimiento INT NOT NULL AUTO_INCREMENT,
    fecha DATE NOT NULL,
    hora time, 
    id_chofer INT NOT NULL,
    salida INT NOT NULL,
    destino INT NOT NULL,
    PRIMARY KEY(id_movimiento),
    FOREIGN KEY(id_chofer) REFERENCES choferes(id_chofer),
    FOREIGN KEY(salida) REFERENCES ubicaciones(id_ubicacion),
    FOREIGN KEY(destino) REFERENCES ubicaciones(id_ubicacion)
);