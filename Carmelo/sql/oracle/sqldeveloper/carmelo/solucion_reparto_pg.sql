/*Base de datos de reparto*/
CREATE TABLE practicas.rep_clientes (
  idcliente SERIAL PRIMARY KEY,
  dni VARCHAR(20) NOT NULL UNIQUE,
  dob DATE NOT NULL,
  email VARCHAR(50)
);

CREATE TABLE practicas.rep_telefonos (
  idtelefono SERIAL PRIMARY KEY,
  idcliente INT NOT NULL,
  tfno VARCHAR(15),
  FOREIGN KEY (idcliente) REFERENCES practicas.rep_clientes (idcliente) ON DELETE CASCADE
);

INSERT INTO practicas.rep_clientes (dni, dob, email) 
VALUES ('123456789', '1990-05-10', 'ejemplo@correo.com');

INSERT INTO practicas.rep_telefonos (idcliente, tfno)
VALUES (1, '1234567890');
INSERT INTO practicas.rep_telefonos (idcliente, tfno)
VALUES (1, '95847854');

CREATE TABLE practicas.rep_productos (
  idproducto SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio NUMERIC(10, 2) NOT NULL
);

INSERT INTO practicas.rep_productos (nombre, precio)
VALUES ('arroz', 45);
INSERT INTO practicas.rep_productos (nombre, precio)
VALUES ('leche', 8);


CREATE TABLE practicas.rep_pedidos (
  idpedido SERIAL PRIMARY KEY,
  idcliente INT NOT NULL,
  FOREIGN KEY (idcliente) REFERENCES practicas.rep_clientes (idcliente) ON DELETE CASCADE
);

INSERT INTO practicas.rep_pedidos (idcliente)
VALUES (1);


CREATE TABLE practicas.rep_detalle_pedido (
  iddetalle SERIAL PRIMARY KEY,
  fechaentrega DATE NOT NULL,
  idproducto INT NOT NULL,
  unidades INT NOT NULL,
  idpedido INT NOT NULL,
  FOREIGN KEY (idpedido) REFERENCES practicas.rep_pedidos (idpedido) ON DELETE CASCADE,
  FOREIGN KEY (idproducto) REFERENCES practicas.rep_productos (idproducto)ON DELETE CASCADE
);

INSERT INTO practicas.rep_detalle_pedido (fechaentrega,idproducto,unidades,idpedido)
VALUES ('2023-01-05',1,2,2);

/*INTRODUCIR VALORES*/
INSERT INTO practicas.rep_clientes (dni, dob, email) 
VALUES ('41544984', '1980-05-10', 'ejemplo@correo.com');

INSERT INTO practicas.rep_telefonos (idcliente, tfno)
VALUES (2, '666666');

INSERT INTO practicas.rep_pedidos (idcliente)
VALUES (2);

INSERT INTO practicas.rep_detalle_pedido (fechaentrega,idproducto,unidades,idpedido)
VALUES ('2023-01-20',1,6,3);


/*CONSULTAR VALORES*/
SELECT * FROM practicas.rep_clientes;
SELECT * FROM practicas.rep_telefonos;
SELECT * FROM practicas.rep_pedidos;

/*Dado un cliente, qué pedidos ha realizado y su importe total*/

SELECT pr.nombre, d.fechaentrega, sum(d.unidades*pr.precio) as total_total
from practicas.rep_clientes c
inner join practicas.rep_pedidos p on c.idcliente=p.idcliente
inner join practicas.rep_detalle_pedido d on p.idpedido=d.idpedido
inner join practicas.rep_productos pr on d.idproducto=pr.idproducto
where c.idcliente=1
group by d.fechaentrega,pr.nombre;

/*El importe total de venta por arroz y por leche*/
SELECT p.nombre,sum(p.precio*dp.unidades) as total
from practicas.rep_productos p
inner join practicas.rep_detalle_pedido dp on p.idproducto=dp.idproducto
where p.nombre in ('arroz','leche')
group by p.nombre;

/*Cuántos kilos de arroz se reparten cada día..*/
SELECT dp.fechaentrega as fecha,sum(dp.unidades) as total
from practicas.rep_productos p
inner join practicas.rep_detalle_pedido dp on p.idproducto=dp.idproducto
where p.nombre='arroz'
group by dp.fechaentrega;

CREATE FUNCTION practicas.unidades_max_5()
  RETURNS TRIGGER AS $$
BEGIN
  IF NEW.idproducto = 1 AND NEW.unidades > 5 THEN
    RAISE EXCEPTION 'Las unidades no pueden ser mayores que 5 para el idproducto 1';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER check_unidades_max_5
BEFORE INSERT OR UPDATE ON practicas.rep_detalle_pedido
FOR EACH ROW
EXECUTE FUNCTION unidades_max_5();


INSERT INTO practicas.rep_detalle_pedido (fechaentrega,idproducto,unidades,idpedido)
VALUES ('2023-01-21',1,15,1);