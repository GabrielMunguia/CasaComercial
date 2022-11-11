package modeloDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import modelo.Conexion;
import modelo.DetalleVenta;

public class DetalleVentaDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DetalleVenta f = new DetalleVenta();
    
    
           public boolean addDetalleFactura(DetalleVenta f) {
        String sql = "insert into detalles_ventas (idVenta, idProducto, cantidad, precioUnitario,descuento) values (?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, f.getIdVenta());
            ps.setInt(2, f.getIdProducto());
            ps.setInt(3, f.getCantidad());
            ps.setDouble(4, f.getPrecioUnitario());
            ps.setDouble(5, f.getDescuento());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;

        
     
    }

    
    
              public boolean eliminar(int id){
         String sql="delete from detallefactura where idFactura="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al eliminar  detalle factura:"+e);
        }
        return false;
    }
           
           
  
}
