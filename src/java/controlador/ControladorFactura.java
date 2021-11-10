/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author GabrielMunguia
 */
public class ControladorFactura extends HttpServlet {

    String add = "./vistas/agregarVenta.jsp";
    String listar = "./vistas/listarFactura.jsp";

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

        } else if (action.equals("Pagar")) {

//            try {
//                String X = request.getParameter("lstProd");
//                Gson gson = new Gson();
//                JsonObject jsonObject = new JsonParser().parse(X).getAsJsonObject();
////                lstProd p = gson.fromJson(jsonObject, lstProd.class);
//                System.out.println("lstProd = " + jsonObject);
//            } catch (Exception error) {
//                System.out.println("error = " + error);
//            }
  String X = request.getParameter("lstProd");
            System.out.println("X = " + X);

            acceso = listar;

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
