package com.utp.proceso1.controlador;

import modelo.Conexion;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.Serializable;
import java.sql.*;

@WebServlet("/ReservaServlet")
public class ReservaServlet extends HttpServlet implements Serializable{
    private static final long serialVersionUID = 1L;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Obtener parámetros del formulario
        String nombre = request.getParameter("nombre_huesped");
        String correo = request.getParameter("correo_huesped");
        String telefono = request.getParameter("telefono_huesped");
        int habitacion = Integer.parseInt(request.getParameter("id_habitacion"));
        String checkin = request.getParameter("fecha_checkin");
        String checkout = request.getParameter("fecha_checkout");
        int personas = Integer.parseInt(request.getParameter("cantidad_personas"));
        
        try {
            // Obtener precio por noche
            double precioNoche = obtenerPrecioNoche(habitacion);
            
            // Calcular total a pagar
            double totalPagar = calcularTotalPagar(checkin, checkout, precioNoche);
            
            // Registrar la reserva
            boolean exito = registrarReserva(
                habitacion, nombre, correo, telefono, 
                checkin, checkout, personas, 
                precioNoche, totalPagar
            );
            
            if (exito) {
                response.sendRedirect("reservaExitosa.jsp");
            } else {
                response.sendRedirect("registrarReserva.jsp?error=Error+al+registrar+reserva");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("registrarReserva.jsp?error=Error+de+base+de+datos" +e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("registrarReserva.jsp?error=Error+del+sistema");
        }
    }
    
    private double obtenerPrecioNoche(int numeroHabitacion) throws SQLException {
    try (Connection con = new Conexion().getConexion()) {
        String sql = "SELECT th.precio_noche FROM tipos_habitacion th "
                   + "JOIN habitaciones h ON th.id_tipo = h.id_tipo "
                   + "WHERE h.numero_habitacion = ?";  // Buscar por numero_habitacion
        
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, numeroHabitacion);
        ResultSet rs = ps.executeQuery();
        return rs.next() ? rs.getDouble("precio_noche") : 0.0;
    }
}
    
    private double calcularTotalPagar(String checkin, String checkout, double precioNoche) {
        try {
            long dias = (java.sql.Date.valueOf(checkout).getTime() - 
                        java.sql.Date.valueOf(checkin).getTime()) / (1000 * 60 * 60 * 24);
            return dias * precioNoche;
        } catch (Exception e) {
            return 0.0;
        }
    }
    
    private boolean registrarReserva(int numeroHabitacion, String nombre, String correo, 
                               String telefono, String checkin, String checkout, 
                               int personas, double precioNoche, double totalPagar) 
                               throws SQLException {
    try (Connection con = new Conexion().getConexion()) {
        // Paso 1: Obtener id_habitacion desde numero_habitacion
        String sqlGetId = "SELECT id_habitacion FROM habitaciones WHERE numero_habitacion = ?";
        PreparedStatement psGetId = con.prepareStatement(sqlGetId);
        psGetId.setInt(1, numeroHabitacion);
        ResultSet rs = psGetId.executeQuery();
        
        if (!rs.next()) {
            throw new SQLException("Número de habitación no existe: " + numeroHabitacion);
        }
        int idHabitacion = rs.getInt("id_habitacion");

        // Paso 2: Insertar reserva con id_habitacion correcto
        String sqlInsert = "INSERT INTO reserva (id_habitacion, nombre_huesped, correo_huesped, "
                         + "telefono_huesped, fecha_checkin, fecha_checkout, cantidad_personas, "
                         + "precio_noche, total_pagar) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        PreparedStatement ps = con.prepareStatement(sqlInsert);
        ps.setInt(1, idHabitacion);  // Usar el ID real, no el número
        ps.setString(2, nombre);
        ps.setString(3, correo);
        ps.setString(4, telefono);
        ps.setString(5, checkin);
        ps.setString(6, checkout);
        ps.setInt(7, personas);
        ps.setDouble(8, precioNoche);
        ps.setDouble(9, totalPagar);
        
        return ps.executeUpdate() > 0;
    }
    }
}