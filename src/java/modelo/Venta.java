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
public class Venta {

    int idVenta;
    int idCliente;

    int idEmpleado;
    int idMetodoPago;
    String fecha;
 public Venta() {
    }
 public Venta(int idVenta, int idCliente, int idEmpleado, int idMetodoPago, String fecha, double total, String tipoComprobante, int noComprobante) {
        this.idVenta = idVenta;
        this.idCliente = idCliente;
      
        this.idEmpleado = idEmpleado;
        this.idMetodoPago = idMetodoPago;
        this.fecha = fecha;
        this.total = total;
        this.tipoComprobante = tipoComprobante;
        this.noComprobante = noComprobante;
 
    }

    public String getEmpleado() {
        return empleado;
    }

    public void setEmpleado(String empleado) {
        this.empleado = empleado;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getMetodoPago() {
        return metodoPago;
    }

    public void setMetodoPago(String metodoPago) {
        this.metodoPago = metodoPago;
    }
    String empleado,cliente,metodoPago;
    double total;

   

    
    public String getTipoComprobante() {
        return tipoComprobante;
    }

    public void setTipoComprobante(String tipoComprobante) {
        this.tipoComprobante = tipoComprobante;
    }

    public int getNoComprobante() {
        return noComprobante;
    }

    public void setNoComprobante(int noComprobante) {
        this.noComprobante = noComprobante;
    }
    String tipoComprobante;
    int noComprobante;

    boolean estado;

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

  

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public int getIdMetodoPago() {
        return idMetodoPago;
    }

    public void setIdMetodoPago(int idMetodoPago) {
        this.idMetodoPago = idMetodoPago;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

}
