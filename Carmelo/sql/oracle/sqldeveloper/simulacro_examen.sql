
SELECT * FROM Usuarios;


-- Crear la tabla "Usuarios" para almacenar los datos de los usuarios
CREATE TABLE Usuarios (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  telefono VARCHAR(20),
  direccion VARCHAR(100)
);

-- Crear la tabla "Boletos" con clave primaria autoincremental
CREATE TABLE Boletos (
  id INT PRIMARY KEY,
  numero INT,
  vendido NUMBER(1) DEFAULT 0,
  id_usuario INT,
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id)
);
SELECT * FROM Boletos;
-- Insertar los cien primeros boletos
DECLARE
  v_contador INT := 1;
BEGIN
  WHILE v_contador <= 100 LOOP
    INSERT INTO Boletos (id,numero) VALUES (v_contador,v_contador);
    v_contador := v_contador + 1;
  END LOOP;
  COMMIT;
END;

-- Crear la tabla "Premios" para almacenar los premios del sorteo
CREATE TABLE Premios (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  descripcion VARCHAR(100)
);
SELECT * FROM Premios;
-- Insertar registros en la tabla "Premios"
INSERT INTO Premios (id, nombre, descripcion) VALUES (1, 'Primer premio', 'Premio principal del sorteo');
INSERT INTO Premios (id, nombre, descripcion) VALUES (2, 'Segundo premio', 'Premio secundario del sorteo');
INSERT INTO Premios (id, nombre, descripcion) VALUES (3, 'Tercer premio', 'Premio adicional del sorteo');


-- Crear la tabla "Ganadores" para almacenar los ganadores de los premios
CREATE TABLE Ganadores (
  id INT PRIMARY KEY,
  id_premio INT,
  id_boleto INT,
  FOREIGN KEY (id_premio) REFERENCES Premios(id),
  FOREIGN KEY (id_boleto) REFERENCES Boletos(id)
);

-- Insertar registros en la tabla "Usuarios"
INSERT INTO Usuarios (id, nombre, telefono, direccion) VALUES (secuencia.NEXTVAL, 'Juan García', '123456789', 'Calle Principal 123');
INSERT INTO Usuarios (id, nombre, telefono, direccion) VALUES (secuencia.NEXTVAL, 'María López', '987654321', 'Avenida Central 456');
INSERT INTO Usuarios (id, nombre, telefono, direccion) VALUES (secuencia.NEXTVAL, 'Pedro Martínez', '555555555', 'Calle Secundaria 789');
INSERT INTO Usuarios (id, nombre, telefono, direccion) VALUES (secuencia.NEXTVAL, 'Ana Rodríguez', '999999999', 'Avenida Principal 321');
INSERT INTO Usuarios (id, nombre, telefono, direccion) VALUES (secuencia.NEXTVAL, 'Carlos Hernández', '111111111', 'Calle Central 654');
INSERT INTO Usuarios (id, nombre, telefono, direccion) VALUES (secuencia.NEXTVAL, 'Laura González', '777777777', 'Avenida Secundaria 987');
INSERT INTO Usuarios (id, nombre, telefono, direccion) VALUES (secuencia.NEXTVAL, 'Javier Pérez', '444444444', 'Calle Principal 555');
INSERT INTO Usuarios (id, nombre, telefono, direccion) VALUES (secuencia.NEXTVAL, 'Sofía Ramírez', '222222222', 'Avenida Central 777');
INSERT INTO Usuarios (id, nombre, telefono, direccion) VALUES (secuencia.NEXTVAL, 'Luis Torres', '888888888', 'Calle Secundaria 888');
INSERT INTO Usuarios (id, nombre, telefono, direccion) VALUES (secuencia.NEXTVAL, 'Elena Sánchez', '333333333', 'Avenida Principal 999');


-- Crear el procedimiento almacenado "comprar_boletos"
CREATE OR REPLACE PROCEDURE comprar_boletos (
  p_id_usuario IN Usuarios.id%TYPE,
  p_cantidad IN INT
) IS
BEGIN
  FOR i IN 1..p_cantidad LOOP
    -- Buscar un boleto disponible para comprar
    DECLARE
      v_boleto_id Boletos.id%TYPE;
    BEGIN
      SELECT id INTO v_boleto_id
      FROM Boletos
      WHERE vendido = 0 AND ROWNUM = 1;
      
      -- Asignar el boleto al usuario
      UPDATE Boletos
      SET vendido = 1, id_usuario = p_id_usuario
      WHERE id = v_boleto_id;
      
      -- Mostrar mensaje de compra exitosa
      DBMS_OUTPUT.PUT_LINE('El usuario ' || p_id_usuario || ' ha comprado el boleto con ID ' || v_boleto_id);
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No hay boletos disponibles para comprar.');
        EXIT;
    END;
  END LOOP;
END;
/
BEGIN
  comprar_boletos(p_id_usuario => 8, p_cantidad => 3);
END;

CREATE OR REPLACE PROCEDURE modificar_descripcion_premios (
  p_numero_premio IN Premios.id%TYPE,
  p_nueva_descripcion IN Premios.descripcion%TYPE
) IS
BEGIN
  UPDATE Premios
  SET descripcion = p_nueva_descripcion
  WHERE id = p_numero_premio;

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Se ha actualizado la descripción del premio ' || p_numero_premio || '.');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se encontró ningún premio con el número ' || p_numero_premio || '.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error al modificar la descripción del premio: ' || SQLERRM);
    ROLLBACK;
END;
BEGIN
  modificar_descripcion_premios(p_numero_premio => 3, p_nueva_descripcion => 'viaje');
END;


-- Insertar ganador del primer premio
INSERT INTO Ganadores (id, id_premio, id_boleto)
VALUES (1, 1, 57); -- Asignar el ID del ganador, el ID del primer premio y el ID del boleto correspondiente

-- Insertar ganador del segundo premio
INSERT INTO Ganadores (id, id_premio, id_boleto)
VALUES (2, 2, 46); -- Asignar el ID del ganador, el ID del segundo premio y el ID del boleto correspondiente

-- Insertar ganador del tercer premio
INSERT INTO Ganadores (id, id_premio, id_boleto)
VALUES (3, 3, 31); -- Asignar el ID del ganador, el ID del tercer premio y el ID del boleto correspondiente



-- Obtener usuarios ganadores del primer premio
SELECT u.nombre AS nombre_usuario, p.nombre AS nombre_premio
FROM Usuarios u
JOIN Boletos b ON u.id = b.id_usuario
JOIN Ganadores g ON b.id = g.id_boleto
JOIN Premios p ON g.id_premio = p.id
WHERE g.id_premio = 1;

-- Obtener usuarios ganadores del segundo premio
SELECT u.nombre AS nombre_usuario, p.nombre AS nombre_premio
FROM Usuarios u
JOIN Boletos b ON u.id = b.id_usuario
JOIN Ganadores g ON b.id = g.id_boleto
JOIN Premios p ON g.id_premio = p.id
WHERE g.id_premio = 2;

-- Obtener usuarios ganadores del tercer premio
SELECT u.nombre AS nombre_usuario, p.nombre AS nombre_premio
FROM Usuarios u
JOIN Boletos b ON u.id = b.id_usuario
JOIN Ganadores g ON b.id = g.id_boleto
JOIN Premios p ON g.id_premio = p.id
WHERE g.id_premio = 3;
