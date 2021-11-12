package modeloDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import modelo.Conexion;
import modelo.DetalleFactura;

public class DetalleFacturaDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DetalleFactura f = new DetalleFactura();
    
    
           public boolean addDetalleFactura(DetalleFactura f) {
        
        String sql = "insert into detallefactura(idProducto, cantidad, descuento, idFactura)values('"+f.getIdProducto()+"','"+f.getCantidad()+"','"+f.getDescuento()+"', '"+f.getIdFactura()+"')";
        
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            System.out.println(" ERROR AL INSETAR DETALLE FACTURA = " +  e);
        }
        return false;
    }
  
}
