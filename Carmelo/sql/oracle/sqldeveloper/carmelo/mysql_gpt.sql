use sys;
SELECT * FROM sys.clientes;

INSERT INTO sys.clientes (nombre,ciudad,facturacion) VALUES 
('juan','madrid',500.95);

/*crear tabla de productos*/
CREATE TABLE sys.productos (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  unidades_en_stock INT NOT NULL,
  precio_unitario DECIMAL(10,2) NOT NULL,
  fecha_de_alta DATE NOT NULL,
  descuento ENUM('5', '10', '20', '50'),
  PRIMARY KEY (id)
);
SELECT * FROM sys.productos;
INSERT INTO sys.productos VALUES (null,'pantalón a rallas negras y blancas',35,19.95,'2022-11-22','20');


SELECT id, nombre, unidades_en_stock, precio_unitario, date_format(fecha_de_alta,'%d-%m-%Y'), descuento
FROM sys.productos
ORDER BY unidades_en_stock DESC;

CREATE TABLE sys.pedidos (
  id_pedido INT NOT NULL AUTO_INCREMENT,
  id_cliente INT NOT NULL,
  id_producto INT NOT NULL,
  fecha_pedido DATE NOT NULL,
  PRIMARY KEY (id_pedido),
  FOREIGN KEY (id_cliente) REFERENCES clientes(id),
  FOREIGN KEY (id_producto) REFERENCES productos(id),
  CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id),
  CONSTRAINT fk_pedido_producto FOREIGN KEY (id_producto) REFERENCES productos(id)
);

SELECT * FROM sys.pedidos;
INSERT INTO sys.pedidos VALUES ('101',2,4,'2023-05-15');
DELETE FROM sys.clientes WHERE id=1;

/*recomendable joins*/
SELECT sys.clientes.nombre, sys.pedidos.fecha_pedido
FROM sys.clientes
INNER JOIN sys.pedidos ON sys.clientes.id = sys.pedidos.id_cliente;

/*no muy recomendable*/
SELECT sys.clientes.nombre, sys.pedidos.fecha_pedido
FROM sys.clientes,sys.pedidos
where sys.clientes.id = sys.pedidos.id_cliente;
