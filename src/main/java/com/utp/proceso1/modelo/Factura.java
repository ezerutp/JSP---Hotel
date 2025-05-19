package com.utp.proceso1.modelo;

import java.util.Date;

public class Factura {
    private int id;
    private Pago pago;
    private Date fecha_emision;
    private String descripcion;

    public Factura() {}

    public Factura(int id, Pago pago, Date fecha_emision, String descripcion) {
        this.id = id;
        this.pago = pago;
        this.fecha_emision = fecha_emision;
        this.descripcion = descripcion;
    }


    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Pago getPago() {
        return this.pago;
    }

    public void setPago(Pago pago) {
        this.pago = pago;
    }

    public Date getFecha_emision() {
        return this.fecha_emision;
    }

    public void setFecha_emision(Date fecha_emision) {
        this.fecha_emision = fecha_emision;
    }

    public String getDescripcion() {
        return this.descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

}
