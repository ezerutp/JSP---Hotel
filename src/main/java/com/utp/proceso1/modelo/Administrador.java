package com.utp.proceso1.modelo;

import java.util.Date;

public class Administrador {
    private int id;
    private String usuario;
    private String contrasena;
    private String nombreCompleto;
    private Date fechaCreacion;

    public Administrador() {
    }

    public Administrador(int id, String usuario, String contrasena, String nombreCompleto, Date fechaCreacion) {
        this.id = id;
        this.usuario = usuario;
        this.contrasena = contrasena;
        this.nombreCompleto = nombreCompleto;
        this.fechaCreacion = fechaCreacion;
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

    public String getContrasena() {
        return this.contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getNombreCompleto() {
        return this.nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public Date getFechaCreacion() {
        return this.fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
}
