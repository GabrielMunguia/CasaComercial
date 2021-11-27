package modelo;


public class Pago {
    int idPago;
    int idFactura;
    double montoPagado;
    String fechaHora;

    public int getIdmetodoPago() {
        return idmetodoPago;
    }

    public void setIdmetodoPago(int idmetodoPago) {
        this.idmetodoPago = idmetodoPago;
    }
    int idmetodoPago;
    
    public Pago(){
        
    }
    
    public Pago(int idFactura, double montoPagado, String fechaHora){
        this.idFactura = idFactura;
        this.montoPagado = montoPagado;
        this.fechaHora = fechaHora;
    }

    public int getIdPago() {
        return idPago;
    }

    public void setIdPago(int idPago) {
        this.idPago = idPago;
    }

    public int getIdFactura() {
        return idFactura;
    }

    public void setIdFactura(int idFactura) {
        this.idFactura = idFactura;
    }

    public double getMontoPagado() {
        return montoPagado;
    }

    public void setMontoPagado(double montoPagado) {
        this.montoPagado = montoPagado;
    }

    public String getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(String fechaHora) {
        this.fechaHora = fechaHora;
    }
}
