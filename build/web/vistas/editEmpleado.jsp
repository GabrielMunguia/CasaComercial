<%-- 
    Document   : addEmpleado
    Created on : 10-16-2021, 12:08:47 PM
    Author     : HP
--%>

<%@page import="modelo.Usuario"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.Cargo"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Empleado"%>
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
                case 2: {

                    aside = "gerente";
                }
                break;

                case 3: {

                    aside = "vendedor";
                }

                default: {
                    aside = "vendedor";
                }
                break;

            }


        %>
        <div id="<%= aside%>" class="sidebar open overflow-scroll ">

        </div>
        <section class="home-section bg-white ">

            <div>
                <div class="container-fluid d-flex justify-content-center align-items-center flex-column">
                    <%
                        EmpleadoDAO dao = new EmpleadoDAO();
                        int id = Integer.parseInt((String) request.getAttribute("idEmp"));
                        Empleado em = (Empleado) dao.list(id);
                    %>
                    <div class="card w-100">
                        <div class="card-header mb-2">
                            <strong>Editar Empleado</strong>
                        </div>
                        <form class="row g-3 mb-3  px-1" action='ControladorEmpleados'
                              class='bg-white   p-2 mt-5 rounded ws-80 ws-50 d-flex flex-column justify-content-center align-items-center'
                              method='GET'>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Nombres</label>
                                <input type="text" class="form-control" name="txtNom" value="<%=em.getNom()%>" required>
                            </div>

                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Apellidos</label>
                                <input type="text" class="form-control" name="txtApellidos" value="<%=em.getApellidos()%>" required>
                            </div>
                            <div class="col-md-6">
                                <label for="inputPassword4" class="form-label">DUI</label>
                                <input type="text" class="form-control" name="txtDui" value="<%=em.getDui()%>"required>
                            </div>

                            <div class="col-md-6">
                                <label for="inputPassword4" class="form-label">NIT</label>
                                <input type="text" class="form-control" name="txtNit" value="<%=em.getNIT()%>"  required>
                            </div>
                            <div class="col-md-6">
                                <label for="inputPassword4" class="form-label">Direccion</label>
                                <textarea  class="form-control" name="txtDireccion" required> <%=em.getDireccion()%></textarea>
                               
                            </div>
                            <div class="col-md-6">
                                <label for="inputPassword4" class="form-label">Correo</label>
                                <input type="text" class="form-control" name="txtCorreo" value="<%=em.getCorreo()%>"  required>
                            </div>
                            <div class="col-md-6">
                                <label for="inputPassword4" class="form-label">Fecha nacimiento</label>
                                <input type="date" class="form-control" name="txtFec" required value="<%=em.getFechNa()%>" >
                              
                            </div>
                            <div class="col-md-6">
                                <label for="inputPassword4" class="form-label">Fecha contratacion</label>
                                <input type="date" class="form-control" name="txtFechaContrato" required value="<%=em.getFechaContrato()%>" />
                              
                                
                            </div>


                            <div class="col-md-6 mt-2">
                                <label for="inputPassword4" class="form-label">Genero</label>
                                <select class="form-select" id="genero"  name="txtGen" required  >
                                    <option selected disabled>-</option>
                                    <option value="MASCULINO">Masculino</option>
                                    <option value="FEMENINO">Femenino</option>

                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="inputPassword4" class="form-label">Telefono</label>
                                <input type="text" class="form-control" name="txtTel" value="<%=em.getTel()%>" required>
                            </div>

                           

                            <input type="hidden" name="txtid" value="<%=em.getIdEmp()%>">
                            <div class="col-12 mt-2 d-flex justify-content-end">
                                <button type="submit" class="btn btn-primary" name='accion' value="Actualizar"
                                        type='submit'>Actualizar</button>
                            </div>
                        </form>

                    </div>

                </div>







            </div>
        </section>
        <script type="module" src="./scripts/dash.js" crossorigin="anonymous"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>


            if ('<%=em.getGen()%>' === 'MASCULINO') {
                document.querySelector("#genero").selectedIndex = 1;
            } else {
                document.querySelector("#genero").selectedIndex = 2;
            }






        </script>


    </body>
</html>
