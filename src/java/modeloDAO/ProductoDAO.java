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
        String sql = "select * from productos join categorias on categorias.idCategoria=productos.idCategoria join proveedores on proveedores.idProveedor=productos.idProveedor where productos.estado=1";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setIdProducto(rs.getInt("idProducto"));
                p.setProducto(rs.getString("producto"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setIdCategoria(rs.getInt("idCategoria"));
                p.setMarca(rs.getString("marca"));
                p.setCosto(rs.getDouble("costo"));    
                p.setPrecioVenta(rs.getDouble("precioVenta"));
                p.setStock(rs.getInt("stock"));
                p.setIdProveedor(rs.getInt("idProveedor"));
                p.setCategoria(rs.getString("categoria"));
                p.setProveedor(rs.getString("nombre"));
               
               
               
               
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
        String sql = "select * from productos where idProducto="+id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
              precio=rs.getDouble("precioVenta");
            }
        } catch (SQLException e) {
            System.out.println("XXXXXXXXXXXXX ERROR AL OBTENER EL PRECIO DEL PRODUCTO XXXXXXXXXXXXXXXXXXX");
            System.out.println("e = " + e);
        }
        
        
        return precio;
    }
    
        public List listarProdVenta(int id) {

        ArrayList<Producto> list = new ArrayList<>();
        String sql = "select * from productos as p,detalles_ventas as df where p.idProducto=df.idProducto and df.idVenta="+id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setIdProducto(rs.getInt("idProducto"));
                p.setProducto(rs.getString("producto"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setIdCategoria(rs.getInt("idCategoria"));
                p.setMarca(rs.getString("marca"));
                p.setCosto(rs.getDouble("costo"));
                p.setPrecioVenta(rs.getDouble("precioUnitario"));
                p.setStock(rs.getInt("stock"));
                p.setIdProveedor(rs.getInt("idProveedor"));
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
        String sql = "select * from productos where estado=1";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setIdProducto(rs.getInt("idProducto"));
                p.setProducto(rs.getString("producto"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setIdCategoria(rs.getInt("idCategoria"));
                p.setMarca(rs.getString("marca"));
                p.setCosto(rs.getDouble("costo"));  
                p.setPrecioVenta(rs.getDouble("precioVenta"));
                p.setStock(rs.getInt("stock"));
                p.setIdProveedor(rs.getInt("idProveedor"));
                
               
               
               
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println("Errr en listar");
        }
        return list;
    }
    

    
   
    public Producto listProducto(int id) {
        String sql="select * from productos where estado=1 and  idProducto="+id;
        System.out.println(sql);
        Producto pro = new Producto();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){                
                pro.setIdProducto(rs.getInt("idProducto"));
             
                pro.setDescripcion(rs.getString("descripcion"));
                pro.setIdCategoria(rs.getInt("idCategoria"));
                pro.setMarca(rs.getString("marca"));
                pro.setCosto(rs.getDouble("costo"));  
                pro.setPrecioVenta(rs.getDouble("precioVenta"));
                pro.setStock(rs.getInt("stock"));
                pro.setIdProveedor(rs.getInt("idProveedor"));
                pro.setProducto(rs.getString("producto"));
            }
        } catch (SQLException e) {
            System.out.println("e = " + e);
        }
        return pro;
    }
    
  
    public boolean addProducto(Producto prod) {
       String sql="insert into productos(producto,descripcion,idCategoria,marca,costo,precioVenta,stock,idProveedor)values('"+prod.getProducto()+"','"+prod.getDescripcion()+"','"+prod.getIdCategoria()+"','"+prod.getMarca()+"','"+prod.getCosto()+"','"+prod.getPrecioVenta()+"','"+prod.getStock()+"','"+prod.getIdProveedor()+"')";
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
        String sql="update productos set producto='"+prod.getProducto()+"',descripcion='"+prod.getDescripcion()+"',idCategoria='"+prod.getIdCategoria()+"',marca='"+prod.getMarca()+"',costo='"+prod.getCosto()+"',precioVenta='"+prod.getPrecioVenta()+"',stock='"+prod.getStock()+"',idProveedor='"+prod.getIdProveedor()+"' where idProducto="+prod.getIdProducto();
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
        String sql="update productos set estado=false where idProducto="+id;
        System.out.println(sql);
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

  
    public boolean descontarStock(int idProducto, int cantidad) {
        String sql="update productos set stock=stock-"+cantidad+" where idProducto="+idProducto;
        System.out.println(sql);
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
