package com.utp.proceso1.modelo;

import java.util.Date;

import com.utp.proceso1.utilades.EnumHotel.metodoPago;

public class Pago {
    private int id;
    private Reserva reserva;
    private double monto;
    private Date fecha_pago;
    private metodoPago metodo_pago;
    
    public Pago() {}

    public Pago(int id, Reserva reserva, double monto, Date fecha_pago, metodoPago metodo_pago) {
        this.id = id;
        this.reserva = reserva;
        this.monto = monto;
        this.fecha_pago = fecha_pago;
        this.metodo_pago = metodo_pago;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Reserva getReserva() {
        return this.reserva;
    }

    public void setReserva(Reserva reserva) {
        this.reserva = reserva;
    }

    public double getMonto() {
        return this.monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public Date getFecha_pago() {
        return this.fecha_pago;
    }

    public void setFecha_pago(Date fecha_pago) {
        this.fecha_pago = fecha_pago;
    }

    public metodoPago getMetodo_pago() {
        return this.metodo_pago;
    }

    public void setMetodo_pago(metodoPago metodo_pago) {
        this.metodo_pago = metodo_pago;
    }

}
