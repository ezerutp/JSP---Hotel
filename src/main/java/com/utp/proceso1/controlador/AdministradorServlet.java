package com.utp.proceso1.controlador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.utp.proceso1.dao.AdministradorDAO;
import com.utp.proceso1.modelo.Administrador;

@WebServlet("/administrador")
public class AdministradorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Maneja las solicitudes GET de la página de inicio de sesión del administrador
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Verificar si hay un error de autenticación
        String error = request.getParameter("error");
        if ("auth".equals(error)) {
            request.setAttribute("error", "Debe iniciar sesión para acceder al dashboard.");
        }
        
        // Verificar si hay un mensaje de logout exitoso
        String logout = request.getParameter("logout");
        if ("success".equals(logout)) {
            request.setAttribute("success", "Sesión cerrada exitosamente.");
        }
        
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    // Maneja las solicitudes POST para validar las credenciales del administrador
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");
        String mensajeError = null;
        
        AdministradorDAO administradorDAO = new AdministradorDAO();
        Administrador administrador = administradorDAO.validarCredenciales(usuario, contrasena);

        if (administrador != null) {            
            // Crear o obtener la sesión y establecer el atributo del administrador
            HttpSession session = request.getSession(true);
            session.setAttribute("administrador", administrador);
            
            // Configurar la cookie de sesión para que sea más permisiva
           response.addHeader("Set-Cookie", "JSESSIONID=" + session.getId() + "; Path=" + request.getContextPath() + "; HttpOnly");
            
            // Verificar si hay una URL original para redirigir después del login
            String originalURL = (String) session.getAttribute("originalURL");
            if (originalURL != null) {
                session.removeAttribute("originalURL");
                response.sendRedirect(originalURL);
            } else {
                response.sendRedirect(request.getContextPath() + "/dashboard/empleados");
            }
        } else {
            mensajeError = "Usuario o contraseña incorrectos.";
            request.setAttribute("error", mensajeError);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
    
}
