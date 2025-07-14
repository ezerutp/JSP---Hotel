package com.utp.proceso1.modelo;

import java.util.Date;

public class Administrador {
    private int id;
    private String usuario;
    private String contrasena;
    private String nombreCompleto;
    private String correo;
    private String telefono;
    private boolean estado;
    private Date fechaCreacion;
    private String iniciales;

    public Administrador() {
    }

    public Administrador(String usuario, String contrasena, String nombreCompleto, String correo, String telefono, boolean estado) {
        this.usuario = usuario;
        this.contrasena = contrasena;
        this.nombreCompleto = nombreCompleto;
        this.correo = correo;
        this.telefono = telefono;
        this.estado = estado;
        this.fechaCreacion = new Date(); // Fecha actual
        this.iniciales = generarIniciales(nombreCompleto);
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

    public String getCorreo() {
        return this.correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return this.telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public boolean isEstado() {
        return this.estado;
    }

    public boolean getEstado() {
        return this.estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public String getIniciales() {
        this.iniciales = generarIniciales(this.nombreCompleto);
        return this.iniciales;
    }

    public void setIniciales(String iniciales) {
        this.iniciales = iniciales;
    }

    private String generarIniciales(String nombreCompleto) {
        String[] nombres = nombreCompleto.split(" ");
        String iniciales = "";
        for (String nombre : nombres) {
            iniciales += nombre.charAt(0);
        }
        return iniciales.toUpperCase();
    }
}
