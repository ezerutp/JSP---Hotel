package com.utp.proceso1.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.utp.proceso1.dao.ReservaDAO;
import com.utp.proceso1.modelo.Reserva;
import org.json.JSONArray;
import org.json.JSONObject;
import java.util.List;

@WebServlet("/ReservasDataServlet")
public class ReservasDataServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            ReservaDAO reservaDAO = new ReservaDAO();
            List<Reserva> reservas = reservaDAO.getReservas();

            JSONArray reservasArray = new JSONArray();

            for (Reserva reserva : reservas) {
                JSONObject obj = new JSONObject();
                obj.put("id", reserva.getIdReserva());
                obj.put("nombreHuesped", reserva.getNombreHuesped());
                obj.put("habitacion", reserva.getIdHabitacion() != null ? reserva.getIdHabitacion().getId() : JSONObject.NULL);
                obj.put("checkin", reserva.getFechaCheckin() != null ? reserva.getFechaCheckin().toString() : "");
                obj.put("checkout", reserva.getFechaCheckout() != null ? reserva.getFechaCheckout().toString() : "");
                obj.put("personas", reserva.getCantidadPersonas());
                reservasArray.put(obj);
            }

            JSONObject resultado = new JSONObject();
            resultado.put("reservas", reservasArray);

            out.print(resultado.toString());

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\":\"Error al obtener reservas\"}");
        }
    }
}