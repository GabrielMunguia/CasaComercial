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
import modelo.Conexion;
import modelo.Usuario;
import modelo.validar;

public class UsuarioDAO {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;

   
    public Usuario validar(String usr,String password) {
       Usuario usuario= new Usuario();
        String sql = "Select * from empleado where usuario=? and password=?";
        try {

            con = cn.getConnection();

            ps = con.prepareStatement(sql);

            ps.setString(1, usr);

            ps.setString(2, password);
            

            rs = ps.executeQuery();

            while (rs.next()) {
                usuario.setUsuario(rs.getString("usuario"));
                usuario.setPassword(rs.getString("password"));
                usuario.setIdCargo(rs.getInt("idCargo"));        
            }

            

        } catch (Exception e) {
            System.out.println("error = " + e);
            
        }
        
        return usuario;
    }
    
 

}
