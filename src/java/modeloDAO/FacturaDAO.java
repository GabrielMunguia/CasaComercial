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

    public double getTotal(int id) {
        ArrayList<Factura> list = new ArrayList<>();
        double total = 0;
        String sql = "select * from detallefactura where idFactura=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                total += (rs.getInt("cantidad") * pdao.obtenerPrecio(rs.getInt("idProducto"))) - rs.getDouble("descuento");
            }
        } catch (SQLException ex) {
            System.out.println("XXXXXXXXXXXX ERROR AL OBTENER EL TOTAL DE LA VENTA XXXXXXXXXXXXXXXX");
            System.out.println("ex = " + ex);
        }

        return total;
    }

    public List listarFacturas() {
        ArrayList<Factura> list = new ArrayList<>();
        String sql = "select * from factura";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Factura fac = new Factura();
                fac.setId(rs.getInt("idFactura"));
                fac.setIdCliente(rs.getInt("idCliente"));
                fac.setIdEmpleado(rs.getInt("idEmpleado"));
                fac.setIdMetodoPago(rs.getInt("idMetodoPago"));
                fac.setFecha(rs.getString("fecha"));
                fac.setTotal(getTotal(rs.getInt("idFactura")));
                list.add(fac);
            }
        } catch (SQLException ex) {
            System.out.println("XXXXXXXXXXXXXXXXXXXXXXXX ERROR AL LISTAR LAS FACTURAS XXXXXXXXXXXXXXXXXXX");

            System.out.println("ex = " + ex);
        }

        return list;
    }
    


}
