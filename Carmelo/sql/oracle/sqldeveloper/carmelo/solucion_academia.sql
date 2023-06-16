/*Ejercicio academia*/
use sys;
CREATE TABLE asignaturas (
  id_asignatura INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  precio_mensual DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id_asignatura)
);

SELECT * FROM asignaturas;

INSERT INTO asignaturas (nombre, precio_mensual) 
VALUES 
('Matemáticas', 50.00),
('Inglés', 60.00),
('Historia', 40.00),
('Física', 55.00),
('Química', 45.00);

DROP TABLE alumnos;
CREATE TABLE alumnos (
  id_alumno INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  apellido_paterno VARCHAR(50) NOT NULL,
  apellido_materno VARCHAR(50) ,
  fecha_nacimiento DATE,
  calle VARCHAR(100),
  numero_exterior VARCHAR(10),
  numero_interior VARCHAR(10),
  colonia VARCHAR(50),
  codigo_postal VARCHAR(10),
  ciudad VARCHAR(50),
  estado VARCHAR(50),
  pais VARCHAR(50),
  telefono VARCHAR(15),
  email VARCHAR(100),
  PRIMARY KEY (id_alumno)
);

INSERT INTO alumnos (nombre, apellido_paterno, email, telefono) VALUES 
('Juan', 'Pérez', 'juan.perez@example.com', '123456789'),
('María', 'García', 'maria.garcia@example.com', '987654321'),
('Pedro', 'Fernández', 'pedro.fernandez@example.com', '555555555'),
('Ana', 'Martínez', 'ana.martinez@example.com', '111111111');

SELECT * FROM alumnos;

CREATE TABLE Matriculas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_alumno INT NOT NULL,
  id_asignatura INT NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE,
  FOREIGN KEY (id_alumno) REFERENCES Alumnos (id_alumno),
  FOREIGN KEY (id_asignatura) REFERENCES Asignaturas (id_asignatura)
);

ALTER TABLE matriculas
ADD CONSTRAINT fk_alumno
FOREIGN KEY (id_alumno)
REFERENCES alumnos(id_alumno);

ALTER TABLE matriculas
ADD CONSTRAINT fk_asignatura
FOREIGN KEY (id_asignatura)
REFERENCES asignaturas(id_asignatura);

INSERT INTO matriculas (id_alumno,id_asignatura,fecha_inicio)
VALUES (1,1,'2023-05-10');

SELECT * FROM matriculas;
SELECT * FROM alumnos;
SELECT * FROM asignaturas;

INSERT INTO matriculas (id_alumno, id_asignatura, fecha_inicio)
VALUES (2, 3, '2023-05-09'),
       (4, 5, '2023-05-08'),
       (1, 2, '2023-05-07'),
       (3, 4, '2023-05-10'),
       (2, 1, '2023-05-06'),
       (1, 3, '2023-05-09'),
       (4, 2, '2023-05-10'),
       (2, 4, '2023-05-05'),
       (3, 5, '2023-05-04'),
       (4, 2, '2023-05-08');
