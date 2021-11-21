/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import java.util.List;
import modelo.Empleado;


public  interface CRUDempleado {
     public List listarEmpleado();
    public List listaRepEmpleado();
    public Empleado list(int idEmp);
    public boolean addEmpleado(Empleado em);
    public boolean editEmpleado(Empleado em);
    public boolean eliminarEmpleado(int idEmp);
}
