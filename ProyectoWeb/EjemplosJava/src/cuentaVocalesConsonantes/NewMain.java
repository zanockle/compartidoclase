
package cuentaVocalesConsonantes;

import java.util.Scanner;

public class NewMain {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String erVocales = "[aeiouAEIOU]+";
        String erConsonantes = "[a-z]+";
        while(true)
        {
        System.out.print("Ingrese cadena: ");
        String s = sc.next();
        int vocales = 0, consonantes = 0;
        for (int i = 0; i < s.length(); i++)
        {
            String letra = s.charAt(i) + "";
            if (letra.matches(erVocales))
            {
                vocales++;
            }
            else if(letra.matches(erConsonantes))
            {
                consonantes++;
            }
        }
       System.out.println("Vocales: " + vocales);
       System.out.println("Consonantes: " + consonantes);
        }
    }
    
}
