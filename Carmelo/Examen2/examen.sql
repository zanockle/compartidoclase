-- Creación de la secuencia para la tabla "OfertasDeEmpleo"
CREATE SEQUENCE OfertasDeEmpleo_Seq START WITH 1 INCREMENT BY 1;

-- Creación de la tabla "OfertasDeEmpleo"
CREATE TABLE OfertasDeEmpleo (
    IDOferta NUMBER DEFAULT OfertasDeEmpleo_Seq.NEXTVAL PRIMARY KEY,
    Titulo VARCHAR(100),
    Descripcion VARCHAR(500),
    Empresa VARCHAR(100),
    FechaPublicacion DATE,
    Ciudad VARCHAR(50)
);

-- Creación de la secuencia para la tabla "Aspirantes"
CREATE SEQUENCE Aspirantes_Seq START WITH 1 INCREMENT BY 1;

-- Creación de la tabla "Aspirantes"
CREATE TABLE Aspirantes (
    IDAspirante NUMBER DEFAULT Aspirantes_Seq.NEXTVAL PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Edad NUMBER,
    Email VARCHAR(100),
    Telefono VARCHAR(20),
    Direccion VARCHAR(200),
    CONSTRAINT chk_edad CHECK (Edad > 15),
    CONSTRAINT uq_email UNIQUE (Email)
);

-- Creación de la secuencia para la tabla "Candidaturas"
CREATE SEQUENCE Candidaturas_Seq START WITH 1 INCREMENT BY 1;

-- Creación de la tabla "Candidaturas"
CREATE TABLE Candidaturas (
    IDCandidatura NUMBER DEFAULT Candidaturas_Seq.NEXTVAL PRIMARY KEY,
    IDOferta NUMBER,
    IDAspirante NUMBER,
    Estado VARCHAR(20),
    FOREIGN KEY (IDOferta) REFERENCES OfertasDeEmpleo (IDOferta),
    FOREIGN KEY (IDAspirante) REFERENCES Aspirantes (IDAspirante),
    CONSTRAINT chk_estado CHECK (Estado IN ('Pendiente','Preseleccionado','Finalista','Seleccionado'))

);


