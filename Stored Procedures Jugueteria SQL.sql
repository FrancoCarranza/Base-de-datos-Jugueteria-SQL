/* Creamos las stored procedures para la base de datos jugueteria */

USE jugueteria;
 
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

DELIMITER ;

/* Creamos el segundo stored procedure el cual sera para agregar un dato a la tabla proveedores,
   y luego mostrar la tabla actualizada */
   
DELIMITER $$

CREATE PROCEDURE `agregar_proveedor` (IN nombre VARCHAR(60), IN telefono INT, IN email VARCHAR(60), IN direccion VARCHAR(60))
BEGIN
    INSERT INTO proveedores (nombre, telefono, email, direccion) VALUES (nombre, telefono, email, direccion);
    
    SELECT * FROM proveedores ORDER BY id_proveedor desc;
END $$

DELIMITER $$