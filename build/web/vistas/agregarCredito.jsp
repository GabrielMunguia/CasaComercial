<%-- 
    Document   : agregarVenta
    Created on : 11-02-2021, 07:56:16 PM
    Author     : GabrielMunguia
--%>

<%@page import="java.util.Iterator"%>
<%@page import="modelo.MetodoPago"%>
<%@page import="modeloDAO.MetodoPagoDAO"%>
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
                        <div class="container-fluid d-flex justify-content-center align-items-center flex-column">



                            <form class="row g-3  w-100 mt-2" action="ControladorCreditos" method="POST">


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
                                                <label for="inputEmail4" class="form-label">ID Empleado</label>
                                                <input type="number" class="form-control" name="idEmpleado" required="">
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
                                                           >
                                                    <input type="numer" class="form-control mx-2 w-25" id="cantidadProd"  placeholder="cantidad"
                                                           >
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
                                                                                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td>   <p>Total Credito <strong>$<span id="total">0.00</span></strong></p></td>
                                                                    <td>
                                                                      
                                                                    </td>
                                                                </tr>

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



//            <%ProductoDAO p = new ProductoDAO();
    List<Producto> strList = p.listar();
        %>
        let lstProductos = [<% for (int i = 0; i < strList.size(); i++) {%>{
        Nombre :"<%= strList.get(i).getNombre()%>", Precio :"<%= strList.get(i).getPrecioCredito()%>",
        Imagen :"<%= strList.get(i).getFotografia()%>",
                Stock :"<%= strList.get(i).getStock()%>", id :"<%= strList.get(i).getId()%>"}<%= i + 1 < strList.size() ? "," : ""%><% }%>
        ];
        lstProductos = lstProductos.filter((prod) => prod.Stock > 0);
        console.log(lstProductos);
