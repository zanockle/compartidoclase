CREATE PROCEDURE sp_sumar
       (v_n1 NUMBER,
       v_n2 NUMBER)
      IS
      v_total NUMBER;
          
      BEGIN
          v_total:=v_n1+v_n2;
          dbms_output.put_line('El resultado es '||v_total);
      END sp_sumar;
      
execute sp_sumar(10,15);

CREATE or replace PROCEDURE sp_bucle
       (v_numero NUMBER)
      IS
          v_total NUMBER;
      BEGIN
       v_total:=0;
         For i in 1..v_numero LOOP
         v_total:=v_total+i;
         
        end loop; 
        dbms_output.put_line('La suma de los número es ' ||v_total);
      END sp_bucle;
      
      execute sp_bucle(20);
      
      
      
      
/*    crea una tabla de libros
id, isbn, titulo, autor, precio
añades 5 libros

crea un sp para insertar libros en la tabla.
a veces, metes el título y el precio.
otras veces metes el titulo, autor, precio
el isbn siempre se mete y es obligatorio  
  */
  
  CREATE TABLE AA_LIBROS (
    ID NUMBER GENERATED ALWAYS AS IDENTITY,
    ISBN VARCHAR2(20) not null,
    TITULO VARCHAR2(100),
    AUTOR VARCHAR2(100) DEFAULT 'pendiente',
    PRECIO NUMBER(10,2),
    CONSTRAINT PK_LIBRO PRIMARY KEY(ID)
  );
  
  INSERT INTO AA_LIBROS(ISBN,TITULO,AUTOR,PRECIO) VALUES('123456','EL QUIJOTE','CERVANTES',15.99);
   INSERT INTO AA_LIBROS(ISBN,TITULO,AUTOR,PRECIO) VALUES('45874','LA COLMENA','CELA',15.99);
    INSERT INTO AA_LIBROS(ISBN,TITULO,PRECIO) VALUES('998877','LA REGENTA',15.99);
      
      SELECT * FROM AA_LIBROS;
      
  /*EL GRABADOR DE DATOS, A VECES NOS DA TITULO Y EL PRECIO Y EL ISBN, Y A VECES, TAMBIÉN NOS DA EL AUTOR*/
  /*CREA UN SP PARA AGILIZAR LA INTRODUCCIÓN DE LIBROS*/
  
  
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      