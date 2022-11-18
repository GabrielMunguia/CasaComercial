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
  
 

 

}
