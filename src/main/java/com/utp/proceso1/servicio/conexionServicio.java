package com.utp.proceso1.servicio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexionServicio {
    // Patron Singleton
    private static conexionServicio instancia;
    private Connection conexion;
    private static final String URL = "jdbc:mysql://localhost:3306/db_hotelcusco";
    private static final String USUARIO = "root";
    private static final String CONTRASENA = "";
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    
    private conexionServicio() {
        try {
            Class.forName(DRIVER);
            this.conexion = DriverManager.getConnection(URL, USUARIO, CONTRASENA);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static conexionServicio getInstancia() {
        if (instancia == null) {
            instancia = new conexionServicio();
        }
        return instancia;
    }

    public Connection getConexion() {
        return conexion;
    }

}
