<%@page import="modelo.Usuario"%>
<%@page import="modelo.Credito"%>
<%@page import="modelo.Credito"%>
<%@page import="modeloDAO.CreditoDAO"%>
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
        <title>CONBINI</title>
        <link rel="stylesheet" href="./css/style.css"/>
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/7fc2bb9c0c.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs5/dt-1.11.3/datatables.min.css"/>
        <!--font awesome con CDN-->  
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">  

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
                <div class="container-fluid d-flex justify-content-center align-items-center flex-column  col-11">
                    <h1 class="m-3"> Lista de Creditos</h1>
                    
                    <div class="col-12">
                        <table id="tabla"  class="p-2 mt-5 table table-striped table-bordered  col-12   "  style="width:100%">
                            <thead>
                                <tr class="bg-dark text-white">
                                    <th class="text-center">Numero credito</th>
                                    <th class="text-center">Id cliente</th>
                                    <th class="text-center">Id Empleado</th>
                                    <th class="text-center">Fecha</th>

                                    <th class="text-center">Monto Credito</th>
                                      
                                    <th class="text-center noExport">Acciones</th>
                                           

                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    CreditoDAO dao = new CreditoDAO();
                                    List<Credito> list = dao.listarCreditos();
                                    Iterator<Credito> iter = list.iterator();
                                    Credito f = null;
                                    while (iter.hasNext()) {
                                        f = iter.next();
                                %>



                                <tr>
                                    <td class="text-center"><%= f.getIdCredito()%></td>
                                    <td class="text-center"><%= f.getIdCLiente()%></td>
                                    <td class="text-center"><%= f.getIdEMpleado()%></td>
                                    <td class="text-center"><%= f.getFecha()%></td>
                                    <td class="text-center">$<%= f.getMontoCredito()%></td>
                                    
                                    <td class="d-flex  justify-content-center align-items-center noExport">
                                         <%if(usr.getIdCargo()==2){%>
                                        <button class="btn btn-danger mx-2 btnEliminar">Elminar </button>
                                        <a  class="d-none" href="ControladorCreditos?accion=eliminar&id=<%=f.getIdCredito()%>">Eliminar</a>
                                        <%}%>
                                        <a class="btn btn-info" href="ControladorCreditos?accion=detalleCredito&id=<%= f.getIdCredito()%>">Ver detalle</a>
                                    </td>
                                    
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>








                </div>
        </section>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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





        <script src="https://cdn.datatables.net/fixedheader/3.1.6/js/dataTables.fixedHeader.min.js"></script> 




 
        <script>


            document.addEventListener("DOMContentLoaded", () => {
                const botonesEliminar = document.querySelectorAll('.btnEliminar');
                for (btn of  botonesEliminar) {
                    btn.addEventListener('click', (e) => {
                        const link = e.target.parentNode.querySelector('.d-none');
                        Swal.fire({
                            title: 'Estas seguro de eliminarlo?',
                            text: "Este cambio eliminara por completo la factura",
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonColor: '#3085d6',
                            cancelButtonColor: '#d33',
                            confirmButtonText: 'Si, borralo!'

                        }).then((result) => {
                            console.log(result)
                            if (result.isConfirmed) {
                                Swal.fire(
                                        'Eliminado!',
                                        'La factura se elimino correctamente',
                                        'success'
                                        ).then((result) => {


                                    link.click();


                                })


                            }


                        })




                    });
                }


            });





        </script>



    </body>
</html>
