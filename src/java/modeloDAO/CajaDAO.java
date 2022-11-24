/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

/**
 *
 * @author GabrielMunguia
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Conexion;
import modelo.Caja;


public class CajaDAO {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;


    //insertar   int idCaja, idUsuarioEmp, idEmpleadoReceptor;String fechaApertura, fechaCierre; double montoCierre, ventasTotales, montoApertura;
    public boolean insertar(Caja c) {
        String sql = "insert into caja(idUsuarioEmp,idEmpleadoReceptor,fechaApertura,fechaCierre,montoCierre,ventasTotales,montoApertura)values(?,?,?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
        
            ps.setInt(1, c.getIdUsuarioEmp());
            ps.setInt(2, c.getIdEmpleadoReceptor());
            ps.setString(3, c.getFechaApertura());
            ps.setString(4, c.getFechaCierre());
            ps.setDouble(5, c.getMontoCierre());
            ps.setDouble(6, c.getVentasTotales());
            ps.setDouble(7, c.getMontoApertura());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("error = " + e);
            return false;
        }
      
    }


    public boolean abrirCaja(Caja c) {
        String sql = "insert into caja(idUsuarioEmp,fechaApertura,montoApertura,montoCierre)values("+c.getIdUsuarioEmp()+",'"+c.getFechaApertura()+"',"+c.getMontoApertura()+","+c.getMontoApertura()+")";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
          
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("error = " + e);
            System.out.println(sql);
            return false;
        }
    }


    public boolean validarCajaAbierta(int idUsuarioEmp) {
        String sql = "select * from caja where idUsuarioEmp=" + idUsuarioEmp + " and fechaCierre is null";
        System.out.println(sql);
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
            return false;
        } catch (Exception e) {
            System.out.println("error = " + e);
            return false;
        }
    }


    public boolean aumentarVentas(double  valorVenta, int idUsuarioEmp) {
        String sql = "update caja set ventasTotales=ventasTotales+"+ 1+",montoCierre=montoCierre+"
        + valorVenta+" where idUsuarioEmp=" + idUsuarioEmp + " and fechaCierre is null";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("error = " + e);
            System.out.println(sql);
            return false;
        }
    }

    //obtener ultima caja abierta del usuario
    public Caja obtenerUltimaCaja(int idUsuarioEmp) {
        String sql = "select * from caja where idUsuarioEmp=" + idUsuarioEmp + " and fechaCierre is null";
        Caja c = new Caja();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                c.setIdCaja(rs.getInt("idCaja"));
                c.setIdUsuarioEmp(rs.getInt("idUsuarioEmp"));
                c.setFechaApertura(rs.getString("fechaApertura"));
                c.setMontoCierre(rs.getDouble("montoCierre"));
                c.setVentasTotales(rs.getDouble("ventasTotales"));
                c.setMontoApertura(rs.getDouble("montoApertura"));
            }
            return c;
        } catch (Exception e) {
            System.out.println("error = " + e);
            return null;
        }
    }

    //restar valor al montoCierra y restar a ventasTotales y restar a total de ventas
    public boolean restarMontoCierre(double valorVenta, int idUsuarioEmp) {
        String sql = "update caja set montoCierre=montoCierre-"+valorVenta+",ventasTotales=ventasTotales-1 where idUsuarioEmp=" + idUsuarioEmp + " and fechaCierre is null";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("error = " + e);
            System.out.println(sql);
            return false;
        }
    }


    public boolean cerrarCaja(int idUsuarioEmp, String fechaCierre,int idEmpleadoReceptor) {
        String sql = "update caja set fechaCierre='"+fechaCierre+"',idEmpleadoReceptor="+idEmpleadoReceptor+" where idUsuarioEmp=" + idUsuarioEmp + " and fechaCierre is null";
        System.out.println(sql);
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("error = " + e);
            System.out.println(sql);
            return false;
        }
    }
    

    public List listar() {
        String sql = "SELECT c.idCaja,c.ventasTotales,concat(e.nombres,' ',e.apellidos)empleado , concat(emp2.nombres,' ',emp2.apellidos)receptor ,c.montoApertura,c.montoCierre,c.fechaApertura,c.fechaCierre  FROM caja as c join usuarios as u on u.idUsuario=c.idUsuarioEmp join empleados as e on e.idEmpleado = u.idEmpleado left join empleados as emp2 on emp2.idEmpleado = idEmpleadoReceptor";
        List<Caja> lista = new ArrayList<>();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Caja c = new Caja();
                c.setIdCaja(rs.getInt("idCaja"));
                c.setVentasTotales(rs.getDouble("ventasTotales"));
                c.setNombreEmpleado(rs.getString("empleado"));
                c.setMontoApertura(rs.getDouble("montoApertura"));
                c.setNombreReceptor(rs.getString("receptor"));
                c.setMontoCierre(rs.getDouble("montoCierre"));
                c.setFechaApertura(rs.getString("fechaApertura"));
                c.setFechaCierre(rs.getString("fechaCierre"));
                lista.add(c);
            }
        } catch (Exception e) {
            System.out.println("error = " + e);
        }
        return lista;
    }
    

  

    

  
 

 

}
