<%@page import="modeloDAO.EmpleadoDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.Empleado"%>
<%@page import="modelo.Empleado"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.EmpleadoDAO"%>
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
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs5/dt-1.11.3/datatables.min.css"/>

    </head>
    <body>
        <div id="dash" class="sidebar open overflow-scroll">

        </div>
        <section class="home-section bg-white ">

            <div>
                <div class="container-fluid d-flex justify-content-center align-items-center flex-column  col-11">
                    <h1 class="m-3"> Lista de empleados</h1>

                    <div class="col-12">
                        <table id="tabla"  class="p-2 mt-5 table table-striped table-bordered  col-12   "  style="width:100%">
                            <thead>
                                <tr class="bg-dark text-white">
                                    <th class="text-center">ID</th>
                                    <th class="text-center">NOMBRE</th>
                                    <th class="text-center">DUI</th>
                                    <th class="text-center">NIT</th>
                                    <th class="text-center">GENERO</th>
                                    <th class="text-center">FECHANACIMIENTO</th>
                                    <th class="text-center">TELEFONO</th>
                                    <th class="text-center">DIRECCION</th>
                                    <th class="text-center">IDCARGO</th>
                                    <th class="text-center noExport">ACCIONES</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    EmpleadoDAO dao = new EmpleadoDAO();
                                    List<Empleado> list = dao.listarEmpleado();
                                    Iterator<Empleado> iter = list.iterator();
                                    Empleado em = null;
                                    while (iter.hasNext()) {
                                        em = iter.next();
                                %>



                                <tr>
                                    <td class="text-center"><%= em.getIdEmp()%></td>
                                    <td class="text-center"><%= em.getNom()%></td>
                                    <td class="text-center"><%= em.getDui()%></td>
                                    <td class="text-center"><%= em.getNit()%></td>
                                    <td class="text-center"><%= em.getGen()%></td>
                                    <td class="text-center"><%= em.getFechNa()%></td>
                                    <td class="text-center"><%= em.getTel()%></td>
                                    <td class="text-center"><%= em.getDir()%></td>

                                    <td class="text-center noExport"><%= em.getIdCa()%></td>
                                    <td>
                                        <a class="btn btn-warning" href="ControladorEmpleados?accion=EditarEmpleado&id=<%= em.getIdEmp()%>">Editar</a>

                                        <a class="btn btn-danger" href="ControladorEmpleados?accion=eliminar&id=<%= em.getIdEmp()%>">Eliminar</a>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>








                </div>
        </section>
        <script type="module" src="./scripts/dash.js" crossorigin="anonymous"></script>

        <script type="text/javascript" src="" crossorigin="anonymous"></script>


        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
        <script  src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>
        <!-- Para usar los botones -->
        <script src="https://cdn.datatables.net/buttons/1.6.5/js/dataTables.buttons.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.6.5/js/buttons.html5.min.js"></script>


        <!-- Para los estilos en Excel     -->
        <script src="https://cdn.jsdelivr.net/npm/datatables-buttons-excel-styles@1.1.1/js/buttons.html5.styles.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/datatables-buttons-excel-styles@1.1.1/js/buttons.html5.styles.templates.min.js"></script>
        <script type="text/javascript" src="./scripts/tablas.js" />


        <script src="https://cdn.datatables.net/fixedheader/3.1.6/js/dataTables.fixedHeader.min.js"></script> 




    </body>
</html>
