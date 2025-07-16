package com.utp.proceso1.controlador;

import com.utp.proceso1.dao.ContactoDAO;
import com.utp.proceso1.modelo.Contacto;
import com.utp.proceso1.utilidades.EnumHotel;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet("/ContactoServlet")
public class ContactoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String telefonoStr = request.getParameter("telefono");
        String mensaje = request.getParameter("mensaje");

        try {
            int telefono = Integer.parseInt(telefonoStr);

            Contacto contacto = new Contacto();
            contacto.setNombreCompleto(nombre);
            contacto.setCorreo(correo);
            contacto.setTelefono(telefono);
            contacto.setMensaje(mensaje);
            contacto.setFechaEnvio(new Date());
            contacto.setEstado(EnumHotel.estadoMensaje.NUEVO); // Ajusta el estado según tu lógica

            ContactoDAO contactoDAO = new ContactoDAO();
            boolean exito = contactoDAO.create(contacto);

            if (exito) {
                response.sendRedirect("contacto.jsp?msg=Mensaje+enviado+exitosamente");
            } else {
                response.sendRedirect("contacto.jsp?error=Error+al+enviar");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("contacto.jsp?error=Error+de+sistema");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
                ContactoDAO contactoDAO = new ContactoDAO();
                List<Contacto> contactos = contactoDAO.getContactos();
                req.setAttribute("contactosList", contactos);
                req.getRequestDispatcher("mensajes.jsp").forward(req, resp);
    }
}