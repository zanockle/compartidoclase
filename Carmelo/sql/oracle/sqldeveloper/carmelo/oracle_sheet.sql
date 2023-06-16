CREATE TABLE usuarios (
  id NUMBER PRIMARY KEY,
  nombre VARCHAR2(50),
  apellido VARCHAR2(50),
  ciudad VARCHAR2(50),
  correo VARCHAR2(100)
);

CREATE SEQUENCE usuarios_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER usuarios_trigger
BEFORE INSERT ON usuarios
FOR EACH ROW
BEGIN
  SELECT usuarios_seq.NEXTVAL INTO :new.id FROM dual;
END;
/

INSERT INTO usuarios (nombre, apellido, ciudad, correo) VALUES ('Juan', 'Pérez', 'Ciudad de México', 'juan.perez@example.com');
INSERT INTO usuarios (nombre, apellido, ciudad, correo) VALUES ('María', 'González', 'Madrid', 'maria.gonzalez@example.com');
INSERT INTO usuarios (nombre, apellido, ciudad, correo) VALUES ('John', 'Smith', 'New York', 'john.smith@example.com');
INSERT INTO usuarios (nombre, apellido, ciudad, correo) VALUES ('Emma', 'Johnson', 'London', 'emma.johnson@example.com');
INSERT INTO usuarios (nombre, apellido, ciudad, correo) VALUES ('Carlos', 'Sánchez', 'Buenos Aires', 'carlos.sanchez@example.com');


SELECT * FROM usuarios;

CREATE TABLE productos (
  id NUMBER PRIMARY KEY,
  nombre VARCHAR2(50),
  descripcion VARCHAR2(100),
  unidades NUMBER(3),
  precio NUMBER(8, 2)
);

CREATE SEQUENCE productos_seq START WITH 1 INCREMENT BY 5;

CREATE OR REPLACE TRIGGER productos_trigger
BEFORE INSERT ON productos
FOR EACH ROW
BEGIN
  SELECT productos_seq.NEXTVAL INTO :new.id FROM dual;
END;
/

INSERT INTO productos (nombre, descripcion, unidades, precio) VALUES ('Vestido de noche', 'Elegante vestido de noche con encaje y pedrería', 10, 199.99);
INSERT INTO productos (nombre, descripcion, unidades, precio) VALUES ('Zapatos de tacón', 'Zapatos de tacón alto con diseño moderno y cómodo', 5, 89.99);
INSERT INTO productos (nombre, descripcion, unidades, precio) VALUES ('Bolso de mano', 'Bolso de mano de cuero con estampado floral', 8, 79.99);
INSERT INTO productos (nombre, descripcion, unidades, precio) VALUES ('Jeans ajustados', 'Jeans ajustados de cintura alta con efecto desgastado', 15, 59.99);
INSERT INTO productos (nombre, descripcion, unidades, precio) VALUES ('Blusa de seda', 'Blusa de seda suave con estampado de flores', 12, 49.99);

select * from productos;

ALTER TABLE usuarios
ADD direccion varchar(255);

describe usuarios;
ALTER TABLE usuarios
MODIFY direccion varchar(100);

CREATE TABLE pedidos (
  id_pedido NUMBER PRIMARY KEY,
  id_usuario NUMBER,
  id_producto NUMBER,
  unidades_pedidas NUMBER(3),
  fecha_pedido DATE,
  tiene_descuento CHAR(1),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
  FOREIGN KEY (id_producto) REFERENCES productos(id)
);

CREATE SEQUENCE pedidos_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER pedidos_trigger
BEFORE INSERT ON pedidos
FOR EACH ROW
BEGIN
  SELECT pedidos_seq.NEXTVAL INTO :new.id_pedido FROM dual;
END;
/

INSERT INTO pedidos (id_usuario, id_producto, unidades_pedidas, fecha_pedido, tiene_descuento) VALUES (1, 16, 2, TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'S');
INSERT INTO pedidos (id_usuario, id_producto, unidades_pedidas, fecha_pedido, tiene_descuento) VALUES (2, 11, 1, TO_DATE('2023-06-02', 'YYYY-MM-DD'), 'N');
INSERT INTO pedidos (id_usuario, id_producto, unidades_pedidas, fecha_pedido, tiene_descuento) VALUES (3, 21, 3, TO_DATE('2023-06-03', 'YYYY-MM-DD'), 'S');
INSERT INTO pedidos (id_usuario, id_producto, unidades_pedidas, fecha_pedido, tiene_descuento) VALUES (1, 11, 5, TO_DATE('2023-06-04', 'YYYY-MM-DD'), 'N');
INSERT INTO pedidos (id_usuario, id_producto, unidades_pedidas, fecha_pedido, tiene_descuento) VALUES (2, 21, 2, TO_DATE('2023-06-05', 'YYYY-MM-DD'), 'S');

select * from pedidos;


SELECT nombre, ciudad
FROM usuarios
WHERE id  in (SELECT id_usuario FROM pedidos where unidades_pedidas > 2);

SELECT nombre, ciudad
FROM usuarios
WHERE id  = any (SELECT id_usuario FROM pedidos where unidades_pedidas > 1);

SELECT nombre, ciudad
FROM usuarios
WHERE id  = some (SELECT id_usuario FROM pedidos where unidades_pedidas > 1);

SELECT nombre, ciudad
FROM usuarios
WHERE exists (SELECT id_usuario FROM pedidos where unidades_pedidas > 1);

SELECT nombre, ciudad
FROM usuarios
WHERE id  in (1,3);

SELECT id_usuario,unidades_pedidas FROM pedidos where unidades_pedidas > 2;

SELECT nombre, unidades, precio,
CASE WHEN unidades > 10 THEN 'para vender'
WHEN precio BETWEEN 10 AND 80 THEN 'vender 2x1'
ELSE 'no vender todavia'
END AS recomendacion,descripcion
FROM productos;

ALTER TABLE productos
ADD CHECK (precio>=40);

INSERT INTO productos (nombre, descripcion, unidades, precio) VALUES ('Vestido de noche', 'Elegante vestido de noche con encaje y pedrería', 10, 30.99);

SELECT * FROM productos
WHERE ROWNUM <= 3;

select * from productos;

delete from productos where id=6;

--1. muestra el total de factura por cliente
select usuarios.nombre, sum(productos.precio*pedidos.unidades_pedidas)
from pedidos
inner join usuarios on usuarios.id=pedidos.id_usuario
inner join productos on productos.id=pedidos.id_producto
group by usuarios.nombre;


--2. muestra el total de factura por pedido
select pedidos.id_pedido,(productos.precio*pedidos.unidades_pedidas)
from pedidos
inner join productos on productos.id=pedidos.id_producto;

--3. muestra el total de factura por mes
select to_char(pedidos.fecha_pedido,'YYYY-MM') as mes, sum(productos.precio*pedidos.unidades_pedidas)
from pedidos

inner join productos on productos.id=pedidos.id_producto
group by to_char(pedidos.fecha_pedido,'YYYY-MM');


select extract(month from pedidos.fecha_pedido) as mes, sum(productos.precio*pedidos.unidades_pedidas)
from pedidos

inner join productos on productos.id=pedidos.id_producto
group by extract(month from pedidos.fecha_pedido);

select nombre from productos
intersect
select ciudad from usuarios;
