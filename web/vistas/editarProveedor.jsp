<%-- 
    Document   : agregarCategoria
    Created on : 9 nov 2022, 22:33:38
    Author     : Gabriel
--%>

<%@page import="modeloDAO.ProveedorDAO"%>
<%@page import="modelo.Proveedor"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        CONBINI
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
                <div class="container-fluid d-flex justify-content-center align-items-center flex-column m-2 py-4">

                    <div class="card w-50">
                        <div class="card-header  ">
                            <strong class="fs-4 " >Agregar proveedor</strong>
                        </div>
                  
                        <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        ProveedorDAO dao = new ProveedorDAO();
                        Proveedor proveedor = dao.listarId(id);
                        
                        %>
                        <form class="row g-3 mb-3  px-3" action='ControladorProveedor'
                              class='bg-white   p-4 mt-5 rounded ws-80 ws-50 d-flex flex-column justify-content-center align-items-center'
                              method='GET'>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Nombre </label>
                                <input type="text" class="form-control" name="txtNombre" value="<%=proveedor.getNombre()%>">
                            </div>
                          
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label
                                        ">Telefono</label>
                                <input type="text" class="form-control" name="txtTelefono" value="<%=proveedor.getTelefono()%>">
                            </div>

                          

                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label
                                        ">Correo</label>
                                <input type="text" class="form-control" name="txtCorreo" value="<%=proveedor.getCorreo()%>">
                            </div>

                            <div class="col-md-12">
                                <label for="inputEmail4" class="form-label">Direccion</label>
                              <textarea class="form-control" name="txtDireccion" required> <%=proveedor.getDireccion()%></textarea>
                            </div>
                            <input type="hidden" name="txtId" value="<%=proveedor.getIdProveedor()%>">

                            <div class="col-12 mt-2 d-flex justify-content-end">
                                <button type="submit" class="btn btn-primary" name='accion' value="Actualizar"
                                        type='submit'>Actualizar</button>
                            </div>
                        </form>

                    </div>

                </div>







            </div>
        </section>
                                 <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script type="module" src="./scripts/dash.js" crossorigin="anonymous"></script>
        <script>
             let error =<%=request.getAttribute("exito")%>
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
                title: 'Se registro correctamente',
                showConfirmButton: false,
                timer: 1500
            })
        }
        </script>




    </body>
</html>