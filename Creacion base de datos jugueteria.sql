/* Base de datos Jugueteria, entrega proyecto final */
/* Creamos la base de datos jugueteria_caranza y la seleccionamos */

CREATE SCHEMA jugueteria_carranza;
USE jugueteria_carranza;

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
    marca VARCHAR(30) NOT NULL,
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
    nombre VARCHAR(60) NOT NULL,
    direccion VARCHAR(60)NOT NULL,
    telefono INT NOT NULL,
    mail VARCHAR(60) NOT NULL,
    PRIMARY KEY(id_ubicacion)
);

CREATE TABLE stock_sucursal_1(
    id_juguete INT NOT NULL,
    stock INT NOT NULL,
    PRIMARY KEY(id_juguete),
    FOREIGN KEY(id_juguete) REFERENCES juguetes(id_juguete)
);

CREATE TABLE stock_sucursal_2(
    id_juguete INT NOT NULL,
    stock INT NOT NULL,
    PRIMARY KEY(id_juguete),
    FOREIGN KEY(id_juguete) REFERENCES juguetes(id_juguete)
);

CREATE TABLE stock_deposito(
    id_juguete INT NOT NULL,
    stock INT NOT NULL,
    PRIMARY KEY(id_juguete),
    FOREIGN KEY(id_juguete) REFERENCES juguetes(id_juguete)
);

