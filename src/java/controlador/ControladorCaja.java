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
import modelo.Empleado;
import modelo.Usuario;
import modeloDAO.EmpleadoDAO;
import modeloDAO.UsuarioDAO;

/**
 *
 * @author Gabriel
 */
public class ControladorCaja extends HttpServlet {

    String listar = "./vistas/listarUsuarios.jsp";
    String add = "./vistas/addCaja.jsp";
    String edit = "./vistas/editEmpleado.jsp";
    Empleado em = new Empleado();
    String login = "./index.jsp";
    UsuarioDAO dao = new UsuarioDAO();
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
            } else if (action.equalsIgnoreCase("addCaja")) {

                acceso = add;
            } else if (action.equalsIgnoreCase("Agregar")) {
                  try {
                     int idEmpleado = Integer.parseInt(request.getParameter("txtIdEmpleado"));
                   int idCargo= Integer.parseInt(request.getParameter("txtIdRol"));
                   String usuario=request.getParameter("txtUsuario");
                   String password = request.getParameter("txtPassword");
                   
                   if(dao.validarUsuarioUnico(usuario)){
                         Usuario user =  new Usuario();
                   user.setIdCargo(idCargo);
                   user.setIdEmpleado(idEmpleado);
                   user.setPassword(password);

                   user.setUsuario(usuario);
                   
      
             
                boolean exito = dao.agregar(user);
                if (exito) {
                    request.setAttribute("exito", "true");
               } else {
                    request.setAttribute("exito", "false");
               }
           
               
            
                       
                   }else{
                     
                            request.setAttribute("errorUsuario", "true");
                   }
                } catch (Exception e) {
                      request.setAttribute("exito", "false");
                }
                   
            acceso = add;
      
             
             
           
               
                acceso = add;
            } else if (action.equalsIgnoreCase("editar")) {
//           request.setAttribute("idEmp",request.getParameter("id"));
                acceso = edit;
            } else if (action.equals("EditarEmpleado")) {
                request.setAttribute("idUsuario", request.getParameter("id"));
                acceso = edit;
            } else if (action.equalsIgnoreCase("Actualizar")) {

                try {
               
                acceso = listar;
                } catch (Exception e) {
                    System.out.println(e);
                }
            } else if (action.equalsIgnoreCase("actualizarEstado")) {
                id = Integer.parseInt(request.getParameter("id"));
                boolean estado = Boolean.parseBoolean(request.getParameter("estado"));
                em.setIdEmp(id);
                boolean exito = dao.actualizarEstado(id,estado);
                if (exito) {
                    request.setAttribute("eliminado", "true");
                } else {
                    request.setAttribute("eliminado", "false");
                }
                acceso = listar;
            }

        }

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
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
