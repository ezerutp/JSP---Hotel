/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.utp.proceso1.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Conexion;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/ReservasDataServlet")
public class ReservasDataServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try (Connection conn = new Conexion().getConexion()) {

            String sql = "SELECT id_reserva, nombre_huesped, id_habitacion, fecha_checkin, fecha_checkout, cantidad_personas FROM reservas";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            JSONArray reservasArray = new JSONArray();

            while (rs.next()) {
                JSONObject reserva = new JSONObject();
                reserva.put("id", rs.getInt("id_reserva"));
                reserva.put("nombreHuesped", rs.getString("nombre_huesped"));
                reserva.put("habitacion", rs.getString("id_habitacion"));
                reserva.put("checkin", rs.getDate("fecha_checkin").toString());
                reserva.put("checkout", rs.getDate("fecha_checkout").toString());
                reserva.put("personas", rs.getInt("cantidad_personas"));

                reservasArray.put(reserva);
            }

            JSONObject resultado = new JSONObject();
            resultado.put("reservas", reservasArray);

            out.print(resultado.toString());

            rs.close();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\":\"Error al obtener reservas\"}");
        }
    }
}
