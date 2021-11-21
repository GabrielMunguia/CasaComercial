<%-- 
    Document   : index
    Created on : 10-04-2021, 03:05:28 PM
    Author     : GabrielMunguia
--%>
<%@page import="modelo.Pago"%>
<%@page import="modeloDAO.PagoDAO"%>
<%@page import="modelo.Cliente"%>
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
        <title>Casa Comercial</title>
        <link rel="stylesheet" href="./css/style.css"/>
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/7fc2bb9c0c.js" crossorigin="anonymous"></script>

    </head>
    <body>
        <div id="dash" class="sidebar open overflow-scroll">

        </div>
        <section class="home-section bg-white">

            <div>
                <div class="container-fluid d-flex justify-content-center align-items-center px-5">


                    <div class=" w-100">
                        <h1>Pagos</h1>
                        <a class="btn btn-success" href="ControladorPago?accion=add">Agregar Nuevo</a>
                        <br>
                        <br>
                        <table class="table table-striped table-hover  table-bordered">
                            <thead>
                                <tr>
                                    <th class="text-center">ID PAGO</th>
                                    <th class="text-center">ID FACTURA</th>
                                    <th class="text-center">MONTO PAGADO</th>
                                    <th class="text-center">FECHA/HORA</th>
                                    <th class="text-center">ACCIONES</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    PagoDAO dao = new PagoDAO();
                                    List<Pago> list = dao.listarPago();
                                    Iterator<Pago> iter = list.iterator();
                                    Pago p = null;
                                    while (iter.hasNext()) {
                                        p = iter.next();
                                %>

                                <tr>
                                    <td class="text-center"><%= p.getIdPago()%></td>
                                    <td class="text-center"><%= p.getIdFactura()%></td>
                                    <td class="text-center"><%= p.getMontoPagado()%></td>
                                    <td><%= p.getFechaHora()%></td>
                                    <td class="text-center">
                                        <a class="btn btn-warning" href="ControladorPago?accion=editar&id=<%= p.getIdPago()%>">Editar</a>
                                        <a class="btn btn-danger" href="ControladorPago?accion=eliminar&id=<%= p.getIdPago()%>">Eliminar</a>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>




                </div>






            </div>
        </div>
    </section>
    <script type="module" src="./scripts/dash.js" crossorigin="anonymous"></script>




</body>
</html>
