package com.utp.proceso1.controlador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.utp.proceso1.dao.AdministradorDAO;
import com.utp.proceso1.modelo.Administrador;

@WebServlet("/dashboard/empleados")
public class EmpleadosServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void listarEmpleados(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdministradorDAO administradorDAO = new AdministradorDAO();
        request.setAttribute("administradores", administradorDAO.getAdministradores());
        request.getRequestDispatcher("/dashboard/empleados.jsp").forward(request, response);
    }

    protected void registrarEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");
        String nombreCompleto = request.getParameter("nombreCompleto");
        String correo = request.getParameter("correo");
        String telefono = request.getParameter("telefono");
        String estadoStr = request.getParameter("estado");
        boolean estado = estadoStr != null && estadoStr.equalsIgnoreCase("Activo");
        AdministradorDAO administradorDAO = new AdministradorDAO();
        boolean success =administradorDAO.create(new Administrador(usuario, contrasena, nombreCompleto, correo, telefono, estado));
        if (!success) {
            request.setAttribute("error", "Error al registrar el empleado. Verifique los datos.");
            request.getRequestDispatcher("/dashboard/empleados.jsp").forward(request, response);
            return;
        }
        response.sendRedirect(request.getContextPath() + "/dashboard/empleados?opt=1");
    }

    protected void actualizarEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");
        String nombreCompleto = request.getParameter("nombreCompleto");
        String correo = request.getParameter("correo");
        String telefono = request.getParameter("telefono");
        String estadoStr = request.getParameter("estado");
        boolean estado = estadoStr != null && estadoStr.equalsIgnoreCase("Activo");

        AdministradorDAO administradorDAO = new AdministradorDAO();
        Administrador administrador = new Administrador(usuario, contrasena, nombreCompleto, correo, telefono, estado);
        administrador.setId(id);
        
        boolean success = administradorDAO.updateAdministrador(administrador);
        if (!success) {
            request.setAttribute("error", "Error al actualizar el empleado.");
            request.getRequestDispatcher("/dashboard/empleados.jsp").forward(request, response);
            return;
        }
        response.sendRedirect(request.getContextPath() + "/dashboard/empleados?opt=1");
    }

    protected void eliminarEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        AdministradorDAO administradorDAO = new AdministradorDAO();
        boolean success = administradorDAO.deleteAdministrador(id);
        if (!success) {
            request.setAttribute("error", "Error al eliminar el empleado.");
        }
        response.sendRedirect(request.getContextPath() + "/dashboard/empleados?opt=1");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int opt;
        try {
            opt = Integer.parseInt(request.getParameter("opt"));
        } catch (NumberFormatException e) {
            opt = 1; // Default to listar empleados
        }

        switch (opt) {
            case 1: // Listar empleados
                listarEmpleados(request, response);
                break;
            case 2: // Registrar empleado
                registrarEmpleado(request, response);
                break;
            case 3: // Actualizar empleado (not implemented in this example)
                actualizarEmpleado(request, response);
                break;
            case 4: // Eliminar empleado
                eliminarEmpleado(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
