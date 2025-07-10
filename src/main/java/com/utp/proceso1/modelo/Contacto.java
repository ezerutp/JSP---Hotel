package com.utp.proceso1.modelo;

import java.util.Date;

import com.utp.proceso1.utilidades.EnumHotel.estadoMensaje;

public class Contacto {
    private int id;
    private String nombreCompleto;
    private String correo;
    private int telefono;
    private String mensaje;
    private Date fechaEnvio;
    private estadoMensaje estado;

    public Contacto() {}

    public Contacto(String nombreCompleto, String correo, int telefono, String mensaje, Date fechaEnvio, estadoMensaje estado) {
        this.nombreCompleto = nombreCompleto;
        this.correo = correo;
        this.telefono = telefono;
        this.mensaje = mensaje;
        this.fechaEnvio = fechaEnvio;
        this.estado = estado;
    }

    public Contacto(int id, String nombreCompleto, String correo, int telefono, String mensaje, Date fechaEnvio, estadoMensaje estado) {
        this.id = id;
        this.nombreCompleto = nombreCompleto;
        this.correo = correo;
        this.telefono = telefono;
        this.mensaje = mensaje;
        this.fechaEnvio = fechaEnvio;
        this.estado = estado;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombreCompleto() {
        return this.nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public String getCorreo() {
        return this.correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getTelefono() {
        return this.telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getMensaje() {
        return this.mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public Date getFechaEnvio() {
        return this.fechaEnvio;
    }

    public void setFechaEnvio(Date fechaEnvio) {
        this.fechaEnvio = fechaEnvio;
    }

    public estadoMensaje getEstado() {
        return this.estado;
    }

    public void setEstado(estadoMensaje estado) {
        this.estado = estado;
    }
}