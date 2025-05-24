
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
     Connection con=null;

    public Connection getConexion() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_hotelcusco", "root", "");
            System.out.println("✅Conexion Exitosa");
        } catch (Exception e) {
            System.out.println("❌ Error de conexión: " + e.getMessage());
            e.printStackTrace();
        }
        return con;
    }
}
