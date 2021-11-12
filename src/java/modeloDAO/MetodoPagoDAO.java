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
import modelo.Empleado;
import modelo.MetodoPago;

/**
 *
 * @author GabrielMunguia
 */
public class MetodoPagoDAO {
        Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    MetodoPago p = new MetodoPago();
    
        public List listarMetodosPago() {
        ArrayList<MetodoPago>list=new ArrayList<>();
        String sql="select * from metodopago";
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                MetodoPago m = new MetodoPago();
                m.setMetodo(rs.getString("metodo"));
                m.setDescripcion(rs.getString("descripcion"));
                m.setIdMetodoPago(rs.getInt("idMetodoPago"));
    
                list.add(m);
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar el metodo de pago : "+ex);
          
        }
        
        return list;
    }
}
