package paquete1;

public class NormalizarEspacios {

    public static void main(String[] args) {
        String cadena = "guatemala      19    de    Marzo    del    2012";
        String er = "[ ]+";
        String resultadoCadena = cadena.replaceAll(er, " ");
        System.out.println("Resultado: " + resultadoCadena);
    }
    
}
