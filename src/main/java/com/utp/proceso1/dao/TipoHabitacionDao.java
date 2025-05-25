package com.utp.proceso1.dao;

import com.utp.proceso1.modelo.TipoHabitacion;
import com.utp.proceso1.servicio.conexionServicio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TipoHabitacionDao {
    private Connection connection;
    private final String TABLE_NAME = "tipo_habitacion";

    public TipoHabitacionDao() {
        this.connection = conexionServicio.getInstancia().getConexion();
    }

    // CREATE
    public boolean create(TipoHabitacion tipoHabitacion) {
        String sql = "INSERT INTO " + TABLE_NAME + " (nombre, descripcion, capacidad) VALUES (?, ?, ?)";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setString(1, tipoHabitacion.getNombre());
            stmp.setString(2, tipoHabitacion.getDescripcion());
            stmp.setInt(3, tipoHabitacion.getCapacidad());
            stmp.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // READ by ID
    public TipoHabitacion getTipoHabitacionById(int id) {
        String sql = "SELECT * FROM " + TABLE_NAME + " WHERE id = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setInt(1, id);
            ResultSet rs = stmp.executeQuery();
            if (rs.next()) {
                return mapTipoHabitacion(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // READ all
    public List<TipoHabitacion> getTipoHabitaciones() {
        List<TipoHabitacion> tipos = new ArrayList<>();
        String sql = "SELECT * FROM " + TABLE_NAME;
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            ResultSet rs = stmp.executeQuery();
            while (rs.next()) {
                tipos.add(mapTipoHabitacion(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tipos;
    }

    // UPDATE
    public boolean updateTipoHabitacion(TipoHabitacion tipoHabitacion) {
        String sql = "UPDATE " + TABLE_NAME + " SET nombre = ?, descripcion = ?, capacidad = ? WHERE id = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setString(1, tipoHabitacion.getNombre());
            stmp.setString(2, tipoHabitacion.getDescripcion());
            stmp.setInt(3, tipoHabitacion.getCapacidad());
            stmp.setInt(4, tipoHabitacion.getId());
            stmp.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // DELETE
    public boolean deleteTipoHabitacion(int id) {
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

    // MAPEO
    private TipoHabitacion mapTipoHabitacion(ResultSet rs) throws Exception {
        TipoHabitacion tipo = new TipoHabitacion();
        tipo.setId(rs.getInt("id"));
        tipo.setNombre(rs.getString("nombre"));
        tipo.setDescripcion(rs.getString("descripcion"));
        tipo.setCapacidad(rs.getInt("capacidad"));
        return tipo;
    }
}
