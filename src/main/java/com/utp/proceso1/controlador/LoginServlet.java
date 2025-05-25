package com.utp.proceso1.controlador;

import com.utp.proceso1.dao.EmpleadoDAO;
import com.utp.proceso1.modelo.Empleado;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private EmpleadoDAO empleadoDAO = new EmpleadoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("contrasena");

        Empleado empleado = empleadoDAO.validarLogin(usuario, clave);

        if (empleado != null) {
            HttpSession session = request.getSession();
            session.setAttribute("empleado", empleado);
            response.sendRedirect("index.jsp");
        } else {
            request.setAttribute("error", "Usuario o clave incorrectos");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
