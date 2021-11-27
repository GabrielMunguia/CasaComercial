package modeloDAO;

import modelo.Conexion;
import interfaces.PagoCRUD;
import modelo.Pago;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import static java.time.Instant.now;
import java.util.ArrayList;
import java.util.List;
import modelo.Conexion;
import modelo.Pago;

public class PagoDAO implements PagoCRUD {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Pago p = new Pago();

    @Override
    public List listarPago() {
        ArrayList<Pago> list = new ArrayList<>();
        String sql = "select * from Abonos";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Pago p = new Pago();
                p.setIdPago(rs.getInt("idAbono"));
                p.setIdFactura(rs.getInt("idCredito"));
                p.setMontoPagado(rs.getDouble("monto"));
                p.setFechaHora(rs.getString("fecha"));
                p.setIdmetodoPago(rs.getInt("idMetodoPago"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println("e = " + e);

        }
        return list;
    }
      public List listarPagosCredito(int id) {
        ArrayList<Pago> list = new ArrayList<>();
        String sql = "select * from Abonos where idCredito="+id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Pago p = new Pago();
                p.setIdPago(rs.getInt("idAbono"));
                p.setIdFactura(rs.getInt("idCredito"));
                p.setMontoPagado(rs.getDouble("monto"));
                p.setFechaHora(rs.getString("fecha"));
                p.setIdmetodoPago(rs.getInt("idMetodoPago"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println("e = " + e);

        }
        return list;
    }

    @Override
    public Pago list(int id) {
        String sql = "select * from Abonos where idAbono=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setIdPago(rs.getInt("idAbono"));
                p.setIdPago(rs.getInt("idAbono"));
                p.setIdFactura(rs.getInt("idCredito"));
                p.setMontoPagado(rs.getDouble("monto"));
                p.setFechaHora(rs.getString("fecha"));
                p.setMontoPagado(rs.getInt("idMetodoPAgo"));
            }
        } catch (Exception e) {
            System.out.println("e = " + e);
        }
        return p;
    }
    
    

    @Override
    public boolean agregarPago(Pago p) {
      String sql="INSERT INTO `Abonos` (`idAbono`, `idCredito`, `fecha`, `idMetodoPago`, `monto`) VALUES (NULL, '"+p.getIdFactura()+"', now(), '"+p.getIdmetodoPago()+"', '"+p.getMontoPagado()+"');";
        System.out.println("sql = " + sql);
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("e = " + e);
        }
        return false;
    }

    @Override
    public boolean editarPago(Pago p) {
        String sql = "UPDATE `Abonos` SET `idCredito` = '"+p.getIdFactura()+"', `fecha` = now(), `idMetodoPago` = '"+p.getIdmetodoPago()+"', `monto` = '"+p.getMontoPagado()+"' WHERE `Abonos`.`idAbono` = "+p.getIdPago();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("e = " + e);
        }
        return false;
    }

    @Override
    public boolean eliminarPago(int id) {
        String sql = "DELETE FROM `Abonos` WHERE `Abonos`.`idAbono` = "+id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("e = " + e);
        }
        return false;
    }
    
     public boolean eliminarTodosLosPagosCredito(int id) {
        String sql = "DELETE FROM `Abonos` WHERE `Abonos`.`idCredito` = "+id;
        
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("e = " + e);
        }
        return false;
    }
    
    public double  getTotalPagos(int id ){
          String sql = "SELECT SUM(a.monto)total FROM Abonos as a WHERE a.idCredito="+id;
          System.out.println("sql = " + sql);
           double total=0;
          try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
           
            while (rs.next()) {
                total=rs.getDouble("total");
                System.out.println("total = " + total);
                
            }
        } catch (Exception e) {
              System.out.println("Error al obtener el total pagos = " + e);
        }
        return total;
    }
}
