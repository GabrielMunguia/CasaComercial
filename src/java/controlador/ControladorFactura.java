/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DetalleFactura;
import modelo.Factura;
import modeloDAO.DetalleFacturaDAO;
import modeloDAO.FacturaDAO;

/**
 *
 * @author GabrielMunguia
 */
public class ControladorFactura extends HttpServlet {

    String add = "./vistas/agregarVenta.jsp";
    String listar = "./vistas/listarFactura.jsp";
    String detalleFactura="./vistas/detalleFactura.jsp";
    Factura f = new Factura();
    FacturaDAO dao = new FacturaDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorFactura</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorFactura at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        class lstProd {

            int id;
            int cantidad;

        }
        String action = request.getParameter("accion");
        if (action.equals("listarFacturas")) {

            acceso = listar;
        } else if (action.equals("addVenta")) {
            acceso = add;

        } else if (action.equals("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            DetalleFacturaDAO daoDetalleFactura = new DetalleFacturaDAO();
            daoDetalleFactura.eliminar(id);
            dao.eliminar(id);
            acceso = listar;

        }else if (action.equals("detalleFactura")) {
              request.setAttribute("idFactura",request.getParameter("id"));
            acceso=detalleFactura;
        
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
        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equals("Pagar")) {
            int idCliente = Integer.parseInt(request.getParameter("idClienteFactura"));
            int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
            int metodoPago = Integer.parseInt(request.getParameter("metodoPago"));
            f.setIdCliente(idCliente);
            f.setIdEmpleado(idEmpleado);
            f.setIdMetodoPago(metodoPago);
            f.setTotal(0);
            int idFactura = dao.addFactura(f);
            if (idFactura != 0) {

                String lst = request.getParameter("lstProd");
                lst = lst.replace("\"", "");
                String[] res = lst.split(",");
                DetalleFactura f = new DetalleFactura();
                f.setIdFactura(idFactura);
                f.setDescuento(0);
                DetalleFacturaDAO daoF = new DetalleFacturaDAO();

                for (int i = 0; i < res.length; i++) {

                    if (i % 2 == 0) {
                        f.setIdProducto(Integer.parseInt(res[i]));

                    } else {
                        f.setCantidad(Integer.parseInt(res[i]));
                        daoF.addDetalleFactura(f);
                    }

                }
                request.setAttribute("exito", "true");
                acceso = add;

            } else {
                System.out.println("ERROR FALSE");
                request.setAttribute("exito", "false");
                acceso = add;
            }

        }

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
