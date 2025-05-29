package com.utp.proceso1.controlador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.utp.proceso1.dao.AdministradorDAO;
import com.utp.proceso1.modelo.Administrador;

@WebServlet("/administrador")
public class AdministradorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");
        String mensajeError = null;

        AdministradorDAO administradorDAO = new AdministradorDAO();
        Administrador administrador = administradorDAO.validarCredenciales(usuario, contrasena);

        if (administrador != null) {
            request.getSession().setAttribute("administrador", administrador);
            response.sendRedirect("/Proceso1/ReservaServlet");
        } else {
            mensajeError = "Usuario o contraseña incorrectos.";
            request.setAttribute("error", mensajeError);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }
    
}