-- Inserción de datos en la tabla "OfertasDeEmpleo"
INSERT INTO OfertasDeEmpleo (Titulo, Descripcion, Empresa, FechaPublicacion, Ciudad)
VALUES ('Desarrollador Full Stack', 'Empresa XYZ busca un desarrollador Full Stack con experiencia en tecnologías web.', 'Empresa XYZ', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Ciudad A');

INSERT INTO OfertasDeEmpleo (Titulo, Descripcion, Empresa, FechaPublicacion, Ciudad)
VALUES ('Analista de Datos', 'Empresa ABC busca un analista de datos con conocimientos en minería de datos y estadística.', 'Empresa ABC', TO_DATE('2023-06-05', 'YYYY-MM-DD'), 'Ciudad B');

INSERT INTO OfertasDeEmpleo (Titulo, Descripcion, Empresa, FechaPublicacion, Ciudad)
VALUES ('Diseñador Gráfico', 'Empresa DEF busca un diseñador gráfico con experiencia en Photoshop e Illustrator.', 'Empresa DEF', TO_DATE('2023-06-10', 'YYYY-MM-DD'), 'Ciudad C');

INSERT INTO OfertasDeEmpleo (Titulo, Descripcion, Empresa, FechaPublicacion, Ciudad)
VALUES ('Asistente Administrativo', 'Empresa GHI busca un asistente administrativo con habilidades organizativas.', 'Empresa GHI', TO_DATE('2023-06-15', 'YYYY-MM-DD'), 'Ciudad D');

INSERT INTO OfertasDeEmpleo (Titulo, Descripcion, Empresa, FechaPublicacion, Ciudad)
VALUES ('Ingeniero de Software', 'Empresa JKL busca un ingeniero de software con experiencia en desarrollo de aplicaciones móviles.', 'Empresa JKL', TO_DATE('2023-06-20', 'YYYY-MM-DD'), 'Ciudad E');

-- Inserción de datos en la tabla "Aspirantes"
INSERT INTO Aspirantes (Nombre, Apellido, Edad, Email, Telefono, Direccion)
VALUES ('Juan', 'Pérez', 30, 'juan@example.com', '1234567890', 'Calle Principal 123');

INSERT INTO Aspirantes (Nombre, Apellido, Edad, Email, Telefono, Direccion)
VALUES ('María', 'Gómez', 25, 'maria@example.com', '9876543210', 'Avenida Central 456');

INSERT INTO Aspirantes (Nombre, Apellido, Edad, Email, Telefono, Direccion)
VALUES ('Carlos', 'López', 28, 'carlos@example.com', '5551234567', 'Plaza Mayor 789');

INSERT INTO Aspirantes (Nombre, Apellido, Edad, Email, Telefono, Direccion)
VALUES ('Laura', 'Fernández', 35, 'laura@example.com', '7779876543', 'Calle Secundaria 321');

INSERT INTO Aspirantes (Nombre, Apellido, Edad, Email, Telefono, Direccion)
VALUES ('Pedro', 'Rodríguez', 27, 'pedro@example.com', '1112223334', 'Avenida Principal 567');

INSERT INTO Aspirantes (Nombre, Apellido, Edad, Email, Telefono, Direccion)
VALUES ('Ana', 'Martínez', 29, 'ana@example.com', '8887776665', 'Calle Central 890');

INSERT INTO Aspirantes (Nombre, Apellido, Edad, Email, Telefono, Direccion)
VALUES ('Luis', 'García', 32, 'luis@example.com', '3334445556', 'Plaza Secundaria 123');

INSERT INTO Aspirantes (Nombre, Apellido, Edad, Email, Telefono, Direccion)
VALUES ('Sofía', 'Vargas', 26, 'sofia@example.com', '9998887778', 'Avenida Secundaria 456');

INSERT INTO Aspirantes (Nombre, Apellido, Edad, Email, Telefono, Direccion)
VALUES ('Jorge', 'Hernández', 31, 'jorge@example.com', '2223334447', 'Calle Mayor 789');

INSERT INTO Aspirantes (Nombre, Apellido, Edad, Email, Telefono, Direccion)
VALUES ('Marta', 'Luna', 24, 'marta@example.com', '6667778889', 'Plaza Central 012');

-- Inserción de datos en la tabla "Candidaturas"
INSERT INTO Candidaturas (IDOferta, IDAspirante, Estado)
VALUES (1, 1, 'Pendiente');

INSERT INTO Candidaturas (IDOferta, IDAspirante, Estado)
VALUES (1, 2, 'Preseleccionado');

INSERT INTO Candidaturas (IDOferta, IDAspirante, Estado)
VALUES (2, 3, 'Finalista');

INSERT INTO Candidaturas (IDOferta, IDAspirante, Estado)
VALUES (2, 4, 'Seleccionado');

INSERT INTO Candidaturas (IDOferta, IDAspirante, Estado)
VALUES (3, 5, 'Pendiente');

INSERT INTO Candidaturas (IDOferta, IDAspirante, Estado)
VALUES (3, 6, 'Preseleccionado');

INSERT INTO Candidaturas (IDOferta, IDAspirante, Estado)
VALUES (4, 7, 'Finalista');

INSERT INTO Candidaturas (IDOferta, IDAspirante, Estado)
VALUES (4, 8, 'Seleccionado');

INSERT INTO Candidaturas (IDOferta, IDAspirante, Estado)
VALUES (5, 9, 'Pendiente');

INSERT INTO Candidaturas (IDOferta, IDAspirante, Estado)
VALUES (5, 10, 'Preseleccionado');

INSERT INTO Candidaturas (IDOferta, IDAspirante, Estado)
VALUES (1, 3, 'Finalista');

INSERT INTO Candidaturas (IDOferta, IDAspirante, Estado)
VALUES (2, 5, 'Seleccionado');

INSERT INTO Candidaturas (IDOferta, IDAspirante, Estado)
VALUES (3, 7, 'Pendiente');

INSERT INTO Candidaturas (IDOferta, IDAspirante, Estado)
VALUES (4, 9, 'Preseleccionado');

INSERT INTO Candidaturas (IDOferta, IDAspirante, Estado)
VALUES (5, 1, 'Finalista');

INSERT INTO Candidaturas (IDOferta, IDAspirante, Estado)
VALUES (1, 4, 'Seleccionado');

INSERT INTO Candidaturas (IDOferta, IDAspirante, Estado)
VALUES (2, 6, 'Pendiente');

INSERT INTO Candidaturas (IDOferta, IDAspirante, Estado)
VALUES (3, 8, 'Preseleccionado');

INSERT INTO Candidaturas (IDOferta, IDAspirante, Estado)
VALUES (4, 10, 'Finalista');

INSERT INTO Candidaturas (IDOferta, IDAspirante, Estado)
VALUES (5, 2, 'Seleccionado');



SELECT o.Titulo, c.Estado
FROM OfertasDeEmpleo o
JOIN Candidaturas c ON o.IDOferta = c.IDOferta
JOIN Aspirantes a ON c.IDAspirante = a.IDAspirante
WHERE a.IDAspirante = 7;

SELECT *
FROM OfertasDeEmpleo
WHERE Ciudad = 'Ciudad B';

SELECT 
    CASE
        WHEN Edad BETWEEN 18 AND 25 THEN '18-25'
        WHEN Edad BETWEEN 26 AND 35 THEN '26-35'
        WHEN Edad BETWEEN 36 AND 45 THEN '36-45'
        ELSE '46+'
    END AS RangoEdad,
    COUNT(*) AS CantidadAspirantes
FROM Aspirantes
GROUP BY 
    CASE
        WHEN Edad BETWEEN 18 AND 25 THEN '18-25'
        WHEN Edad BETWEEN 26 AND 35 THEN '26-35'
        WHEN Edad BETWEEN 36 AND 45 THEN '36-45'
        ELSE '46+'
    END;


SELECT a.Nombre, a.Apellido, o.Titulo
FROM Aspirantes a
INNER JOIN Candidaturas c ON a.IDAspirante = c.IDAspirante
INNER JOIN OfertasDeEmpleo o ON c.IDOferta = o.IDOferta;

UPDATE Aspirantes
SET Email = 'nuevoemail@example.com'
WHERE IDAspirante = 1;

SELECT Email FROM Aspirantes WHERE IDAspirante = 1;


DELETE FROM Candidaturas
WHERE IDAspirante = 1;

SELECT * FROM Candidaturas;

SELECT *
FROM Aspirantes
WHERE Nombre LIKE 'A%';

SELECT COUNT(*) AS TotalUsuarios
FROM Candidatos;


SELECT *
FROM OfertasDeEmpleo
ORDER BY FechaPublicacion DESC;


SELECT 
    CASE
        WHEN Edad BETWEEN 18 AND 25 THEN '18-25'
        WHEN Edad BETWEEN 26 AND 35 THEN '26-35'
        WHEN Edad BETWEEN 36 AND 45 THEN '36-45'
        ELSE '46+'
    END AS RangoEdad,
    COUNT(*) AS NumeroAspirantes
FROM Aspirantes
GROUP BY 
    CASE
        WHEN Edad BETWEEN 18 AND 25 THEN '18-25'
        WHEN Edad BETWEEN 26 AND 35 THEN '26-35'
        WHEN Edad BETWEEN 36 AND 45 THEN '36-45'
        ELSE '46+'
    END
HAVING COUNT(*) > 5;


SELECT
    A.Nombre,
    A.Apellido,
    O.Titulo
FROM
    Aspirantes A
    INNER JOIN Candidaturas C ON A.IDAspirante = C.IDAspirante
    INNER JOIN OfertasDeEmpleo O ON C.IDOferta = O.IDOferta
WHERE
    O.Ciudad = 'Ciudad B';


SELECT
    O.Titulo,
    COUNT(C.IDAspirante) AS CantidadAspirantes
FROM
    OfertasDeEmpleo O
    LEFT JOIN Candidaturas C ON O.IDOferta = C.IDOferta
GROUP BY
    O.Titulo
ORDER BY
    CantidadAspirantes DESC;


CREATE OR REPLACE FUNCTION calcular_edad_promedio RETURN NUMBER IS
    edad_promedio NUMBER;
BEGIN
    SELECT AVG(Edad) INTO edad_promedio FROM Aspirantes;
    RETURN edad_promedio;
END;
/

SELECT calcular_edad_promedio() FROM dual;


CREATE OR REPLACE PROCEDURE obtener_nombre_y_correo (p_id_aspirante IN NUMBER) AS
    v_nombre VARCHAR2(50);
    v_correo VARCHAR2(100);
BEGIN
    SELECT Nombre, Email INTO v_nombre, v_correo FROM Aspirantes WHERE IDAspirante = p_id_aspirante;
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_nombre);
    DBMS_OUTPUT.PUT_LINE('Correo: ' || v_correo);
