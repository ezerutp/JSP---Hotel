package com.utp.proceso1.modelo;

import com.utp.proceso1.utilidades.EnumHotel.estadoHabitacion;

public class Habitacion {
    private int id;
    private String numeroHabitacion;
    private TipoHabitacion tipoHabitacion;
    private estadoHabitacion estado;

    public Habitacion() {}

    public Habitacion(String numeroHabitacion, estadoHabitacion estado) {
        this.numeroHabitacion = numeroHabitacion;
        this.estado = estado;
    }

    public Habitacion(String numeroHabitacion, TipoHabitacion tipoHabitacion, estadoHabitacion estado) {
        this.numeroHabitacion = numeroHabitacion;
        this.tipoHabitacion = tipoHabitacion;
        this.estado = estado;
    }
    public Habitacion(int id, String numeroHabitacion, TipoHabitacion tipoHabitacion, estadoHabitacion estado) {
        this.id = id;
        this.numeroHabitacion = numeroHabitacion;
        this.tipoHabitacion = tipoHabitacion;
        this.estado = estado;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNumeroHabitacion() {
        return this.numeroHabitacion;
    }

    public void setNumeroHabitacion(String numeroHabitacion) {
        this.numeroHabitacion = numeroHabitacion;
    }

    public TipoHabitacion getTipoHabitacion() {
        return this.tipoHabitacion;
    }

    public void setTipoHabitacion(TipoHabitacion tipoHabitacion) {
        this.tipoHabitacion = tipoHabitacion;
    }

    public estadoHabitacion getEstado() {
        return this.estado;
    }

    public void setEstado(estadoHabitacion estado) {
        this.estado = estado;
    }
}

