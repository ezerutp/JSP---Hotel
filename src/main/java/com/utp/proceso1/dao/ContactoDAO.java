package com.utp.proceso1.dao;

import com.utp.proceso1.modelo.Contacto;
import com.utp.proceso1.servicio.conexionServicio;
import com.utp.proceso1.utilidades.EnumHotel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ContactoDAO {
    private Connection connection;
    private final String TABLE_NAME = "mensajes_contacto";

    public ContactoDAO() {
        this.connection = conexionServicio.getInstancia().getConexion();
    }

    // CREATE
    public boolean create(Contacto contacto) {
        String sql = "INSERT INTO " + TABLE_NAME + " (nombre_completo, correo_electronico, telefono, mensaje, fecha_envio, estado) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setString(1, contacto.getNombreCompleto());
            stmp.setString(2, contacto.getCorreo());
            stmp.setInt(3, contacto.getTelefono());
            stmp.setString(4, contacto.getMensaje());
            stmp.setDate(5, new java.sql.Date(contacto.getFechaEnvio().getTime()));
            stmp.setString(6, contacto.getEstado().name());
            stmp.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // READ by ID
    public Contacto getContactoById(int id) {
        String sql = "SELECT * FROM " + TABLE_NAME + " WHERE id_mensaje = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setInt(1, id);
            ResultSet rs = stmp.executeQuery();
            if (rs.next()) {
                return mapContacto(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // READ all
    public List<Contacto> getContactos() {
        List<Contacto> contactos = new ArrayList<>();
        String sql = "SELECT * FROM " + TABLE_NAME;
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            ResultSet rs = stmp.executeQuery();
            while (rs.next()) {
                contactos.add(mapContacto(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return contactos;
    }

    // UPDATE
    public boolean updateContacto(Contacto contacto) {
        String sql = "UPDATE " + TABLE_NAME + " SET nombre_completo = ?, correo_electronico = ?, telefono = ?, mensaje = ?, fecha_envio = ?, estado = ? WHERE id_mensaje = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setString(1, contacto.getNombreCompleto());
            stmp.setString(2, contacto.getCorreo());
            stmp.setInt(3, contacto.getTelefono());
            stmp.setString(4, contacto.getMensaje());
            stmp.setDate(5, new java.sql.Date(contacto.getFechaEnvio().getTime()));
            stmp.setString(6, contacto.getEstado().name());
            stmp.setInt(7, contacto.getId());
            stmp.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // DELETE
    public boolean deleteContacto(int id) {
        String sql = "DELETE FROM " + TABLE_NAME + " WHERE id_mensaje = ?";
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
    private Contacto mapContacto(ResultSet rs) throws Exception {
        Contacto contacto = new Contacto();
        contacto.setId(rs.getInt("id_mensaje"));
        contacto.setNombreCompleto(rs.getString("nombre_completo"));
        contacto.setCorreo(rs.getString("correo_electronico"));
        contacto.setTelefono(rs.getInt("telefono"));
        contacto.setMensaje(rs.getString("mensaje"));
        contacto.setFechaEnvio(rs.getDate("fecha_envio"));
        contacto.setEstado(EnumHotel.estadoMensaje.valueOf(rs.getString("estado").toUpperCase()));
        return contacto;
    }
}
