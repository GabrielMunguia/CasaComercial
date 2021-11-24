package modelo;
public class Credito {
    int idCredito;
    int idCLiente;
    int idEMpleado;
    String fecha;
    double montoCredito;

    public int getIdCredito() {
        return idCredito;
    }

    public void setIdCredito(int idCredito) {
        this.idCredito = idCredito;
    }

    public int getIdCLiente() {
        return idCLiente;
    }

    public void setIdCLiente(int idCLiente) {
        this.idCLiente = idCLiente;
    }

    public int getIdEMpleado() {
        return idEMpleado;
    }

    public void setIdEMpleado(int idEMpleado) {
        this.idEMpleado = idEMpleado;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public double getMontoCredito() {
        return montoCredito;
    }

    public void setMontoCredito(double montoCredito) {
        this.montoCredito = montoCredito;
    }
}
