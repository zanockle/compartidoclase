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
  
  CREATE or replace PROCEDURE sp_add_aalibros
         (
         v_isbn aa_libros.isbn%type,
         v_titulo aa_libros.titulo%type,
         v_precio aa_libros.precio%type default 0.0,
         v_autor aa_libros.autor%type default 'sin autor'
          
         )
       is
       
        BEGIN
        
            INSERT INTO AA_LIBROS(ISBN,TITULO,PRECIO,autor) VALUES
            (v_isbn,v_titulo, v_precio,v_autor);
        END sp_add_aalibros;
        
 execute sp_add_aalibros('147852','la insoportable levedad del ser','milan kundera','20,75');   
 execute sp_add_aalibros('147852','titulo1','95,66'); 
  execute sp_add_aalibros('147852','lazarillo de tormes','95,47','anonimo'); 
  
    execute sp_add_aalibros('5555','lazarillo de tormes','','tu tia'); 
      
      
select * from aa_libros;   
      
create or replace PROCEDURE sp_libros
As
cursor c_libros is select titulo,precio from aa_libros;
v_titulo aa_libros.titulo%type;
v_precio aa_libros.precio%type;
begin
open c_libros;
fetch c_libros into v_titulo,v_precio;
while c_libros%found loop
dbms_output.put_line(v_titulo || '-----' || v_precio);
fetch c_libros into v_titulo,v_precio;
end loop;
close c_libros;
end sp_libros;


     execute sp_libros; 
      

DECLARE
  pdf_id   plpdf.pdf_id;
BEGIN
  -- Inicializar el documento PDF
  pdf_id := plpdf.init;

  -- Agregar contenido al PDF
  plpdf.add_paragraph(pdf_id, '¡Hola, mundo PDF!');

  -- Guardar el PDF en un archivo
  plpdf.save(pdf_id, 'ruta_del_archivo.pdf');

  -- Liberar recursos
  plpdf.terminate(pdf_id);
END;
/
     
  declare   
    l_pdf blob;
begin plpdf.init();

plpdf.senddoc(l_pdf);
end;
      
      
      create or replace procedure helloworld is
l_pdf blob;
begin
plpdf.init();
plpdf.newpage();
plpdf.senddoc(l_pdf);
end;
      
      
      CREATE OR REPLACE PROCEDURE generar_pdf
  
  is
  pdf_id plpdf.utl_file_type;
BEGIN
  -- Inicializar el documento PDF
  pdf_id := plpdf.init;

  -- Agregar contenido al PDF
  plpdf.add_paragraph(pdf_id, '¡Hola, mundo PDF!');
  plpdf.add_paragraph(pdf_id, 'Este es un ejemplo de PDF generado con PL/PDF en Oracle Database.');

  -- Guardar el PDF en un archivo
  plpdf.save(pdf_id, 'ruta_del_archivo.pdf');

  -- Liberar recursos
  plpdf.terminate(pdf_id);

  -- Mostrar mensaje de éxito
  dbms_output.put_line('PDF generado exitosamente.');
END;
/
begin
plpdf.init();
end;


create or replace procedure pruebapdf is
l_pdf blob;
begin plpdf.init();
plpdf.senddoc(l_pdf);
plpdf.
end;
  
      
      
      
      
      