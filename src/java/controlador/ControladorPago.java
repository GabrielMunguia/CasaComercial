package controlador;


import modelo.Pago;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeloDAO.PagoDAO;

public class ControladorPago extends HttpServlet{
    String listar="vistas/listarPago.jsp";
    String add="vistas/agregarPago.jsp";
    String edit="vistas/editarPago.jsp";
    Pago p = new Pago();
    PagoDAO dao = new PagoDAO();
    int id;
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
        String acceso="";
        String action=request.getParameter("accion");
        if(action.equalsIgnoreCase("listarPago")){
            acceso=listar;          
        }/*else if(action.equalsIgnoreCase("repalumno")){
            acceso=repalumno;
        }else if(action.equalsIgnoreCase("listalumno")){
            acceso=listalumno;
        }*/else if(action.equalsIgnoreCase("add")){
            acceso=add;
        }else if(action.equalsIgnoreCase("Agregar")){
            int idFac = Integer.parseInt(request.getParameter("txtidFactura"));
            double monto = Double.parseDouble(request.getParameter("txtMonto"));
            String fecha = request.getParameter("txtFecha");
            p.setIdFactura(idFac);
            p.setMontoPagado(monto);
            p.setFechaHora(fecha);
            dao.agregarPago(p);
            acceso=listar;
        }
        
        // REVISAR
        else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idPago",request.getParameter("id"));
            acceso=edit;
        }else if(action.equalsIgnoreCase("Actualizar")){
            id=Integer.parseInt(request.getParameter("txtid"));
            int idFact=Integer.parseInt(request.getParameter("txtidFactura"));
            double monto = Double.parseDouble(request.getParameter("txtMonto"));
            String fecha=request.getParameter("txtFecha");
            p.setIdPago(id);
            p.setIdFactura(idFact);
            p.setMontoPagado(monto);
            p.setFechaHora(fecha);
            dao.editarPago(p);
            acceso=listar;
        
        }else if(action.equalsIgnoreCase("eliminar")){
            id=Integer.parseInt(request.getParameter("id"));
            p.setIdPago(id);
            dao.eliminarPago(id);
            acceso=listar;
        }
        RequestDispatcher vista=request.getRequestDispatcher(acceso);
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