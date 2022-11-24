<%-- 
    Document   : index
    Created on : 10-04-2021, 03:05:28 PM
    Author     : GabrielMunguia
--%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Pago"%>
<%@page import="modeloDAO.PagoDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="modeloDAO.ClienteDAO"%>
<%@page import="modeloDAO.ClienteDAO"%>
<%@page import="modeloDAO.ProductoDAO"%>
<% String accion = request.getParameter("accion");%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Producto"%>
<%@page import="modeloDAO.ProductoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CONBINI</title>
        <link rel="stylesheet" href="./css/style.css"/>
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/7fc2bb9c0c.js" crossorigin="anonymous"></script>

    </head>
    <body>
       <% Usuario usr = (Usuario) session.getAttribute("login");
            String aside = "";

            switch (usr.getIdCargo()) {
                case 1: {
                    aside = "admin";
                }
                break;
                case 2:{
                    
                    aside="gerente";
                }break;
                
                case 3:{
                    
                    aside="vendedor";
                }
                
                default:{
                aside="vendedor";
                }break;

            }

            
        %>
        <div id="<%= aside %>" class="sidebar open overflow-scroll ">

        </div>
        <section class="home-section bg-white ">

            <div>
                <div class="container-fluid d-flex justify-content-center align-items-center">
                    <div class="container  d-flex justify-content-center align-items-center">
                        <div class="col-8">
                            <%
                                PagoDAO dao = new PagoDAO();
                                int id = Integer.parseInt((String) request.getAttribute("idPago"));
                                Pago c = (Pago) dao.list(id);
                            %>
                            <h1>Modificar Pago</h1>
                            <form action="ControladorPago">
                                Id de factura<br>
                                <input class="form-control" type="text" name="txtidFactura" value="<%= c.getIdFactura()%>"><br>
                                Monto<br>
                                <input class="form-control" type="text" name="txtMonto" value="<%= c.getMontoPagado()%>"><br>
                                Fecha<br>
                                <input class="form-control" type="datetime-local" name="txtFecha" value="<%= c.getFechaHora()%>"><br>

                                <input type="hidden" name="txtid" value="<%= c.getIdPago()%>">
                                <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"> 
                                <a href="ControladorPago?accion=listarPago">Regresar</a>
                            </form>
                        </div>
                    </div>







                </div>
            </div>
        </section>
        <script type="module" src="./scripts/dash.js" crossorigin="anonymous"></script>




    </body>
</html>
