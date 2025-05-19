package com.utp.proceso1.dao;

import  com.utp.proceso1.modelo.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class ClienteDAO {
    private Connection connection;

    public ClienteDAO(Connection connection) {
        this.connection = connection;
    }

    //METODOS CRUD
    public boolean create(Cliente cliente) {
        String sql = "INSERT INTO cliente (nombre, dni, telefono, email) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setString(1, cliente.getNombre());
            stmp.setString(2, cliente.getDni());
            stmp.setString(3, cliente.getTelefono());
            stmp.setString(4, cliente.getEmail());
            stmp.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }
}
