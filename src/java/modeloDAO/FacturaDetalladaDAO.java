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
import modelo.Conexion;
import modelo.FacturaDetallada;

/**
 *
 * @author GabrielMunguia
 */
public class FacturaDetalladaDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    FacturaDetallada f = new FacturaDetallada();

    public FacturaDetallada list(int idFactura) {
        ArrayList<FacturaDetallada> list = new ArrayList<>();
        String sql = "select f.idFactura,f.fecha,f.idEmpleado,e.nombre as nombreEmpleado,c.idCliente,c.nombre as nombreCliente ,c.direccion,mp.metodo, f.total,c.telefono from factura as f, cliente as c , empleado as e , metodopago as mp where f.idCliente=c.idCliente and e.idEmpleado=f.idEmpleado and mp.idMetodoPago=f.idMetodoPago and idFactura=" + idFactura;
        System.out.println("sql = " + sql);
        FacturaDetallada f = new FacturaDetallada();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                f.setIdFactura(rs.getInt("idFactura"));
                f.setFecha(rs.getString("fecha"));
                f.setIdEmpleado(rs.getInt("idEmpleado"));
                f.setNombreEmpleado(rs.getString("nombreEmpleado"));
                f.setIdCliente(rs.getInt("idCliente"));
                f.setNombreCliente(rs.getString("nombreCliente"));
                f.setDireccionCliente(rs.getString("direccion"));
                f.setMetodoPago(rs.getString("metodo"));
                f.setTelCliente(rs.getString("telefono"));
                

               
            }
        } catch (Exception e) {
            System.out.println("EL ERROR AL TRAER DETALLES GENERALES FACTURA = " + e);
        }

        return f;
    }

}
