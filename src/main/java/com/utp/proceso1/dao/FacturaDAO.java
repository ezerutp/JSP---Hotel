package com.utp.proceso1.dao;

import com.utp.proceso1.modelo.Factura;
import com.utp.proceso1.modelo.Pago;
import com.utp.proceso1.servicio.conexionServicio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class FacturaDAO {
    private Connection connection;
    private final String TABLE_NAME = "factura";

    public FacturaDAO() {
        this.connection = conexionServicio.getInstancia().getConexion();
    }

    // CREATE
    public boolean create(Factura factura) {
        String sql = "INSERT INTO " + TABLE_NAME + " (id_pago, fecha_emision, descripcion) VALUES (?, ?, ?)";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setInt(1, factura.getPago().getId());
            stmp.setDate(2, new Date(factura.getFecha_emision().getTime()));
            stmp.setString(3, factura.getDescripcion());
            stmp.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // READ by ID
    public Factura getFacturaById(int id) {
        String sql = "SELECT * FROM " + TABLE_NAME + " WHERE id = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setInt(1, id);
            ResultSet rs = stmp.executeQuery();
            if (rs.next()) {
                return mapFactura(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // READ all
    public List<Factura> getFacturas() {
        List<Factura> facturas = new ArrayList<>();
        String sql = "SELECT * FROM " + TABLE_NAME;
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            ResultSet rs = stmp.executeQuery();
            while (rs.next()) {
                facturas.add(mapFactura(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return facturas;
    }

    // UPDATE
    public boolean updateFactura(Factura factura) {
        String sql = "UPDATE " + TABLE_NAME + " SET id_pago = ?, fecha_emision = ?, descripcion = ? WHERE id = ?";
        try (PreparedStatement stmp = connection.prepareStatement(sql)) {
            stmp.setInt(1, factura.getPago().getId());
            stmp.setDate(2, new Date(factura.getFecha_emision().getTime()));
            stmp.setString(3, factura.getDescripcion());
            stmp.setInt(4, factura.getId());
            stmp.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // DELETE
    public boolean deleteFactura(int id) {
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
    private Factura mapFactura(ResultSet rs) throws Exception {
        Factura factura = new Factura();
        factura.setId(rs.getInt("id"));
        // Suponiendo que tienes PagoDAO con constructor que recibe Connection
        Pago pago = new PagoDAO().getPagoById(rs.getInt("id_pago"));
        factura.setPago(pago);
        factura.setFecha_emision(rs.getDate("fecha_emision"));
        factura.setDescripcion(rs.getString("descripcion"));
        return factura;
    }
}
