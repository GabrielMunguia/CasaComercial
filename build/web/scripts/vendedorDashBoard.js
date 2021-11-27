export const vendedorDashBoard=` 

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
        <a href="ControladorCliente?accion=listarCliente"  name='accion' value='listarCliente'>
          <i class='bx bx-grid-alt'></i>
          <span class="links_name">Ver Clientes</span>
        </a>
         <span class="tooltip">Ver Clientes</span>
      </li>
      
   <li>
       <a href="ControladorCreditos?accion=addCredito">
         <i class='bx bx-folder' ></i>
         <span class="links_name">Agregar Credito</span>
       </a>
       <span class="tooltip">Agregar Venta</span>
     </li>
  <li>
       <a href="ControladorCreditos?accion=listar">
         <i class='bx bx-folder' ></i>
         <span class="links_name">Ver Creditos</span>
       </a>
       <span class="tooltip">Ver Creditos</span>
     </li>
     <li>
       <a  href="ControladorPago?accion=verPagos">
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
         <span class="links_name">Cerrar sesion</span>
       </a>
       <span class="tooltip">Cerrar sesion</span>
     </li>
   
    </ul>

</div>

`;