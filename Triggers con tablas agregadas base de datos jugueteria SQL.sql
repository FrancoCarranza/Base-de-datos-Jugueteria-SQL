/* Creacion de triggers */


USE jugueteria;

/* El primer trigger se ejecuta cuando agregamos un juguete a la tabla juguetes, se agrega en una tabla aparte de precios_juguetes
el precio del juguete normal y calcula con el uso de funciones los diferentes tipos de descuentos y los agrega. */

CREATE TABLE precios_juguetes(
	id INT NOT NULL,
    precio_normal DECIMAL(11,2) NOT NULL,
    precio_club_la_voz DECIMAL (11,2) NOT NULL,
    precio_naranja DECIMAL(11,2) NOT NULL,
    precio_efectivo DECIMAL(11,2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(id) REFERENCES juguetes(id_juguete)
);

CREATE TRIGGER `precios_juguetes`
AFTER INSERT ON `juguetes`
FOR EACH ROW
INSERT INTO `precios_juguetes` (id, precio_normal, precio_club_la_voz, precio_naranja, precio_efectivo)
VALUES 
(NEW.id_juguete, NEW.precio_juguete, (descuento_clubLaVoz(NEW.precio_juguete)), (descuento_naranja(NEW.precio_juguete)), (descuento_efectivo(NEW.precio_juguete)));

/* El segundo trigger se ejecuta al eliminar un chofer de la tabla ya que no ejerce mas su puesto, se agrega en una tabla aparte 
choferes_antiguos todos los choferes eliminados con la fecha de ese dia. */

CREATE TABLE choferes_antiguos(
	id INT NOT NULL,
    nombre VARCHAR(40),
	apellido VARCHAR(40) NOT NULL,
	mail VARCHAR(60) NOT NULL,
    telefono VARCHAR(40),
    fecha DATE NOT NULL,
    PRIMARY KEY(id)
);

CREATE TRIGGER `choferes_antiguos`
AFTER DELETE ON `choferes`
FOR EACH ROW
INSERT INTO `choferes_antiguos` (id, nombre, apellido, mail, telefono, fecha) 
VALUES (OLD.id_chofer, OLD.nombre, OLD.apellido, OLD.mail, OLD.telefono, current_date());