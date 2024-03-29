<%@page import="modelo.Usuario"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Cliente"%>
<%@page import="modeloDAO.ClienteDAO"%>
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
                <div class="container-fluid d-flex justify-content-center align-items-center flex-column  col-12">
                  <h1 class="m-3"> Lista de Clientes</h1>

                    <div class="col-12">
                        <table id="tabla"  class="p-2 mt-5 table table-striped table-bordered  col-12   "  style="width:100%">
                            <thead>
                               <tr class="bg-dark text-white">
                            <th class="text-center">ID</th>
                            <th class="text-center">NOMBRE</th>
                            <th class="text-center">DUI</th>
                            <th class="text-center">NIT</th>
                            <th class="text-center">DIRECCI�N</th>
                            <th class="text-center">TEL�FONO</th>
                            
                            <%if(usr.getIdCargo()==1||usr.getIdCargo()==2){ %>

                           
                            <th class="text-center noExport">ACCIONES</th>
                            <% } %>
                             
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
                           <%if(usr.getIdCargo()==1||usr.getIdCargo()==2){ %>
                            <td class="text-center noExport">
                                <a class="btn btn-warning" href="ControladorCliente?accion=editar&id=<%= c.getIdCliente()%>">Editar</a>
                       
                                 <%if(usr.getIdCargo()==2){%>
                                    <a  class="d-none" href="ControladorCliente?accion=eliminar&id=<%= c.getIdCliente()%>">Eliminar</a>
                                        <a class="btn btn-danger btnEliminar">Eliminar</a>
                                        <%}%>
                            </td>
                        <% } %>
                        </tr>
                        <%}%>
                    </tbody>
                        </table>
                    </div>








                </div>
        </section>
        <script type="module" src="./scripts/dash.js" crossorigin="anonymous"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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

<script>


            document.addEventListener("DOMContentLoaded", () => {
                const botonesEliminar = document.querySelectorAll('.btnEliminar');
                for (btn of  botonesEliminar) {
                    btn.addEventListener('click', (e) => {
                        const link = e.target.parentNode.querySelector('.d-none');
                        Swal.fire({
                            title: 'Estas seguro de eliminarlo?',
                            text: "Se eliminara el cliente",
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonColor: '#3085d6',
                            cancelButtonColor: '#d33',
                            confirmButtonText: 'Si, borralo!'

                        }).then((result) => {
                            console.log(result)
                            if (result.isConfirmed) {



                                link.click();





                            }


                        })




                    });
                }


            });

            let error =<%=request.getAttribute("exito")%>
            let elim =<%=request.getAttribute("eliminado")%>
            console.log(error);
            if (error === false) {
                Swal.fire({
                    title: 'Error!',
                    text: 'Porfavor verifique los datos',
                    icon: 'error',
                    confirmButtonColor: 'red',
                    confirmButtonText: 'OK'
                });

            } else if (error == true) {
                Swal.fire({
                    icon: 'success',
                    title: 'Se actualizo correctamente',
                    showConfirmButton: false,
                    timer: 1500
                })
            }
            if (elim === false) {
                Swal.fire({
                    title: 'Error!',
                    text: 'No se puede eliminar el cliente por que se necesita mantener su registro',
                    icon: 'error',
                    confirmButtonColor: 'red',
                    confirmButtonText: 'OK'
                });

            } else if (elim == true) {
                Swal.fire({
                    icon: 'success',
                    title: 'Se elimino correctamente',
                    showConfirmButton: false,
                    timer: 1500
                })
            }





        </script>

    </body>
</html>
