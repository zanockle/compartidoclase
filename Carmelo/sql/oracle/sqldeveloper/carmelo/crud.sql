/*CRUD */
/*Read */
SELECT * FROM clientes;
/*Create*/
INSERT INTO clientes (id,nombre,ciudad,facturacion)
VALUES (5,'sofía','segovia',123.45);
/*Update*/
UPDATE clientes
SET ciudad='zaragoza'
WHERE id=2;
/*Delete*/
DELETE  FROM clientes
WHERE id=2;
