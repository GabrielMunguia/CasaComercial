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
                usuario.setID(rs.getInt("idUsuario"));   
            }

            

        } catch (Exception e) {
            System.out.println("error! = " + e);
            
        }
        
        return usuario;
    }

  
    public  Boolean agregar(Usuario u) {
        String sql = "insert into usuarios(usuario,clave,idRol,idEmpleado)values(?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getUsuario());
            ps.setString(2, u.getPassword());
            ps.setInt(3, u.getIdCargo());
            ps.setInt(4, u.getIdEmpleado());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("error = " + e);
        }
        return false;
      
    }

    //set estado
    public boolean actualizarEstado(int idUsuario, boolean estado) {
        String sql = "update usuarios set estado="+estado+" where idUsuario=" + idUsuario + ";";
        System.out.println(sql);
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("error = " + e);
        }
        return false;
    }

       public List listarUsuarios(){
  
        ArrayList<Usuario> lista = new ArrayList<>();
        String sql = "SELECT usr.idUsuario,usr.usuario,roles.idRol,roles.rol,concat(e.nombres,' ',e.apellidos) as empleado,e.DUI ,e.idEmpleado,usr.estado FROM usuarios as usr join roles on roles.idRol=usr.idRol join empleados as e on e.idEmpleado=usr.idEmpleado;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Usuario u = new Usuario();
                u.setID(rs.getInt("idUsuario"));
                u.setUsuario(rs.getString("usuario"));
                u.setPassword("");
                u.setIdCargo(rs.getInt("idRol"));
                u.setIdEmpleado(rs.getInt("idEmpleado"));
                u.setEstado(rs.getBoolean("estado"));
                u.setNombre_empleado(rs.getString("empleado"));
                u.setDui_empelado(rs.getString("DUI"));
                u.setRol(rs.getString("rol"));
                lista.add(u);
            }
        } catch (Exception e) {
            System.out.println("error = " + e);
        }
        return lista;
    }


    public boolean validarUsuarioUnico(String usuario) {
        String sql = "select * from usuarios where usuario='" + usuario + "';";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                return false;
            }
        } catch (Exception e) {
            System.out.println("error = " + e);
        }
        return true;
    }
    
 

}
