<%-- 
    Document   : index
    Created on : 10-04-2021, 03:05:28 PM
    Author     : GabrielMunguia
--%>
<%@page import="modelo.Proveedor"%>
<%@page import="modeloDAO.ProveedorDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="modeloDAO.CategoriaDAO"%>
<%@page import="modelo.Usuario"%>
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
        <section class="home-section bg-white">

            <div>
                <div class="mt-3 d-flex justify-content-center align-items-center">


                    <div class="card col-12 col-lg-8  ">
                        <div class="card-header">
                            <h3>Editar Producto</h3>
                        </div>
                        <div class="card-body">
                            <div class="col-12 mt-3">
                                <%
                                    ProductoDAO daoProd = new ProductoDAO();
                                    int idP = Integer.parseInt((String) request.getAttribute("idProduct"));
                                    Producto pr = (Producto) daoProd.listProducto(idP);
                                %>
                             
                                <form action="ControladorProducto">
                                  
                                    Nombre del producto:<br>
                                    <input class="form-control" type="text" name="txtProducto" value="<%=pr.getProducto()%>"><br>
                                
                                    Descripcion:<br>
                                    <input class="form-control" type="text" name="txtDesc" value="<%=pr.getDescripcion()%>"><br>
                                    Marca:<br>
                                    <input class="form-control" type="text" name="txtMarca" value="<%=pr.getMarca()%>"><br>
                                     Categoria:<br>
                                    <Select class="form-control mb-4" id="cat"  name="txtCat"><br>
                                        <%
                                            CategoriaDAO dao2 = new CategoriaDAO();
                                            List<Categoria> list = dao2.listar();
                                            Iterator<Categoria> iter = list.iterator();
                                            Categoria cat = null;
                                            while (iter.hasNext()) {
                                                cat = iter.next();
    
                                        %>
    
                                        <option value="<%= cat.getIdCategoria()%>"><%= cat.getCategoria()%></option>
                                        <%}%>
                                    </select>
                                    Costo:<br>
                                    <input class="form-control" type="text" name="txtCosto" value="<%=pr.getCosto()%>"><br>
                                    Precio venta<br>
                                    <input class="form-control" type="text" name="txtPrecioVenta" value="<%=pr.getPrecioVenta()%>"><br>
                                 
                                    Stock:<br>
                                    <input class="form-control" type="text" name="txtStock" value="<%=pr.getStock()%>"><br>
                                       Proveedor<br>
                                    <!-- <input class="form-control" value="<%=pr.getIdProveedor()%>" type="text" name="txtIdProveedor"><br> -->
                                        <Select class="form-control mb-4" id="prev"  name="txtIdProveedor"><br>
                                        <%
                                            ProveedorDAO dao3 = new ProveedorDAO();
                                            List<Proveedor> list2 = dao3.listar();
                                            Iterator<Proveedor> iter2 = list2.iterator();
                                            Proveedor prov = null;
                                            while (iter2.hasNext()) {
                                                prov = iter2.next();
    
                                        %>
    
                                        <option value="<%= prov.getIdProveedor()%>"><%= prov.getNombre()%></option>
                                        <%}%>
                                    </select>
                              
                                   
                                    <input type="hidden" name="txtid" value="<%=pr.getIdProducto()%>">
    
                                    <input class="btn btn-primary" type="submit" name="accion" value="Actualizar">
                                    <a class="btn btn-warning" href="ControladorProducto?accion=listarProducto">Regresar</a>
                                </form>
                            </div>
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

            //asignar valor a la categoria
            let cat = <%=pr.getIdCategoria()%>;
            let select = document.querySelector("#cat");
            select.value = cat;
            
             //asignar valor al proveedor
            let prev = <%=pr.getIdProveedor()%>;
            let select2 = document.querySelector("#prev");
            select2.value = prev;
            

        </script>



    </body>
</html>
