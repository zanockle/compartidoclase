
SELECT * FROM libros;

CREATE TABLE aa_log (
id NUMBER GENERATED ALWAYS AS IDENTITY,
detalle VARCHAR2(200));

CREATE OR REPLACE TRIGGER auditar_libros 
BEFORE INSERT OR DELETE
ON libros
FOR EACH ROW
BEGIN
IF DELETING THEN
INSERT INTO aa_log (detalle)
VALUES(TO_CHAR(sysdate,'DD/MM/YY*HH24:MI*')
|| :OLD.isbn|| '*' || :OLD.titulo || '* BORRADO ');
ELSIF INSERTING THEN
INSERT INTO aa_log (detalle)
VALUES(TO_CHAR(sysdate,'DD/MM/YY*HH24:MI*')
|| :NEW.isbn || '*' || :NEW.autor||'* INSERCION ');
END IF;
END;

CREATE OR REPLACE TRIGGER auditar_libros1
BEFORE UPDATE
ON libros
FOR EACH ROW
DECLARE v_cad_inser aa_log.detalle%TYPE;
BEGIN
v_cad_inser := TO_CHAR(sysdate,'DD/MM/YY*HH24:MI*') || 
IF UPDATING ('precio') THEN
