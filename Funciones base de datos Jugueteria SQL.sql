/* Creacion de funciones en base de datos jugueteria */

USE jugueteria;

/* Ceamos la primera funcion que servira para traer el stock total del juguete que le digamos,
 le pasaremos como parametro el id del juguete */

DELIMITER $$

CREATE FUNCTION `juguete_stock` (juguete INT)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE stock_juguete INT;
    SET stock_juguete=(SELECT stock from stock WHERE juguete=id_juguete);
    RETURN stock_juguete;
END $$

DELIMITER ;

/* Creamos la segunda funcion la cual nos dira la cantidad de juguetes que nos vendio un proveedor
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