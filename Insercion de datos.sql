/* Insercion de datos a la base de datos jugueteria */

USE jugueteria_carranza;

INSERT INTO proveedores (nombre, telefono, email, direccion)
VALUES
	('Juguetes al por mayor',125356, 'juguetesalpormayor0@gmail.com', 'Goycochea 1278'),
    ('Comercial B.P de juguetes',345434, 'bpjuguetes@hotmail.com', 'Ricado Rojas 256'),
    ('Alco distibuciones',427456, 'alcodistribuciones@outlook.com.ar', 'Pernambuco 556'),
    ('Grupo Disar',20478, 'disagroup@yahoo.com.ar', 'Atahualpa 599'),
    ('Diver Planet',289452, 'planetdiver@gmail.com', 'Recta Martinolli 567'),
    ('Sindiseca Toys',280456, 'toyssindiseca1@hotmail.com.ar', 'San Martin 290'),
    ('Injusa',58302, 'injusatoys@gmail.com', 'Nuñez 127'),
    ('Tecnicas Laser',379245, 'lasertecnicas2@outlook.com.ar', 'Donato Alvarez 2343'),
    ('Mobelkids',279025, 'mobelkidds@gmail.com', 'Belgrano 2340'),
    ('Juguetes Junior',123456, 'juniortoys@hotmail.com.ar', 'Ricardo Rojas 639');
    
INSERT INTO choferes (nombre, apellido, mail, telefono)
VALUES
	('Fernando', 'Carranza', 'fdcarranza@yahoo.com.ar','234347'),
    ('Bautista', 'Liendo', 'liendobautista03@hotmail.com', '127347'),
    ('Salvador', 'Aliani', 'salvialiani04@gmail.com','893405'),
    ('Juan Ignacio', 'Olaechea', 'juaniolaechea@outlook.com','280471'),
    ('Gaspar', 'Blanco', 'blancogaspar@hotmail.com.ar','200893'),
    ('Thiago', 'Vivas', 'thiagovivasjorda@outlook.com','459210'),
    ('Facundo', 'Esteve', 'estevefacundo@yahoo.com.ar','235890'),
    ('Luciano', 'Yunes', 'yunesluciano04@gmail.com','351234');
    
INSERT INTO choferes_antiguos (id_chofer, nombre, apellido, mail, telefono, fecha)
VALUES
	(9, 'Octavio', 'Garcia', 'garciaoctavio@hotmail.com', '3518234324', '2022-11-01'),
    (10, 'Mauricio', 'Rodriguez', 'rodriguezmauricio@gmail.com', '3519123213', '2022-12-01'),
    (11, 'Juan', 'Berton', 'juanberton@outlook.com.ar', '3516959527', '2022-10-01');
    
INSERT INTO juguetes (nombre, precio_juguete, id_proveedor)
VALUES
	('monopoly', 7999, 4),
    ('TEG', 7999, 4),
    ('NERF pistola', 8700, 5),
    ('NERF escopeta', 12500, 5),
    ('NERF balas', 5000, 5),
    ('NERF rifle', 14000, 5),
    ('muñeca chica', 5000, 9),
    ('muñeca grande', 7000, 9),
    ('auto hotweels', 2500, 1),
    ('cubo magico', 2000, 7),
    ('aro de basquet chico', 5500, 6),
    ('aro de basquet grande', 10000, 6),
    ('casita de muñecas', 7890, 9),
    ('club', 7999, 4),
    ('castillo medieval', 4599, 8),
    ('soldados medievales', 4999, 8),
    ('soldaditos', 3500, 10),
    ('tanque', 2500, 10),
    ('mecano', 6999, 4),
    ('patineta', 12000, 2),
    ('5 autos hotweels', 7000, 1),
    ('pista de autos', 8000, 1),
    ('pelota de basquet', 10690, 6),
    ('pelota de futbol', 10500, 6),
    ('dinosauio chico', 1500, 3),
    ('dinosaurio grande', 3000, 3),
    ('camion', 1000, 3),
    ('cartas naipes', 999, 4),
    ('cartas poker', 999, 4),
    ('gogos', 780, 9),
    ('ferrari', 6800, 10);
    
    
