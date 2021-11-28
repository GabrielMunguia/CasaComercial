package controlador;

import modelo.Pago;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Credito;
import modelo.Usuario;
import modeloDAO.CreditoDAO;
import modeloDAO.PagoDAO;

public class ControladorPago extends HttpServlet {

    String listar = "vistas/listarPago.jsp";
    String add = "vistas/agregarPago.jsp";
    String edit = "vistas/editarPago.jsp";
    String verPagos = "vistas/verPago.jsp";
    Pago p = new Pago();
    PagoDAO dao = new PagoDAO();
    int id;
 String login = "./index.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controlador Pago</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controlador at " + request.getContextPath() + "</h1>");
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
            System.out.println("NULLLLLLLLLLLLLLLLL");
            acceso = login;

        } else {if (action.equalsIgnoreCase("Consultar")) {
           String id = request.getParameter("idCredito");
            CreditoDAO cd= new CreditoDAO();
            Credito c = cd.list(Integer.parseInt(id));
            if(c.getIdCredito()!=0){
                 
                  request.setAttribute("idCredito",id);
                   acceso = listar;
            
            }else{
            request.setAttribute("error",true);
            acceso=verPagos;
            }
        
            
            
            
           
           
        } else if (action.equalsIgnoreCase("verPagos")) {
          
            
            
            acceso = verPagos;
        } else if (action.equalsIgnoreCase("add")) {
            acceso = add;
        } else if (action.equalsIgnoreCase("Agregar")) {
            int idFac = Integer.parseInt(request.getParameter("txtidFactura"));

            double monto = Double.parseDouble(request.getParameter("txtMonto"));

            int metodoPago = Integer.parseInt(request.getParameter("metodoPago"));
            CreditoDAO daoc = new CreditoDAO();
            Credito c = (Credito) daoc.list(idFac);

            double totalPagado = dao.getTotalPagos(idFac);

            double totalCredito = c.getMontoCredito();

            if (totalCredito > totalPagado) {
                System.out.println("FALTA DE PAGAR TODAVIA LA CANTIDAD DE " + (totalCredito - totalPagado));

                if ((totalCredito - totalPagado) >= monto) {
                    System.out.println("PAGO JUSTO ");
                    System.out.println((c.getMontoCredito() - totalPagado));

                    p.setIdFactura(idFac);
                    p.setMontoPagado(monto);
                    p.setIdmetodoPago(metodoPago);
                    dao.agregarPago(p);
                    request.setAttribute("exito", true);

                    double totalPagadoAux = dao.getTotalPagos(idFac);

                    double totalCreditoAux = c.getMontoCredito();
                    if (totalCreditoAux - totalPagadoAux == 0) {
                        request.setAttribute("factura", true);

                    }

                } else {
                    request.setAttribute("exito", false);
                    request.setAttribute("debe", (totalCredito - totalPagado));
                    System.out.println("excede el monto ");

                }

            } else {
                request.setAttribute("exito", false);
                request.setAttribute("pagado", true);
                System.out.println("YA SE PAGO ");

            }
            acceso = add;

        } else if (action.equalsIgnoreCase("eliminarPago")) {
            int id = Integer.parseInt(request.getParameter("idPago"));
             String idCredito = request.getParameter("idCredito");
              System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
             System.out.println("idCredito = " + idCredito);
             System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
           
           
         
           dao.eliminarPago(id);
            request.setAttribute("idCredito",idCredito);
           
            acceso = listar;
        }}
        
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
