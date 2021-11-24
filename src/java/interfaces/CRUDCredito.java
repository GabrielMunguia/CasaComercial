/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import java.util.List;
import modelo.Credito;
/**
 *
 * @author gabriel
 */
public interface CRUDCredito {
    public List listarCreditos();
    public Credito list(int idCredito);
    public int agregarCredito(Credito p);
    public boolean editarCredito(Credito p);
    public boolean eliminarCredito(int id);
}
