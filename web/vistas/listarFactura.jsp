<%@page import="modelo.Factura"%>
<%@page import="modelo.Factura"%>
<%@page import="modeloDAO.FacturaDAO"%>

<%@page import="java.util.Iterator"%>

<%@page import="java.util.List"%>

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
        <section class="home-section bg-white ">

            <div>
                <div class="container-fluid d-flex justify-content-center align-items-center flex-column">
                    <h1 class="m-3"> Lista de Facturas</h1>
                
     <table class="table table-bordered ">
                        <thead>
                            <tr>
                                <th class="text-center">Numero factura</th>
                                <th class="text-center">Fecha</th>
                                <th class="text-center">Id cliente</th>
                                <th class="text-center">Id Empleado</th>
                                <th class="text-center">Total</th>
                                  <th class="text-center">Acciones</th>

                            </tr>
                        </thead>
                        <%
                            FacturaDAO dao = new FacturaDAO();
                            List<Factura> list = dao.listarFacturas();
                            Iterator<Factura> iter = list.iterator();
                            Factura f = null;
                            while (iter.hasNext()) {
                                f = iter.next();
                        %>


                        <tbody>
                            <tr>
                                <td class="text-center"><%= f.getId()%></td>
                                <td class="text-center"><%= f.getFecha()%></td>
                                <td class="text-center"><%= f.getIdCliente()%></td>
                                <td class="text-center"><%= f.getIdEmpleado()%></td>
                                <td class="text-center">$<%= f.getTotal()%></td>

                                <td class="d-flex  justify-content-center align-items-center">
                                    <a class="btn btn-warning " href="ControladorEmpleados?accion=EditarEmpleado&id=<%= f.getId()%>">Editar</a>
                                    <a class="btn btn-danger mx-2" href="ControladorFactura?accion=eliminar&id=<%=f.getId()%>">Eliminar</a>
                                    <a class="btn btn-dark" href="ControladorEmpleados?accion=VerMas&id=<%= f.getId()%>">Ver mas</a>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>







        
            </div>
        </section>
        <script type="module" src="./scripts/dash.js" crossorigin="anonymous"></script>




    </body>
</html>
