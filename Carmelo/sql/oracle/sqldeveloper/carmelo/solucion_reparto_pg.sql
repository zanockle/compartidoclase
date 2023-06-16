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


