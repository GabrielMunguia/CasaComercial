<%-- 
    Document   : addEmpleado
    Created on : 10-16-2021, 12:08:47 PM
    Author     : HP
--%>

<%@page import="modelo.Usuario"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.Cargo"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.EmpleadoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <div class="   d-flex justify-content-center align-items-center flex-column m-2">

                    <div class="card col-12 col-lg-8  ">
                        <div class="card-header  ">
                            <strong class="fs-4 " >Agregar Empleado</strong>
                        </div>
                        <div class="card-body">
                            <form class="row g-3 mb-3  px-1" action='ControladorEmpleados'
                            class='bg-white   p-2 mt-5 rounded ws-80 ws-50 d-flex flex-column justify-content-center align-items-center'
                            method='GET'>
                          <div class="col-md-6">
                              <label for="inputEmail4" class="form-label">Nombre</label>
                              <input type="text" class="form-control" name="txtNom" required>
                          </div>
                          <div class="col-md-6">
                              <label for="inputEmail4" class="form-label">Apellidos</label>
                              <input type="text" class="form-control" name="txtApellidos" required>
                          </div>
                          <div class="col-md-6">
                              <label for="inputPassword4" class="form-label">DUI</label>
                              <input type="text" class="form-control" name="txtDui" required>
                          </div>
                           <div class="col-md-6">
                              <label for="inputPassword4" class="form-label">NIT</label>
                              <input type="text" class="form-control" name="txtNIT" required>
                          </div>
                          
                          <div class="col-md-6">
                              <label for="inputPassword4" class="form-label">Direccion</label>
                              <textarea type="text" class="form-control" name="txtDireccion" required></textarea>
                          </div>
                          <div class="col-md-6">
                              <label for="inputPassword4" class="form-label">CORREO</label>
                              <input type="text" class="form-control" name="txtCorreo" required>
                          </div>

                          <div class="col-md-6">
                              <label for="inputPassword4" class="form-label">Fecha nacimiento</label>
                              <input type="date" class="form-control" name="txtFec" required>
                          </div>
                             <div class="col-md-6">
                              <label for="inputPassword4" class="form-label">Fecha de contratacion </label>
                              <input type="date" class="form-control" name="txtFechaContrato" required>
                          </div>
                          


                          <div class="col-md-6 mt-2">
                              <label for="inputPassword4" class="form-label">Genero</label>
                              <select class="form-select" name="txtGen" required>
                                  <option selected disabled>-</option>
                                  <option value="Masculino">Masculino</option>
                                  <option value="Femenino">Femenino</option>

                              </select>
                          </div>
                          <div class="col-md-6">
                              <label for="inputPassword4" class="form-label">Telefono</label>
                              <input type="text" class="form-control" name="txtTel" required>
                          </div>


                          <div class="col-12 mt-2 d-flex justify-content-end">
                              <button type="submit" class="btn btn-primary" name='accion' value="Agregar"
                                      type='submit'>Registrar</button>
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
