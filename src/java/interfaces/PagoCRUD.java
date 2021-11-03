package interfaces;

import modelo.Pago;
import java.util.List;

public interface PagoCRUD {
    public List listarPago();
    public Pago list(int idPago);
    public boolean agregarPago(Pago p);
    public boolean editarPago(Pago p);
    public boolean eliminarPago(int idPago);
}
