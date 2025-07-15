package com.utp.proceso1.controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.utp.proceso1.dao.HabitacionDAO;
import com.utp.proceso1.dao.TipoHabitacionDAO;
import com.utp.proceso1.modelo.Habitacion;
import com.utp.proceso1.modelo.TipoHabitacion;
import com.utp.proceso1.utilidades.EnumHotel;

@WebServlet("/dashboard/habitaciones")
public class HabitacionServlet extends HttpServlet {
    
    protected void listarHabitaciones(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HabitacionDAO habitacionDAO = new HabitacionDAO();
        TipoHabitacionDAO habitacionTipoDAO = new TipoHabitacionDAO();
        List<Habitacion> habitaciones = habitacionDAO.getHabitaciones();
        List<TipoHabitacion> tipos = habitacionTipoDAO.getTipoHabitaciones();
        int totalHabitaciones = habitaciones.size();
        int totalHabitacionesActivas = (int) habitaciones.stream()
                .filter(h -> h.getEstado() == EnumHotel.estadoHabitacion.DISPONIBLE)
                .count();
        int totalHabitacionesOcupadas = totalHabitaciones - totalHabitacionesActivas;
        request.setAttribute("habitaciones", habitaciones);
        request.setAttribute("tipos", tipos);
        request.setAttribute("totalHabitaciones", totalHabitaciones);
        request.setAttribute("totalHabitacionesActivas", totalHabitacionesActivas);
        request.setAttribute("totalHabitacionesOcupadas", totalHabitacionesOcupadas);
        request.getRequestDispatcher("/dashboard/habitaciones.jsp").forward(request, response);
    }

    protected void registrarHabitacion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String numeroHabitacion = request.getParameter("numeroHabitacion");
        String tipoHabitacionId = request.getParameter("tipoHabitacion");
        HabitacionDAO habitacionDAO = new HabitacionDAO();
        TipoHabitacionDAO tipoHabitacionDAO = new TipoHabitacionDAO();
        TipoHabitacion tipoHabitacion = tipoHabitacionDAO.getTipoHabitacionById(Integer.parseInt(tipoHabitacionId));
        if (tipoHabitacion == null) {
            request.setAttribute("error", "Tipo de habitación no válido.");
            request.getRequestDispatcher("/dashboard/habitaciones.jsp").forward(request, response);
            return;
        }
        Habitacion habitacion = new Habitacion(numeroHabitacion, tipoHabitacion, EnumHotel.estadoHabitacion.DISPONIBLE);
        boolean success = habitacionDAO.create(habitacion);
        if (!success) {
            request.setAttribute("error", "Error al registrar la habitación. Verifique los datos.");
            request.getRequestDispatcher("/dashboard/habitaciones.jsp").forward(request, response);
            return;
        }
        response.sendRedirect(request.getContextPath() + "/dashboard/habitaciones");
    }

    protected void actualizarHabitacion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String numeroHabitacion = request.getParameter("numeroHabitacion");
        String tipoHabitacionId = request.getParameter("tipoHabitacion");
        HabitacionDAO habitacionDAO = new HabitacionDAO();
        TipoHabitacionDAO tipoHabitacionDAO = new TipoHabitacionDAO();
        TipoHabitacion tipoHabitacion = tipoHabitacionDAO.getTipoHabitacionById(Integer.parseInt(tipoHabitacionId));
        if (tipoHabitacion == null) {
            request.setAttribute("error", "Tipo de habitación no válido.");
            request.getRequestDispatcher("/dashboard/habitaciones.jsp").forward(request, response);
            return;
        }

        Habitacion habitacion = new Habitacion(id, numeroHabitacion, tipoHabitacion, EnumHotel.estadoHabitacion.DISPONIBLE);
        boolean success = habitacionDAO.updateHabitacion(habitacion);
        if (!success) {
            request.setAttribute("error", "Error al actualizar la habitación. Verifique los datos.");
            request.getRequestDispatcher("/dashboard/habitaciones.jsp").forward(request, response);
            return;
        }
        response.sendRedirect(request.getContextPath() + "/dashboard/habitaciones");
    }

    protected void eliminarHabitacion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        HabitacionDAO habitacionDAO = new HabitacionDAO();
        boolean eliminado = habitacionDAO.deleteHabitacion(id);
        if (!eliminado) {
            request.setAttribute("error", "Error al eliminar la habitación. Verifique los datos.");
        }
        listarHabitaciones(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int opt;
        try {
            opt = Integer.parseInt(request.getParameter("opt"));
        } catch (NumberFormatException e) {
            opt = 1; // Default to listar habitaciones
        }

        switch (opt) {
            case 1: // Listar habitaciones
                listarHabitaciones(request, response);
                break;
            case 2: // Registrar habitación
                registrarHabitacion(request, response);
                break;
            case 3: // Actualizar habitación
                actualizarHabitacion(request, response);
                break;
            case 4: // Eliminar habitación
                eliminarHabitacion(request, response);
                break;
            default: // Si no se especifica una opción válida, listar habitaciones
                listarHabitaciones(request, response);
                break;
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