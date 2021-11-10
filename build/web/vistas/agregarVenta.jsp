<%-- 
    Document   : agregarVenta
    Created on : 11-02-2021, 07:56:16 PM
    Author     : GabrielMunguia
--%>

<%@page import="modelo.Producto"%>
<%@page import="java.util.List"%>
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
        <div id="dash" class="sidebar open overflow-scroll">

        </div>
        <section class="home-section bg-white ">

            <div>
                <div class="container-fluid d-flex justify-content-center align-items-center">

                    <div id="formContainer">
                        <div class="container-fluid d-flex justify-content-center align-items-center">





                            <form class="row g-3  w-100 mt-2" action="ControladorFactura">

                                <div class="col-sm-12 ">
                                    <div class="card">
                                        <div class="card-header">
                                            <strong>Ingreso de datos</strong>

                                        </div>
                                        <div class="card-body row">
                                            <div class="col-md-6">
                                                <label for="inputEmail4" class="form-label">ID Cliente</label>
                                                <input type="number" class="form-control" name="idClienteFactura" required="">
                                            </div>
                                            <div class="col-md-6">
                                                <label for="inputEmail4" class="form-label">Fecha</label>
                                                <input type="date" class="form-control" name="fechaFactura" required="">
                                            </div>
                                            <div class="col-md-6">
                                                <label for="inputEmail4" class="form-label">ID Empleado</label>
                                                <input type="number" class="form-control" name="idEmpleado" required="">
                                            </div>
                                            <div class="col-md-6 ">
                                                <label for="inputPassword4" class="form-label">Metodo de pago</label>
                                                <select id="metodoPago" class="form-select" required="">
                                                    <option value="1" selected="">Efectivo</option>
                                                    <option value="2">Tarjeta</option>


                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>



                                <div id="datosPago" class="my-2">

                                </div>


                                <div class="col-sm-12 ">
                                    <div class="card">
                                        <div class="card-header">
                                            <strong>Agregar productos</strong>

                                        </div>
                                        <div class="card-body row">
                                            <div class="col-md-12 ">
                                                <label for="inputEmail4" class="form-label">ID Producto</label>
                                                <div class="d-flex">
                                                    <input type="number" class="form-control mx-2" id="idProd" placeholder="Agregar producto"
                                                           required="">
                                                    <input type="numer" class="form-control mx-2 w-25" id="cantidadProd"  placeholder="cantidad"
                                                           required="">
                                                    <input type="button" class=" btn btn-outline-primary" id="aggProducto" value="Agregar">
                                                </div>
                                            </div>

                                            <div id="lstProd" class="container  overflow-auto">

                                                <div class="row">
                                                    <div class="col-12">
                                                        <table class="table table-image  ">
                                                            <thead>
                                                                <tr>
                                                                    <th scope="col">#</th>
                                                                    <th scope="col">Imagen</th>
                                                                    <th scope="col">Nombre</th>
                                                                    <th scope="col">Precio</th>
                                                                    <th scope="col">Cantidad</th>
                                                                    <th scope="col">Sub total</th>
                                                                    <th scope="col">Accion</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="tabla">


                                                            </tbody>
                                                            <tfoot>

                                                            </tfoot>

                                                        </table>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" id="lstProdCompra" name="lstProd">



                                <div class="col-12 mt-2 d-flex justify-content-end">
                                     <input class="btn btn-primary" type="submit"
                                       name="accion" value="Pagar">
                                <a
                                </div>
                            </form>

                        </div>
                    </div>




                </div>
            </div>
        </section>
        <script type="module" src="./scripts/dash.js" crossorigin="anonymous"></script>

        <script>

//            <%ProductoDAO p = new ProductoDAO();
                  List<Producto> strList = p.listar();
              %>
            const lstProductos = [<% for (int i = 0; i < strList.size(); i++) {%>{
            Nombre :"<%= strList.get(i).getNombre()%>", Precio :"<%= strList.get(i).getPrecio()%>",
                    Imagen :"<%= strList.get(i).getFotografia()%>", id :"<%= strList.get(i).getId()%>"}<%= i + 1 < strList.size() ? "," : ""%><% }%>
            ];
            const btnAgregarProd = document.querySelector('#aggProducto');
            const idProd = document.querySelector('#idProd');
            const tabla = document.querySelector('#tabla');
            const x2 = document.createElement('tr');
            let contador =1;
            let arrayIdProduCompra=[];
            const inputHidden=document.querySelector("#lstProdCompra");
            let btnEliminar;
            btnAgregarProd.addEventListener('click', () => {
                const id = document.querySelector('#idProd');
                const cantidad = document.querySelector('#cantidadProd');
                const lst = lstProductos.filter((prod) => prod.id === id.value);
                if (lst.length > 0) {
                    const prod = lst[0];
                    arrayIdProduCompra.push({id:prod.id,cantidad:cantidad.value});
                    const x = " <tr><th scope='row'>"+contador+"</th><td class='w-25'> <img src='" + prod.Imagen + "' class='img-fluid' alt='quixote' ></td> <td>" + prod.Nombre +
                            "</td> <td>$" + prod.Precio + "</td> <td><input type='number' value='" + cantidad.value + "' class='text-center border-0 btn'></td><td>" + (cantidad.value * prod.Precio) + "</td> <td><input type='button' class='btn btn-danger btnEliminarProd' id="+prod.id+" value='Eliminar' ></td></tr>";
                    tabla.innerHTML += x;
                    contador++;
                    inputHidden.value=JSON.stringify(arrayIdProduCompra);
                    
                    
                     btnEliminar=document.querySelectorAll('.btnEliminarProd');
                    for(btn of btnEliminar){
                        btn.addEventListener('click',()=>{
                  
                          arrayIdProduCompra=  arrayIdProduCompra.filter((prod)=>prod.id!==btn.id);
                          tabla.removeChild(btn.parentNode.parentNode)
                             console.log(arrayIdProduCompra)
                             
                               inputHidden.value=JSON.stringify(arrayIdProduCompra);
                        })
                    }
                     
                    
                }
                
            });
            
          
        </script>




    </body>
</html>
