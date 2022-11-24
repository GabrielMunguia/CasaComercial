/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Caja;
import modelo.Empleado;
import modelo.Usuario;
import modeloDAO.CajaDAO;
import modeloDAO.EmpleadoDAO;
import modeloDAO.UsuarioDAO;

/**
 *
 * @author Gabriel
 */
public class ControladorCaja extends HttpServlet {

    String listar = "./vistas/listarCortesCaja.jsp";
    String add = "./vistas/addCaja.jsp";
    String cerrar="./vistas/cerrarCaja.jsp";

    Caja caja = new Caja();
    String login = "./index.jsp";
    CajaDAO dao = new CajaDAO();
    int id;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorEmpleados</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorEmpleados at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";

        String action = request.getParameter("accion");
        HttpSession session = request.getSession();
        Usuario usr = (Usuario) session.getAttribute("login");
        if (usr == null) {

            acceso = login;

        } else {
            if (action.equalsIgnoreCase("listar")) {
                System.out.println(action);
                acceso = listar;
            } else if (action.equalsIgnoreCase("caja")) {
                Boolean tieneCajaAbierta= dao.validarCajaAbierta(usr.getID());
                if(tieneCajaAbierta){
                 acceso = cerrar;
                }else{
                       acceso = add;
                }

             
            } else if (action.equalsIgnoreCase("abrirCaja")) {
                  try {
                         Boolean tieneCajaAbierta= dao.validarCajaAbierta(usr.getID());
                         if(!tieneCajaAbierta){
                          Double montoCaja = Double.parseDouble(request.getParameter("monto"));
                      String fechaApertura= request.getParameter("fechaApertura");
                      Caja c  = new Caja();
                      c.setFechaApertura(fechaApertura);
                      c.setIdUsuarioEmp(usr.getID());
                      c.setMontoApertura(montoCaja);
                      System.out.println("datos: "+usr.getID());
                      Boolean exito= dao.abrirCaja(c);
                      if(exito){
                            request.setAttribute("exito", "true");
                                acceso = cerrar;
                      }else{
                            request.setAttribute("exito", "false");
                              acceso = add;
                      }
                         }
                     
                      
                  
                } catch (Exception e) {
                      request.setAttribute("exito", "false");
                          acceso = add;
                }
                   

            
            } else if (action.equalsIgnoreCase("cerrarCaja")) {
                  try {
                         Boolean tieneCajaAbierta= dao.validarCajaAbierta(usr.getID());
                       
                         if(tieneCajaAbierta){
                          int  idEmpleado = Integer.parseInt(request.getParameter("idEmpleadoReceptor"));
                           String fechaCierre= request.getParameter("fechaCierre");
                           Boolean exito= dao.cerrarCaja(usr.getID(), fechaCierre, idEmpleado);
                            if(exito){
                            request.setAttribute("exito", "true");
                                 acceso = add;
                      }else{
                            request.setAttribute("exito", "false");
                               acceso = cerrar;
                      }
                   
                         }
                     
                      
                  
                } catch (Exception e) {
                      System.out.println(e);
                      request.setAttribute("exito", "false");
                         acceso = cerrar;
                }
                   

           
            } 

        }

       //ir a la vista pero quitar cualquier parametro que se haya enviado
       RequestDispatcher vista = request.getRequestDispatcher(acceso);
         request.removeAttribute("accion");
        vista.forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