const calcularTotal=()=>{
      const total=document.querySelector('#total');
            let numTotal=0;
            const subTotales=document.querySelectorAll('.subTotal');
            
            for(sub of subTotales){
             const subt=parseFloat(sub.textContent.replace('$',''));
             numTotal+=subt;
            }
           total.textContent=numTotal;
}

        const btnAgregarProd = document.querySelector("#aggProducto");
        const idProd = document.querySelector("#idProd");
        const tabla = document.querySelector("#tabla");
        tabla.addEventListener('DOMNodeInserted',()=>{
          calcularTotal();
            
        })
        const x2 = document.createElement("tr");
        let contador = 1;
        let arrayIdProduCompra = "";
        const inputHidden = document.querySelector("#lstProdCompra");
        let btnEliminar;
        btnAgregarProd.addEventListener("click", () => {
            const id = document.querySelector("#idProd");
            const cantidad = document.querySelector("#cantidadProd");
            const lst = lstProductos.filter((prod) => prod.id === id.value);
            if (lst.length > 0) {
                const prod = lst[0];
                let arrayAux = arrayIdProduCompra.split(',');
                let encontrado = false;
                let arrayAux2 = [];
                let x = false;
                if (arrayAux.length > 1) {
                    for (let i = 0; i < arrayAux.length; i++) {


                        if (i % 2 == 0) {


                            if (arrayAux[i] == prod.id) {
                                encontrado = true;
                                x = true;
                            }
                            arrayAux2.push(arrayAux[i]);
                        } else {
                            if (encontrado) {
                                arrayAux2.push(parseInt(arrayAux[i]) + parseInt(cantidad.value));
                                const input = obtenerInput(prod.id);
                                input.value = parseInt(arrayAux[i]) + parseInt(cantidad.value);
                                const precio = input.parentElement.parentElement.querySelector(".precioProd").textContent.replace("$", "");
                                const subTotal = input.parentElement.parentElement.querySelector(".subTotal");

                                subTotal.textContent = "$" + (parseFloat(precio) * parseInt(parseInt(arrayAux[i]) + parseInt(cantidad.value)));
                               

                                encontrado = false;

                            } else {
                                arrayAux2.push(arrayAux[i]);
                            }
                        }

                    }
//       console.log(arrayAux2);

                    arrayIdProduCompra = arrayAux2 + "";
                    inputHidden.value = JSON.stringify(arrayIdProduCompra);
                }
                if (!x) {
                    arrayIdProduCompra += prod.id + "," + cantidad.value + ",";
//      console.log(arrayIdProduCompra);
                    const x =
                            " <tr><th scope='row'>" +
                            contador +
                            "</th><td class='w-25'> <img src='" +
                            prod.Imagen +
                            "' class='img-fluid' alt='quixote' ></td> <td>" +
                            prod.Nombre +
                            "</td> <td class='precioProd'>$" +
                            prod.Precio +
                            "</td> <td><input type='number' max='" + prod.Stock + "'idInput='" + prod.id + "' value='" +
                            cantidad.value +
                            "' class='text-center border-0 btn input-cantidad'></td><td class='subTotal'>$" +
                            cantidad.value * prod.Precio +
                            "</td> <td><input type='button' class='btn btn-danger btnEliminarProd' id=" +
                            prod.id +
                            " value='Eliminar' ></td></tr>";
                    tabla.innerHTML += x;
                    contador++;
                    inputHidden.value = JSON.stringify(arrayIdProduCompra);
                }


//       console.log(arrayAux2);


                aggBtnEliminar();
                procesarCambiosCantidad();
            } else {
                Swal.fire({
                    title: 'Error!',
                    text: 'El producto no se encuentra disponible',
                    icon: 'error',
                    confirmButtonColor: 'red',
                    confirmButtonText: 'OK'
                });
            }
        });

        const aggBtnEliminar = () => {

            btnEliminar = document.querySelectorAll(".btnEliminarProd");
            for (btn of btnEliminar) {

                btn.addEventListener("click", (e) => {
                    

                    let arrayAux = arrayIdProduCompra.split(',');
                    let encontrado = false;
                    let arrayAux2 = [];
                    for (let i = 0; i < arrayAux.length; i++) {


                        if (i % 2 == 0) {


                            if (arrayAux[i] == e.target.id) {

                                encontrado = true;
                                console.log("SE ENCONTRO LA COINCIDENCIA");
                            } else {
                                console.log("se agrego " + arrayAux[i]);
                                arrayAux2.push(arrayAux[i]);
                            }
                        } else {
                            if (encontrado) {
                                encontrado = false;
                                console.log("SE ENCONTRO LA CANITDAD DE PAR");
                            } else {
                                console.log("se agrego " + arrayAux[i]);
                                arrayAux2.push(arrayAux[i]);
                            }
                        }

                    }
                    arrayIdProduCompra = arrayAux2 + "";
                    inputHidden.value = JSON.stringify(arrayIdProduCompra);

                    tabla.removeChild(e.target.parentNode.parentNode);
                      calcularTotal();


                });
            }
            ;
        }

        const obtenerInput = (id) => {
            const inputs = document.querySelectorAll('.input-cantidad');
            console.log(inputs);
            console.log(id)
            return Object.values(inputs).filter((inp) => inp.getAttribute("idinput") == id)[0];
        };

        const procesarCambiosCantidad = () => {

            const inputsCantidad = document.querySelectorAll('.input-cantidad');
            for (input of inputsCantidad) {
                input.addEventListener('change', (e) => {

                    let arrayAux = arrayIdProduCompra.split(',');
                    let encontrado = false;
                    let arrayAux2 = [];
                    for (let i = 0; i < arrayAux.length; i++) {
                        if (i % 2 == 0) {


                            if (arrayAux[i] == e.target.getAttribute("idinput")) {
                                encontrado = true;
                                arrayAux2.push(arrayAux[i]);
                            } else {
                                arrayAux2.push(arrayAux[i]);
                            }
                        } else {
                            if (encontrado) {
                                arrayAux2.push(e.target.value);
                            } else {
                                arrayAux2.push(arrayAux[i]);
                            }
                        }

                    }

                    arrayIdProduCompra = arrayAux2 + "";
                    inputHidden.value = JSON.stringify(arrayIdProduCompra);

                    const precio = e.target.parentElement.parentElement.querySelector(".precioProd").textContent.replace("$", "");
                    const subTotal = e.target.parentElement.parentElement.querySelector(".subTotal");
                    subTotal.textContent = "$" + (parseFloat(precio) * parseInt(parseInt(e.target.value)));

                });
            }

        }



    </script>




</body>
</html>
