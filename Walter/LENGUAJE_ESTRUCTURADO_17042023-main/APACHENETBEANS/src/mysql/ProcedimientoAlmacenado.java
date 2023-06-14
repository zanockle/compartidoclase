
package mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProcedimientoAlmacenado {

    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306";
        String usuario = "root";
        String contrasenia = "";
        
        try
        {
            Connection conexion = DriverManager.getConnection(url, usuario, contrasenia);
        } catch (SQLException ex) {
            Logger.getLogger(ProcedimientoAlmacenado.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
