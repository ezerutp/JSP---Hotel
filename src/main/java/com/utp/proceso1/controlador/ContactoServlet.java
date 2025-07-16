package com.utp.proceso1.controlador;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.utp.proceso1.dao.ContactoDAO;
import com.utp.proceso1.modelo.Contacto;
import com.utp.proceso1.utilidades.EnumHotel.estadoMensaje;

@WebServlet("/contacto")
public class ContactoServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Validar que todos los campos requeridos estén presentes y no estén vacíos
        if (isNullOrEmpty(request.getParameter("nombre")) ||
            isNullOrEmpty(request.getParameter("correo")) ||
            isNullOrEmpty(request.getParameter("telefono")) ||
            isNullOrEmpty(request.getParameter("mensaje"))) {
            request.setAttribute("error", "Campos obligatorios faltantes");
            request.getRequestDispatcher("/contacto.jsp").forward(request, response);
            return;
        }

        Contacto contacto = new Contacto();
        contacto.setNombreCompleto(request.getParameter("nombre"));
        contacto.setCorreo(request.getParameter("correo"));
        int telefono;
        try {
            telefono = Integer.parseInt(request.getParameter("telefono"));
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Número de teléfono inválido");
            request.getRequestDispatcher("/contacto.jsp").forward(request, response);
            return;
        }
        contacto.setTelefono(telefono);
        contacto.setMensaje(request.getParameter("mensaje"));
        contacto.setFechaEnvio(new Date());
        contacto.setEstado(estadoMensaje.NUEVO);

        ContactoDAO contactoDAO = new ContactoDAO();
        boolean success = contactoDAO.create(contacto);
        // Redirigir o mostrar un mensaje de éxito
        if (success) {
            request.setAttribute("success", "Mensaje enviado correctamente");
        } else {
            request.setAttribute("error", "Error al enviar el mensaje");
        }
        request.getRequestDispatcher("/contacto.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/contacto.jsp").forward(request, response);
    }

    private boolean isNullOrEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }
    
}
