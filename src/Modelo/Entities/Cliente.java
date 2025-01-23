package Modelo.Entities;

import java.sql.Timestamp;

public class Cliente {
    private String id;

    private String nombre;
    private String apellido;
    private String direccion;
    private String telefono;
    private String correo;
    private String estado;
    private Timestamp fechaRegistro;
    private Timestamp ultimaActividad;

    public Cliente(String id, String nombre, String apellido, String direccion, String telefono, String correo, String estado, Timestamp fechaRegistro, Timestamp ultimaActividad) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.direccion = direccion;
        this.telefono = telefono;
        this.correo = correo;
        this.estado = estado;
        this.fechaRegistro = fechaRegistro;
        this.ultimaActividad = ultimaActividad;
    }

    public String getId() { return id; }

    public void setId(String id) { this.id = id; }

    public String getDireccion() { return direccion; }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setDireccion(String direccion) { this.direccion = direccion; }
    public String getTelefono() { return telefono; }
    public void setTelefono(String telefono) { this.telefono = telefono; }
    public String getCorreo() { return correo; }
    public void setCorreo(String correo) { this.correo = correo; }
    public String getEstado() { return estado; }
    public void setEstado(String estado) { this.estado = estado; }

    public Timestamp getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Timestamp fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public Timestamp getUltimaActividad() {
        return ultimaActividad;
    }

    public void setUltimaActividad(Timestamp ultimaActividad) {
        this.ultimaActividad = ultimaActividad;
    }
}