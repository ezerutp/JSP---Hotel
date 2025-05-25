package com.utp.proceso1.dao;

import com.utp.proceso1.modelo.Habitacion;
import com.utp.proceso1.modelo.TipoHabitacion;
import com.utp.proceso1.servicio.conexionServicio;
import com.utp.proceso1.utilidades.EnumHotel.estadoHabitacion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HabitacionDAO {
    private Connection connection;
    private final String TABLE_NAME = "habitacion";

    public HabitacionDAO() {
        this.connection = conexionServicio.getInstancia().getConexion();
    }

    // CREATE
    public boolean create(Habitacion habitacion) {
        String sql = "INSERT INTO " + TABLE_NAME + " (numero, tipo_habitacion, precio, estado) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setString(1, habitacion.getNumero());
            stmp.setInt(2, habitacion.getTipoHabitacion().getId());
            stmp.setDouble(3, habitacion.getPrecio());
            stmp.setString(4, habitacion.getEstado().toString());
            stmp.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // READ by ID
    public Habitacion getHabitacionById(int id) {
        String sql = "SELECT * FROM " + TABLE_NAME + " WHERE id = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setInt(1, id);
            ResultSet rs = stmp.executeQuery();
            if (rs.next()) {
                return mapHabitacion(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // READ all
    public List<Habitacion> getHabitaciones() {
        List<Habitacion> habitaciones = new ArrayList<>();
        String sql = "SELECT * FROM " + TABLE_NAME;
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            ResultSet rs = stmp.executeQuery();
            while (rs.next()) {
                habitaciones.add(mapHabitacion(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return habitaciones;
    }

    // UPDATE
    public boolean updateHabitacion(Habitacion habitacion) {
        String sql = "UPDATE " + TABLE_NAME + " SET numero = ?, tipo_habitacion = ?, precio = ?, estado = ? WHERE id = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setString(1, habitacion.getNumero());
            stmp.setString(2, habitacion.getTipoHabitacion().toString());
            stmp.setDouble(3, habitacion.getPrecio());
            stmp.setString(4, habitacion.getEstado().toString());
            stmp.setInt(5, habitacion.getId());
            stmp.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // DELETE
    public boolean deleteHabitacion(int id) {
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
    private Habitacion mapHabitacion(ResultSet rs) throws Exception {
        Habitacion habitacion = new Habitacion();
        habitacion.setId(rs.getInt("id"));
        habitacion.setNumero(rs.getString("numero"));
        TipoHabitacion tipoHabitacion = new TipoHabitacionDao().getTipoHabitacionById(rs.getInt("tipo_habitacion"));
        habitacion.setTipoHabitacion(tipoHabitacion);
        habitacion.setPrecio(rs.getDouble("precio"));
        habitacion.setEstado(getEstadoByString(rs.getString("estado")));
        return habitacion;
    }

    private estadoHabitacion getEstadoByString(String estado) {
        try {
            return estadoHabitacion.valueOf(estado.toUpperCase());
        } catch (Exception e) {
            return null;
        }
    }
}