INSERT INTO stock (id_juguete, stock)
VALUES
	(1, 30),
	(2, 25),
    (3, 32),
    (4, 23),
    (5, 39),
    (6, 24),
    (7, 40),
    (8, 36),
    (9, 43),
    (10, 22),
    (11, 17),
    (12, 8),
    (13, 14),
    (14, 32),
    (15, 13),
    (16, 39),
    (17, 54),
    (18, 25),
    (19, 20), 
    (20, 10),
    (21, 29),
    (22, 9),
    (23, 7),
    (24, 10), 
    (25, 29),
    (26, 17),
    (27, 21),
    (28, 15),
    (29, 9),
    (30, 57),
    (31, 7);
    
INSERT INTO descripcion (id_juguete, descripcion, marca)
VALUES
	(1, 'juego de mesa monopoly', 'Hasbro'),
	(2, 'juego de mesa TEG', 'Hasbro'),
    (3, 'pistola chica de dardos, 5 dardos incluidos', 'NERF'),
    (4, 'escopeta de dardos, 10 dardos incluidos', 'NERF'),
    (5, 'dardos para armas nerf, 25 dardos', 'NERF'),
    (6, 'rifle de dardos, 10 dardos incluidos', 'NERF'),
    (7, 'muñeca de plastico chica', 'Barbie'),
    (8, 'muñeca de plastico grande', 'Barbie'),
    (9, 'auto chico de juguete', 'Hotweels'),
    (10, 'cubo magico para armar', 'Mattel'),
    (11, 'aro de basquet tamaño chico de plastico, pelota de goma incluida', 'Smoby'),
    (12,'aro de basquet grande de hierro para exteriores', 'AND1'),
    (13, 'casa de muñecas de plastico', 'Barbie'),
    (14, 'juego de mesa club', 'Hasbro'),
    (15, 'castillo medieval de plastico', 'Chicco'),
    (16, '5 unidades de soldados medievales de plastico', 'Chicco'),
    (17, '12 unidades de soldados de guera', 'Playskool'),
    (18, 'tanque de plastico', 'Playskool'),
    (19, 'juego de piezas de metal para construir autos', 'Hasbro'), 
    (20, 'patineta de 4 ruedas', 'Molto'),
    (21, '5 unidades de autos hotweels', 'Hotweels'),
    (22,'pista de autos de plastico', 'Hotweels'),
    (23,'pelota de basquet tamaño gr7', 'AND1'),
    (24, 'pelota de futbol tamaño gr6', 'AND1'), 
    (25, 'dinosaurio de plastico tamaño chico', 'Vtech'),
    (26, 'dinosaurio de plastico tamaño grande', 'Vtech'),
    (27, 'camion de plastico', 'Smoby'),
    (28, '50 cartas naipes', 'Mattel'),
    (29, '50 cartas de poker', 'Mattel'),
    (30, 'bolsa con 3 unidades de gogos', 'Gogos'),
    (31,'auto de plastico, ferrari tamaño grande', 'Smoby');
    
INSERT INTO ubicaciones (nombre, direccion, telefono, mail)
VALUES
	('deposito', 'Boderau 3489',590233, 'depositoJugueteria1@gmail.com'),
    ('sucursal 1', 'Goycochea 3490',142909, 'sucursal1jugueteria@gmail.com'),
    ('sucursal 2', 'Ricardo Rojas 3278',892577, 'sucursal2jugueteria@gmail.com');
    
INSERT INTO stock_deposito (id_juguete, stock) 
VALUES
	(1, 11),
	(2, 10),
    (3, 7),
    (4, 12),
    (5, 10),
    (6, 15),
    (7, 12),
    (8, 6),
    (9, 10),
    (10, 5),
    (11, 3),
    (12, 0),
    (13, 7),
    (14, 0),
    (15, 13),
    (16, 12),
    (17, 15),
    (18, 9),
    (19, 0), 
    (20, 10),
    (21, 11),
    (22, 0),
    (23, 0),
    (24, 10), 
    (25, 10),
    (26, 5),
    (27, 8),
    (28, 0),
    (29, 3),
    (30, 12),
    (31, 0);

INSERT INTO stock_sucursal_1 (id_juguete, stock) 
VALUES
	(1, 9),
	(2, 7),
    (3, 12),
    (4, 5),
    (5, 15),
    (6, 15),
    (7, 14),
    (8, 16),
    (9, 15),
    (10, 8),
    (11, 8),
    (12, 4),
    (13, 3),
    (14, 17),
    (15, 0),
    (16, 15),
    (17, 20),
    (18, 8),
    (19, 11), 
    (20, 0),
    (21, 9),
    (22, 5),
    (23, 4),
    (24, 0), 
    (25, 8),
    (26, 6),
    (27, 6),
    (28, 8),
    (29, 3),
    (30, 20),
    (31, 4);

