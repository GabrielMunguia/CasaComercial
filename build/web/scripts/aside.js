export const aside=` 

    <div class="logo-details">
        <a href="Controlador?accion=menuPrincipal"  class="d-flex  justify-content-center align-items-center text-decoration-none">
       <i class='bx bxl-c-plus-plus icon '></i>
          <div class="logo_name">Comercial</div>
      
     </a>
  <i class='bx bx-menu' id="btn" ></i>
    </div>
    <ul class="nav-list px-0  ">
      <li>
          <i class='bx bx-search' ></i>
         <input type="text" placeholder="Search...">
         <span class="tooltip">Search</span>
      </li>

   <li>
        <a href="ControladorEmpleados?accion=addEmpleado">
          <i class='bx bx-grid-alt'></i>
          <span class="links_name">Agregar Empleados</span>
        </a>
         <span class="tooltip">Agregar Empleados</span>
      </li>
   <li>
        <a href="ControladorEmpleados?accion=listarEmpleado">
          <i class='bx bx-grid-alt'></i>
          <span class="links_name">Ver Empleados</span>
        </a>
         <span class="tooltip">Ver Empleados</span>
      </li>
      <li>
        <a href="ControladorCliente?accion=listarCliente"  name='accion' value='listarCliente'>
          <i class='bx bx-grid-alt'></i>
          <span class="links_name">Ver Clientes</span>
        </a>
         <span class="tooltip">Ver Clientes</span>
      </li>
      <li>
       <a  href="ControladorCliente?accion=add"  name='accion' value='add' >
         <i class='bx bx-user' ></i>
         <span class="links_name">Agregar Cliente</span>
       </a>
       <span class="tooltip">Agregar Cliente</span>
     </li>
     <li>
       <a  href="ControladorPago?accion=listarPago">
         <i class='bx bx-chat' ></i>
         <span class="links_name">Ver pagos</span>
       </a>
       <span class="tooltip">Ver pagos</span>
     </li>
     <li>
       <a href="ControladorPago?accion=add">
         <i class='bx bx-pie-chart-alt-2' ></i>
         <span class="links_name">Agregar Pago</span>
       </a>
       <span class="tooltip">Agregar Pago</span>
     </li>
     <li>
       <a href="ControladorFactura?accion=addVenta">
         <i class='bx bx-folder' ></i>
         <span class="links_name">Agregar Venta</span>
       </a>
       <span class="tooltip">Agregar Venta</span>
     </li>
     <li>
       <a href="ControladorFactura?accion=listarFacturas">
         <i class='bx bx-cart-alt' ></i>
         <span class="links_name">Ver Ventas</span>
       </a>
       <span class="tooltip">Ver Ventas</span>
     </li>
     <li>
       <a href="#">
         <i class='bx bx-heart' ></i>
         <span class="links_name">Ver productos</span>
       </a>
       <span class="tooltip">Ver productos</span>
     </li>
     <li>
       <a href="#">
         <i class='bx bx-cog' ></i>
         <span class="links_name">Agregar Producto</span>
       </a>
       <span class="tooltip">Agregar Producto</span>
     </li>
   
    </ul>

</div>

`;