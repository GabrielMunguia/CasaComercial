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
        String sql = "Select * from usuarios where usuario='"+usr+"'and clave='"+password+"';";
        System.out.println(sql);
        try {

            con = cn.getConnection();

            ps = con.prepareStatement(sql);

      

            rs = ps.executeQuery();

            while (rs.next()) {
                usuario.setUsuario(rs.getString("usuario"));
                usuario.setPassword(rs.getString("clave"));
                usuario.setIdCargo(rs.getInt("idRol"));   
                usuario.setIdEmpleado(rs.getInt("idEmpleado"));
            }

            

        } catch (Exception e) {
            System.out.println("error = " + e);
            
        }
        
        return usuario;
    }
    
 

}
