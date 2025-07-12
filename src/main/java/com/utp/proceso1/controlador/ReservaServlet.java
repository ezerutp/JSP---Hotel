package com.utp.proceso1.controlador;

import com.utp.proceso1.dao.ReservaDAO;
import com.utp.proceso1.dao.HabitacionDAO;
import com.utp.proceso1.modelo.Reserva;
import com.utp.proceso1.modelo.Habitacion;
import com.utp.proceso1.utilidades.EnumHotel;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet("/reservar")
public class ReservaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Validar que todos los campos requeridos estén presentes y no estén vacíos
        if (isNullOrEmpty(request.getParameter("nombre_huesped")) ||
                isNullOrEmpty(request.getParameter("correo_huesped")) ||
                isNullOrEmpty(request.getParameter("telefono_huesped")) ||
                isNullOrEmpty(request.getParameter("id_habitacion")) ||
                isNullOrEmpty(request.getParameter("fecha_checkin")) ||
                isNullOrEmpty(request.getParameter("fecha_checkout")) ||
                isNullOrEmpty(request.getParameter("cantidad_personas"))) {
            response.sendRedirect("reservar.jsp?error=Campos+obligatorios+faltantes");
            return;
        }

        // Obtener los parámetros de la solicitud
        String nombre = request.getParameter("nombre_huesped");
        String correo = request.getParameter("correo_huesped");
        String telefono = request.getParameter("telefono_huesped");
        int numeroHabitacion;
        String checkinStr = request.getParameter("fecha_checkin");
        String checkoutStr = request.getParameter("fecha_checkout");
        int personas;

        try {

            numeroHabitacion = Integer.parseInt(request.getParameter("id_habitacion"));
            personas = Integer.parseInt(request.getParameter("cantidad_personas"));

            java.sql.Date checkin = java.sql.Date.valueOf(checkinStr);
            java.sql.Date checkout = java.sql.Date.valueOf(checkoutStr);

            // Verificar si es que el checkout es antes del checkin
            if (!checkout.after(checkin)) {
                response.sendRedirect("reservar.jsp?error=Fechas+inválidas");
                return;
            }

            // Obtener la habitación usando HabitacionDAO
            HabitacionDAO habitacionDAO = new HabitacionDAO();
            Habitacion habitacion = habitacionDAO.getHabitacionById(numeroHabitacion);

            // Obtener precio por noche
            double precioNoche = habitacion.getTipoHabitacion().getPrecioNoche();

            // Calcular total a pagar
            double totalPagar = calcularTotalPagar(checkin, checkout, precioNoche);

            // Crear objeto Reserva
            Reserva reserva = new Reserva();
            reserva.setIdHabitacion(habitacion);
            reserva.setNombreHuesped(nombre);
            reserva.setCorreoHuesped(correo);
            reserva.setTelefonoHuesped(telefono);
            reserva.setFechaCheckin(checkin);
            reserva.setFechaCheckout(checkout);
            reserva.setCantidadPersonas(personas);
            reserva.setPrecioNoche(precioNoche);
            reserva.setTotalPagar(totalPagar);
            reserva.setEstadoReserva(EnumHotel.estadoReserva.PENDIENTE);
            reserva.setFechaReserva(new Date());
            reserva.setNotas("");

            // Registrar la reserva usando ReservaDAO
            ReservaDAO reservaDAO = new ReservaDAO();
            boolean exito = reservaDAO.create(reserva);

            if (exito) {
                boolean actualizado = habitacionDAO.updateEstadoHabitacion(numeroHabitacion,
                        EnumHotel.estadoHabitacion.OCUPADA);
                if (actualizado) {
                    response.sendRedirect("reservaExitosa.jsp?success=Reserva+registrada+con+éxito");
                } else {
                    response.sendRedirect("reservar.jsp?error=Error+al+actualizar+estado+de+habitacion");
                }
            } else {
                response.sendRedirect("reservar.jsp?error=Error+al+registrar+reserva");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("reservar.jsp?error=Error+del+sistema");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HabitacionDAO habitacionDAO = new HabitacionDAO();
        request.setAttribute("habitaciones",
                habitacionDAO.getHabitacionesByEstado(EnumHotel.estadoHabitacion.DISPONIBLE));
        request.getRequestDispatcher("reservar.jsp").forward(request, response);
    }

    private double calcularTotalPagar(java.sql.Date checkin, java.sql.Date checkout, double precioNoche) {
        try {
            long dias = (checkout.getTime() - checkin.getTime()) / (1000 * 60 * 60 * 24);
            return dias * precioNoche;
        } catch (Exception e) {
            return 0.0;
        }
    }

    // Método auxiliar para validar nulos o vacíos
    private boolean isNullOrEmpty(String param) {
        boolean resultado = param == null || param.trim().isEmpty();
        return resultado;
    }
}