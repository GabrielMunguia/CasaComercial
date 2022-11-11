/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Categoria;
import modelo.Cliente;
import modelo.Conexion;

/**
 *
 * @author gabriel
 */
public class CategoriaDAO {
     Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
        public List listar(){
        ArrayList<Categoria>list = new ArrayList<>();
        String sql = "select * from categorias where estado=1";
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
               
                Categoria c = new Categoria();
                c.setIdCategoria(rs.getInt("idCategoria"));
                c.setCategoria(rs.getString("categoria"));
                list.add(c);
            }
        }catch(Exception e){  
            System.out.println("Error al listar categorias = " + e);
        }
        return list;
    }

    //Agregar
    public boolean agregar(Categoria c){
        String sql = "insert into categorias(categoria)values(?)";
    
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getCategoria());
            ps.executeUpdate();
         return true;

        }catch(Exception e){
            System.out.println("Error al agregar categoria = " + e);
        }
        return false;
    }

    //eliminar
    public boolean eliminar(int idCategoria){
        String sql = "update categorias set estado = 0 where idCategoria = "+idCategoria;
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
           
            ps.executeUpdate();
            return true;
        }catch(Exception e){
            System.out.println("Error al eliminar categoria = " + e);
        }
        return false;
    
       
    }

    //actualizar

    public boolean actualizar(Categoria c){
        String sql = "update categorias set categoria = ? where idCategoria = ?";
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getCategoria());
            ps.setInt(2, c.getIdCategoria());
            ps.executeUpdate();
            return true;
        }catch(Exception e){
            System.out.println("Error al actualizar categoria = " + e);
        }
        return false;
    }
    
    //obtener por id
    public Categoria listarId(int idCategoria){
        Categoria c = new Categoria();
        String sql = "select * from categorias where idCategoria = "+idCategoria;
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                c.setIdCategoria(rs.getInt("idCategoria"));
                c.setCategoria(rs.getString("categoria"));
            }
        }catch(Exception e){
            System.out.println("Error al listar categoria por id = " + e);
        }
        return c;
    }
    
}
