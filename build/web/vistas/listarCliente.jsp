<%-- 
    Document   : index
    Created on : 10-04-2021, 03:05:28 PM
    Author     : GabrielMunguia
--%>
<%@page import="modeloDAO.ClienteDAO"%>
<%@page import="modeloDAO.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Cliente"%>
<% String accion = request.getParameter("accion"); %>
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
  <div id="dash" class="sidebar open overflow-scroll">
           h1
           adasdasd
       </div>
       <section class="home-section bg-white">

           <div>
               <div class="container-fluid d-flex justify-content-center align-items-center flex-column">
  <h1 class="m-3"> Lista de Clientes</h1>
                   <table class="table table-bordered table-hover table-striped">
                       <thead>
                           <tr>
                               <th class="text-center">ID</th>
                               <th class="text-center">NOMBRE</th>
                               <th class="text-center">DUI</th>
                               <th class="text-center">NIT</th>
                               <th class="text-center">DIRECCIÓN</th>
                               <th class="text-center">TELÉFONO</th>
                               <th class="text-center">ACCIONES</th>
                           </tr>
                       </thead>
                         <tbody>
                       <%
                           ClienteDAO dao = new ClienteDAO();
                           List<Cliente> list = dao.listarCliente();
                           Iterator<Cliente> iter = list.iterator();
                           Cliente c = null;
                           while (iter.hasNext()) {
                               c = iter.next();
                       %>
                     
                           <tr>
                               <td class="text-center"><%= c.getIdCliente()%></td>
                               <td class="text-center"><%= c.getNombre()%></td>
                               <td class="text-center"><%= c.getDUI()%></td>
                               <td class="text-center"><%= c.getNIT()%></td>
                               <td class="text-center"><%= c.getDireccion()%></td>
                               <td><%= c.getTelefono()%></td>
                               <td class="text-center">
                                   <a class="btn btn-warning" href="ControladorCliente?accion=editar&id=<%= c.getIdCliente()%>">Editar</a>
                                   <a class="btn btn-danger" href="ControladorCliente?accion=eliminar&id=<%= c.getIdCliente()%>">Eliminar</a>
                               </td>
                           </tr>
                           <%}%>
                       </tbody>
                   </table>






               </div>
           </div>
       </section>
       <script type="module" src="./scripts/dash.js" crossorigin="anonymous"></script>
    </body>
</html>
