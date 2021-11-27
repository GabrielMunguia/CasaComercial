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
                        <div class="d-flex flex-column justify-content-center align-items-center mt-4 ">
                            <h1>Digite el numero  del credito</h1>
                            <h5 class="mt-3" >Consulta lista de pagos</h5>
                        </div>

                        <form  action="ControladorPago">
                            <div class=" d-flex justify-content-center flex-column align-items-center">
                                <div class="col-5 mt-3">
                                
                                <input type="number" class="form-control" placeholder="Digite el numero del credito"  name="idCredito" >
                                <div id="emailHelp" class="form-text">En caso de no conocer el  numero del credito lo pudes consultar </div>
                            </div>

                            <input type="submit" class="btn btn-primary mt-4" type="submit" name="accion" value="Consultar"/>
                            </div>
                        </form>


                    </div>




                </div>






            </div>
        </div>
    </section>
        
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script type="module" src="./scripts/dash.js" crossorigin="anonymous"></script>

    <script>
        let error =<%=request.getAttribute("error")%>
        console.log(error)
        console.log(error);
        if (error === true) {
            Swal.fire({
                title: 'Error!',
                text: 'El credito no existe!',
                icon: 'error',
                confirmButtonColor: 'red',
                confirmButtonText: 'OK'
            });

        }
    </script>


</body>
</html>
