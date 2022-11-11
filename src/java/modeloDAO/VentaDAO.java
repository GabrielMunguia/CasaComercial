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
import modelo.Venta;

/**
 *
 * @author GabrielMunguia
 */
public class VentaDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Venta f = new Venta();
    ProductoDAO pdao = new ProductoDAO();


        public boolean eliminar(int id){
         String sql="update ventas set estado=0 where idVenta="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al eliminar factura :"+e);
        }
        return false;
    }


    public List listarVenta() {
         ArrayList<Venta>list2 = new ArrayList<>();
        String sql = "SELECT  v.idVenta,v.idCliente,v.idEmpleado,v.idMetodoPago,v.fecha,v.total,v.tipoComprobante,v.noComprobante,concat(em.nombres,' ',em.apellidos) as empleado ,concat(cli.nombres,' ',cli.apellidos) as cliente ,mp.metodo FROM ventas as v join empleados as em on em.idEmpleado=v.idEmpleado join metodopago as mp on mp.idMetodoPago = v.idMetodoPago join clientes as cli on cli.idCliente=v.idCliente where v.estado=1; ";
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
           
             Venta c = new Venta();
                c.setIdVenta(rs.getInt("idVenta"));
                c.setFecha(rs.getString("fecha"));
                c.setTotal(rs.getDouble("total"));
//                c.setEstado(rs.getBoolean("estado"));
                c.setIdCliente(rs.getInt("idCliente"));
                c.setIdEmpleado(rs.getInt("idEmpleado"));
                c.setTipoComprobante(rs.getString("tipoComprobante"));
                c.setNoComprobante(rs.getInt("noComprobante"));
                c.setIdMetodoPago(rs.getInt("idMetodoPago"));
                c.setEmpleado(rs.getString("empleado"));
                c.setCliente(rs.getString("cliente"));
                c.setMetodoPago(rs.getString("metodo"));
                


              
                list2.add(c);

               
            
            }
        }catch(Exception e){  
            System.out.println("e = " + e);
            System.out.println(sql);
        }
        return list2;
    }
    
    
    
    
    
       public int addFactura(Venta f) {
        String sql = "insert into ventas (idCliente, idEmpleado, idMetodoPago, fecha, total, tipoComprobante, noComprobante,estado) values (?,?,?,?,?,?,?,1)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, f.getIdCliente());
            ps.setInt(2, f.getIdEmpleado());
            ps.setInt(3, f.getIdMetodoPago());
            ps.setString(4, f.getFecha());
            ps.setDouble(5, f.getTotal());
            ps.setString(6, f.getTipoComprobante());
            ps.setInt(7, f.getNoComprobante());
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
            return 1;
        } catch (Exception e) {
            System.out.println("Error al agregar factura: " + e);
        }
        return 0;
        
      
    }
    //actualizar el total de una venta
    public boolean actualizarTotal(int idVenta, double total) {
        String sql = "update ventas set total=" + total + " where idVenta=" + idVenta;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            System.out.println(sql);
            return true;
        } catch (Exception e) {
            System.out.println("Error al actualizar total: " + e);
        }
        return false;
    }
       
       public double getTotalFactura(int id){
            String sql = "SELECT * FROM ventas where idVenta="+id;
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
           
       
                f.setTotal(rs.getDouble("total"));
                
             
            
            }
        }catch(Exception e){  
            System.out.println("e = " + e);
        }
        return f.getTotal();
       }


}
