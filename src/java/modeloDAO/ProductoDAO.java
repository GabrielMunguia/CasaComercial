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
    Producto pro = new Producto();
    


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
        } catch (SQLException e) {
            System.out.println("XXXXXXXXXXXXX ERROR AL OBTENER EL PRECIO DEL PRODUCTO XXXXXXXXXXXXXXXXXXX");
            System.out.println("e = " + e);
        }
        
        
        return precio;
    }
     public double obtenerPrecioCredito ( int id){
        double precio=0;
         ArrayList<Producto> list = new ArrayList<>();
        String sql = "select * from producto where idProducto="+id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
              precio=rs.getDouble("precioCredito");
            }
        } catch (SQLException e) {
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
        } catch (SQLException e) {
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
        } catch (SQLException e) {
            System.out.println("Errr en listar productos de factura");
            System.out.println("e = " + e);
        }
        return list;
    }
         
          public List listarProducto(){
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
        } catch (SQLException e) {
            System.out.println("Errr en listar");
        }
        return list;
    }
    

    
   
    public Producto listProducto(int id) {
        String sql="select * from producto where idProducto="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){                
                pro.setId(rs.getInt("idProducto"));
                pro.setNombre(rs.getString("producto"));
                pro.setDescripcion(rs.getString("descripcion"));
                pro.setMarca(rs.getString("marca"));
                pro.setCosto(rs.getDouble("costo"));
                pro.setPrecioContado(rs.getDouble("precioContado"));
                pro.setPrecioCredito(rs.getDouble("precioCredito"));
                pro.setFotografia(rs.getString("fotografia"));
                pro.setStock(rs.getInt("stock"));
                pro.setIdCategoria(rs.getInt("idCategoria"));
            }
        } catch (SQLException e) {
            System.out.println("e = " + e);
        }
        return pro;
    }
    
  
    public boolean addProducto(Producto prod) {
       String sql="insert into producto(producto, descripcion, marca, costo, precioContado, precioCredito, fotografia, stock, idCategoria)values('"+prod.getNombre()+"','"+prod.getDescripcion()+"','"+prod.getMarca()+"','"+prod.getCosto()+"','"+prod.getPrecioContado()+"','"+prod.getPrecioCredito()+"','"+prod.getFotografia()+"','"+prod.getStock()+"','"+prod.getIdCategoria()+"')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("e = " + e);
        }
       return false;
    }
    
    
    public boolean editProducto(Producto prod) {
        String sql="update producto set producto='"+prod.getNombre()+"',descripcion='"+prod.getDescripcion()+"',marca='"+prod.getMarca()+"',costo='"+prod.getCosto()+"',precioContado='"+prod.getPrecioContado()+"',precioCredito='"+prod.getPrecioCredito()+"',fotografia='"+prod.getFotografia()+"',stock='"+prod.getStock()+"',idCategoria='"+prod.getIdCategoria()+"'where idProducto="+prod.getId();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("e = " + e);
        }
        return false;
    }

    
    public boolean eliminarProducto(int id) {
        String sql="delete from producto where idProducto="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("e = " + e);
        }
        return false;
    }
    
}
