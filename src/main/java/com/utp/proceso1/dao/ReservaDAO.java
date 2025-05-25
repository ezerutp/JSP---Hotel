package com.utp.proceso1.dao;

import com.utp.proceso1.modelo.Reserva;
import com.utp.proceso1.servicio.conexionServicio;
import com.utp.proceso1.modelo.Cliente;
import com.utp.proceso1.modelo.Habitacion;
import com.utp.proceso1.utilidades.EnumHotel.estadoReserva;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
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
        String sql = "INSERT INTO " + TABLE_NAME + " (id_cliente, id_habitacion, fecha_entrada, fecha_salida, estado, total_pago) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setInt(1, reserva.getCliente().getId());
            stmp.setInt(2, reserva.getHabitacion().getId());
            stmp.setDate(3, new Date(reserva.getFecha_entrada().getTime()));
            stmp.setDate(4, new Date(reserva.getFecha_salida().getTime()));
            stmp.setString(5, reserva.getEstado().toString());
            stmp.setDouble(6, reserva.getTotal_pago());
            stmp.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // READ by ID
    public Reserva getReservaById(int id) {
        String sql = "SELECT * FROM " + TABLE_NAME + " WHERE id = ?";
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
        String sql = "UPDATE " + TABLE_NAME + " SET id_cliente = ?, id_habitacion = ?, fecha_entrada = ?, fecha_salida = ?, estado = ?, total_pago = ? WHERE id = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setInt(1, reserva.getCliente().getId());
            stmp.setInt(2, reserva.getHabitacion().getId());
            stmp.setDate(3, new Date(reserva.getFecha_entrada().getTime()));
            stmp.setDate(4, new Date(reserva.getFecha_salida().getTime()));
            stmp.setString(5, reserva.getEstado().toString());
            stmp.setDouble(6, reserva.getTotal_pago());
            stmp.setInt(7, reserva.getId());
            stmp.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // DELETE
    public boolean deleteReserva(int id) {
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
    private Reserva mapReserva(ResultSet rs) throws Exception {
        Reserva reserva = new Reserva();
        reserva.setId(rs.getInt("id"));
        Cliente cliente = new ClienteDAO().getClienteById(rs.getInt("id_cliente"));
        Habitacion habitacion = new HabitacionDAO().getHabitacionById(rs.getInt("id_habitacion"));
        reserva.setCliente(cliente);
        reserva.setHabitacion(habitacion);
        reserva.setFecha_entrada(rs.getDate("fecha_entrada"));
        reserva.setFecha_salida(rs.getDate("fecha_salida"));
        reserva.setEstado(getEstadoReservaByString(rs.getString("estado")));
        reserva.setTotal_pago(rs.getDouble("total_pago"));
        return reserva;
    }

    private estadoReserva getEstadoReservaByString(String estado) {
        try {
            return estadoReserva.valueOf(estado.toUpperCase());
        } catch (Exception e) {
            return null;
        }
    }
}
