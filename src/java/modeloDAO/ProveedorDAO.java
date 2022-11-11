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
import modelo.Proveedor;

/**
 *
 * @author GabrielMunguia
 */
public class ProveedorDAO {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;
    Proveedor p = new Proveedor();

    public List listar() {

        ArrayList<Proveedor> list = new ArrayList<>();
        String sql = "select * from proveedores where estado=1";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Proveedor p = new Proveedor();
                p.setIdProveedor(rs.getInt("idProveedor"));
                p.setNombre(rs.getString("nombre"));
                p.setTelefono(rs.getString("telefono"));
                p.setCorreo(rs.getString("correo"));
                p.setDireccion(rs.getString("direccion"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println("Errr en listar");
        }
        return list;
    }

    public boolean agregar(Proveedor p) {
        String sql = "insert into proveedores(nombre,telefono,correo,direccion)values(?,?,?,?)";
        
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getNombre());
            ps.setString(2, p.getTelefono());
            ps.setString(3, p.getCorreo());
            ps.setString(4, p.getDireccion());
          
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error en agregar");
            System.out.println(e);
        }
        return false;
    }

    public boolean actualizar(Proveedor p) {
        String sql = "update proveedores set nombre=?,telefono=?,correo=?,direccion=? where idProveedor=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getNombre());
            ps.setString(2, p.getTelefono());
            ps.setString(3, p.getCorreo());
            ps.setString(4, p.getDireccion());
            ps.setInt(5, p.getIdProveedor());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error en actualizar");
        }
        return false;
    }

    public boolean eliminar(int id) {
        String sql = "update proveedores set estado=0 where idProveedor=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error en eliminar");
            return false;
        }
    }

    public Proveedor listarId(int id) {
        String sql = "select * from proveedores where idProveedor=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setIdProveedor(rs.getInt("idProveedor"));
                p.setNombre(rs.getString("nombre"));
                p.setTelefono(rs.getString("telefono"));
                p.setCorreo(rs.getString("correo"));
                p.setDireccion(rs.getString("direccion"));
            }
        } catch (Exception e) {
            System.out.println("Error en listarId");
        }
        return p;
    }

    

    

}
