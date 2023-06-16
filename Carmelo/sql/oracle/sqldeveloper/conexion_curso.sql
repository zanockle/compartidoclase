SELECT * FROM alumnos;
SELECT * FROM asignaturas;
SELECT * FROM matriculas;

CREATE TABLE alumnos (

    id_alumno NUMBER(10) PRIMARY KEY,

    nombre VARCHAR2(50) NOT NULL,

    apellidos VARCHAR2(100) NOT NULL,

    fecha_nacimiento DATE,

    direccion VARCHAR2(200),

    telefono VARCHAR2(20),

    email VARCHAR2(100)

);


INSERT INTO alumnos (id_alumno, nombre, apellidos, fecha_nacimiento, direccion, telefono, email)
VALUES
(1, 'Juan', 'Pérez García', TO_DATE('1998-01-15', 'YYYY-MM-DD'), 'Calle Mayor 23', '123456789', 'juan.perez@example.com');

INSERT INTO alumnos (id_alumno, nombre, apellidos, fecha_nacimiento, direccion, telefono, email)
VALUES
(2, 'María', 'López Fernández', TO_DATE('1999-05-12', 'YYYY-MM-DD'), 'Plaza del Sol 7', '987654321', 'maria.lopez@example.com');
INSERT INTO alumnos (id_alumno, nombre, apellidos, fecha_nacimiento, direccion, telefono, email)
VALUES
(3, 'Pedro', 'González Sánchez', TO_DATE('1997-07-28', 'YYYY-MM-DD'), 'Avenida Libertad 45', '555444333', 'pedro.gonzalez@example.com');
INSERT INTO alumnos (id_alumno, nombre, apellidos, fecha_nacimiento, direccion, telefono, email)
VALUES
(4, 'Laura', 'Martínez Rodríguez', TO_DATE('2000-11-03', 'YYYY-MM-DD'), 'Calle Real 12', '222333444', 'laura.martinez@example.com');
INSERT INTO alumnos (id_alumno, nombre, apellidos, fecha_nacimiento, direccion, telefono, email)
VALUES
(5, 'Manuel', 'Hernández Ruiz', TO_DATE('1996-03-22', 'YYYY-MM-DD'), 'Calle del Sol 34', '666777888', 'manuel.hernandez@example.com');

CREATE TABLE asignaturas (

  id_asignatura NUMBER(10) PRIMARY KEY,

  nombre VARCHAR2(50) NOT NULL,

  creditos NUMBER(5) NOT NULL,

  precio NUMBER(10, 2) NOT NULL

);


CREATE TABLE matriculas (

  id_matricula NUMBER(10) PRIMARY KEY,

  id_alumno NUMBER(10) NOT NULL,

  id_asignatura NUMBER(10) NOT NULL,

  fecha_matricula DATE NOT NULL,

  CONSTRAINT fk_matricula_alumno

    FOREIGN KEY (id_alumno)

    REFERENCES alumnos(id_alumno)

    ON DELETE CASCADE,

  CONSTRAINT fk_matricula_asignatura

    FOREIGN KEY (id_asignatura)

    REFERENCES asignaturas(id_asignatura)

    ON DELETE CASCADE

);


INSERT INTO asignaturas (id_asignatura, nombre, creditos, precio)
VALUES (1, 'Matemáticas', 4, 100);

INSERT INTO asignaturas (id_asignatura, nombre, creditos, precio)
VALUES (2, 'Física', 3, 80);

INSERT INTO asignaturas (id_asignatura, nombre, creditos, precio)
VALUES (3, 'Química', 3, 75);

INSERT INTO asignaturas (id_asignatura, nombre, creditos, precio)
VALUES (4, 'Historia', 2, 50);

INSERT INTO asignaturas (id_asignatura, nombre, creditos, precio)
VALUES (5, 'Inglés', 2, 60);

INSERT INTO asignaturas (id_asignatura, nombre, creditos, precio)
VALUES (6, 'Programación', 5, 120);



INSERT INTO matriculas (id_matricula, id_alumno, id_asignatura, fecha_matricula)
VALUES (1, 1, 1, TO_DATE('2023-05-12', 'YYYY-MM-DD'));

INSERT INTO matriculas (id_matricula, id_alumno, id_asignatura, fecha_matricula)
VALUES (2, 1, 2, TO_DATE('2023-05-12', 'YYYY-MM-DD'));

INSERT INTO matriculas (id_matricula, id_alumno, id_asignatura, fecha_matricula)
VALUES (3, 1, 3, TO_DATE('2023-05-12', 'YYYY-MM-DD'));

INSERT INTO matriculas (id_matricula, id_alumno, id_asignatura, fecha_matricula)
VALUES (4, 2, 1, TO_DATE('2023-05-12', 'YYYY-MM-DD'));

INSERT INTO matriculas (id_matricula, id_alumno, id_asignatura, fecha_matricula)
VALUES (5, 2, 4, TO_DATE('2023-05-12', 'YYYY-MM-DD'));

INSERT INTO matriculas (id_matricula, id_alumno, id_asignatura, fecha_matricula)
VALUES (6, 3, 1, TO_DATE('2023-05-12', 'YYYY-MM-DD'));

INSERT INTO matriculas (id_matricula, id_alumno, id_asignatura, fecha_matricula)
VALUES (7, 3, 5, TO_DATE('2023-05-12', 'YYYY-MM-DD'));

INSERT INTO matriculas (id_matricula, id_alumno, id_asignatura, fecha_matricula)
VALUES (8, 4, 6, TO_DATE('2023-05-12', 'YYYY-MM-DD'));



INSERT INTO alumnos (id_alumno, nombre, apellidos, fecha_nacimiento, direccion, telefono, email)
VALUES (6, 'María', 'García', TO_DATE('2001-02-02', 'YYYY-MM-DD'), 'Avenida 456', '987654321', 'maria.garcia@example.com');

INSERT INTO alumnos (id_alumno, nombre, apellidos, fecha_nacimiento, direccion, telefono, email)
VALUES (7, 'Pedro', 'López', TO_DATE('2002-03-03', 'YYYY-MM-DD'), 'Carrera 789', '456123789', 'pedro.lopez@example.com');

INSERT INTO alumnos (id_alumno, nombre, apellidos, fecha_nacimiento, direccion, telefono, email)
VALUES (8, 'Ana', 'Martínez', TO_DATE('2003-04-04', 'YYYY-MM-DD'), 'Calle 456', '789123456', 'ana.martinez@example.com');

INSERT INTO alumnos (id_alumno, nombre, apellidos, fecha_nacimiento, direccion, telefono, email)
VALUES (9, 'Luis', 'Hernández', TO_DATE('2004-05-05', 'YYYY-MM-DD'), 'Avenida 789', '321654987', 'luis.hernandez@example.com');

INSERT INTO alumnos (id_alumno, nombre, apellidos, fecha_nacimiento, direccion, telefono, email)
VALUES (10, 'Sofía', 'Gómez', TO_DATE('2005-06-06', 'YYYY-MM-DD'), 'Carrera 123', '654987321', 'sofia.gomez@example.com');

INSERT INTO alumnos (id_alumno, nombre, apellidos, fecha_nacimiento, direccion, telefono, email)
VALUES (11, 'Carlos', 'Ruiz', TO_DATE('2006-07-07', 'YYYY-MM-DD'), 'Calle 789', '987321654', 'carlos.ruiz@example.com');