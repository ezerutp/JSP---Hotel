package com.utp.proceso1.dao;

import com.utp.proceso1.modelo.Empleado;
import com.utp.proceso1.servicio.conexionServicio;
import com.utp.proceso1.utilidades.EnumHotel.tipoRol;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;

public class EmpleadoDAO {
    private Connection connection;
    private final String TABLE_NAME = "empleado";

    public EmpleadoDAO() {
        this.connection = conexionServicio.getInstancia().getConexion();
    }

    // METODOS CRUD

    // create
    public boolean create(Empleado empleado) {
        Empleado empleadoExistente = getEmpleadoByUsuario(empleado.getUsuario());
        if (empleadoExistente != null) {
            return false; // El empleado ya existe
        }
        String sql = "INSERT INTO " + TABLE_NAME + " (usuario, clave, nombre, rol) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setString(1, empleado.getUsuario());
            stmp.setString(2, empleado.getClave());
            stmp.setString(3, empleado.getNombre());
            stmp.setString(4, empleado.getRol().toString());
            stmp.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // getEmpleadoById
    public Empleado getEmpleadoById(int id) {
        String sql = "SELECT * FROM " + TABLE_NAME + " WHERE id = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setInt(1, id);
            ResultSet rs = stmp.executeQuery();
            if (rs.next()) {
                return mapEmpleado(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // getEmpleadoByUsuario
    public Empleado getEmpleadoByUsuario(String usuario) {
        String sql = "SELECT * FROM " + TABLE_NAME + " WHERE usuario = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setString(1, usuario);
            ResultSet rs = stmp.executeQuery();
            if (rs.next()) {
                return mapEmpleado(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // getEmpleados
    public List<Empleado> getEmpleados() {
        List<Empleado> empleados = new ArrayList<>();
        String sql = "SELECT * FROM " + TABLE_NAME;
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            ResultSet rs = stmp.executeQuery();
            while (rs.next()) {
                empleados.add(mapEmpleado(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return empleados;
    }

    // updateEmpleado
    public boolean updateEmpleado(Empleado empleado) {
        String sql = "UPDATE " + TABLE_NAME + " SET usuario = ?, clave = ?, nombre = ?, rol = ? WHERE id = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setString(1, empleado.getUsuario());
            stmp.setString(2, empleado.getClave());
            stmp.setString(3, empleado.getNombre());
            stmp.setString(4, empleado.getRol().toString());
            stmp.setInt(5, empleado.getId());
            stmp.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // deleteEmpleado
    public boolean deleteEmpleado(int id) {
        String sql = "DELETE FROM " + TABLE_NAME + " WHERE id = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setInt(1, id);
            stmp.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private Empleado mapEmpleado(ResultSet rs) throws Exception {
        Empleado empleado = new Empleado();
        empleado.setId(rs.getInt("id"));
        empleado.setUsuario(rs.getString("usuario"));
        empleado.setClave(rs.getString("clave"));
        empleado.setNombre(rs.getString("nombre"));
        empleado.setRol(getRolByString(rs.getString("rol")));
        return empleado;
    }

    // METODOS PRIVADOS
    private tipoRol getRolByString(String rol) {
        switch (rol.toUpperCase()) {
            case "ADMIN":
                return tipoRol.ADMIN;
            case "RECEPCIONISTA":
                return tipoRol.RECEPCIONISTA;
            default:
                return null;
        }
    }

    
}
