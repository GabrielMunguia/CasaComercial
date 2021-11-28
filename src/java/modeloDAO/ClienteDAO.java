package modeloDAO;


import modelo.Conexion;
import interfaces.ClienteCRUD;
import modelo.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Usuario;

public class ClienteDAO implements ClienteCRUD{
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Cliente cli = new Cliente();
    
    @Override
    public List listarCliente(){
        ArrayList<Cliente>list = new ArrayList<>();
        String sql = "select * from cliente";
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                System.out.println("empleado");
                Cliente c = new Cliente();
                c.setIdCliente(rs.getInt("idCliente"));
                c.setNombre(rs.getString("nombre"));
                c.setDUI(rs.getString("DUI"));
                c.setNIT(rs.getString("NIT"));
                c.setDireccion(rs.getString("direccion"));
                c.setTelefono(rs.getString("telefono"));
                list.add(c);
            }
        }catch(Exception e){  
        }
        return list;
    }
    
    
    @Override
    public Cliente list(int id){
        String sql = "select * from cliente where idCliente="+id;
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                cli.setIdCliente(rs.getInt("idCliente"));
                cli.setNombre(rs.getString("nombre"));
                cli.setDUI(rs.getString("DUI"));
                cli.setNIT(rs.getString("NIT"));
                cli.setDireccion(rs.getString("direccion"));
                cli.setTelefono(rs.getString("telefono"));
            }
            
        }catch(Exception e){            
        }
        return cli;
    }
    
    @Override
    public boolean addCliente(Cliente cli){
        String sql = "insert into cliente(nombre, DUI, NIT, direccion, telefono)values('"+cli.getNombre()+"','"+cli.getDUI()+"','"+cli.getNIT()+"','"+cli.getDireccion()+"','"+cli.getTelefono()+"')";
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        }catch(SQLException e){
            System.out.println("e = " + e);
        }
     return false;   
    }
    
    @Override
    public boolean editCliente(Cliente cli){
        String sql ="update cliente set nombre='"+cli.getNombre()+"',DUI='"+cli.getDUI()+"',NIT='"+cli.getNIT()+"',direccion='"+cli.getDireccion()+"',telefono='"+cli.getTelefono()+"'where idCliente="+cli.getIdCliente();
        try{
            con = cn.getConnection();
            ps =con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        }catch(SQLException e){
            System.out.println("e = " + e);
        }
        return false;
    }
    
    @Override
    public boolean eliminarCliente(int id){
        String sql = "delete from cliente where idCliente="+id;
        try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        }catch(SQLException e){
            System.out.println("e = " + e);
        }
        return false;
    } 

    public int validar(Usuario usr) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}