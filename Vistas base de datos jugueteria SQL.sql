/* Vistas para base de datos jugueteria */

USE jugueteria;

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

/* Creamos la cuarta vista la cual muestra  los movimientos realizados
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

/* Creamos la quinta vista la cual muestra los juguetes que tienen un pecio por arriba de $8000 
con sus descripciones y stock */

CREATE VIEW juguetes_caros AS(
SELECT
	j.id_juguete,
    j.nombre AS juguete,
    j.precio_juguete AS precio,
    s.stock, 
    d.descripcion
FROM juguetes AS j
JOIN stock AS s
JOIN descripcion AS d
ON(j.id_juguete=s.id_juguete) AND (s.id_juguete=d.id_juguete)
WHERE j.precio_juguete > 8000
ORDER BY j.precio_juguete
); 

/* Creamos la sexta vista la cual muestra los juguetes sin stock en el deposito */

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

/* Creamos la septima vista la cual muestra los juguetes sin stock en la sucursal 1 */

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

/* Creamos la octava vista la cual muestra los juguetes sin stock en la sucursal 2 */

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
