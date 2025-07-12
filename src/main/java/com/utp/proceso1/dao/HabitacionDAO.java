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
    private final String TABLE_NAME = "habitaciones";

    public HabitacionDAO() {
        this.connection = conexionServicio.getInstancia().getConexion();
    }

    // CREATE
    public boolean create(Habitacion habitacion) {
        String sql = "INSERT INTO " + TABLE_NAME + " (numero_habitacion, id_tipo, estado) VALUES (?, ?, ?)";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setString(1, habitacion.getNumeroHabitacion());
            stmp.setInt(2, habitacion.getTipoHabitacion().getId());
            stmp.setString(3, habitacion.getEstado().name());
            stmp.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // READ by ID
    public Habitacion getHabitacionById(int id) {
        String sql = "SELECT * FROM " + TABLE_NAME + " WHERE id_habitacion = ?";
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

    // READ by Numero
    public Habitacion getHabitacionByNumero(String numero) {
        String sql = "SELECT * FROM " + TABLE_NAME + " WHERE numero_habitacion = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setString(1, numero);
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
        String sql = "UPDATE " + TABLE_NAME
                + " SET numero_habitacion = ?, id_tipo = ?, estado = ? WHERE id_habitacion = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setString(1, habitacion.getNumeroHabitacion());
            stmp.setInt(2, habitacion.getTipoHabitacion().getId());
            stmp.setString(3, habitacion.getEstado().name());
            stmp.setInt(4, habitacion.getId());
            stmp.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // DELETE
    public boolean deleteHabitacion(int id) {
        String sql = "DELETE FROM " + TABLE_NAME + " WHERE id_habitacion = ?";
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
        habitacion.setId(rs.getInt("id_habitacion"));
        habitacion.setNumeroHabitacion(rs.getString("numero_habitacion"));

        // Obtener el tipo de habitación usando el DAO correspondiente
        int tipoHabitacionId = rs.getInt("id_tipo");
        TipoHabitacionDAO tipoHabitacionDao = new TipoHabitacionDAO();
        TipoHabitacion tipoHabitacion = tipoHabitacionDao.getTipoHabitacionById(tipoHabitacionId);
        habitacion.setTipoHabitacion(tipoHabitacion);

        habitacion.setEstado(estadoHabitacion.valueOf(rs.getString("estado").toUpperCase()));
        return habitacion;
    }

    // funciones adicionales
    public List<Habitacion> getHabitacionesByEstado(estadoHabitacion estado) {
        List<Habitacion> habitaciones = new ArrayList<>();
        String sql = "SELECT * FROM " + TABLE_NAME + " WHERE estado = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setString(1, estado.name().toLowerCase());
            ResultSet rs = stmp.executeQuery();
            while (rs.next()) {
                habitaciones.add(mapHabitacion(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return habitaciones;
    }

    public boolean updateEstadoHabitacion(int id, estadoHabitacion estado) {
        String sql = "UPDATE " + TABLE_NAME + " SET estado = ? WHERE id_habitacion = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setString(1, estado.name().toLowerCase());
            stmp.setInt(2, id);
            stmp.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}