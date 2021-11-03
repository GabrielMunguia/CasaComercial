export const formAgregarEmpleado = `
   <div class="container-fluid d-flex justify-content-center align-items-center mt-2 ">
        <div class="card w-100">
            <div class="card-header">
             <strong>Agregar Empleado</strong>
            </div>
            <form class="row g-3 mb-3  px-1" action='Controlador' class='bg-white   p-2 mt-5 rounded ws-80 ws-50 d-flex flex-column justify-content-center align-items-center' method='GET'>
                <div class="col-md-6">
                  <label for="inputEmail4" class="form-label">Nombre completo</label>
                  <input type="text" class="form-control" name="nombresEmpleado" required>
                </div>
                <div class="col-md-6">
                    <label for="inputPassword4" class="form-label">DUI</label>
                    <input type="number" class="form-control" name="duiEmpleado" required>
                  </div>
                  <div class="col-md-6">
                    <label for="inputPassword4" class="form-label">NIT</label>
                    <input type="number" class="form-control" name="nitEmpleado" required>
                  </div>
               
                <div class="col-md-6">
                    <label for="inputPassword4" class="form-label">Fecha nacimiento</label>
                    <input type="datetime" class="form-control" name="nacEmpleado" required>
                </div>
              
              
                <div class="col-md-6 mt-2">
                    <label for="inputPassword4" class="form-label">Genero</label>
                    <select class="form-select" name="generoEmpleado" required>
                      <option selected disabled>-</option>
                      <option value="0">Masculino</option>
                      <option value="1">Femenino</option>
                
                    </select>
                  </div>
                  <div class="col-md-6">
                    <label for="inputPassword4" class="form-label">Telefono</label>
                    <input type="number" class="form-control" name="telEmpleado" required>
                  </div>
    
                  <div class="col-md-6">
                    <label for="inputPassword4" class="form-label">Direccion</label>
                    <textarea class="form-control" id="floatingTextarea" name="direccionEmpleado" ></textarea>
     
                  </div>
                  
            
                
                <div class="col-md-6 ">
                    <label for="inputPassword4" class="form-label">Cargo</label>
                    <select class="form-select" id="inputGroupSelect01" name="cargoEmpleado" required>
                      <option selected disabled>Seleccione un cargo</option>
                      <option value="1">Administrador</option>
                      <option value="2">Gerente</option>
                      <option value="3">Vendedor</option>
                    </select>
                  </div>
    
                  <div class="col-md-6 ">
                    <label for="inputEmail4" class="form-label">Usuario</label>
                    <input type="text" class="form-control" name="usuarioEmpleado" required>
                  </div>
                  <div class="col-md-6">
                    <label for="inputEmail4" class="form-label">Contraseña</label>
                    <input type="password" class="form-control" name="passwordEmpleado" required>
                  </div>
               
            
                 
            
            
                
                <div class="col-12 mt-2 d-flex justify-content-end">
                  <button type="submit" class="btn btn-primary"  name='accion''  value="aggEmpleado" type='submit'>Registrar</button>
                </div>
              </form>
         
          </div>
        
        </div>
`;