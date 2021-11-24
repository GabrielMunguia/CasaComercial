<%@page import="modelo.Credito"%>
<%@page import="modeloDAO.CreditoDAO"%>
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
                    <h1 class="m-3"> Lista de Creditos</h1>

                    <table class="table table-bordered table-striped ">
                        <thead>
                            <tr>
                                <th class="text-center">Numero credito</th>
                                <th class="text-center">Id cliente</th>
                                <th class="text-center">Id Empleado</th>
                                <th class="text-center">Fecha</th>
                                
                                <th class="text-center">Monto Credito</th>
                                <th class="text-center">Acciones</th>

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
                                <td class="d-flex  justify-content-center align-items-center">
                                    <button class="btn btn-danger mx-2 btnEliminar">Elminar </button>
                                    <a  class="d-none" href="ControladorCreditos?accion=eliminar&id=<%=f.getIdCredito()%>">Eliminar</a>
                                    <a class="btn btn-dark" href="ControladorCreditos?accion=detalleCredito&id=<%= f.getIdCredito()%>">Ver detalle</a>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>








                </div>
        </section>
        <script type="module" src="./scripts/dash.js" crossorigin="anonymous"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
