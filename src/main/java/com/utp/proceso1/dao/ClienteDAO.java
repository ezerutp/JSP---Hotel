package com.utp.proceso1.dao;

import com.utp.proceso1.modelo.Cliente;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;

public class ClienteDAO {
    private Connection connection;

    public ClienteDAO(Connection connection) {
        this.connection = connection;
    }

    // METODOS CRUD

    // create
    public boolean create(Cliente cliente) {
        Cliente clienteExistente = getClienteByDni(cliente.getDni());
        if (clienteExistente != null) {
            return false; // El cliente ya existe
        }
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

    // getclienteById
    public Cliente getClienteById(int id) {
        String sql = "SELECT * FROM cliente WHERE id_cliente = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setInt(1, id);
            ResultSet rs = stmp.executeQuery();
            if (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(rs.getInt("id_cliente"));
                cliente.setNombre(rs.getString("nombre"));
                cliente.setDni(rs.getString("dni"));
                cliente.setTelefono(rs.getString("telefono"));
                cliente.setEmail(rs.getString("email"));
                return cliente;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // getclienteByDni
    public Cliente getClienteByDni(String dni) {
        String sql = "SELECT * FROM cliente WHERE dni = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setString(1, dni);
            ResultSet rs = stmp.executeQuery();
            if (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(rs.getInt("id_cliente"));
                cliente.setNombre(rs.getString("nombre"));
                cliente.setDni(rs.getString("dni"));
                cliente.setTelefono(rs.getString("telefono"));
                cliente.setEmail(rs.getString("email"));
                return cliente;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // getClientes
    public List<Cliente> getClientes() {
        List<Cliente> clientes = new ArrayList<>();
        String sql = "SELECT * FROM cliente";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            ResultSet rs = stmp.executeQuery();
            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(rs.getInt("id_cliente"));
                cliente.setNombre(rs.getString("nombre"));
                cliente.setDni(rs.getString("dni"));
                cliente.setTelefono(rs.getString("telefono"));
                cliente.setEmail(rs.getString("email"));
                clientes.add(cliente);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return clientes;
    }

    // updateCliente
    public boolean updateCliente(Cliente cliente) {
        String sql = "UPDATE cliente SET nombre = ?, dni = ?, telefono = ?, email = ? WHERE id_cliente = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setString(1, cliente.getNombre());
            stmp.setString(2, cliente.getDni());
            stmp.setString(3, cliente.getTelefono());
            stmp.setString(4, cliente.getEmail());
            stmp.setInt(5, cliente.getId());
            stmp.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // deleteCliente
    public boolean deleteCliente(int id) {
        String sql = "DELETE FROM cliente WHERE id_cliente = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setInt(1, id);
            stmp.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
