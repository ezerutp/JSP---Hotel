package com.utp.proceso1.controlador;

import modelo.Conexion;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class ContactoServlet extends HttpServlet {
    Conexion cn = new Conexion();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Obtener parámetros
        String nombre = req.getParameter("nombre");
        String correo = req.getParameter("correo");
        String telefonoStr = req.getParameter("telefono");
        String mensaje = req.getParameter("mensaje");
        
        // Validación básica
        if (nombre == null || nombre.trim().isEmpty() || 
            correo == null || correo.trim().isEmpty() ||
            telefonoStr == null || telefonoStr.trim().isEmpty() ||
            mensaje == null || mensaje.trim().isEmpty()) {
            req.setAttribute("msg", "Por favor complete todos los campos obligatorios");
            req.getRequestDispatcher("contacto.jsp").forward(req, resp);
            return;
        }

        // Validar teléfono (9 dígitos)
        if (!telefonoStr.matches("\\d{9}")) {
            req.setAttribute("msg", "El celular debe tener exactamente 9 dígitos");
            req.getRequestDispatcher("contacto.jsp").forward(req, resp);
            return;
        }

        try {
            int telefono = Integer.parseInt(telefonoStr);
            Connection con = null;
            PreparedStatement ps = null;
            
            try {
                con = cn.getConexion();
                if (con == null) {
                    req.setAttribute("msg", "Error de conexión con la base de datos");
                    req.getRequestDispatcher("contacto.jsp").forward(req, resp);
                    return;
                }

                ps = con.prepareStatement(
                    "INSERT INTO contacto(nombre, correo, telefono, mensaje) VALUES (?, ?, ?, ?)");
                ps.setString(1, nombre.trim());
                ps.setString(2, correo.trim());
                ps.setInt(3, telefono);  // Usamos setInt para el campo INT
                ps.setString(4, mensaje.trim());
                
                int filas = ps.executeUpdate();
                if (filas > 0) {
                    req.setAttribute("msg", "Mensaje enviado correctamente");
                } else {
                    req.setAttribute("msg", "No se pudo guardar el mensaje");
                }
            } catch (SQLException e) {
                req.setAttribute("msg", "Error en la base de datos: " + e.getMessage());
                e.printStackTrace();
            } finally {
                // Cerrar recursos
                try { if (ps != null) ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        } catch (NumberFormatException e) {
            req.setAttribute("msg", "El celular debe contener solo números");
        }

        req.getRequestDispatcher("contacto.jsp").forward(req, resp);
    }
}