INSERT INTO stock_sucursal_2 (id_juguete, stock) 
VALUES
	(1, 10),
	(2, 8),
    (3, 13),
    (4, 6),
    (5, 14),
    (6, 4),
    (7, 14),
    (8, 14),
    (9, 18),
    (10, 9),
    (11, 6),
    (12, 4),
    (13, 4),
    (14, 15),
    (15, 0),
    (16, 12),
    (17, 19),
    (18, 8),
    (19, 9), 
    (20, 0),
    (21, 9),
    (22, 4),
    (23, 3),
    (24, 0), 
    (25, 11),
    (26, 6),
    (27, 7),
    (28, 7),
    (29, 3),
    (30, 25),
    (31, 3);
    
INSERT INTO movimientos (fecha, hora, id_chofer, salida, destino)
VALUES
	('2022-03-23', '09:45', 5, 1, 2),
    ('2022-04-30', '10:30', 4, 1, 3),
    ('2022-05-12', '15:30', 1, 1, 3),
    ('2022-05-24', '08:00', 2, 1, 3),
    ('2022-06-01', '12:00', 6, 2, 3),
    ('2022-06-10', '07:30', 3, 1, 2),
    ('2022-06-24', '08:45', 8, 3, 2),
    ('2022-07-04', '10:15', 7, 1, 2),
    ('2022-07-29', '16:30', 6, 2, 1),
    ('2022-08-04', '17:00', 2, 1, 3),
    ('2022-08-15', '11:00', 4, 1, 2),
    ('2022-08-29', '18:00', 5, 1, 2),
    ('2022-09-03', '07:30', 8, 2, 3),
    ('2022-09-19', '10:15', 4, 3, 2),
    ('2022-09-28', '14:45', 7, 1, 2),
    ('2022-10-05', '12:00', 4, 3, 1),
    ('2022-10-18', '15:30', 2, 2, 1),
    ('2022-10-18', '17:00', 2, 1, 2),
    ('2022-10-27', '10:00', 5, 1, 3),
    ('2022-11-02', '18:55', 1, 1, 2);
    
INSERT INTO  clientes (nombre, apellido, telefono, mail)
VALUES
	('Gaston', 'Virano', '3516959527', 'viranogaston@gmail.com'),
    ('Joaquin', 'Josape', '3513456766', 'joacjospae@outlook.com'),
    ('Pedro', 'Zazu', '3517895654', 'zazupedro@yahoo.com.ar'),
    ('Valentino', 'Gomez', '3516789034', 'valentino0gomez@hotmail.com'),
    ('David', 'Sotola', '351456897', 'sotoladavid02@gmail.com'),
    ('Fiona', 'Conti', '3518903457', 'contifiona@outlook.com.ar'),
    ('Pilar', 'Baigorri', '3516783421', 'baigorripilar@gmail.com'),
    ('Lautaro', 'Carrizo', '351678345', 'lautarocarizo@hotmail.com.ar'),
    ('Ramiro', 'Somavilla', '3516784523', 'somavillaramiro@yahoo.com'),
    ('Tomas', 'Gonzalez', '3512346767', 'gonzaleztomas@outlook.com');
    
INSERT INTO puestos_trabajo (puesto, descripcion)
VALUES
	('empleado de comercio', 'empleado de comercio, encargado de atender a los clientes en el local'),
    ('supervisor de sucursal', 'por cada sucursal hay un supervisor encargado de controlar esa sucursal y ayudar a los empleados de comercio'),
    ('gerente', 'encargado del funcionamiento de las sucursales y el deposito'),
    ('empleado deposito', 'encargado de ayuda en el deposito, cargando y descargando objetos'),
    ('recursos humanos', 'encargado de encontrar y capacitar a los diferentes empleados');
    
