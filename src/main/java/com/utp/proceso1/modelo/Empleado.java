package com.utp.proceso1.modelo;

import com.utp.proceso1.utilidades.EnumHotel.tipoRol;

public class Empleado {
    
    private int id;
    private String usuario;
    private String clave;
    private String nombre;
    private tipoRol rol;

    public Empleado() {}

    public Empleado(int id, String usuario, String clave, String nombre, tipoRol rol) {
        this.id = id;
        this.usuario = usuario;
        this.clave = clave;
        this.nombre = nombre;
        this.rol = rol;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsuario() {
        return this.usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return this.clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public tipoRol getRol() {
        return this.rol;
    }

    public void setRol(tipoRol rol) {
        this.rol = rol;
    }

}
