from util import cabecera, cuerpo
from crud import *

def opcion1(alumnos_1):
    cabecera()
    for alumno_d in alumnos_1:
        cuerpo(alumno_d)
    pass
def opcion2(alumnos_1):
    idAlumno = input("Ingrese ID de alumno: ")
    alumnoBuscar = buscar(idAlumno, alumnos_1)
    cabecera()
    cuerpo(alumnoBuscar)
    pass
def opcion3(alumnos_1):
    idAlumno = input("Ingrese ID de alumno: ")
    eliminar(idAlumno, alumnos_1)
    pass
def opcion4(alumnos_1):
    idAlumno = input("Ingrese ID de alumno: ")
    nuevoNombre = input("Introduzca el nuevo nombre de alumno: ")
    alumnoBuscar = buscar(idAlumno, alumnos_1)
    alumnoBuscar['nombre'] = nuevoNombre
    pass
def opcion5(alumnos_1):
    idInicial = input("Introduzca ID inicial: ")
    idFinal = input("Introduzca ID final: ")
    
    pass
def opcion6():
    pass
def opcion7():
    pass
def opcion8():
    exit
    pass