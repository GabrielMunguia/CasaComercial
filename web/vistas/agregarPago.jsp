<%-- 
    Document   : index
    Created on : 10-04-2021, 03:05:28 PM
    Author     : GabrielMunguia
--%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.MetodoPago"%>
<%@page import="modeloDAO.MetodoPagoDAO"%>
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
                <div class="container-fluid d-flex justify-content-center align-items-center">

                    <div class="container">
                        <div class="col-12">
                            <h1>Registrar Pago</h1>
                            <form action="ControladorPago">
                                Id de Factura<br>
                                <input class="form-control" type="text"
                                       name="txtidFactura"required ><br>
                                Monto:<br>
                                <input class="form-control"required type="text"
                                       name="txtMonto"><br>
                               
                                <label for="inputPassword4" class="form-label">Metodo de pago</label>
                                                <select id="metodoPago" class="form-select" name="metodoPago"  required>
                                                    <%
                                                        MetodoPagoDAO dao = new MetodoPagoDAO();
                                                        List<MetodoPago> list = dao.listarMetodosPago();
                                                        Iterator<MetodoPago> iter = list.iterator();
                                                        MetodoPago m = null;
                                                        while (iter.hasNext()) {
                                                            m = iter.next();
                                                    %>

                                                    <option value="<%= m.getIdMetodoPago()%>"><%= m.getMetodo()%></option>
                                                    <%}%>


                                                </select>
                                
                                <br>
                                <input class="btn btn-primary" type="submit"
                                       name="accion" value="Agregar">
                                <a
                                    href="ControladorPago?accion=listarPago">Regresar</a>
                            </form>
                        </div>
                    </div>






                </div>
            </div>
        </section>
        <script type="module" src="./scripts/dash.js" crossorigin="anonymous"></script>
       
   <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>

        let exito =<%=request.getAttribute("exito")%>
        let pagado =<%=request.getAttribute("pagado")%>
        let debe =<%=request.getAttribute("debe")%>
         let factura =<%=request.getAttribute("factura")%>
     
        if (exito == false) {
             if (pagado == true) {
                  Swal.fire({
                title: 'Error!',
                text: 'El credito ya esta cancelado',
                icon: 'error',
                confirmButtonColor: 'red',
                confirmButtonText: 'OK'
            });
                 
             }else{
                  Swal.fire({
                title: 'Error!',
                text: 'El pago excede el monto a deber : $'+debe,
                icon: 'error',
                confirmButtonColor: 'red',
                confirmButtonText: 'OK'
            });
            
            
             }
           

        } else if (exito == true) {
           
            
            if(factura==true){
                Swal.fire({
                icon: 'success',
                title: 'Se registro el pago, y se emitio la factura',
                showConfirmButton: true,
                
            })
            }else{
                 Swal.fire({
                icon: 'success',
                title: 'Se registro correctamente',
                showConfirmButton: true,
               
            })
            }
        }
        </script>




    </body>
</html>
