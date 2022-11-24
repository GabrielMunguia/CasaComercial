<%-- 
    Document   : addEmpleado
    Created on : 10-16-2021, 12:08:47 PM
    Author     : HP
--%>

<%@page import="modeloDAO.UsuarioDAO"%>
<%@page import="modelo.Empleado"%>
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
            UsuarioDAO daoUsuario= new UsuarioDAO();

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
                 int idU = Integer.parseInt((String) request.getAttribute("idUsuario"));
           Usuario UsuarioEdit = daoUsuario.obtenerUsuario(idU);

            
        %>
        <div id="<%= aside %>" class="sidebar open overflow-scroll ">

        </div>
        <section class="home-section bg-white ">

            <div>
                <div class="container-fluid d-flex justify-content-center align-items-center flex-column m-2">

                    <div class="card w-100">
                        <div class="card-header w-100 text-center  ">
                            <strong class="fs-4 texte-center w-100" >Editar usuario</strong>
                        </div>
                        <form class="row g-3 mb-3  px-1" action='ControladorUsuarios'
                              class='bg-white   p-2 mt-5 rounded ws-80 ws-50 d-flex flex-column justify-content-center align-items-center'
                              method='GET'>
                            <input value="<%=UsuarioEdit.getID()%>"  type="hidden" class="form-control" name="idUser" required>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Empleado</label>
                               <%
                                                        EmpleadoDAO dao = new EmpleadoDAO();
                                                       Empleado emp = dao.getEmpleadoByUsuario(UsuarioEdit.getID());
                                                       

                                                    %>
                                <select class="form-control" required disabled>
                                   
                                  

                                                    <option selected value="<%= emp.getIdEmp()%>"><%=emp.getNom()+" "+emp.getApellidos()%></option>
                                                           </select>
                              <input  name="txtIdEmpleado"  value="<%= emp.getIdEmp()%>" type="hidden" class="form-control"  required>
                                                    <%%>
                                                    
                                                    
                         
                                
                            </div>
                                  
                                 <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Rol</label>
                           
                                <select name="txtIdRol" class="form-control" required>
                                 
                                    <option value="1"  <%=UsuarioEdit.getIdCargo()==1?"selected":""%> >Admnistrador</option>
                                     <option value="2" <%=UsuarioEdit.getIdCargo()==2?"selected":""%>>Gerente</option>
                                    <option value="3" <%=UsuarioEdit.getIdCargo()==3?"selected":""%> >Vendedor</option>
                                
                                 
                                 
                                </select>
                            </div>
                          <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Usuario</label>
                                <input value="<%=UsuarioEdit.getUsuario()%>"  type="text" class="form-control" name="txtUsuario" required>
                            </div>
                                
                            <div class="col-md-6">
                                <label for="inputPassword4" class="form-label">Contraseña</label>
                                <input type="password" class="form-control" name="txtPassword" >
                            </div>
                           

                            <div class="col-12 mt-2 d-flex justify-content-end">
                                <button type="submit" class="btn btn-primary" name='accion' value="actualizar"
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
             let usuarioError= <%=request.getAttribute("errorUsuario")%>
             
             if(usuarioError){
                Swal.fire({
                title: 'Error!',
                text: 'El usuario ya existe',
                icon: 'error',
                confirmButtonColor: 'red',
                confirmButtonText: 'OK'
            });  
            
          
             }
  
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