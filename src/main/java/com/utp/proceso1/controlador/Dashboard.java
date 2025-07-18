package com.utp.proceso1.controlador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.utp.proceso1.dao.AdministradorDAO;
import com.utp.proceso1.dao.ContactoDAO;
import com.utp.proceso1.dao.HabitacionDAO;
import com.utp.proceso1.dao.ReservaDAO;

@WebServlet("/dashboard/")
public class Dashboard extends HttpServlet {
    protected void listarVarios(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        AdministradorDAO administradorDAO = new AdministradorDAO();
        HabitacionDAO habitacionDAO = new HabitacionDAO();
        ReservaDAO reservaDAO = new ReservaDAO();
        ContactoDAO mensajesDAO = new ContactoDAO();
        
        request.setAttribute("empleadosList", administradorDAO.getAdministradores());
        request.setAttribute("habitacionesList", habitacionDAO.getHabitaciones());
        request.setAttribute("reservaList", reservaDAO.getReservas());
        request.setAttribute("mensajesList", mensajesDAO.getContactos());
        
        request.getRequestDispatcher("/dashboard/index.jsp").forward(request, response);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int opt;
        try {
            opt = Integer.parseInt(request.getParameter("opt"));
        } catch (NumberFormatException e) {
            opt = 1;
        }

        switch (opt) {
            case 1: // Listar varios
                listarVarios(request, response);
                break;
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
