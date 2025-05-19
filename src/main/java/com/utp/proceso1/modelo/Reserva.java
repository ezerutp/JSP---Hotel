package com.utp.proceso1.modelo;

import java.util.Date;

import com.utp.proceso1.utilidades.EnumHotel.estadoReserva;

public class Reserva {
    private int id;
    private Cliente cliente;
    private Habitacion habitacion;
    private Date fecha_entrada;
    private Date fecha_salida;
    private estadoReserva estado;
    private double total_pago;

    public Reserva() {}

    public Reserva(int id, Cliente cliente, Habitacion habitacion, Date fecha_entrada, Date fecha_salida, estadoReserva estado, double total_pago) {
        this.id = id;
        this.cliente = cliente;
        this.habitacion = habitacion;
        this.fecha_entrada = fecha_entrada;
        this.fecha_salida = fecha_salida;
        this.estado = estado;
        this.total_pago = total_pago;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Cliente getCliente() {
        return this.cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Habitacion getHabitacion() {
        return this.habitacion;
    }

    public void setHabitacion(Habitacion habitacion) {
        this.habitacion = habitacion;
    }

    public Date getFecha_entrada() {
        return this.fecha_entrada;
    }

    public void setFecha_entrada(Date fecha_entrada) {
        this.fecha_entrada = fecha_entrada;
    }

    public Date getFecha_salida() {
        return this.fecha_salida;
    }

    public void setFecha_salida(Date fecha_salida) {
        this.fecha_salida = fecha_salida;
    }

    public estadoReserva getEstado() {
        return this.estado;
    }

    public void setEstado(estadoReserva estado) {
        this.estado = estado;
    }

    public double getTotal_pago() {
        return this.total_pago;
    }

    public void setTotal_pago(double total_pago) {
        this.total_pago = total_pago;
    }

}
