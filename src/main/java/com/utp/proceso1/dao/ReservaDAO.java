package com.utp.proceso1.dao;

import com.utp.proceso1.modelo.Reserva;
import com.utp.proceso1.modelo.Habitacion;
import com.utp.proceso1.servicio.conexionServicio;
import com.utp.proceso1.utilidades.EnumHotel.estadoReserva;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReservaDAO {
    private Connection connection;
    private final String TABLE_NAME = "reserva";

    public ReservaDAO() {
        this.connection = conexionServicio.getInstancia().getConexion();
    }

    // CREATE
    public boolean create(Reserva reserva) {
        String sql = "INSERT INTO " + TABLE_NAME + " (id_habitacion, nombre_huesped, correo_huesped, telefono_huesped, fecha_checkin, fecha_checkout, cantidad_personas, precio_noche, total_pagar, estado_reserva, fecha_reserva, notas) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setInt(1, reserva.getIdHabitacion().getId());
            stmp.setString(2, reserva.getNombreHuesped());
            stmp.setString(3, reserva.getCorreoHuesped());
            stmp.setString(4, reserva.getTelefonoHuesped());
            stmp.setDate(5, new java.sql.Date(reserva.getFechaCheckin().getTime()));
            stmp.setDate(6, new java.sql.Date(reserva.getFechaCheckout().getTime()));
            stmp.setInt(7, reserva.getCantidadPersonas());
            stmp.setDouble(8, reserva.getPrecioNoche());
            stmp.setDouble(9, reserva.getTotalPagar());
            stmp.setString(10, reserva.getEstadoReserva().name());
            stmp.setDate(11, new java.sql.Date(reserva.getFechaReserva().getTime()));
            stmp.setString(12, reserva.getNotas());
            stmp.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // READ by ID
    public Reserva getReservaById(int id) {
        String sql = "SELECT * FROM " + TABLE_NAME + " WHERE id_reserva = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setInt(1, id);
            ResultSet rs = stmp.executeQuery();
            if (rs.next()) {
                return mapReserva(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // READ all
    public List<Reserva> getReservas() {
        List<Reserva> reservas = new ArrayList<>();
        String sql = "SELECT * FROM " + TABLE_NAME;
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            ResultSet rs = stmp.executeQuery();
            while (rs.next()) {
                reservas.add(mapReserva(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reservas;
    }

    // UPDATE
    public boolean updateReserva(Reserva reserva) {
        String sql = "UPDATE " + TABLE_NAME + " SET id_habitacion = ?, nombre_huesped = ?, correo_huesped = ?, telefono_huesped = ?, fecha_checkin = ?, fecha_checkout = ?, cantidad_personas = ?, precio_noche = ?, total_pagar = ?, estado_reserva = ?, fecha_reserva = ?, notas = ? WHERE id_reserva = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setInt(1, reserva.getIdHabitacion().getId());
            stmp.setString(2, reserva.getNombreHuesped());
            stmp.setString(3, reserva.getCorreoHuesped());
            stmp.setString(4, reserva.getTelefonoHuesped());
            stmp.setDate(5, new java.sql.Date(reserva.getFechaCheckin().getTime()));
            stmp.setDate(6, new java.sql.Date(reserva.getFechaCheckout().getTime()));
            stmp.setInt(7, reserva.getCantidadPersonas());
            stmp.setDouble(8, reserva.getPrecioNoche());
            stmp.setDouble(9, reserva.getTotalPagar());
            stmp.setString(10, reserva.getEstadoReserva().name());
            stmp.setDate(11, new java.sql.Date(reserva.getFechaReserva().getTime()));
            stmp.setString(12, reserva.getNotas());
            stmp.setInt(13, reserva.getIdReserva());
            stmp.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // DELETE
    public boolean deleteReserva(int id) {
        String sql = "DELETE FROM " + TABLE_NAME + " WHERE id_reserva = ?";
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
    private Reserva mapReserva(ResultSet rs) throws Exception {
        Reserva reserva = new Reserva();
        reserva.setIdReserva(rs.getInt("id_reserva"));
        
        // Obtener la habitación usando el DAO correspondiente
        int idHabitacion = rs.getInt("id_habitacion");
        HabitacionDAO habitacionDAO = new HabitacionDAO();
        Habitacion habitacion = habitacionDAO.getHabitacionById(idHabitacion);
        reserva.setIdHabitacion(habitacion);

        reserva.setNombreHuesped(rs.getString("nombre_huesped"));
        reserva.setCorreoHuesped(rs.getString("correo_huesped"));
        reserva.setTelefonoHuesped(rs.getString("telefono_huesped"));
        reserva.setFechaCheckin(rs.getDate("fecha_checkin"));
        reserva.setFechaCheckout(rs.getDate("fecha_checkout"));
        reserva.setCantidadPersonas(rs.getInt("cantidad_personas"));
        reserva.setPrecioNoche(rs.getDouble("precio_noche"));
        reserva.setTotalPagar(rs.getDouble("total_pagar"));
        reserva.setEstadoReserva(estadoReserva.valueOf(rs.getString("estado_reserva").toUpperCase()));
        reserva.setFechaReserva(rs.getDate("fecha_reserva"));
        reserva.setNotas(rs.getString("notas"));
        return reserva;
    }
}
