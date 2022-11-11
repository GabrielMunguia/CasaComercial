package modelo;

public class Cliente {
    int idCliente;
    String nombre;
    String apellidos;
    String DUI;
    String NIT;
    String direccion;
    String telefono;
    
    public Cliente(){
    }
    
    public Cliente(String nom, String DUI, String NIT, String dir, String tel){
        this.nombre = nom;
        this.DUI = DUI;
        this.NIT = NIT;
        this.direccion = dir;
        this.telefono = tel;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNombre() {
        return this.nombre;
    }
    
    

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
      public String getApellidos() {
        return apellidos;
    }
    
    

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }


    public String getDUI() {
        return DUI;
    }

    public void setDUI(String DUI) {
        this.DUI = DUI;
    }

    public String getNIT() {
        return NIT;
    }

    public void setNIT(String NIT) {
        this.NIT = NIT;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
}
