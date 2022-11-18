/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Empleado;
import modeloDAO.EmpleadoDAO;
import modelo.Usuario;
import modeloDAO.UsuarioDAO;

public class Controlador extends HttpServlet {

    UsuarioDAO dao = new UsuarioDAO();
    Usuario usr = new Usuario();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String accion = request.getParameter("accion");

        
        if (accion.equals("Ingresar")) {

            HttpSession session = request.getSession();

            String usuario = request.getParameter("usuario");
            String password = request.getParameter("password");
            System.out.println("usuario"+usuario);
            System.out.println("password"+password);
            usr = dao.validar(usuario, password);
            
  
            
            if (usr.getIdCargo() != 0) {
                session.setAttribute("login", usr);
            }

            
            
            if (session.getAttribute("login") != null) {

                Usuario activo = (Usuario) session.getAttribute("login");
                if (activo.getIdCargo() != 0) {

                            request.getRequestDispatcher("./vistas/admin.jsp").forward(request, response);

                }

            } else {
                System.out.println("null");
                 request.setAttribute("exito", "false");
                request.getRequestDispatcher("./index.jsp").forward(request, response);
                
            }

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equals("menuPrincipal")) {
            request.getRequestDispatcher("./vistas/admin.jsp").forward(request, response);
        }else if(action.equals("salir")){
             System.out.println("SALIRRRRRRRRR");
            HttpSession session = request.getSession();
             session.invalidate();
        
             
            
             request.getRequestDispatcher("./index.jsp").forward(request, response);
            
        }

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
        System.out.println("hola desde doPOST");
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
