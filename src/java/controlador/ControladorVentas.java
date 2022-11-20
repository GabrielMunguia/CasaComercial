/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Caja;
import modelo.DetalleVenta;
import modelo.FacturaDetallada;
import modelo.Producto;
import modelo.Venta;
import modelo.Usuario;
import modeloDAO.CajaDAO;
import modeloDAO.DetalleVentaDAO;
import modeloDAO.FacturaDetalladaDAO;
import modeloDAO.ProductoDAO;
import modeloDAO.VentaDAO;

/**
 *
 * @author GabrielMunguia
 */
public class ControladorVentas extends HttpServlet {

    String add = "./vistas/agregarVenta.jsp";
    String listar = "./vistas/listarVenta.jsp";
    String detalleVenta = "./vistas/detalleVenta.jsp";
    Venta f = new Venta();
    VentaDAO dao = new VentaDAO();
    String login = "./index.jsp";
    CajaDAO daoCaja = new CajaDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
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
        HttpSession session = request.getSession();
        Usuario usr = (Usuario) session.getAttribute("login");
        if (usr == null) {
            System.out.println("NULLLLLLLLLLLLLLLLL");
            acceso = login;

        } else {
            String action = request.getParameter("accion");
            if (action.equals("listarVentas")) {

                acceso = listar;
            } else if (action.equals("addVenta")) {
                acceso = add;

            } else if (action.equals("eliminar")) {
                int id = Integer.parseInt(request.getParameter("id"));
                FacturaDetalladaDAO daoFD = new FacturaDetalladaDAO();
                FacturaDetallada fd = daoFD.list(id);
                double totalFactura = fd.getTota();
                Boolean cajaAbierta = daoCaja.validarCajaAbierta(usr.getID());
                
                if (cajaAbierta) {
                    Caja c = daoCaja.obtenerUltimaCaja(usr.getID());
                    String fecha = c.getFechaApertura();
                    //dividir la fecha por -
                    String[] fechaDividida = fecha.split(" ")[0].split("-");
                    String[] horaDividida = fecha.split(" ")[1].split(":");

                    //int
                    int anio = Integer.parseInt(fechaDividida[0]);
                    int mes = Integer.parseInt(fechaDividida[1]);
                    int dia = Integer.parseInt(fechaDividida[2]);
                    int hora = Integer.parseInt(horaDividida[0]);
                    int minuto = Integer.parseInt(horaDividida[1]);
                    int segundo = Integer.parseInt(horaDividida[2]);

                    

                    //hacer lo mismo para la fecha de la factura
                    String fechaFactura = fd.getFecha();
                    //dividir la fecha por -
                    String[] fechaDivididaFactura = fechaFactura.split(" ")[0].split("-");
                    String[] horaDivididaFactura = fechaFactura.split(" ")[1].split(":");
                    //int
                    int anioFactura = Integer.parseInt(fechaDivididaFactura[0]);
                    int mesFactura = Integer.parseInt(fechaDivididaFactura[1]);
                    int diaFactura = Integer.parseInt(fechaDivididaFactura[2]);
                    int horaFactura = Integer.parseInt(horaDivididaFactura[0]);
                    int minutoFactura = Integer.parseInt(horaDivididaFactura[1]);
                    int segundoFactura = Integer.parseInt(horaDivididaFactura[2]);

                  

                  //validar datos
                  if(anioFactura==anio&&mesFactura==mes&&diaFactura==dia&&horaFactura>=hora&&minutoFactura>=minuto&&segundoFactura>=segundo){
                       daoCaja.restarMontoCierre(totalFactura, usr.getID());
                  }

                }

                dao.eliminar(id);

                acceso = listar;

            } else if (action.equals("detalleVenta")) {
                request.setAttribute("idFactura", request.getParameter("id"));
                acceso = detalleVenta;

            } else {
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
        String acceso = "";
        String action = request.getParameter("accion");

        if (action.equals("Pagar")) {

            try {
                HttpSession session = request.getSession();
                Usuario usr = (Usuario) session.getAttribute("login");
                int idCliente = Integer.parseInt(request.getParameter("idClienteFactura"));
                //            int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
                int metodoPago = Integer.parseInt(request.getParameter("metodoPago"));
                String tipoDocument = request.getParameter("tipoDocumento");
                int noComprobante = Integer.parseInt(request.getParameter("noDocumento"));
                f.setIdCliente(idCliente);
                f.setIdEmpleado(usr.getIdEmpleado());
                f.setIdMetodoPago(metodoPago);
                f.setTotal(0);
                f.setTipoComprobante(tipoDocument);
                f.setNoComprobante(noComprobante);

                f.setFecha(request.getParameter("fecha"));
                int idFactura = dao.addFactura(f);
                if (idFactura != 0) {
                    double total = 0;
                    String lst = request.getParameter("lstProd");
                    lst = lst.replace("\"", "");
                    String[] res = lst.split(",");
                    DetalleVenta f = new DetalleVenta();
                    f.setIdVenta(idFactura);
                    f.setDescuento(0);
                    ProductoDAO daoProd = new ProductoDAO();

                    DetalleVentaDAO daoF = new DetalleVentaDAO();

                    for (int i = 0; i < res.length; i++) {

                        if (i % 2 == 0) {
                            f.setIdProducto(Integer.parseInt(res[i]));

                        } else {
                            Producto p = new Producto();
                            p = daoProd.listProducto(f.getIdProducto());
                            f.setCantidad(Integer.parseInt(res[i]));
                            f.setPrecioUnitario(p.getPrecioVenta());
                            daoF.addDetalleFactura(f);

                            daoProd.descontarStock(f.getIdProducto(), f.getCantidad());
                            total += (f.getCantidad() * p.getPrecioVenta());

                        }

                    }
                    dao.actualizarTotal(f.getIdVenta(), total);

                    daoCaja.aumentarVentas(total, usr.getID());

                    request.setAttribute("exito", "true");
                    acceso = add;
                } else {
                    System.out.println("ERROR FALSE");
                    request.setAttribute("exito", "false");
                    acceso = add;
                }
            } catch (Exception e) {
                // TODO: handle exception
                request.setAttribute("exito", "false");
                acceso = add;
            }

        }

        //ir a la vista sin datos del post
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
