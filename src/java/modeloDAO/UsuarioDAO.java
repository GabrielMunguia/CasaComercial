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

public class UsuarioDAO implements validar {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;

    @Override
    public int validar(Usuario usr) {
        r = 0;
        String sql = "Select * from empleado where usuario=? and password=?";
        try {

            con = cn.getConnection();

            ps = con.prepareStatement(sql);

            ps.setString(1, usr.getUsuario());

            ps.setString(2, usr.getPassword());

            rs = ps.executeQuery();

            while (rs.next()) {
                r = r + 1;
                usr.setUsuario(rs.getString("usuario"));
                usr.setPassword(rs.getString("password"));
                r = rs.getInt("idCargo");
            }

            if (r >= 1) {

                return 1;
            } else {
                return 0;
            }

        } catch (Exception e) {
            System.out.println("error = " + e);
            return 0;
        }
    }
    
 

}
