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
    int r;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String accion = request.getParameter("accion");

        if (accion.equals("Ingresar")) {

            HttpSession session = request.getSession();

            System.out.println("Ingresarrr");
            String x = (String) session.getAttribute("login");
            if (x == "true") {
                System.out.println("TRUEEEE");
                request.getRequestDispatcher("./vistas/admin.jsp").forward(request, response);
                return;
            }

            String usuario = request.getParameter("usuario");
            String password = request.getParameter("password");
            usr.setUsuario(usuario);
            usr.setPassword(password);

            r = dao.validar(usr);
            System.out.println(r);

            if (r >= 1) {

                if (r == 1) {

                    session.setAttribute("login", "true");

                    request.getRequestDispatcher("./vistas/admin.jsp").forward(request, response);
                }

                request.getRequestDispatcher("index.jsp").forward(request, response);

            } else {
                System.out.println("Error tipo empleado");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } else if (accion.equals("aggEmpleado")) {
           
              
               

    
        }else if (accion.equals("ver productos")) {
           
             request.getRequestDispatcher("./vistas/admin.jsp").forward(request, response);
        
             
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
          String acceso="";
        String action = request.getParameter("accion");
         if (action.equals("menuPrincipal")) {
                request.getRequestDispatcher("./vistas/admin.jsp").forward(request, response);
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