CREATE TABLE choferes(
	id_chofer INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(60) NOT NULL,
    apellido VARCHAR(60) NOT NULL,
    mail VARCHAR(60) NOT NULL,
    telefono VARCHAR(30) NOT NULL,
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

CREATE TABLE clientes(
	id_cliente INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    telefono VARCHAR(30) NOT NULL,
    mail VARCHAR(60) NOT NULL,
    PRIMARY KEY(id_cliente)
);

CREATE TABLE precios_juguetes(
	id_juguete INT NOT NULL,
    precio_normal DECIMAL(11,2) NOT NULL,
    precio_club_la_voz DECIMAL (11,2) NOT NULL,
    precio_naranja DECIMAL(11,2) NOT NULL,
    precio_efectivo DECIMAL(11,2) NOT NULL,
    PRIMARY KEY (id_juguete),
    FOREIGN KEY(id_juguete) REFERENCES juguetes(id_juguete)
);

CREATE TABLE choferes_antiguos(
	id_chofer INT NOT NULL,
    nombre VARCHAR(40) NOT NULL,
	apellido VARCHAR(40) NOT NULL,
	mail VARCHAR(60) NOT NULL,
    telefono VARCHAR(40),
    fecha DATE NOT NULL,
    PRIMARY KEY(id_chofer)
);

CREATE TABLE ventas_juguetes (
	id_venta INT NOT NULL AUTO_INCREMENT,
	id_juguete INT NOT NULL,
    ventas INT NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY (id_venta),
    FOREIGN KEY(id_juguete) REFERENCES juguetes(id_juguete)
);

CREATE TABLE empleados (
	id_empleado INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    telefono VARCHAR(60) NOT NULL,
    mail VARCHAR(75) NOT NULL,
    PRIMARY KEY(id_empleado)
);

CREATE TABLE puestos_trabajo (
	id_puesto INT NOT NULL AUTO_INCREMENT,
    puesto VARCHAR(30) NOT NULL,
    descripcion VARCHAR(150),
    PRIMARY KEY(id_puesto)
);

CREATE TABLE empleados_info (
	id_empleado INT NOT NULL,
    sueldo DECIMAL(11,2) NOT NULL,
    puesto INT NOT NULL,
    ubicacion INT,
    PRIMARY KEY(id_empleado),
    FOREIGN KEY(id_empleado) REFERENCES empleados(id_empleado),
    FOREIGN KEY(puesto) REFERENCES puestos_trabajo(id_puesto),
    FOREIGN KEY(ubicacion) REFERENCES ubicaciones(id_ubicacion)
);

CREATE TABLE empleados_antiguos (
	id_empleado INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    mail VARCHAR(60) NOT NULL,
    telefono VARCHAR(40) NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY(id_empleado)
);

CREATE TABLE compras(
	id_compra INT NOT NULL AUTO_INCREMENT,
    id_juguete INT NOT NULL,
    id_cliente INT NOT NULL,
    cantidad INT DEFAULT 1 NOT NULL,
    precio_total DECIMAL(11,2),
    fecha DATE NOT NULL,
    id_empleado INT NOT NULL,
    id_ubicacion INT NOT NULL,
    PRIMARY KEY (id_compra),
    FOREIGN KEY (id_juguete) REFERENCES juguetes(id_juguete),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
    FOREIGN KEY(id_ubicacion) REFERENCES ubicaciones(id_ubicacion)
);


/* Vistas para base de datos jugueteria */

USE jugueteria_carranza;

/* Creamos la pimera vista la cual nos muestra el stock de los juguetes en total,
y tambien la cantidad de stock del juguete en las diferentes ubicaciones*/

CREATE VIEW juguetes_stock AS(
SELECT
	j.id_juguete,
    j.nombre AS juguete, 
    s.stock AS stock_total,
    a.stock AS stock_sucursal_1,
    b.stock AS stock_sucursal_2,
    c.stock AS stock_deposito
FROM juguetes AS j
JOIN stock AS s
JOIN stock_sucursal_1 AS a
JOIN stock_sucursal_2 AS b
JOIN stock_deposito AS c
ON(j.id_juguete=s.id_juguete) AND (s.id_juguete=a.id_juguete) AND (a.id_juguete=b.id_juguete) AND (b.id_juguete=c.id_juguete)
);

/* Creamos la segunda vista la cual muestra los juguetes con sus descripciones*/

CREATE VIEW juguetes_descipcion AS(
SELECT
	j.id_juguete,
    j.nombre AS juguete,
    d.descripcion
FROM juguetes AS j
JOIN descripcion AS d
ON(j.id_juguete=d.id_juguete)
);

/* Creamos la tercea vista la cual muestra los juguetes y sus proveedores */

CREATE VIEW juguetes_proveedores AS(
SELECT 
	j.id_juguete,
    j.nombre AS juguete,
    p.id_proveedor,
    p.nombre AS proveedor,
    p.telefono,
    p.email
FROM juguetes AS j
JOIN proveedores AS p
ON(j.id_proveedor=p.id_proveedor)
);

/* Creamos la cuarta vista la cual muesta  los movimientos realizados
 con la informacion de los choferes que realizaron cada movimiento ordenado por fecha*/

CREATE VIEW movimientos_info AS(
SELECT
	m.id_movimiento, 
    m.fecha,
    m.id_chofer,
    c.nombre,
    c.apellido AS apellido_chofer,
    c.telefono AS telefono_chofer
FROM movimientos AS m
JOIN choferes AS c
ON(m.id_chofer=c.id_chofer)
ORDER BY m.fecha
);

/* Creamos la quinta vista la cual muestra los juguetes sin stock en el deposito */

CREATE VIEW deposito_juguetes_nulos AS(
SELECT
	j.id_juguete,
    j.nombre AS juguete,
    s.stock
FROM juguetes AS j
JOIN stock_deposito AS s
ON(j.id_juguete=s.id_juguete)
WHERE s.stock = 0
);

/* Creamos la sexta vista la cual muestra los juguetes sin stock en la sucursal 1 */

CREATE VIEW sucursal1_juguetes_nulos AS(
SELECT
	j.id_juguete,
    j.nombre AS juguete,
    s.stock
FROM juguetes AS j
JOIN stock_sucursal_1 AS s
ON(j.id_juguete=s.id_juguete)
WHERE s.stock = 0
);

/* Creamos la septima vista la cual muestra los juguetes sin stock en la sucursal 2 */

CREATE VIEW sucursal2_juguetes_nulos AS(
SELECT
	j.id_juguete,
    j.nombre AS juguete,
    s.stock
FROM juguetes AS j
JOIN stock_sucursal_2 AS s
ON(j.id_juguete=s.id_juguete)
WHERE s.stock = 0
);

/* En las proximas 4 vistas se podra ver la cantidad de juguetes vendidos en los diferentes meses, y una vista de los juguetes vendidos 
 en el 2022 */

CREATE VIEW ventas_noviembre_22 AS (
	SELECT id_juguete, sum(ventas)
    FROM ventas_juguetes
    WHERE id_juguete=id_juguete 
    AND fecha > '2022-10-30'
    GROUP BY id_juguete
);

CREATE VIEW ventas_diciembre_22 AS (
	SELECT id_juguete, sum(ventas)
    FROM ventas_juguetes
    WHERE id_juguete=id_juguete 
    AND fecha > '2022-11-30'
    GROUP BY id_juguete
);


CREATE VIEW ventas_2022 AS (
	SELECT id_juguete, sum(ventas)
    FROM ventas_juguetes
    WHERE id_juguete=id_juguete 
    AND fecha > '2021-12-31'
    GROUP BY id_juguete
);

/* En las siguientes 3 vistas se muestra la cantidad de ventas de cada empleados en los diferentes meses, y en el 2022 */

CREATE VIEW ventas_empleados_noviembre_22 AS (
	SELECT id_empleado, sum(cantidad)
    FROM compras
    WHERE id_empleado=id_empleado
    AND fecha > '2022-10-30'
    GROUP BY id_empleado 
    ORDER BY sum(cantidad)
);

CREATE VIEW ventas_empleados_diciembre_22 AS (
	SELECT id_empleado, sum(cantidad)
    FROM compras
    WHERE id_empleado=id_empleado
    AND fecha > '2022-11-30'
    GROUP BY id_empleado 
    ORDER BY sum(cantidad)
);

CREATE VIEW ventas_empleados_22 AS (
	SELECT id_empleado, sum(cantidad)
    FROM compras
    WHERE id_empleado=id_empleado
    AND fecha > '2021-12-31'
    GROUP BY id_empleado 
    ORDER BY sum(cantidad)
);


/* Creacion de funciones en base de datos jugueteria */

USE jugueteria_carranza;

/* Creamos la primea funcion la cual nos dira la cantidad de juguetes que nos vendio un proveedor
  pasandole como parametros el id del poveedor */
  
DELIMITER $$

CREATE FUNCTION `cantidad_juguetes_proveedor` (proveedor INT)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE proveedor_juguetes INT;
	SET proveedor_juguetes=(SELECT COUNT(nombre) FROM juguetes WHERE proveedor=id_proveedor);
    RETURN proveedor_juguetes;
END$$

DELIMITER ;

/* Creamos las proximas tres funciones las cuales nos dian la cantidad de stock total que hay en cada ubicacion,
   sin la necesidad que le pasemos un parametro, solo seleccionandolas*/

DELIMITER $$

CREATE FUNCTION `deposito_stock` ()
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE deposito_stock INT;
    SET deposito_stock=(SELECT SUM(stock) FROM stock_deposito);
    RETURN deposito_stock;
END $$

CREATE FUNCTION `sucursal_1_stock` ()
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE sucursal_1_stock INT;
    SET sucursal_1_stock=(SELECT SUM(stock) FROM stock_sucursal_1);
    RETURN sucursal_1_stock;
END $$

CREATE FUNCTION `sucursal_2_stock` ()
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE sucursal_2_stock INT;
    SET sucursal_2_stock=(SELECT SUM(stock) FROM stock_sucursal_2);
    RETURN sucursal_2_stock;
END $$

DELIMITER ;

/* Agregamos la quinta funcion la cual servira para traer el precio de un juguete, como parameto le pasamos el id del juguete,
   esta funcion decidi crearla para agilizar la insercion de datos en la tabla compras 
   para no perder tiempo buscando el precio de cada juguete */

DELIMITER $$

CREATE FUNCTION `precio_juguete` (juguete INT)
RETURNS DECIMAL
READS SQL DATA
BEGIN
	DECLARE juguete_precio DECIMAL;
    SET juguete_precio=(SELECT precio_juguete FROM juguetes WHERE id_juguete=juguete);
    RETURN juguete_precio;
END $$

DELIMITER ;

/* Las proximas tes funciones serviran para sacar los diferentes tipos de descuentos que ofrece la jugueteria,
con tajeta Club la Voz hay un %15 de descuento, con tajeta Naranja un %20 y pagando en efectivo un %10,
estas funciones son utilizadas en el tigger precios_juguetes para llenar la tabla precios_juguetes. */

DELIMITER $$

CREATE FUNCTION `descuento_naranja` (precio DECIMAL)
RETURNS DECIMAL
READS SQL DATA
BEGIN
	DECLARE precio_naranja DECIMAL;
    SET precio_naranja=(precio - (precio*20)/100);
    RETURN precio_naranja;
END $$


CREATE FUNCTION `descuento_clubLaVoz` (precio DECIMAL)
RETURNS DECIMAL
READS SQL DATA
BEGIN
	DECLARE precio_clubLaVoz DECIMAL;
    SET precio_clubLaVoz=(precio - (precio*15)/100);
    RETURN precio_clubLaVoz;
END $$


CREATE FUNCTION `descuento_efectivo` (precio DECIMAL)
RETURNS DECIMAL
READS SQL DATA
BEGIN
	DECLARE precio_efectivo DECIMAL;
    SET precio_efectivo=(precio - (precio*10)/100);
    RETURN precio_efectivo;
END $$

/* Las proximas tres funciones tienen como funcion devolver el numero de stock de un juguete, le pasamos como parametro
el id del juguete. La primea funcion nos devuelve el stock del juguete en general, la segunda funcion nos devuelve el 
stock del juguete en la sucursal 1, la tercera funcion nos devuelve el stock del juguete en la sucursal 2 y la ultima
funcion nos devuelve el stock del juguete en el deposito.
Estas funciones fueron creadas con el fin de utilizarlas en la creacion de triggers y stored procedures*/

CREATE FUNCTION `stock` (juguete INT)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE numero INT;
    SET numero = (SELECT stock FROM stock WHERE id_juguete = juguete);
    RETURN numero ;
END $$

CREATE FUNCTION `stock_1` (juguete INT)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE numero INT;
    SET numero = (SELECT stock FROM stock_sucursal_1 WHERE id_juguete = juguete);
    RETURN numero ;
END $$

CREATE FUNCTION `stock_2` (juguete INT)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE numero INT;
    SET numero = (SELECT stock FROM stock_sucursal_2 WHERE id_juguete = juguete);
    RETURN numero ;
END $$

CREATE FUNCTION `stock_deposito` (juguete INT)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE numero INT;
    SET numero = (SELECT stock FROM stock_deposito WHERE id_juguete = juguete);
    RETURN numero ;
END $$

DELIMITER ;


/* Creamos las stored procedures para la base de datos jugueteria */

USE jugueteria_carranza;
 
/* Creamos el primer stored procedure el cual nos mostrara los juguetes que nos ha vendido un proveedor,
   el parameto de entrada sera el id del proveedor que queremos ver, y nos dira herror si el id que le pasamos no existe */
   
DELIMITER $$

CREATE PROCEDURE `juguetes_proveedor` (IN proveedor INT, IN order_ VARCHAR(40))
BEGIN
	DECLARE max_ INT;
    DECLARE min_ INT;
    SET max_=(SELECT MAX(id_proveedor) FROM proveedores);
    SET min_=(SELECT MIN(id_proveedor) FROM proveedores);
    IF proveedor > max_ THEN
		SELECT 'Este id de proveedor no existe' AS 'HERROR';
	ELSEIF proveedor < min_ THEN
		SELECT 'Este id de proveedor no existe' AS 'HERROR';
	ELSE
		SELECT 
			j.id_juguete,
            j.nombre,
            p.id_proveedor,
            p.nombre
		FROM juguetes AS j
        JOIN proveedores AS p
        ON(j.id_proveedor=p.id_proveedor) AND (j.id_proveedor=proveedor)
        ORDER BY order_;
	END IF;
END $$

/* Creamos el segundo stored procedure el cual sera para agregar un dato a la tabla proveedores,
   y luego mostrar la tabla actualizada */
   
DELIMITER $$

CREATE PROCEDURE `agregar_proveedor` (IN nombre VARCHAR(60), IN telefono INT, IN email VARCHAR(60), IN direccion VARCHAR(60))
BEGIN
    INSERT INTO proveedores (nombre, telefono, email, direccion) VALUES (nombre, telefono, email, direccion);
    
    SELECT * FROM proveedores ORDER BY id_proveedor desc;
END $$

DELIMITER $$

/* Creamos la tercera stored procedure el cual sera para agregar un dato a la tabla choferes,
   y luego mostrar la tabla actualizada */
   
DELIMITER $$

CREATE PROCEDURE `agregar_chofer` (IN nombre VARCHAR(60), IN apellido VARCHAR(60), IN mail VARCHAR(60), IN telefono VARCHAR(60))
BEGIN
    INSERT INTO choferes (nombre, apellido, mail, telefono) VALUES (nombre, apellido, mail, telefono);
    
    SELECT * FROM choferes ORDER BY id_chofer desc;
END $$

DELIMITER ;

/* El cuarto stored procedure sera para mover un juguete del deposito a algunas de las sucursales de venta,
 le pasamos tres parametros, el id del juguete, cuantas unidades de ese juguete nos llevaremos, y a que sucursal ira el juguete.
 Luego automaticamente actualiza las tablas de stock_deposito, restandole al juguete el stock que nos llevamos, y agregandolo 
 a la tabla de stock a la cual llevamos el juguete */

DELIMITER $$

CREATE PROCEDURE `mover_juguete` (IN juguete INT, IN cantidad INT, IN ubicacion INT)
BEGIN
	UPDATE stock_deposito SET stock=(SELECT stock_deposito(juguete)) - (cantidad) WHERE id_juguete=juguete;
    IF ubicacion = 1 THEN
		UPDATE stock_sucursal_1 SET stock=(SELECT stock_1(juguete)) + (cantidad) WHERE id_juguete=juguete;
	ELSE
		UPDATE stock_sucursal_2 SET stock=(SELECT stock_2(juguete)) + (cantidad) WHERE id_juguete=juguete;
	END IF;
END $$

DELIMITER ;


/* Creacion de triggers */


USE jugueteria_carranza;

/* El primer trigger se ejecuta cuando agregamos un juguete a la tabla juguetes, se agrega en una tabla aparte de precios_juguetes
el precio del juguete normal y calcula con el uso de funciones los diferentes tipos de descuentos y los agrega. */

CREATE TRIGGER `precios_juguetes`
AFTER INSERT ON `juguetes`
FOR EACH ROW
INSERT INTO `precios_juguetes` (id_juguete, precio_normal, precio_club_la_voz, precio_naranja, precio_efectivo)
VALUES 
(NEW.id_juguete, NEW.precio_juguete, (descuento_clubLaVoz(NEW.precio_juguete)), (descuento_naranja(NEW.precio_juguete)), (descuento_efectivo(NEW.precio_juguete)));

/* El segundo trigger se ejecuta al eliminar un chofer de la tabla ya que no ejerce mas su puesto, se agrega en una tabla aparte 
choferes_antiguos todos los choferes eliminados con la fecha de ese dia. */

CREATE TRIGGER `choferes_antiguos`
AFTER DELETE ON `choferes`
FOR EACH ROW
INSERT INTO `choferes_antiguos` (id, nombre, apellido, mail, telefono, fecha) 
VALUES (OLD.id_chofer, OLD.nombre, OLD.apellido, OLD.mail, OLD.telefono, current_date());

/* El tercer trigger tiene la funcion de completa la tabla de ventas_juguetes, cuando se inserta un dato en la tabla compras, 
 en la tabla de ventas_juguetes se guardan los datos de que juguete se vendio, cantidad y fecha de la compra,
 luego a base de esta tabla creamos las vistas que dividen esta tabla por meses, para saber cuales son los juguetes
 mas y menos vendidos por mes.*/

CREATE TRIGGER `ventas_juguetes`
AFTER INSERT ON `compras`
FOR EACH ROW
INSERT INTO `ventas_juguetes` (id_juguete, ventas, fecha)
VALUES
	(NEW.id_juguete, NEW.cantidad, NEW.fecha);
    
/* Los proximos dos tiggers tienen las siguientes funciones: El primero esta en la tabla empleados, y cuando se elimina
 un empleado ya que no trabaja mas con nostros, automaticamente el trigger lo agrega a la tabla de empleados antiguos.
  El segundo trigger tambien esta en la tabla empleados, y al eliminar un empleado, elimina tambien a ese 
  empleado de la tabla de empleados_info */
    
CREATE TRIGGER `empleados_antiguos`
AFTER DELETE ON `empleados`
FOR EACH ROW
INSERT INTO `empleados_antiguos` (id_empleado, nombre, apellido, puesto, mail, telefono, fecha) 
VALUES (OLD.id_empleado, OLD.nombre, OLD.apellido, OLD.mail, OLD.telefono, current_date());

CREATE TRIGGER `borrar_empleados_info`
AFTER DELETE ON `empleados`
FOR EACH ROW
DELETE FROM `empleados_info` WHERE OLD.id_empleado = id_empleado;

/*Los proximos tes triggers se encuentran en la tabla compras, luego de agregar un dato a la tabla 
automaticamente resta de las tablas de stock el juguete que se ha vendido.
El primer trigger resta el stock de la tabla de stock general, y los otros dos triggers resta el stock de las
 tablas stock_sucursal_1 y stock_sucursal_2 */

CREATE TRIGGER `restar_stock`
AFTER INSERT ON `compras`
FOR EACH ROW
UPDATE `stock` SET stock=(select stock(NEW.id_juguete)) - (NEW.cantidad)
WHERE id_juguete = NEW.id_juguete ;

DELIMITER $$

CREATE TRIGGER `restar_stock_1`
AFTER INSERT ON `compras`
FOR EACH ROW
BEGIN
	IF NEW.id_ubicacion = 2 THEN
		UPDATE `stock_sucursal_1` SET stock = (select stock_1(NEW.id_juguete))- (NEW.cantidad) WHERE id_juguete = NEW.id_juguete ;
        END IF;
END $$

CREATE TRIGGER `restar_stock_2`
AFTER INSERT ON `compras`
FOR EACH ROW
BEGIN
	IF NEW.id_ubicacion = 3 THEN
		UPDATE `stock_sucursal_2` SET stock = (select stock_2(NEW.id_juguete))- (NEW.cantidad) WHERE id_juguete = NEW.id_juguete ;
        END IF;
END $$

DELIMITER ;