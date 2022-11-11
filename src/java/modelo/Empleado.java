/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author HP
 */
public class Empleado{
    int idEmp;
    String nom;
    String ape;
    String dui;
    String correo;
    String gen;
    String fechNa;
    String fechContrato;
    String tel;
    String nit;
    String direccion;

    

    public Empleado() {
    }

    public Empleado(String nom, String dui, String correo, String gen, String fechNa, String tel,String ape,String nit,String direccion) {
  
        this.nom = nom;
        this.dui = dui;
        this.correo=correo;
        this.ape=ape;
        this.gen = gen;
        this.fechNa = fechNa;
        this.tel = tel;
        this.direccion=direccion;
        this.nit = nit;
        
      
        
    }
    
    public void setFechaContrato(String fecha){
        this.fechContrato=fecha;
    }
     public String getFechaContrato(){
        return this.fechContrato;
    }
    
    
     public String getDireccion(){
        return this.direccion;
    }
    public void setDireccion(String direccion){
        this.direccion=direccion;
    }
    public String getNIT(){
        return this.nit;
    }
    public void setNIT(String nit){
        this.nit=nit;
    }
    public String getApellidos(){
        return this.ape;
    }
    public void setApellidos(String ape){
        this.ape=ape;
    }
    public int getIdEmp() {
        return idEmp;
    }

    public void setIdEmp(int idEmp) {
        this.idEmp = idEmp;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDui() {
        return dui;
    }

    public void setDui(String dui) {
        this.dui = dui;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getGen() {
        return this.gen;
    }

    public void setGen(String gen) {
        this.gen = gen;
    }

    public String getFechNa() {
        return fechNa;
    }

    public void setFechNa(String fechNa) {
        this.fechNa = fechNa;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }
}
