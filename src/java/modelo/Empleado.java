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
public class Empleado {
    int idEmp;
    String nom;
    String dui;
    String nit;
    String gen;
    String fechNa;
    String tel;
    String dir;
    String usu;
    String pas;
    int idCar;

    public Empleado() {
    }

    public Empleado(String nom, String dui, String nit, String gen, String fechNa, String tel, String dir, String usu, String pas, int idCar) {
        this.nom = nom;
        this.dui = dui;
        this.nit = nit;
        this.gen = gen;
        this.fechNa = fechNa;
        this.tel = tel;
        this.dir = dir;
        this.usu = usu;
        this.pas = pas;
        this.idCar = idCar;
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

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
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

    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    public String getUsu() {
        return usu;
    }

    public void setUsu(String usu) {
        this.usu = usu;
    }

    public String getPas() {
        return pas;
    }

    public void setPas(String pas) {
        this.pas = pas;
    }

    public int getIdCar() {
        return idCar;
    }

    public void setIdCar(int idCar) {
        this.idCar = idCar;
    }

    
    
    
    
}
