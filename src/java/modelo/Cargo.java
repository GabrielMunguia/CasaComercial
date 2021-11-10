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
public class Cargo {
    int idCa;
    String cargo;
    String descri;

    public Cargo() {
    }

    public Cargo(int idCa, String cargo, String descri) {
        this.idCa = idCa;
        this.cargo = cargo;
        this.descri = descri;
    }

    public int getIdCa() {
        return idCa;
    }

    public void setIdCa(int idCa) {
        this.idCa = idCa;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getDescri() {
        return descri;
    }

    public void setDescri(String descri) {
        this.descri = descri;
    }
    
    
}
