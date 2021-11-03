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
                p.setCosto(rs.getDouble("costo"));
                p.setPrecioContado(rs.getDouble("precioContado"));
                p.setPrecioCredito(rs.getDouble("precioCredito"));
                p.setFotografia(rs.getString("fotografia"));
                p.setStock(rs.getInt("stock"));
                p.setIdCategoria(rs.getInt("idCategoria"));
            
               
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println("Errr en listar");
        }
        return list;
    }
}
