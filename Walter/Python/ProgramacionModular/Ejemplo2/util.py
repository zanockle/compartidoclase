def cabecera():
    print('%-8s %-10s %4s  %-6s' % ('IDALUMNO', 'NOMBRE', 'EDAD', 'CASADO'))
    print('%-8s %-10s %4s  %-6s' % (pintarGuiones('IDALUMNO'), pintarGuiones('NOMBRE'), pintarGuiones('EDAD'), pintarGuiones('CASADO')))
    pass

def cuerpo(alumno_d):
    print('%-8s %-10s %4s  %-6s' % (alumno_d['idAlumno'],
                                    alumno_d['nombre'],
                                    alumno_d['edad'],
                                    alumno_d['casado']))
    pass

def pintarGuiones(cadena):
    s = ''
    for i in range(len(cadena)):
        s = s + '-'
        return s