END;
/
BEGIN
    obtener_nombre_y_correo(3); -- Pasa el ID del aspirante que deseas consultar
END;

CREATE OR REPLACE TRIGGER actualizar_fecha_publicacion
BEFORE INSERT ON OfertasDeEmpleo
FOR EACH ROW
BEGIN
    :NEW.FechaPublicacion := SYSDATE;
END;
/
INSERT INTO OfertasDeEmpleo (Titulo, Descripcion, Empresa, Ciudad)
VALUES ('Desarrollador de Software', 'Empresa XYZ busca un desarrollador de software con experiencia en Java y SQL.', 'Empresa XYZ', 'Ciudad XYZ');

SELECT * FROM OfertasDeEmpleo;


CREATE OR REPLACE PROCEDURE mostrar_aspirantes_mayor_30 AS
    CURSOR c_aspirantes IS
        SELECT Nombre, Apellido, Edad
        FROM Aspirantes
        WHERE Edad > 30;
    v_nombre Aspirantes.Nombre%TYPE;
    v_apellido Aspirantes.Apellido%TYPE;
    v_edad Aspirantes.Edad%TYPE;
BEGIN
    OPEN c_aspirantes;
    LOOP
        FETCH c_aspirantes INTO v_nombre, v_apellido, v_edad;
        EXIT WHEN c_aspirantes%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_nombre || ', Apellido: ' || v_apellido || ', Edad: ' || v_edad);
    END LOOP;
    CLOSE c_aspirantes;
END;
/
BEGIN
    mostrar_aspirantes_mayor_30;
END;
/
SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE mostrar_ofertas_con_inscritos AS
    v_idoferta OfertasDeEmpleo.IDOferta%TYPE;
    v_titulo OfertasDeEmpleo.Titulo%TYPE;
    v_cantidad NUMBER;
BEGIN
    FOR oferta IN (SELECT IDOferta, Titulo FROM OfertasDeEmpleo) LOOP
        v_idoferta := oferta.IDOferta;
        v_titulo := oferta.Titulo;
        SELECT COUNT(*) INTO v_cantidad
        FROM Candidaturas
        WHERE IDOferta = v_idoferta;
        DBMS_OUTPUT.PUT_LINE('Oferta: ' || v_titulo || ', Inscritos: ' || v_cantidad);
    END LOOP;
END;
/
BEGIN
    mostrar_ofertas_con_inscritos;
END;
/