INSERT INTO empleados (nombre, apellido, telefono, mail)
VALUES
	('German', 'Gutierrez', '45123478', 'gemangutierrez@gmail.com'),
    ('Pedro', 'Ponzio', '35189345', 'ponziopedro0@hotmail.com'),
    ('Matias', 'Kraneviter', '35123478', 'kranevitermatias@yahoo.com.ar'),
    ('Franco', 'Armani', '35129562', 'francoarmani@hotmail.com'),
    ('Francisco', 'Rulli', '35123517', 'rullifran@outlook.com.ar'),
    ('Rodrigo', 'Funes Mori', '35167234', 'funesmori@gmail.com'),
    ('Lucas', 'Pisculichi', '351679234', 'pisculichilucas@hotmail.com'),
    ('Juan', 'Riquelme', '3514582', 'juanromanriquelme@gmail.com'),
    ('Stephen', 'Curry', '35178234', 'stephencury@gmail.com'),
    ('Grabiel', 'Mercado', '351238094', 'mercadogabriel@yahoo.com.ar'),
    ('Rodrigo', 'Sanchez', '35183048', 'sanchezrodigo@outlook.com'),
    ('Pedro', 'Barovero', '35123789', 'baroveropedo@gmail.com'),
    ('Fernando', 'Mora', '35138921', 'fernandomora14@outlook.com');
    
INSERT INTO empleados_info (id_empleado, sueldo, puesto, ubicacion)
VALUES
	(1, '75000', 1, 3),
    (2, '75000', 1, 3),
    (3, '75000', 1, 2),
    (4, '75000', 1, 2),
    (5, '70000', 4, 1),
    (6, '70000', 4, 1),
    (7, '70000', 4, 1),
    (8, '100000', 2, 2),
    (9, '100000', 2, 3),
    (10, '100000', 2, 1),
    (11, '150000', 3, null),
    (12, '175000', 5, null),
    (13, '75000', 1, 3);
    
INSERT INTO  empleados_antiguos (id_empleado, nombre, apellido, mail, telefono, fecha)
VALUES
	(14, 'Giovani', 'LoCelso', 'locelsogio@gmail.com', '35128343', '2022-11-01'),
    (15, 'Lionel', 'Messi', 'lionelmessi@outlook.com', '351239432', '2022-12-01'),
    (16, 'Juan', 'Correa', 'correajuan@yahoo.com.ar', '35189422', '2022-10-29');
    
INSERT INTO compras (id_juguete, id_cliente, cantidad, precio_total, fecha, id_empleado, id_ubicacion)
VALUES
    (3, 6, 1, 8700, '2022-11-12', 1, 3),
    (25, 10, 1, 1500, '2022-12-17', 2, 3),
    (14, 2, 1, 7999, '2022-11-01', 3, 2),
    (18, 10, 1, 2500, '2022-12-15', 4, 2),
    (30, 9, 2, 1560, '2022-11-30', 13, 2),
    (19, 2, 1, 6999, '2022-12-02', 1, 3),
    (1, 8, 1, 7999, '2022-11-18', 2, 3),
    (7, 7, 1, 5000, '2022-12-29', 8, 2),
    (17, 9, 3, 1050, '2022-11-03', 9, 3),
    (22, 4, 1, 8000, '2022-12-18', 8, 2),
    (31, 1, 1, 6800, '2022-11-10', 9, 3),
    (9, 3, 2, 5000, '2022-12-01', 8, 2),
    (23, 5, 1, 1069, '2022-11-04', 13, 3),
    (19, 1, 1, 12000, '2022-12-01', 3, 2),
    (1, 2, 1, 7999, '2022-11-18', 4, 2),
    (14, 6, 2, 16000, '2022-11-19', 8, 2),
    (12, 10, 1, 10000, '2022-12-13', 9, 3),
    (4, 3, 1, 12500, '2022-11-02', 1, 3),
    (9, 9, 1, 2500, '2022-12-26', 2, 3),
    (8, 7, 2, 14000, '2022-11-29', 3, 2),
    (31, 10, 1, 6800, '2022-12-01', 4, 2),
    (28, 2, 1, 999, '2022-11-12', 8, 2),
    (19, 4, 2, 14000, '2022-12-23', 9, 3),
    (8, 6, 1, 1400, '2022-12-24', 1, 3),
    (17, 2, 2, 7000, '2022-11-01', 8, 2),
    (19, 6, 3, 21000, '2022-12-31', 9, 3),
    (1, 1, 2, 16000, '2022-12-04', 2, 3),
    (8, 10, 2, 14000, '2022-12-20', 3, 2),
    (14, 2, 3, 24000, '2022-12-09', 4, 2),
    (19, 9, 2, 14000, '2022-12-01', 9, 3),
    (17, 4, 2, 7000, '2022-12-12', 8, 2),
    (14, 1, 2, 16000, '2022-12-23', 4, 2),
    (19, 4, 1, 6999, '2022-11-12', 9, 3);
