package controlador;

import modelo.Cliente;
import modeloDAO.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet(name = "ControladorCliente", urlPatterns = {"/ControladorCliente"})
public class ControladorCliente extends HttpServlet {
    String listar = "./vistas/listarCliente.jsp";
    String add = "./vistas/agregarCliente.jsp";
    String edit = "./vistas/editarCliente.jsp";
    Cliente cli = new Cliente();
    ClienteDAO dao = new ClienteDAO();
    int id;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controlador Cliente</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorCliente at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso="";
        String action = request.getParameter("accion");
        if(action.equalsIgnoreCase("listarCliente")){
            acceso=listar;          
        }else if(action.equalsIgnoreCase("add")){
            acceso=add;
        }else if(action.equalsIgnoreCase("Agregar")){
            String nom = request.getParameter("txtNombre");
            String dui = request.getParameter("txtDUI");
            String nit = request.getParameter("txtNIT");
            String dir = request.getParameter("txtDireccion");
            String tel = request.getParameter("txtTelefono");
            cli.setNombre(nom);
            cli.setDUI(dui);
            cli.setNIT(nit);
            cli.setDireccion(dir);
            cli.setTelefono(tel);
            dao.addCliente(cli);
            acceso=listar;
        }
        
        // REVISAR
        else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("IDCliente",request.getParameter("id"));
            acceso=edit;
            System.out.println("Editar cliente");
        }else if(action.equalsIgnoreCase("Actualizar")){
            id=Integer.parseInt(request.getParameter("txtid"));
            String nom = request.getParameter("txtNombre");
            String dui = request.getParameter("txtDUI");
            String nit = request.getParameter("txtNIT");
            String dir = request.getParameter("txtDireccion");
            String tel = request.getParameter("txtTelefono");
            cli.setIdCliente(id);
            cli.setNombre(nom);
            cli.setDUI(dui);
            cli.setNIT(nit);
            cli.setDireccion(dir);
            cli.setTelefono(tel);
            dao.editCliente(cli);
            acceso=listar;
        
        }else if(action.equalsIgnoreCase("eliminar")){
            id=Integer.parseInt(request.getParameter("id"));
            cli.setIdCliente(id);
            dao.eliminarCliente(id);
            acceso=listar;
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

