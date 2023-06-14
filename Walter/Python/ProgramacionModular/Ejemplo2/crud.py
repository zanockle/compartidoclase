

def buscar(idAlumno, alumnos_1):
    alumnoBuscar = {}
    for alumno_d in alumnos_1:
        if alumno_d["idAlumno"] == idAlumno:
            alumnoBuscar = alumno_d
            break
    return alumnoBuscar

def mostrar():
    pass

def eliminar(idAlumno, alumnos_1):
    alumnoBorrar = buscar(idAlumno, alumnos_1)
    alumnos_1.remove(alumnoBorrar)
    pass