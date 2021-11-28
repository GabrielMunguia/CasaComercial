package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Credito;
import modelo.DetalleCredito;
import modelo.DetalleFactura;
import modelo.Usuario;
import modeloDAO.CreditoDAO;
import modeloDAO.DetalleCreditoDAO;
import modeloDAO.DetalleFacturaDAO;
import modeloDAO.PagoDAO;
import modeloDAO.ProductoDAO;

public class ControladorCreditos extends HttpServlet {
    
    String add = "./vistas/agregarCredito.jsp";
    String listar = "./vistas/listarCreditos.jsp";
    String detalleCredito = "./vistas/detalleCredito.jsp";
    CreditoDAO dao = new CreditoDAO();
    Credito f = new Credito();
       String login="./index.jsp";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        HttpSession session = request.getSession();
          Usuario usr = (Usuario) session.getAttribute("login");
           if(usr==null){
              System.out.println("NULLLLLLLLLLLLLLLLL");
              acceso=login;
              
          }else{
                String action = request.getParameter("accion");
        if (action.equals("listar")) {
            
            acceso = listar;
        } else if (action.equals("addCredito")) {
            acceso = add;
            
        } else if (action.equals("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));        
            DetalleCreditoDAO d = new DetalleCreditoDAO();
            PagoDAO dp=new PagoDAO();
            dp.eliminarTodosLosPagosCredito(id);
            d.eliminar(id);
           dao.eliminarCredito(id);
          acceso = listar;

        } else if (action.equals("detalleCredito")) {
              request.setAttribute("idFactura",request.getParameter("id"));
            acceso=detalleCredito;        
        }
           }
       
        
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equals("Pagar")) {
            int idCliente = Integer.parseInt(request.getParameter("idClienteFactura"));
            int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
            f.setIdCLiente(idCliente);
            f.setIdEMpleado(idEmpleado);
            f.setMontoCredito(0);
            
            int idFactura = dao.agregarCredito(f);
            if (idFactura != 0) {
                
                String lst = request.getParameter("lstProd");
                lst = lst.replace("\"", "");
                String[] res = lst.split(",");
                DetalleCredito f = new DetalleCredito();
                f.setIdCredito(idFactura);
                f.setDescuento(0);
                DetalleCreditoDAO daoF = new DetalleCreditoDAO();
                ProductoDAO pd = new ProductoDAO();
                for (int i = 0; i < res.length; i++) {
                    
                    if (i % 2 == 0) {
                        f.setIdPRoducto(Integer.parseInt(res[i]));
                        f.setPrecio(pd.obtenerPrecioCredito(Integer.parseInt(res[i])));
                        
                        
                    } else {
                        f.setCantidad(Integer.parseInt(res[i]));
                        
                        daoF.addDetalleCredito(f);
                        
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
    }
    
}
