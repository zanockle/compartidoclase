import os
import sqlite3
from os import path
from sqlite3 import Error

def crear_tabla():
    nra = 'SQLITE\\instituto.sqlite'
    conexion = sqlite3.connect(nra)
    cursor = conexion.cursor()
    sql = """CREATE TABLE IF NOT EXISTS Alumno (
                idAlumno INTEGER PRIMARY KEY AUTOINCREMENT,
                nombre VARCHAR(20),
                estatura DOUBLE,
                edad INTEGER,
                casado BOOLEAN
    );""" #comentario
    cursor.execute(sql)
    print("OK: CREAR TABLA")

def insertar_registro():
    nra = 'SQLITE\\instituto.sqlite'
    conexion = sqlite3.connect(nra)
    cursor = conexion.cursor()
    insert_1 = ["INSERT INTO Alumno(nombre, estatura, edad, casado) VALUES('Luis', 1.72, 23, True);",
                "INSERT INTO Alumno(nombre, estatura, edad, casado) VALUES('Carlos', 1.73, 32, True);",
                "INSERT INTO Alumno(nombre, estatura, edad, casado) VALUES('Marcos', 1.86, 33, False);"]
    for insert in insert_1:
        cursor.execute(insert)
    print("OK: INSERTAR REGISTRO")
    conexion.commit()
    conexion.close()

def mostrar_registro():
    nra = 'SQLITE\\instituto.sqlite'
    conexion = sqlite3.connect(nra)
    cursor = conexion.cursor()
    query = "SELECT * FROM Alumno"
    cursor.execute(query)
    registros_1 = cursor.fetchall()
    print(registros_1)
    
def eliminar_registro():
    nra = 'SQLITE\\instituto.sqlite'
    conexion = sqlite3.connect(nra)
    cursor = conexion.cursor()
    idAlumnoEliminar = int(input('Ingrese id alumno eliminar: '))
    query = "DELETE FROM Alumno WHERE idAlumno = ?", (idAlumnoEliminar,)
    cursor.execute("DELETE FROM Alumno WHERE idAlumno = ?", (idAlumnoEliminar,))
    conexion.commit()
    conexion.close()

def actualizar_registro():
    conexion = getconexion()
    if conexion != None:
        cursor = conexion.cursor()
        idAlumnoActualizar = input("Ingrese id alumno actualizar: ")
        nombre = input("Ingrese nuevo nombre: ")
        cursor.execute('UPDATE Alumno SET nombre = ? WHERE idAlumno = ?', (nombre, idAlumnoActualizar))
        conexion.commit()
        conexion.close()

def eliminaTabla():
    conexion = getconexion()
    if conexion != None:
        sql = "DROP TABLE Alumno;"
        cursor = conexion.cursor()
        cursor.execute(sql)
        conexion.commit()
        conexion.close()
        print("TABLA ELIMINADA")

def getconexion():
    nra = 'SQLITE\\instituto.sqlite'
    try:
        if path.exists(nra):
            conexion = sqlite3.connect(nra)
        else:
            conexion = None
        return conexion
    except Error:
        return None
    cursor = conexion.cursor()

if __name__ == "__main__":
    os.system("cls")
    eliminaTabla()