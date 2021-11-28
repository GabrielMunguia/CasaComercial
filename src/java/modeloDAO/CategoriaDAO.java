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
        String sql = "select * from categoria";
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
}
