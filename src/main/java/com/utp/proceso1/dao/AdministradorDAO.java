package com.utp.proceso1.dao;

import com.utp.proceso1.modelo.Administrador;
import com.utp.proceso1.servicio.conexionServicio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AdministradorDAO {
    private Connection connection;
    private final String TABLE_NAME = "administradores";

    public AdministradorDAO() {
        this.connection = conexionServicio.getInstancia().getConexion();
    }

    // CREATE
    public boolean create(Administrador administrador) {
        String sql = "INSERT INTO " + TABLE_NAME + " (usuario, contrasena, nombre_completo, correo, telefono, estado, fecha_creacion) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setString(1, administrador.getUsuario());
            stmp.setString(2, administrador.getContrasena());
            stmp.setString(3, administrador.getNombreCompleto());
            stmp.setString(4, administrador.getCorreo());
            stmp.setString(5, administrador.getTelefono());
            stmp.setBoolean(6, administrador.getEstado());
            stmp.setTimestamp(7, new java.sql.Timestamp(administrador.getFechaCreacion().getTime()));
            stmp.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // READ by ID
    public Administrador getAdministradorById(int id) {
        String sql = "SELECT * FROM " + TABLE_NAME + " WHERE id_admin = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setInt(1, id);
            ResultSet rs = stmp.executeQuery();
            if (rs.next()) {
                return mapAdministrador(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // READ all
    public List<Administrador> getAdministradores() {
        List<Administrador> administradores = new ArrayList<>();
        String sql = "SELECT * FROM " + TABLE_NAME;
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            ResultSet rs = stmp.executeQuery();
            while (rs.next()) {
                administradores.add(mapAdministrador(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return administradores;
    }

    // UPDATE
    public boolean updateAdministrador(Administrador administrador) {
        String sql = "UPDATE " + TABLE_NAME + " SET usuario = ?, contrasena = ?, nombre_completo = ?, correo = ?, telefono = ?, estado = ?, fecha_creacion = ? WHERE id_admin = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setString(1, administrador.getUsuario());
            stmp.setString(2, administrador.getContrasena());
            stmp.setString(3, administrador.getNombreCompleto());
            stmp.setString(4, administrador.getCorreo());
            stmp.setString(5, administrador.getTelefono());
            stmp.setBoolean(6, administrador.getEstado());
            stmp.setTimestamp(7, new java.sql.Timestamp(administrador.getFechaCreacion().getTime()));
            stmp.setInt(8, administrador.getId());
            stmp.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // DELETE
    public boolean deleteAdministrador(int id) {
        String sql = "DELETE FROM " + TABLE_NAME + " WHERE id_admin = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setInt(1, id);
            stmp.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // MAPEO
    private Administrador mapAdministrador(ResultSet rs) throws Exception {
        Administrador administrador = new Administrador();
        administrador.setId(rs.getInt("id_admin"));
        administrador.setUsuario(rs.getString("usuario"));
        administrador.setContrasena(rs.getString("contrasena"));
        administrador.setNombreCompleto(rs.getString("nombre_completo"));
        administrador.setCorreo(rs.getString("correo"));
        administrador.setTelefono(rs.getString("telefono"));
        administrador.setEstado(rs.getBoolean("estado"));
        administrador.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
        return administrador;
    }

    // funciones adicionales
    public Administrador getAdministradorByUsuario(String usuario) {
        String sql = "SELECT * FROM " + TABLE_NAME + " WHERE usuario = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setString(1, usuario);
            ResultSet rs = stmp.executeQuery();
            if (rs.next()) {
                return mapAdministrador(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Administrador validarCredenciales(String usuario, String contrasena) {
        String sql = "SELECT * FROM " + TABLE_NAME + " WHERE usuario = ? AND contrasena = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setString(1, usuario);
            stmp.setString(2, contrasena);
            ResultSet rs = stmp.executeQuery();
            return rs.next() ? mapAdministrador(rs) : null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
