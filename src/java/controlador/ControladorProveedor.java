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
import modelo.Categoria;
import modelo.Proveedor;
import modelo.Usuario;
import modeloDAO.CategoriaDAO;
import modeloDAO.ProveedorDAO;

/**
 *
 * @author Gabriel
 */
public class ControladorProveedor extends HttpServlet {

 String login = "./index.jsp";
    String listar = "./vistas/ListarProveedores.jsp";
    String add = "./vistas/agregarProveedor.jsp";
    String edit = "./vistas/editarProveedor.jsp";
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorCategoria</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorCategoria at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        HttpSession session = request.getSession();
        Usuario usr = (Usuario) session.getAttribute("login");
        ProveedorDAO dao= new ProveedorDAO();
        if (usr == null) {

            acceso = login;

        } else {
            if (action.equalsIgnoreCase("listarProveedor")) {
                acceso = listar;
            } else if (action.equalsIgnoreCase("addProveedor")) {
                acceso = add;
            } else if (action.equalsIgnoreCase("Agregar")) {
                String nombre = request.getParameter("txtNombre");
                String direccion = request.getParameter("txtDireccion");
                String telefono = request.getParameter("txtTelefono");
                String correo = request.getParameter("txtCorreo");
                Proveedor prov= new Proveedor();
                prov.setNombre(nombre);
                prov.setDireccion(direccion);
                prov.setTelefono(telefono);
                prov.setCorreo(correo);
                boolean exito = dao.agregar(prov);
                if (exito) {
                    request.setAttribute("exito", "true");
               } else {
                    request.setAttribute("exito", "false");
               }
           
                
               
                
                
              
         
                acceso = listar;
            } else if (action.equalsIgnoreCase("editar")) {
                request.setAttribute("idProduct", request.getParameter("id"));
                acceso = edit;
            } else if (action.equalsIgnoreCase("Actualizar")) {
                int id = Integer.parseInt(request.getParameter("txtId"));
                String nombre = request.getParameter("txtNombre");
                String direccion = request.getParameter("txtDireccion");
                String telefono = request.getParameter("txtTelefono");
                String correo = request.getParameter("txtCorreo");
                Proveedor prov= new Proveedor();
                prov.setIdProveedor(id);
                prov.setNombre(nombre);
                prov.setDireccion(direccion);
                prov.setTelefono(telefono);
                prov.setCorreo(correo);
                boolean exito = dao.actualizar(prov);
                if (exito) {
                    request.setAttribute("exito", "true");
                } else {
                    request.setAttribute("exito", "false");
                }
              
              
                acceso = listar;

                
               
                acceso = listar;
            } else if (action.equalsIgnoreCase("Eliminar")) {
                int id = Integer.parseInt(request.getParameter("id"));
                boolean exito = dao.eliminar(id);
                if (exito) {
                    request.setAttribute("exito", "true");
                } else {
                    request.setAttribute("exito", "false");
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
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

}
