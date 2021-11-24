/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author gabriel
 */
public class DetalleCredito {
    int idDetalleCredito;
    int idCredito;
    int idPRoducto;
    int cantidad;
    double precio;
    double descuento;

    public int getIdDetalleCredito() {
        return idDetalleCredito;
    }

    public void setIdDetalleCredito(int idDetalleCredito) {
        this.idDetalleCredito = idDetalleCredito;
    }

    public int getIdCredito() {
        return idCredito;
    }

    public void setIdCredito(int idCredito) {
        this.idCredito = idCredito;
    }

    public int getIdPRoducto() {
        return idPRoducto;
    }

    public void setIdPRoducto(int idPRoducto) {
        this.idPRoducto = idPRoducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public double getDescuento() {
        return descuento;
    }

    public void setDescuento(double descuento) {
        this.descuento = descuento;
    }
    
    
}
