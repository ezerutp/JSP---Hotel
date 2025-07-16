package com.utp.proceso1.controlador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.utp.proceso1.dao.ContactoDAO;

@WebServlet("/dashboard/mensajes")
public class MensajesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void listarMensajes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ContactoDAO contactoDAO = new ContactoDAO();
        request.setAttribute("contactosList", contactoDAO.getContactos());
        request.getRequestDispatcher("/dashboard/mensajes.jsp").forward(request, response);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int opt;
        try {
            opt = Integer.parseInt(request.getParameter("opt"));
        } catch (NumberFormatException e) {
            opt = 1; // Default to listar mensajes
        }

        switch (opt) {
            case 1: // Listar empleados
                listarMensajes(request, response);
                break;
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}