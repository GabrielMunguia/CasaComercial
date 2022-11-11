/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import modelo.Conexion;
import modelo.DetalleCredito;
import modelo.DetalleVenta;

/**
 *
 * @author gabriel
 */
public class DetalleCreditoDAO {
     Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DetalleCredito f = new DetalleCredito();
    
     public boolean addDetalleCredito(DetalleCredito f) {
        
        String sql = "INSERT INTO `DetalleCredito` (`idDetalleCredito`, `idCredito`, `idProducto`, `cantidad`, `precio`, `descuento`) "
                    + "VALUES (NULL, '"+f.getIdCredito()+"', '"+f.getIdPRoducto()+"', '"+f.getCantidad()+"', '"+f.getPrecio()+"', '"+f.getDescuento()+"');";
        
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            System.out.println(" ERROR AL INSETAR DETALLE CREDITO = " +  e);
        }
        return false;
    }
     
     public boolean eliminar(int id){
         String sql="delete from DetalleCredito where idCredito="+id;
         System.out.println("sql detalle credito = " + sql);
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al eliminar  detalle credito:"+e);
        }
        return false;
    }
}
