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
import javax.servlet.http.HttpSession;
import modelo.Empleado;
import modelo.Usuario;
import modeloDAO.EmpleadoDAO;

/**
 *
 * @author GabrielMunguia
 */
public class ControladorEmpleados extends HttpServlet {

    String listar = "./vistas/listarEmpleado.jsp";
    String add = "./vistas/addEmpleado.jsp";
    String edit = "./vistas/editEmpleado.jsp";
    Empleado em = new Empleado();
    String login = "./index.jsp";
    EmpleadoDAO dao = new EmpleadoDAO();
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
            System.out.println("NULLLLLLLLLLLLLLLLL");
            acceso = login;

        } else {
            if (action.equalsIgnoreCase("listarEmpleado")) {
                System.out.println(action);
                acceso = listar;
            } else if (action.equalsIgnoreCase("addEmpleado")) {

                acceso = add;
            } else if (action.equalsIgnoreCase("Agregar")) {
                String nom = request.getParameter("txtNom");
                String dui = request.getParameter("txtDui");
                String nit = request.getParameter("txtNit");
                String gen = request.getParameter("txtGen");
                String fec = request.getParameter("txtFec");
                String tel = request.getParameter("txtTel");
                String dir = request.getParameter("txtDir");
                String usu = request.getParameter("txtUsu");
                String pas = request.getParameter("txtPas");
                int car = Integer.parseInt(request.getParameter("txtCar"));

                em.setNom(nom);
                em.setDui(dui);
                em.setNit(nit);
                em.setGen(gen);
                em.setFechNa(fec);
                em.setTel(tel);
                em.setDir(dir);
                em.setUsu(usu);
                em.setPas(pas);
                em.setIdCa(car);
                boolean exito = dao.addEmpleado(em);
                if (exito) {
                     request.setAttribute("exito", "true");
                } else {
                     request.setAttribute("exito", "false");
                }
                acceso = add;
            } else if (action.equalsIgnoreCase("editar")) {
//           request.setAttribute("idEmp",request.getParameter("id"));
                acceso = edit;
            } else if (action.equals("EditarEmpleado")) {
                request.setAttribute("idEmp", request.getParameter("id"));
                acceso = edit;
            } else if (action.equalsIgnoreCase("Actualizar")) {

                String nom = request.getParameter("txtNom");
                String dui = request.getParameter("txtDui");
                String nit = request.getParameter("txtNit");
                String gen = request.getParameter("txtGen");
                String fec = request.getParameter("txtFec");
                String tel = request.getParameter("txtTel");
                String dir = request.getParameter("txtDir");
                System.out.println("dir = " + dir);
                String usu = request.getParameter("txtUsu");
                String pas = request.getParameter("txtPas");
                int car = Integer.parseInt(request.getParameter("txtCargo"));
                id = Integer.parseInt(request.getParameter("txtid"));
                em.setIdEmp(id);
                em.setNom(nom);
                em.setDui(dui);
                em.setNit(nit);
                em.setGen(gen);
                em.setFechNa(fec);
                em.setTel(tel);
                em.setDir(dir);
                em.setUsu(usu);
                em.setPas(pas);
                em.setIdCa(car);
              boolean exito= dao.editEmpleado(em);
              if (exito) {
                     request.setAttribute("exito", "true");
                } else {
                     request.setAttribute("exito", "false");
                }
                acceso = listar;
            } else if (action.equalsIgnoreCase("Eliminar")) {
                id = Integer.parseInt(request.getParameter("id"));
                em.setIdEmp(id);
                boolean exito= dao.eliminarEmpleado(id);
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
