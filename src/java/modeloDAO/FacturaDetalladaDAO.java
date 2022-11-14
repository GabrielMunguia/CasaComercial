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
        String sql = "SELECT v.idVenta,c.idCliente,concat(c.nombres,' ',c.apellidos)as nombre_cliente,c.direccion as direccion_cliente,c.telefono as telefono_cliente \n" +
",e.idEmpleado,concat(e.nombres,' ',e.apellidos) as nombre_empleado,total as total_venta,fecha as fecha_venta,\n" +
"mp.metodo as metodo_pago\n" +
" FROM ventas as v join empleados as e on e.idEmpleado=v.idEmpleado join clientes as c on c.idCliente=v.idCliente join metodopago as mp on mp.idMetodoPago=v.idMetodoPago where idVenta=" + idFactura+';';
        System.out.println("sql = " + sql);
        FacturaDetallada f = new FacturaDetallada();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                f.setIdFactura(rs.getInt("idVenta"));
                f.setFecha(rs.getString("fecha_venta"));
                f.setIdEmpleado(rs.getInt("idEmpleado"));
                f.setNombreEmpleado(rs.getString("nombre_empleado"));
                f.setIdCliente(rs.getInt("idCliente"));
                f.setNombreCliente(rs.getString("nombre_cliente"));
                f.setDireccionCliente(rs.getString("direccion_cliente"));
                f.setMetodoPago(rs.getString("metodo_pago"));
                f.setTelCliente(rs.getString("telefono_cliente"));
                f.setTota(rs.getDouble("total_venta"));
              
                

               
            }
        } catch (Exception e) {
            System.out.println("EL ERROR AL TRAER DETALLES GENERALES FACTURA = " + e);
        }

        return f;
    }

}
