package com.utp.proceso1.controlador;

import com.utp.proceso1.dao.ContactoDAO;
import com.utp.proceso1.modelo.Contacto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import org.json.*;

@WebServlet("/MensajesDataServlet")
public class MensajesDataServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            ContactoDAO contactoDAO = new ContactoDAO();
            List<Contacto> contactos = contactoDAO.getContactos();

            JSONArray mensajesArray = new JSONArray();

            for (Contacto contacto : contactos) {
                JSONObject mensaje = new JSONObject();
                mensaje.put("id", contacto.getId());
                mensaje.put("nombre", contacto.getNombreCompleto());
                mensaje.put("correo", contacto.getCorreo());
                mensaje.put("mensaje", contacto.getMensaje());
                mensaje.put("fecha", contacto.getFechaEnvio() != null ? contacto.getFechaEnvio().toString() : "");
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