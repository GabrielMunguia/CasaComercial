package interfaces;

import modelo.Cliente;
import java.util.List;

public interface ClienteCRUD {
    public List listarCliente();
    public Cliente list(int idCliente);
    public boolean addCliente(Cliente cli);
    public boolean editCliente(Cliente cli);
    public boolean eliminarCliente(int idCliente);
}
