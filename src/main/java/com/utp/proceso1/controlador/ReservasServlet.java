package com.utp.proceso1.controlador;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.utp.proceso1.dao.ReservaDAO;
import com.utp.proceso1.utilidades.EnumHotel;

@WebServlet("/dashboard/reservas")
public class ReservasServlet extends HttpServlet {

    protected void listarReservas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ReservaDAO reservaDAO = new ReservaDAO();
        int totalReservas = reservaDAO.getReservas().size();
        int totalReservasActivas = (int) reservaDAO.getReservas().stream()
                .filter(r -> r.getEstadoReserva() == EnumHotel.estadoReserva.CONFIRMADA)
                .count();
        int totalReservasPendientes = (int) reservaDAO.getReservas().stream()
                .filter(r -> r.getEstadoReserva() == EnumHotel.estadoReserva.PENDIENTE)
                .count();
        int totalReservasCheckedIn = (int) reservaDAO.getReservas().stream()
                .filter(r -> r.getFechaCheckin().equals(new Date()))
                .count();
        request.setAttribute("totalReservas", totalReservas);
        request.setAttribute("totalReservasActivas", totalReservasActivas);
        request.setAttribute("totalReservasPendientes", totalReservasPendientes);
        request.setAttribute("totalReservasCheckedIn", totalReservasCheckedIn);
        request.setAttribute("reservas", reservaDAO.getReservas());
        request.getRequestDispatcher("/dashboard/reservas.jsp").forward(request, response);
    }

    protected void eliminarReserva(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        ReservaDAO reservaDAO = new ReservaDAO();
        boolean success = reservaDAO.deleteReserva(id);
        if (!success) {
            request.setAttribute("error", "Error al eliminar la reserva");
            request.getRequestDispatcher("/dashboard/reservas.jsp").forward(request, response);
            return;
        }
        response.sendRedirect(request.getContextPath() + "/dashboard/reservas");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int opt;
        try {
            opt = Integer.parseInt(request.getParameter("opt"));
        } catch (NumberFormatException e) {
            opt = 1; // Default to listar reservas
        }

        switch (opt) {
            case 1: // Listar reservas
                listarReservas(request, response);
                break;
            case 2:
                eliminarReserva(request, response);
                break;
            default:
                listarReservas(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
