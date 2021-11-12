
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

public class PagoDAO implements PagoCRUD{
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Pago p=new Pago();
    
    @Override
    public List listarPago() {
        ArrayList<Pago>list=new ArrayList<>();
        String sql="select * from pago";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Pago p=new Pago();
                p.setIdPago(rs.getInt("idPago"));
                p.setIdFactura(rs.getInt("idFactura"));
                p.setMontoPagado(rs.getDouble("montoPagado"));
                p.setFechaHora(rs.getString("fechaHora"));
                list.add(p);
            }
        } catch (Exception e) {
            
        }
        return list;
    }


    @Override
    public Pago list(int id) {
        String sql="select * from pago where idPago="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){                
                p.setIdPago(rs.getInt("idPago"));
                p.setIdFactura(rs.getInt("idFactura"));
                p.setMontoPagado(rs.getDouble("montoPagado"));
                p.setFechaHora(rs.getString("fechaHora"));
            }
        } catch (Exception e) {
        }
        return p;
    }

    @Override
    public boolean agregarPago(Pago p) {
       String sql="insert into pago(idFactura, montoPagado, fechaHora)values('"+p.getIdFactura()+"',"+p.getMontoPagado()+",now())";
        System.out.println("sql = " + sql);
       try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("e = " + e);
        }
       return false;
    }

    @Override
    public boolean editarPago(Pago p) {
        String sql="update pago set idFactura='"+p.getIdFactura()+"',montoPagado='"+p.getMontoPagado()+"',fechaHora='"+p.getFechaHora()+"'where idPago="+p.getIdPago();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminarPago(int id) {
        String sql="delete from pago where idPago="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }    
}
