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
(3, 'laura', 'Pérez García', TO_DATE('1998-01-15', 'YYYY-MM-DD'), 'Calle Mayor 23', '123456789', 'juan.perez@example.com');

SELECT * FROM alumnos;

CREATE TABLE asignaturas (
  id_asignatura NUMBER(10) PRIMARY KEY,
  nombre VARCHAR2(50) NOT NULL,
  creditos NUMBER(5) NOT NULL,
  precio NUMBER(10, 2) NOT NULL
);


INSERT INTO asignaturas VALUES 
(3,'oracle',5,25.85);

SELECT * FROM asignaturas;

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

INSERT INTO matriculas VALUES (2,3,1,TO_DATE('1998-01-15', 'YYYY-MM-DD'));
 SELECT * FROM matriculas;
 
 /*1. Inserta hasta 7 alumnos. Intenta con GPT  hacerlo más rápido*/
 /*bulk NO porque no son millones de filas*/

INSERT ALL 
 INTO  alumnos  VALUES
(11, 'eva', 'Pérez García', TO_DATE('1998-01-15', 'YYYY-MM-DD'), NULL, '123456789', '')
 INTO  alumnos  VALUES
(8, 'ana', 'Pérez García', TO_DATE('1998-01-15', 'YYYY-MM-DD'), NULL, '123456789', '')
 INTO  alumnos  VALUES
(9, 'eva', 'Pérez García', TO_DATE('1998-01-15', 'YYYY-MM-DD'), NULL, '123456789', '')
 INTO  alumnos  VALUES
(10, 'marta', 'Pérez García', TO_DATE('1998-01-15', 'YYYY-MM-DD'), NULL, '123456789', '')
SELECT * FROM DUAL
;

select * from alumnos;
/*
2. Añade 6 asignaturas, con precios con decimales*/

INSERT INTO asignaturas VALUES 
(4,'historia',5,13.85);
/*
3. Matricula a los alumnos en asignaturas. 
Puede un alumno estar matriculado en más de una.
*/
INSERT INTO matriculas VALUES (12,3,2,TO_DATE('1998-01-15', 'YYYY-MM-DD'));
/*
INSERT INTO matriculas (id_matricula, id_alumno, id_asignatura, fecha_matricula)
SELECT ROWNUM, 3, ROUND(DBMS_RANDOM.VALUE(1, 7)), TO_DATE('1998-01-15', 'YYYY-MM-DD')
FROM dual
CONNECT BY level <= 10;*/


/*
4. Muestra le precio medio del coste de las
 asignaturas
*/

SELECT avg(precio) as "Precio_Medio" FROM asignaturas;
/*
5. Muestra el nombre y la asignatura en la 
que está matriculado cada alumno
*/
select * from matriculas;

SELECT al.nombre as NombreAlumno,asi.nombre as Nombre_asignatura
FROM alumnos al
INNER JOIN matriculas ma
on al.id_alumno=ma.id_alumno
inner join asignaturas asi
on ma.id_asignatura=asi.id_asignatura;

/*
6. Dime cuántas matrículas tiene cada asignatura/*/

SELECT asignaturas.nombre, count(matriculas.id_asignatura) 
FROM matriculas
inner join asignaturas
on matriculas.id_asignatura=asignaturas.id_asignatura
 group by asignaturas.nombre
;
/*
7. Dime qué alumnos NO están matriculados.
*/
SELECT alumnos.id_alumno
from alumnos
left join matriculas
on alumnos.id_alumno=matriculas.id_alumno
where matriculas.id_alumno IS NULL
ORDER BY alumnos.id_alumno;
 
SELECT * FROM MATRICULAS;
 
 
 