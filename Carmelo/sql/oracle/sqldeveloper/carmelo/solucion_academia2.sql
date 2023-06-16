USE sys;
SELECT * FROM alumnos;
SELECT * FROM asignaturas;
SELECT * FROM matriculas;


/*informe1. qué alumnos están matriculados y en qué asignaturas*/
/*INNER JOIN... PORQUE BUSCAMOS COINCIDENTES*/
SELECT alumnos.nombre,alumnos.apellido_paterno,matriculas.fecha_inicio,asignaturas.nombre
FROM matriculas 
INNER JOIN alumnos
ON alumnos.id_alumno=matriculas.id_alumno
INNER JOIN asignaturas
ON asignaturas.id_asignatura=matriculas.id_asignatura
;

/*informe2. dime qué asignaturas NO tienen ningún alumno matriculado*/
SELECT a.nombre
FROM asignaturas AS a
LEFT JOIN matriculas AS m /*EL ORDEN EN FROM Y JOIN EN ESTOS CASOS SÍ ES IMPORTANTE*/
ON a.id_asignatura=m.id_asignatura
WHERE m.id_asignatura IS NULL
;

/*informe3. Saca las factura del mes para un alumno.*/
SELECT alumnos.nombre,SUM(asignaturas.precio_mensual) /*CAMPO CALCULADO ES DE GROUP BY*/
FROM matriculas  /* NO NECESITO GROUP BY PORQUE SOLO HAY UN CAMPO*/
INNER JOIN alumnos
ON alumnos.id_alumno=matriculas.id_alumno
INNER JOIN asignaturas
ON asignaturas.id_asignatura=matriculas.id_asignatura
WHERE alumnos.id_alumno=2
;