export const formAgregarEmpleado = `
<div class="container-fluid d-flex justify-content-center align-items-center">
<form class="row g-3">
    <div class="col-md-6">
      <label for="inputEmail4" class="form-label">Nombres</label>
      <input type="text" class="form-control" name="nombresEmpleado" required>
    </div>
    <div class="col-md-6">
      <label for="inputPassword4" class="form-label">Apellidos</label>
      <input type="text" class="form-control" name="apellidosEmpleado" required>
    </div>
    <div class="col-md-6">
        <label for="inputPassword4" class="form-label">Fecha nacimiento</label>
        <input type="date" class="form-control" name="nacEmpleado" required>
    </div>
    <div class="col-md-6">
        <label for="inputPassword4" class="form-label">DUI</label>
        <input type="number" class="form-control" name="duiEmpleado" required>
      </div>
      <div class="col-md-6">
        <label for="inputPassword4" class="form-label">NIT</label>
        <input type="number" class="form-control" name="nitEmpleado" required>
      </div>
  
    <div class="col-md-6 mt-2">
        <label for="inputPassword4" class="form-label">Pais</label>
        <select class="form-select" id="inputGroupSelect01" required>
          <option selected disabled>Seleccione un cargo</option>
          <option value="SV">El salvador</option>
          <option value="GT">Guatemala</option>
          <option value="EEUU">USA</option>
        </select>
      </div>
      <div class="col-md-6 mt-2">
        <label for="inputPassword4" class="form-label">Departamento</label>
        <select class="form-select" id="inputGroupSelect01" required>
          <option selected disabled>Seleccione un cargo</option>
          <option value="sonsonate">Sonsonate</option>        
        </select>
      </div>
      <div class="col-md-6 mt-2">
        <label for="inputPassword4" class="form-label">Municipio</label>
        <select class="form-select" id="inputGroupSelect01" required>
          <option selected disabled>Seleccione un cargo</option>
          <option value="juayua">Juayua</option>
          <option value="sonzacate">Sonzacate</option>
        </select>
      </div>


    <div class="col-md-6 mt-2">
        <label for="inputPassword4" class="form-label">Cargo</label>
        <select class="form-select" id="inputGroupSelect01" required>
          <option selected disabled>Seleccione un cargo</option>
          <option value="1">Vendedor</option>
          <option value="2">Gerente</option>
          <option value="3">Administrador</option>
        </select>
      </div>

      <div class="col-md-6 mt-2">
        <label for="inputPassword4" class="form-label">Sucursal</label>
        <select class="form-select" id="inputGroupSelect01" required>
          <option selected disabled>Seleccione un cargo</option>
          <option value="1">Sonsonate</option>
          <option value="2">juayua</option>
          <option value="3">Salcoatitan</option>
        </select>
      </div>


    
    <div class="col-12 mt-2">
      <button type="submit" class="btn btn-primary" name="form" value="registroEmpleado">Registrar</button>
    </div>
  </form>

</div>
`;