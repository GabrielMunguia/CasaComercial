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

    </head>
    <body>
        <div id="dash" class="sidebar open overflow-scroll">

        </div>
        <section class="home-section bg-white ">

            <div>
                <div class="container-fluid d-flex justify-content-center align-items-center flex-column">
                    <h1 class="m-3"> Lista de empleados</h1>
                
                          <table class="table table-striped table-bordered table-hover ">
            <thead>
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">NOMBRE</th>
                    <th class="text-center">DUI</th>
                    <th class="text-center">NIT</th>
                    <th class="text-center">GENERO</th>
                    <th class="text-center">FECHANACIMIENTO</th>
                    <th class="text-center">TELEFONO</th>
                    <th class="text-center">DIRECCION</th>
                    <th class="text-center">IDCARGO</th>
                    <th class="text-center">ACCIONES</th>
                </tr>
            </thead>
               <tbody>
            <%
                    EmpleadoDAO dao=new EmpleadoDAO();
                    List<Empleado>list=dao.listarEmpleado();
                    Iterator<Empleado>iter=list.iterator();
                    Empleado em=null;
                    while(iter.hasNext()){
                        em=iter.next();
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
 
                    <td class="text-center"><%= em.getIdCa()%></td>
                    <td>
                      <a class="btn btn-warning" href="ControladorEmpleados?accion=EditarEmpleado&id=<%= em.getIdEmp()%>">Editar</a>

                        <a class="btn btn-danger" href="ControladorEmpleados?accion=eliminar&id=<%= em.getIdEmp()%>">Eliminar</a>
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
