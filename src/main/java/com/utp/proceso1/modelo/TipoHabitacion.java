package com.utp.proceso1.modelo;

public class TipoHabitacion {
    private int id;
    private String nombre;
    private String descripcion;
    private double precio_noche;
    private int capacidad;

    public TipoHabitacion() {}

    public TipoHabitacion(int id, String nombre, String descripcion, double precio_noche, int capacidad) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio_noche = precio_noche;
        this.capacidad = capacidad;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return this.descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecioNoche() {
        return this.precio_noche;
    }

    public void setPrecioNoche(double precioNoche) {
        this.precio_noche = precioNoche;
    }

    public int getCapacidad() {
        return this.capacidad;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

}