<%-- 
    Document   : addEmpleado
    Created on : 10-16-2021, 12:08:47 PM
    Author     : HP
--%>

<%@page import="modelo.Caja"%>
<%@page import="modeloDAO.CajaDAO"%>
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
                <div class="container-fluid d-flex justify-content-center align-items-center flex-column m-2">
                  
                    <%
                        CajaDAO dao = new CajaDAO();
                        Caja caja = dao.obtenerUltimaCaja(usr.getID());
                        
                    %>

                    <div class="card col-6">
                        <div class="card-header text-center  ">
                            <strong class="fs-4 text-center " >Cerrar caja</strong>
                        </div>
                        <form class="row g-3 mb-3  px-3 d-flex justify-content-center py-4" action='ControladorCaja'
                              class='bg-white   p-2 mt-5 rounded ws-80 ws-50 d-flex flex-column justify-content-center align-items-center'
                              method='GET'>
                            
                             <div class="col-12">
                                <label for="inputEmail4" class="form-label">Monto apertura </label>
                                <input class="form-control" type="number" step="any" disabled value="<%=caja.getMontoApertura()%>" />
                            </div>
                            
                            <div class="col-12">
                                <label for="inputEmail4" class="form-label">Ventas totales </label>
                                <input class="form-control" type="number" step="any" disabled value="<%=caja.getVentasTotales()%>" />
                            </div>
                            
                            <div class="col-12">
                                <label for="inputEmail4" class="form-label">Monto de cierre </label>
                                <input class="form-control" type="number" step="any" disabled value="<%=caja.getMontoCierre()%>" />
                            </div>
                            
                              <input type="hidden"  name="fechaCierre" id="fechaCierre" />
                              <div class="col-12">
                                   <label for="inputEmail4" class="form-label">Empleado receptor </label>
                              <select name="idEmpleadoReceptor" class="form-control" required>
                                  
                                     <%
                                                        EmpleadoDAO dao2 = new EmpleadoDAO();
                                                        List<Empleado> list2 = dao2.listarEmpleado();
                                                        Iterator<Empleado> iter2 = list2.iterator();
                                                        Empleado emp = null;
                                                        while (iter2.hasNext()) {
                                                            emp = iter2.next();

                                                    %>

                                                  
                                                  <option value="<%= emp.getIdEmp()%>"><%=emp.getNom()+" "+emp.getApellidos()%></option>
                                                  
                                                    <%}%>
                                </select>
                           
                            </div>


                            <div class="col-12 mt-5 d-flex justify-content-end">
                                <button type="submit" class="btn btn-primary" name='accion' value="cerrarCaja"
                                        type='submit'>Cerrar caja</button>
                            </div>
                        </form>

                    </div>

                </div>







            </div>
        </section>
                                 <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script type="module" src="./scripts/dash.js" crossorigin="anonymous"></script>
        <script>
            const fechaCierre = document.getElementById("fechaCierre");
 
         
            fechaCierre.value =getFechaCierre();
          
             let error =<%=request.getAttribute("exito")%>
          
  
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
            
            // setTimeout(()=>{
            //     //quitar cualquier dato que se mando por el request
            //     window.location.href = "ControladorCaja?accion=abrirCaja";
            // },1550)
        }


        function getFechaCierre(){
            const fecha = new Date();
            let dia = fecha.getDate();
            let mes = fecha.getMonth() + 1;
            let anio = fecha.getFullYear();
            let hora = fecha.getHours();
            let minuto = fecha.getMinutes();
            let segundo = fecha.getSeconds();
            //dejar con dos digitos
            dia = dia < 10 ? "0" + dia : dia;
            mes = mes < 10 ? "0" + mes : mes;
            hora = hora < 10 ? "0" + hora : hora;
            minuto = minuto < 10 ? "0" + minuto : minuto;
            segundo = segundo < 10 ? "0" + segundo : segundo;
            return anio+"-"+mes+"-"+dia+" "+hora+":"+minuto+":"+segundo;
        }

       
    
        </script>




    </body>
</html>
