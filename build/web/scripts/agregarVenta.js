export const agregarVenta=`   <div id="formContainer">
    <div class="container-fluid d-flex justify-content-center align-items-center">





      <form class="row g-3  w-100 mt-2">

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
                  <input type="number" class="form-control mx-2" name="idEmpleado" placeholder="Agregar producto"
                    required="">
                  <input type="numer" class="form-control mx-2 w-25" name="idEmpleado" placeholder="cantidad"
                    required="">
                  <input type="button" class=" btn btn-outline-primary" id="aggProducto" value="Agregar">
                </div>
              </div>

              <div id="lstProd" class="container  overflow-auto">

                <div class="row">
                  <div class="col-12">
                    <table class="table table-image ">
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
                      <tbody overflow-x="">
                        <tr>
                          <th scope="row">1</th>
                          <td class="w-25">
                            <img src="https://i.ibb.co/KwJ7DZq/rtx.png" class="img-fluid" alt="quixote">
                          </td>
                          <td>RTX 3090 TI </td>
                          <td>$3000</td>
                          <td><input type="number" value="2" class="text-center border-0 btn"></td>
                          <td>$6000</td>
                          <td><input type="button" class="btn btn-danger" value="Eliminar"></td>
                        </tr>

                        <tr>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td>
                            <p>Total a pagar <strong>$6000</strong></p>
                          </td>
                        </tr>

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






        <div class="col-12 mt-2 d-flex justify-content-end">
          <button type="submit" class="btn btn-primary" name="form" value="registroEmpleado">Procesar
            pago</button>
        </div>
      </form>

    </div>
  </div>`;

