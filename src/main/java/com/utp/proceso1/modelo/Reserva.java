package com.utp.proceso1.modelo;

import com.utp.proceso1.utilidades.EnumHotel.estadoReserva;

import java.util.Date;

public class Reserva {
    private int id;
    private Habitacion idHabitacion;
    private String nombreHuesped;
    private String correoHuesped;
    private String telefonoHuesped;
    private Date fechaCheckin;
    private Date fechaCheckout;
    private int cantidadPersonas;
    private double precioNoche;
    private double totalPagar;
    private estadoReserva estadoReserva;
    private Date fechaReserva;
    private String notas;
    
    public Reserva() {}

    public Reserva(int id, Habitacion idHabitacion, String nombreHuesped, String correoHuesped, String telefonoHuesped, Date fechaCheckin, Date fechaCheckout, int cantidadPersonas, double precioNoche, double totalPagar, estadoReserva estadoReserva, Date fechaReserva, String notas) {
        this.id = id;
        this.idHabitacion = idHabitacion;
        this.nombreHuesped = nombreHuesped;
        this.correoHuesped = correoHuesped;
        this.telefonoHuesped = telefonoHuesped;
        this.fechaCheckin = fechaCheckin;
        this.fechaCheckout = fechaCheckout;
        this.cantidadPersonas = cantidadPersonas;
        this.precioNoche = precioNoche;
        this.totalPagar = totalPagar;
        this.estadoReserva = estadoReserva;
        this.fechaReserva = fechaReserva;
        this.notas = notas;
    }

    // Getters y Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCodigo(){
        return String.format("RES-%03d", id);
    }

    public void setCodigo(String codigo) {
        // Este método no es necesario, ya que el código se genera automáticamente
        // a partir del ID de la reserva.
    }

    public Habitacion getIdHabitacion() {
        return idHabitacion;
    }

    public void setIdHabitacion(Habitacion idHabitacion) {
        this.idHabitacion = idHabitacion;
    }

    public String getNombreHuesped() {
        return nombreHuesped;
    }

    public void setNombreHuesped(String nombreHuesped) {
        this.nombreHuesped = nombreHuesped;
    }

    public String getCorreoHuesped() {
        return correoHuesped;
    }

    public void setCorreoHuesped(String correoHuesped) {
        this.correoHuesped = correoHuesped;
    }

    public String getTelefonoHuesped() {
        return telefonoHuesped;
    }

    public void setTelefonoHuesped(String telefonoHuesped) {
        this.telefonoHuesped = telefonoHuesped;
    }

    public Date getFechaCheckin() {
        return fechaCheckin;
    }

    public void setFechaCheckin(Date fechaCheckin) {
        this.fechaCheckin = fechaCheckin;
    }

    public Date getFechaCheckout() {
        return fechaCheckout;
    }

    public void setFechaCheckout(Date fechaCheckout) {
        this.fechaCheckout = fechaCheckout;
    }

    public int getCantidadPersonas() {
        return cantidadPersonas;
    }

    public void setCantidadPersonas(int cantidadPersonas) {
        this.cantidadPersonas = cantidadPersonas;
    }

    public double getPrecioNoche() {
        return precioNoche;
    }

    public void setPrecioNoche(double precioNoche) {
        this.precioNoche = precioNoche;
    }

    public double getTotalPagar() {
        return totalPagar;
    }

    public void setTotalPagar(double totalPagar) {
        this.totalPagar = totalPagar;
    }

    public estadoReserva getEstadoReserva() {
        return estadoReserva;
    }

    public void setEstadoReserva(estadoReserva estadoReserva) {
        this.estadoReserva = estadoReserva;
    }

    public Date getFechaReserva() {
        return fechaReserva;
    }

    public void setFechaReserva(Date fechaReserva) {
        this.fechaReserva = fechaReserva;
    }

    public String getNotas() {
        return notas;
    }

    public void setNotas(String notas) {
        this.notas = notas;
    }

    public int getDiasHospedaje() {
        if (fechaCheckin != null && fechaCheckout != null) {
            long diff = fechaCheckout.getTime() - fechaCheckin.getTime();
            return (int) (diff / (1000 * 60 * 60 * 24));
        }
        return 0; // Si las fechas no están definidas, retornamos 0 días
    }

    public void setDiasHospedaje(int diasHospedaje) {
        // Este método no es necesario, ya que los días de hospedaje se calculan automáticamente
        // a partir de las fechas de check-in y check-out.
        // Este método solo es para JSP y no tiene lógica en el modelo.
    }
}