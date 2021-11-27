/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import interfaces.CRUDCredito;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.Cliente;
import modelo.Conexion;
import modelo.Credito;

/**
 *
 * @author gabriel
 */
public class CreditoDAO implements CRUDCredito {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Credito c = new Credito();

    @Override
    public List listarCreditos() {
        ArrayList<Credito> list = new ArrayList<>();
        String sql = "select * from Credito";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                Credito c = new Credito();
                c.setIdCredito(rs.getInt("idCredito"));
                c.setIdCLiente(rs.getInt("idCliente"));
                c.setIdEMpleado(rs.getInt("idEmpleado"));
                c.setFecha(rs.getString("fecha"));
                c.setMontoCredito(rs.getDouble("montoCredito"));
                

                list.add(c);
            }
        } catch (Exception e) {
            System.out.println("Erro al listar credito  = " + e);
        }
        return list;
    }

    @Override
    public Credito list(int id) {
         Credito c = new Credito();
          String sql = "select * from Credito where idCredito="+id;
        try{
            
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
              
                c.setIdCredito(rs.getInt("idCredito"));
                c.setIdCLiente(rs.getInt("idCliente"));
                c.setIdEMpleado(rs.getInt("idEmpleado"));
                c.setFecha(rs.getString("fecha"));
                c.setMontoCredito(rs.getDouble("montoCredito"));
            
            }
            
        }catch(Exception e){     
            System.out.println("e = " + e);
        }
        
        return c;
    }

    @Override
    public int agregarCredito(Credito p) {
        String sql="INSERT INTO `Credito` (`idCredito`, `idCliente`, `idEmpleado`, `fecha`, `montoCredito`)"
                + "VALUES (NULL, '"+p.getIdCLiente()+"', '"+p.getIdEMpleado()+"', now() , '"+p.getMontoCredito()+"');";
        System.out.println("sql = " + sql);
   try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            ps.executeUpdate();
            rs=ps.getGeneratedKeys();
            if(rs.next()){
                String id = rs.getString(1);
                return Integer.parseInt(id);
              
            }
        }catch(Exception e){
            System.out.println(" ERROR AL INSETAR CREDITO = " +  e);
            System.out.println("e = " + e);
        }
        return 0;
    }

    @Override
    public boolean editarCredito(Credito p) {
        String sql="UPDATE `Credito` SET `idCliente` = '"+p.getIdCLiente()+"', `idEmpleado` = '"+p.getIdEMpleado()+"', `fecha` = '"+p.getFecha()+"', "
                + "`montoCredito` = '"+p.getMontoCredito()+"' WHERE `Credito`.`idCredito` ="+p.getIdCredito();
         try{
            con = cn.getConnection();
            ps =con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        }catch(Exception e){
             System.out.println("Error al editar credito :"+e);
        }
        return false;
    }

    @Override
    public boolean eliminarCredito(int id) {
        String sql="DELETE FROM `Credito` WHERE `Credito`.`idCredito` = "+id;
      try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        }catch(Exception e){
            System.out.println("Error al eliminar credito :"+e);
        }
        return false;
    }
}
