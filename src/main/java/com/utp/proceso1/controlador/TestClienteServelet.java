package com.utp.proceso1.controlador;

import com.utp.proceso1.dao.ClienteDAO;
import com.utp.proceso1.modelo.Cliente;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/TestClienteServlet")
public class TestClienteServelet extends HttpServlet {

    private ClienteDAO clienteDAO;

    @Override
    public void init() throws ServletException {
        clienteDAO = new ClienteDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener parámetros del formulario
        String nombre = request.getParameter("nombre");
        String dni = request.getParameter("dni");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");

        // Crear objeto Cliente
        Cliente cliente = new Cliente();
        cliente.setNombre(nombre);
        cliente.setDni(dni);
        cliente.setTelefono(telefono);
        cliente.setEmail(correo);

        // Insertar cliente usando ClienteDAO
        boolean exito = clienteDAO.create(cliente);

        // Responder al cliente
        response.setContentType("text/html");
        if (exito) {
            response.getWriter().println("Cliente insertado correctamente.");
        } else {
            response.getWriter().println("Error al insertar el cliente.");
        }
    }
}
