package com.utp.proceso1.modelo;

import com.utp.proceso1.utilades.EnumHotel.estadoHabitacion;

public class Habitacion {
    private int id;
    private String numero;
    private TipoHabitacion tipoHabitacion;
    private double precio;
    private estadoHabitacion estado;

    public Habitacion() {}

    public Habitacion(int id, String numero, TipoHabitacion tipoHabitacion, double precio, estadoHabitacion estado) {
        this.id = id;
        this.numero = numero;
        this.tipoHabitacion = tipoHabitacion;
        this.precio = precio;
        this.estado = estado;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNumero() {
        return this.numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public TipoHabitacion getTipoHabitacion() {
        return this.tipoHabitacion;
    }

    public void setTipoHabitacion(TipoHabitacion tipoHabitacion) {
        this.tipoHabitacion = tipoHabitacion;
    }

    public double getPrecio() {
        return this.precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public estadoHabitacion getEstado() {
        return this.estado;
    }

    public void setEstado(estadoHabitacion estado) {
        this.estado = estado;
    }
}

