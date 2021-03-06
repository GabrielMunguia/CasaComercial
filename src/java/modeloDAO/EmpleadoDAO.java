package modeloDAO;

import modelo.Cargo;
import interfaces.CRUDempleado;
import modelo.Empleado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Conexion;

public class EmpleadoDAO implements CRUDempleado {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Empleado e = new Empleado();

    @Override
    public List listarEmpleado() {
        ArrayList<Empleado> list = new ArrayList<>();
        String sql = "select * from empleado";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Empleado em = new Empleado();
                em.setIdEmp(rs.getInt("idEmpleado"));
                em.setNom(rs.getString("nombre"));
                em.setDui(rs.getString("DUI"));
                em.setNit(rs.getString("NIT"));
                em.setGen(rs.getString("genero"));
                em.setFechNa(rs.getString("fechaNacimiento"));
                em.setTel(rs.getString("telefono"));
                em.setDir(rs.getString("direccion"));
                em.setUsu(rs.getString("usuario"));
                em.setPas(rs.getString("password"));
                em.setIdCa(rs.getInt("idCargo"));
                list.add(em);
            }
        } catch (SQLException ex) {

        }

        return list;
    }

    @Override
    public List listaRepEmpleado() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Empleado list(int idEmp) {
        ArrayList<Empleado> list = new ArrayList<>();
        String sql = "select * from empleado where idEmpleado=" + idEmp;
        Empleado em = new Empleado();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                em.setIdEmp(rs.getInt("idEmpleado"));
                em.setNom(rs.getString("nombre"));
                em.setDui(rs.getString("DUI"));
                em.setNit(rs.getString("NIT"));
                em.setGen(rs.getString("genero"));
                em.setFechNa(rs.getString("fechaNacimiento"));
                em.setTel(rs.getString("telefono"));
                em.setDir(rs.getString("direccion"));
                em.setUsu(rs.getString("usuario"));
                em.setPas(rs.getString("password"));
                em.setIdCa(rs.getInt("idCargo"));
            }
        } catch (Exception e) {
            System.out.println("EL ERROR = " + e);
        }

        return em;
    }

    @Override
    public boolean addEmpleado(Empleado emp) {

        String sql = "insert into empleado(nombre, DUI, NIT, genero, fechaNacimiento, telefono, direccion, usuario, password, idCargo)values('" + emp.getNom() + "','" + emp.getDui() + "', '" + emp.getNit() + "','" + emp.getGen() + "','" + emp.getFechNa() + "','" + emp.getTel() + "','" + emp.getDir() + "','" + emp.getUsu() + "','" + emp.getPas() + "','" + emp.getIdCa() + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(" e = " + e);
        }
        return false;
    }

    @Override
    public boolean editEmpleado(Empleado em) {
        String sql = "update empleado set nombre='" + em.getNom() + "', DUI='" + em.getDui() + "', NIT='" + em.getNit() + "', genero='" + em.getGen() + "', fechaNacimiento='" + em.getFechNa() + "', telefono='" + em.getTel() + "', direccion='" + em.getDir() + "', usuario='" + em.getUsu() + "', password='" + em.getPas() + "', idCargo='" + em.getIdCa() + "'where idEmpleado=" + em.getIdEmp();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Erro al actualizar el empleado ************************************************************************");
        }
        return false;
    }

    @Override
    public boolean eliminarEmpleado(int idEmp) {
        String sql = "delete from empleado where idEmpleado=" + idEmp;
        try {
           
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error = " + e);
        }
        return false;

    }

    public List listarCargo() {
        ArrayList<Cargo> list = new ArrayList<>();
        String sql = "select * from cargo";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Cargo ca = new Cargo();
                ca.setIdCa(rs.getInt("idCargo"));
                ca.setCargo(rs.getString("cargo"));
                ca.setDescri(rs.getString("descripcion"));

                list.add(ca);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmpleadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
    
     public String getCargo(int id) {
      
        String sql = "select * from cargo where idCargo="+id;
        Cargo ca = new Cargo();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                
                ca.setIdCa(rs.getInt("idCargo"));
                ca.setCargo(rs.getString("cargo"));
                ca.setDescri(rs.getString("descripcion"));

            }
        } catch (SQLException ex) {
            System.out.println("ex = " + ex);
        }

        return ca.getCargo();
    }

}
