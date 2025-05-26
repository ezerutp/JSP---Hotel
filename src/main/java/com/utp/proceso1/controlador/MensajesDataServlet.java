package com.utp.proceso1.controlador;

import modelo.Conexion;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.sql.*;
import org.json.*;

@WebServlet("/MensajesDataServlet")
public class MensajesDataServlet extends HttpServlet implements Serializable {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try (Connection conn = new Conexion().getConexion()) {
            String sql = "SELECT id_mensaje, nombre_completo, correo_electronico, " +
                         "mensaje, fecha_envio FROM mensajes_contacto";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            JSONArray mensajesArray = new JSONArray();

            while (rs.next()) {
                JSONObject mensaje = new JSONObject();
                mensaje.put("id", rs.getInt("id_mensaje"));
                mensaje.put("nombre", rs.getString("nombre_completo"));
                mensaje.put("correo", rs.getString("correo_electronico"));
                mensaje.put("mensaje", rs.getString("mensaje"));
                mensaje.put("fecha", rs.getTimestamp("fecha_envio").toString());
                
                mensajesArray.put(mensaje);
            }

            JSONObject resultado = new JSONObject();
            resultado.put("mensajes", mensajesArray);
            out.print(resultado.toString());

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\":\"Error al obtener mensajes\"}");
        }
    }
}