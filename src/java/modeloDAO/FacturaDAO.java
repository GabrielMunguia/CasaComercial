/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.Conexion;
import modelo.Factura;

/**
 *
 * @author GabrielMunguia
 */
public class FacturaDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Factura f = new Factura();
    ProductoDAO pdao = new ProductoDAO();


        public boolean eliminar(int id){
         String sql="delete from factura where idFactura="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al eliminar factura :"+e);
        }
        return false;
    }

    public List listarFacturas() {
         ArrayList<Factura>list2 = new ArrayList<>();
        String sql = "SELECT * FROM factura";
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
           
             Factura c = new Factura();
                c.setId(rs.getInt("idFactura"));
                c.setIdCliente(rs.getInt("idCliente"));
                c.setIdEmpleado(rs.getInt("idEmpleado"));
                c.setIdMetodoPago(rs.getInt("idMetodoPago"));
                c.setFecha(rs.getString("fecha"));
                c.setTotal(rs.getDouble("total"));
//                c.setTotal(getTotal(rs.getInt("idFactura")));
                list2.add(c);
            
            }
        }catch(Exception e){  
            System.out.println("e = " + e);
        }
        return list2;
    }
    
    
    
    
    
       public int addFactura(Factura f) {
        
        String sql = "insert into factura(fecha, idCliente, idEmpleado, idMetodoPago)values('"+f.getFecha()+"','"+f.getIdCliente()+"','"+f.getIdEmpleado()+"', '"+f.getIdMetodoPago()+"')";
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            ps.executeUpdate();
            rs=ps.getGeneratedKeys();
            if(rs.next()){
                String id = rs.getString(1);
                return Integer.parseInt(id);
              
            }
        }catch(Exception e){
            System.out.println(" ERROR AL INSETAR FACTURA = " +  e);
        }
        return 0;
    }


}
