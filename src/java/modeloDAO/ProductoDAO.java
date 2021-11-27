/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Conexion;
import modelo.Producto;

/**
 *
 * @author GabrielMunguia
 */
public class ProductoDAO {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;
    


    public List listar() {

        ArrayList<Producto> list = new ArrayList<>();
        String sql = "select * from producto";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt("idProducto"));
                p.setNombre(rs.getString("producto"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setMarca(rs.getString("marca"));
                p.setFotografia(rs.getString("fotografia"));
                p.setStock(rs.getInt("stock"));
                p.setIdCategoria(rs.getInt("idCategoria"));
                p.setCosto(rs.getDouble("costo"));
                p.setPrecioContado(rs.getDouble("precioContado"));
                p.setPrecioCredito(rs.getDouble("precioCredito"));
               
               
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println("Errr en listar");
        }
        return list;
    }
    
    public double obtenerPrecio ( int id){
        double precio=0;
         ArrayList<Producto> list = new ArrayList<>();
        String sql = "select * from producto where idProducto="+id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
              precio=rs.getDouble("precioContado");
            }
        } catch (Exception e) {
            System.out.println("XXXXXXXXXXXXX ERROR AL OBTENER EL PRECIO DEL PRODUCTO XXXXXXXXXXXXXXXXXXX");
            System.out.println("e = " + e);
        }
        
        
        return precio;
    }
    
        public List listarProdVenta(int id) {

        ArrayList<Producto> list = new ArrayList<>();
        String sql = "select * from producto as p,detallefactura as df where p.idProducto=df.idProducto and df.idFactura="+id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt("idProducto"));
                p.setNombre(rs.getString("producto"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setMarca(rs.getString("marca"));
                p.setFotografia(rs.getString("fotografia"));
                p.setStock(rs.getInt("stock"));
                p.setIdCategoria(rs.getInt("idCategoria"));
                p.setCosto(rs.getDouble("costo"));
                p.setPrecioContado(rs.getDouble("precioContado"));
                p.setPrecioCredito(rs.getDouble("precioCredito"));
                p.setCantidad(rs.getInt("cantidad"));
            
               
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println("Errr en listar productos de factura");
            System.out.println("e = " + e);
        }
        return list;
    }
        
         public List listarProdCredito(int id) {

        ArrayList<Producto> list = new ArrayList<>();
        String sql = "select * from producto as p,DetalleCredito as df where p.idProducto=df.idProducto and df.idCredito="+id;
             System.out.println("sql = " + sql);
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt("idProducto"));
                p.setNombre(rs.getString("producto"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setMarca(rs.getString("marca"));
                p.setFotografia(rs.getString("fotografia"));
                p.setStock(rs.getInt("stock"));
                p.setIdCategoria(rs.getInt("idCategoria"));
                p.setCosto(rs.getDouble("costo"));
                p.setPrecioContado(rs.getDouble("precioContado"));
                p.setPrecioCredito(rs.getDouble("precio"));
                p.setCantidad(rs.getInt("cantidad"));
            
               
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println("Errr en listar productos de factura");
            System.out.println("e = " + e);
        }
        return list;
    }
    
}
