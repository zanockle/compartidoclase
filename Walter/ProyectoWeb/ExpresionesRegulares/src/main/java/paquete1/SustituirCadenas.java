
package paquete1;

public class SustituirCadenas {

    public static void main(String[] args) {
        String cadena = "guatemala 19 de Marzo del 2012";
        String er = "[0-9]+";
        String resultadoCadena = cadena.replaceAll(er, "nada");
        System.out.println("Resultado: " + resultadoCadena);
    }
    
}
