<%-- 
    Document   : addEmpleado
    Created on : 10-16-2021, 12:08:47 PM
    Author     : HP
--%>

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
                <div class="container-fluid d-flex justify-content-center align-items-center flex-column m-2">

                    <div class="card w-100">
                        <div class="card-header  ">
                            <strong class="fs-4" >Agregar Empleado</strong>
                        </div>
                        <form class="row g-3 mb-3  px-1" action='ControladorEmpleados'
                              class='bg-white   p-2 mt-5 rounded ws-80 ws-50 d-flex flex-column justify-content-center align-items-center'
                              method='GET'>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Nombre completo</label>
                                <input type="text" class="form-control" name="txtNom" required>
                            </div>
                            <div class="col-md-6">
                                <label for="inputPassword4" class="form-label">DUI</label>
                                <input type="number" class="form-control" name="txtDui" required>
                            </div>
                            <div class="col-md-6">
                                <label for="inputPassword4" class="form-label">NIT</label>
                                <input type="number" class="form-control" name="txtNit" required>
                            </div>

                            <div class="col-md-6">
                                <label for="inputPassword4" class="form-label">Fecha nacimiento</label>
                                <input type="date" class="form-control" name="txtFec" required>
                            </div>


                            <div class="col-md-6 mt-2">
                                <label for="inputPassword4" class="form-label">Genero</label>
                                <select class="form-select" name="txtGen" required>
                                    <option selected disabled>-</option>
                                    <option value="MASCULINO">Masculino</option>
                                    <option value="FEMENINO">Femenino</option>

                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="inputPassword4" class="form-label">Telefono</label>
                                <input type="number" class="form-control" name="txtTel" required>
                            </div>

                            <div class="col-md-6">
                                <label for="inputPassword4" class="form-label">Direccion</label>
                                <textarea class="form-control" id="floatingTextarea" name="txtDir"></textarea>

                            </div>



                            <div class="col-md-6 ">
                                <label for="inputPassword4" class="form-label">Cargo</label>
                                <select class="form-select" id="inputGroupSelect01" name="txtCar" required>
                    <%
                    EmpleadoDAO dao=new EmpleadoDAO();
                    List<Cargo>list=dao.listarCargo();
                    Iterator<Cargo>iter=list.iterator();
                    Cargo car=null;
                    while(iter.hasNext()){
                        car=iter.next();
                    %>
                
                    <option value="<%= car.getIdCa()%>"><%= car.getCargo()%></option>
                    <%}%>
                                </select>
                            </div>

                            <div class="col-md-6 ">
                                <label for="inputEmail4" class="form-label">Usuario</label>
                                <input type="text" class="form-control" name="txtUsu" required>
                            </div>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Contraseña</label>
                                <input type="password" class="form-control" name="txtPas" required>
                            </div>






                            <div class="col-12 mt-2 d-flex justify-content-end">
                                <button type="submit" class="btn btn-primary" name='accion' value="Agregar"
                                        type='submit'>Registrar</button>
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
