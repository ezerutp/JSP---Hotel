package com.utp.proceso1.controlador;
import modelo.reserva;
import modelo.Conexion;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReservaServlet extends HttpServlet {
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        // Obtener los parámetros del formulario
        String nombre = request.getParameter("nombreHuesped");
        String habitacion = request.getParameter("habitacion");
        String checkin = request.getParameter("checkin");
        String checkout = request.getParameter("checkout");
        int personas = Integer.parseInt(request.getParameter("personas"));

        // Crear objeto Reserva con los datos del formulario
        reserva reserva = new reserva(nombre, habitacion, checkin, checkout, personas);

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            // Establecer conexión a la base de datos
            Conexion conexion = new Conexion();
            conn = conexion.getConexion();

            // Consulta SQL para insertar la reserva
            String sql = "INSERT INTO reserva (nombreHuesped, habitacion, checkin, checkout, personas) " +
                         "VALUES (?, ?, ?, ?, ?)";

            ps = conn.prepareStatement(sql);
            ps.setString(1, reserva.getNombreHuesped());
            ps.setString(2, reserva.getHabitacion());
            ps.setString(3, reserva.getCheckin());
            ps.setString(4, reserva.getCheckout());
            ps.setInt(5, reserva.getPersonas());

            // Ejecutar la inserción
            ps.executeUpdate();

            // Redireccionar a página de éxito
            response.sendRedirect("reservaExitosa.jsp");

        } catch (Exception e) {
            // Manejo de errores
            e.printStackTrace();
            response.getWriter().println("Error al registrar la reserva: " + e.getMessage());

        } finally {
            // Cerrar recursos
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
