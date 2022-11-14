/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author GabrielMunguia
 */
public class Usuario {

    String usuario;
    int idEmpleado;
    String password;
    int idCargo;
    int idUsuario;
    boolean estado;
    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombre_empleado() {
        return nombre_empleado;
    }

    public void setNombre_empleado(String nombre_empleado) {
        this.nombre_empleado = nombre_empleado;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getDui_empelado() {
        return dui_empelado;
    }

    public void setDui_empelado(String dui_empelado) {
        this.dui_empelado = dui_empelado;
    }
    String nombre_empleado,rol,dui_empelado;



    public Usuario() {
        this.estado = true;

    }

    public Usuario(int id, String usuario, String password, boolean estado) {

        this.usuario = usuario;
        this.password = password;
        this.estado = estado;
    }

    public void setID(int id) {
        this.idUsuario = id;
    }
     public int getID() {
        return this.idUsuario;
     }
    public boolean getEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public int getIdCargo() {
        return idCargo;
    }

    public void setIdCargo(int idCargo) {
        this.idCargo = idCargo;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
