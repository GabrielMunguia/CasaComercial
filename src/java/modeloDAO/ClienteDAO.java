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
        String sql = "select * from clientes where estado=1";
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                System.out.println("empleado");
                Cliente c = new Cliente();
                c.setIdCliente(rs.getInt("idCliente"));
                c.setNombre(rs.getString("nombres"));
                c.setApellidos(rs.getString("apellidos"));
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
        String sql = "select * from clientes where idCliente="+id;
      
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
             Cliente cli = new Cliente();
            while(rs.next()){
                
                cli.setIdCliente(rs.getInt("idCliente"));
                cli.setNombre(rs.getString("nombres"));
                cli.setApellidos(rs.getString("apellidos"));
                cli.setDUI(rs.getString("DUI"));
                cli.setNIT(rs.getString("NIT"));
                cli.setDireccion(rs.getString("direccion"));
                cli.setTelefono(rs.getString("telefono"));
                 return cli;
            }
          
            
        }catch(Exception e){            
        }
        System.out.println("abahoo");
        System.out.println(cli.getNombre());
        return cli;
    }
    
    @Override
    public boolean addCliente(Cliente cli){
        String sql = "insert into clientes(nombres,apellidos, DUI, NIT, direccion, telefono)values('"+cli.getNombre()+"','"+cli.getApellidos()+"','"+cli.getDUI()+"','"+cli.getNIT()+"','"+cli.getDireccion()+"','"+cli.getTelefono()+"')";
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
        String sql ="update clientes set nombres='"+cli.getNombre()+"',DUI='"+cli.getDUI()+"',apellidos='"+cli.getApellidos()+"',NIT='"+cli.getNIT()+"',direccion='"+cli.getDireccion()+"',telefono='"+cli.getTelefono()+"'where idCliente="+cli.getIdCliente();
        System.out.println(sql);
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
        String sql = "update clientes set estado=0   where idCliente="+id;
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