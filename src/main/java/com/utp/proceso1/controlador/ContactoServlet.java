package com.utp.proceso1.controlador;

import modelo.Conexion;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.Serializable;
import java.sql.*;

@WebServlet("/ContactoServlet")
public class ContactoServlet extends HttpServlet implements Serializable {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String telefono = request.getParameter("telefono");
        String mensaje = request.getParameter("mensaje");

        try (Connection con = new Conexion().getConexion()) {
            String sql = "INSERT INTO mensajes_contacto (nombre_completo, correo_electronico, " +
                         "telefono, mensaje) VALUES (?, ?, ?, ?)";
            
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, correo);
            ps.setString(3, telefono);
            ps.setString(4, mensaje);
            
            int filas = ps.executeUpdate();
            
            if (filas > 0) {
                response.sendRedirect("contacto.jsp?msg=Mensaje+enviado+exitosamente");
            } else {
                response.sendRedirect("contacto.jsp?error=Error+al+enviar");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("contacto.jsp?error=Error+de+sistema");
        }
    }
}