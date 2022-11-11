package controlador;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Producto;
import modelo.Usuario;
import modeloDAO.ProductoDAO;

public class ControladorProducto extends HttpServlet {

    String login = "./index.jsp";
    String listar = "./vistas/listarProducto.jsp";
    String add = "./vistas/addProducto.jsp";
    String edit = "./vistas/editProducto.jsp";
    Producto pr = new Producto();
    ProductoDAO daoprod = new ProductoDAO();
    int idP;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorProducto</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorProducto at " + request.getContextPath() + "</h1>");
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
            if (action.equalsIgnoreCase("listarProducto")) {
                acceso = listar;
            } else if (action.equalsIgnoreCase("addProducto")) {
                acceso = add;
            } else if (action.equalsIgnoreCase("Agregar")) {
              String producto = request.getParameter("txtProducto");
              String  descripcion = request.getParameter("txtDesc");
              String marca = request.getParameter("txtMarca");
              int idCategoria = Integer.parseInt(request.getParameter("txtCat"));
              double costo = Double.parseDouble(request.getParameter("txtCosto"));
              double precioVenta = Double.parseDouble(request.getParameter("txtPrecioVenta"));
              int stock = Integer.parseInt(request.getParameter("txtStock"));
              int idProveedor = Integer.parseInt(request.getParameter("txtIdProveedor"));
                pr.setProducto(producto);   
                pr.setDescripcion(descripcion);
                pr.setMarca(marca);
                pr.setIdCategoria(idCategoria);
                pr.setCosto(costo);
                pr.setPrecioVenta(precioVenta);
                pr.setStock(stock);
                pr.setIdProveedor(idProveedor);



                daoprod.addProducto(pr);
                acceso = listar;
            } else if (action.equalsIgnoreCase("editar")) {
                request.setAttribute("idProduct", request.getParameter("id"));
                acceso = edit;
            } else if (action.equalsIgnoreCase("Actualizar")) {
                idP = Integer.parseInt(request.getParameter("txtid"));
                String producto = request.getParameter("txtProducto");
              String  descripcion = request.getParameter("txtDesc");
              String marca = request.getParameter("txtMarca");
              int idCategoria = Integer.parseInt(request.getParameter("txtCat"));
              double costo = Double.parseDouble(request.getParameter("txtCosto"));
              double precioVenta = Double.parseDouble(request.getParameter("txtPrecioVenta"));
              int stock = Integer.parseInt(request.getParameter("txtStock"));
              int idProveedor = Integer.parseInt(request.getParameter("txtIdProveedor"));
                pr.setProducto(producto);   
                pr.setDescripcion(descripcion);
                pr.setMarca(marca);
                pr.setIdCategoria(idCategoria);
                pr.setCosto(costo);
                pr.setPrecioVenta(precioVenta);
                pr.setStock(stock);
                pr.setIdProveedor(idProveedor);
                pr.setIdProducto(idP);
                daoprod.editProducto(pr);
                boolean exito = daoprod.editProducto(pr);
                if (exito) {
                    request.setAttribute("exito", "true");
                } else {
                    request.setAttribute("exito", "false");
                }
                acceso = listar;
            } else if (action.equalsIgnoreCase("Eliminar")) {
                idP = Integer.parseInt(request.getParameter("id"));
                // pr.setIdProducto(idP);
               boolean exito= daoprod.eliminarProducto(idP);
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
