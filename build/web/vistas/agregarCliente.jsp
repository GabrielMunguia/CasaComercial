<%-- 
    Document   : index
    Created on : 10-04-2021, 03:05:28 PM
    Author     : GabrielMunguia
--%>
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
        <title>Casa Comercial</title>
        <link rel="stylesheet" href="./css/style.css"/>
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/7fc2bb9c0c.js" crossorigin="anonymous"></script>

    </head>
    <body>
        <div id="dash" class="sidebar open overflow-scroll">
            h1
            adasdasd
        </div>
        <section class="home-section bg-white">

            <div>
                <div class="container-fluid d-flex justify-content-center align-items-center">


                    <div class="container">
                        <div class="col-12">
                            <h1>Agrega a un nuevo Cliente</h1>
                            <form action="ControladorCliente">
                                Nombre:<br>
                                <input class="form-control" type="text"
                                       name="txtNombre"><br>
                                DUI<br>
                                <input class="form-control" type="text"
                                       name="txtDUI"><br>
                                NIT<br>
                                <input class="form-control" type="text"
                                       name="txtNIT"><br>
                                Dirección<br>
                                <input class="form-control" type="text"
                                       name="txtDireccion"><br>
                                Teléfono<br>
                                <input class="form-control" type="text"
                                       name="txtTelefono"><br>
                                <input class="btn btn-primary" type="submit"
                                       name="accion" value="Agregar">
                                <a
                                    href="ControladorCliente?accion=listarCliente">Regresar</a>
                            </form>
                        </div>
                    </div>






                </div>
            </div>
        </section>
        <script type="module" src="./scripts/dash.js" crossorigin="anonymous"></script>




    </body>
</html>
