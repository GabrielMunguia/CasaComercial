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
                  <form  action="ControladorProducto" enctype="multipart/form-data" class="container-fluid d-flex justify-content-center align-items-center">
                      <div class=" col-11 col-lg-6 mt-4 d-flex">
                          <div>
                              <button id="btnCargaMasiva" class="btn btn-primary">Carga masiva</button>
                              <a  href="http://localhost:8080<%=request.getContextPath()%>/assets/ejemploProductos.xlsx"id="btnDescargarPlantilla" class="btn btn-secondary" target="_blank">Descargar plantilla</a>
                          </div>
                          <div>
                            <button id="btnConfimar" disabled class="btn btn-primary mx-3 btn-secondary d-none" type="button" >Confimar</button>
                            <input class="d-none" id="btnSubmitCargaMasiva"  type="submit" name="accion" value="cargaMasiva">
                            <input class="d-none" id="lstProductos"  type="hidden" name="lstProductos" value="add">
                        </div>
                        <div>
                            <button id="btnCancelar" type="button" class="btn btn-primary mx-3 btn-danger d-none">Cancelar</button>
                        </div>
                          <input id="fileCargaMasiva" name="fileCargaMasiva" type="file" class="d-none"/>
                    </div>
                </form>
                <div class="container-fluid d-flex justify-content-center align-items-center">
                 


                    <div class="card col-11 col-lg-6 mt-4">
                        <div class="card-header">
                            <h1 class="text-center" >Agregar Producto</h1>
                        </div>
                        <div class="card-body">
                            <div class="col-12">
                                <div class="col-12 mt-3">

                                    <form action="ControladorProducto" enctype="multipart/form-data">
                                        Nombre del producto:<br>
                                        <input class="form-control" type="text" name="txtProducto"><br>
                                        Descripcion:<br>
                                        <input class="form-control" type="text" name="txtDesc"><br>
                                        Marca:<br>
                                        <input class="form-control" type="text" name="txtMarca"><br>
                                        Categoria:<br>
                                        <Select class="form-control mb-4"  name="txtCat"><br>
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
                                        <input class="form-control" type="text" name="txtCosto"><br>
                                        Precio contado:<br>
                                        <input class="form-control" type="text" name="txtPrecioVenta"><br>

                                        Stock:<br>
                                        <input class="form-control" type="text" name="txtStock"><br>
                                        Proveedor<br>

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





                                        <br>
                                        <input class="btn btn-primary" type="submit" name="accion" value="Agregar">
                                        <a class="btn btn-warning" href="ControladorProducto?accion=listarProducto">Regresar</a>
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>





                </div>
            </div>
        </section>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.8.0/jszip.js"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.8.0/xlsx.js"></script>


        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script type="module" src="./scripts/dash.js" crossorigin="anonymous"></script>
        <script>
            const btnDescargarPlantilla = document.getElementById("btnDescargarPlantilla");
          
            const lstProductos= document.getElementById("lstProductos");
            const btnConfimar = document.getElementById("btnConfimar");
            const btnCancelar = document.getElementById("btnCancelar");
            const btnCargaMasiva = document.getElementById("btnCargaMasiva");
            const fileCargaMasiva = document.getElementById("fileCargaMasiva");
            const btnSubmitCargaMasiva= document.getElementById("btnSubmitCargaMasiva");
          

            
         
            let error =<%=request.getAttribute("exito")%>

            
            document.addEventListener('DOMContentLoaded', () => {
                btnCancelar.addEventListener("click",Cancelar);
                btnConfimar.addEventListener("click",subirCargaMasiva);
                fileCargaMasiva.addEventListener("change",cargarDatosExcel);

             
 
            
            btnCargaMasiva.addEventListener("click",async (e) => {
                e.preventDefault();
                //reinciar el input file
                btnConfimar.classList.remove("btn-success");
                btnConfimar.classList.add("btn-secondar");
                btnConfimar.disabled=true;
                
               
                  
                fileCargaMasiva.value = "";
             fileCargaMasiva.click();

                btnConfimar.classList.remove("d-none");
                btnCancelar.classList.remove("d-none");
             

          
            });

            });


            const Cancelar = (e) => {
                e.preventDefault();
                btnConfimar.classList.add("d-none");
                btnCancelar.classList.add("d-none");
            }

            const subirCargaMasiva = async (e) => {
                //confirmar swal
                e.preventDefault();
                console.log('click')
                const { isConfirmed } = await Swal.fire({
                    title: '¿Estas seguro de cargar el archivo?',
                    text: "Se cargaran los productos al sistema",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Si, subir!'
                })
                if (isConfirmed) {
                 
                    btnSubmitCargaMasiva.click();
                }
            
            }

            //leer excel
            const cargarDatosExcel=async()=>{
          
              try {
                const file = fileCargaMasiva.files[0];
                const reader = new FileReader();
                //validar que sea un archivo excel
                if (file.type !== "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Solo se permiten archivos excel',
                        showConfirmButton: false,
                        timer: 1500

                    })
                    return;
                }
                reader.readAsBinaryString(file);
                reader.onload = async (e) => {
                    const data = e.target.result;
                    const workbook = XLSX.read(data, {
                        type: "binary"
                    });
                    const sheetName = workbook.SheetNames[0];
                    const worksheet = workbook.Sheets[sheetName];
                    const arrayProd = XLSX.utils.sheet_to_json(worksheet);
                    let lstProd="";
                    let errorCarga = false;
                    console.log(arrayProd)
                    
                     arrayProd.map(produc => {
                        const { Nombre,Costo,Descripcion,Marca,Stock,idCategoria,idProveedor,precio}=produc;
                        if(!validarProductoCargaMasiva(produc)){
                   
                            
                            errorCarga=true;
                          return ;
                        }
                      
                        console.log(produc)
            
                        lstProd+="Nombre:"+Nombre+"-Costo:"+Costo+"-Descripcion:"+Descripcion+"-Marca:"+Marca+"-Stock:"+Stock+"-idCategoria:"+idCategoria+"-idProveedor:"+idProveedor+"-precio:"+precio+"|";
                        
                    });
                    if(errorCarga){
                      await  Swal.fire({
                                icon: 'error',
                                title: 'Oops...',
                                text: 'El archivo contiene errores',
                                showConfirmButton: false,
                                timer: 1500

                            })
                            btnConfimar.classList.remove("btn-success");
                btnConfimar.classList.add("btn-secondar");
                            btnConfimar.disabled=true;
                     
                        
                        return ;
                    }
               
                    lstProd=lstProd.substring(0,lstProd.length-1);
                    lstProductos.value=lstProd;
             
                    btnConfimar.disabled=false;
                    btnConfimar.classList.remove("btn-secondar");
                    btnConfimar.classList.add("btn-success");
                    await Swal.fire({
                        title: 'Exito',
                        text: "Archivo valido , puedes subirlo",
                        icon: 'success',
                        showCancelButton: false
                        ,showConfirmButton:false,
                        timer: 2000

                        
                    })

                  
                }
              } catch (error) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'El formato del archivo no es el correcto',
                })
                
              }
             

              
                 

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


        //funcion validar prod carga masiva
        const validarProductoCargaMasiva=(produc)=>{
            let sonValidos=true;
          try {
            let { Nombre,Costo,Descripcion,Marca,Stock,idCategoria,idProveedor,precio}=produc;
            console.log(produc)
      
            //validar si algun campo esta vacio o nulo
            if(Nombre=="" ||Costo=="" || Descripcion=="" || Marca=="" || Stock=="" || idCategoria=="" || idProveedor=="" || precio==""
            || Nombre==null || Costo==null || Descripcion==null || Marca==null || Stock==null || idCategoria==null || idProveedor==null || precio==null
            ){
                alert("El archivo contiene campos vacios")
                sonValidos=false;
            }

            //pasar costo a double,string a int,idProveedor a int,idCategoria a int  y precio a double,stock a int
            Costo=parseFloat(Costo);
            Stock=parseInt(Stock);
            idCategoria=parseInt(idCategoria);
            idProveedor=parseInt(idProveedor);
            precio=parseFloat(precio);
         
            if(isNaN(Costo) || isNaN(Stock) || isNaN(idCategoria) || isNaN(idProveedor) || isNaN(precio)){
                sonValidos=false;
              
            }
          } catch (error) {
            sonValidos=false;
            
          }
            return sonValidos;

            
           
            
            

        }



        </script>



    </body>
</html>
