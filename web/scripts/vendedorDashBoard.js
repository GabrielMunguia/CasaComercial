export const vendedorDashBoard=` 

    <div class="logo-details">
        <a href="Controlador?accion=menuPrincipal"  class="d-flex  justify-content-center align-items-center text-decoration-none">
       <i class='bx bxl-c-plus-plus icon '></i>
          <div class="logo_name">CONBINI</div>
      
     </a>
  <i class='bx bx-menu' id="btn" ></i>
    </div>
    <ul class="nav-list px-0  ">
     
    <li>
    <a href="ControladorCaja?accion=caja">
      <i class='bx bx-grid-alt'></i>
      <span class="links_name">CAJA</span>
    </a>
     <span class="tooltip">Caja</span>
  </li>
<li>

  <li>
       <a  href="ControladorCliente?accion=add"  name='accion' value='add' >
         <i class='bx bx-user' ></i>
         <span class="links_name">Agregar Cliente</span>
       </a>
       <span class="tooltip">Agregar Cliente</span>
     </li>
      <li>
        <a href="ControladorCliente?accion=listarCliente"  name='accion' value='listarCliente'>
          <i class='bx bx-grid-alt'></i>
          <span class="links_name">Ver Clientes</span>
        </a>
         <span class="tooltip">Ver Clientes</span>
      </li>
      
  
     

     <li>
       <a href="ControladorVentas?accion=addVenta">
         <i class='bx bx-folder' ></i>
         <span class="links_name">Agregar Venta</span>
       </a>
       <span class="tooltip">Agregar Venta</span>
     </li>
     <li>
       <a href="ControladorVentas?accion=addVenta">
         <i class='bx bx-cart-alt' ></i>
         <span class="links_name">Ver Ventas</span>
       </a>
       <span class="tooltip">Ver Ventas</span>
     </li>
    <li>
       <a href="ControladorProducto?accion=listarProducto">
         <i class='bx bx-heart' ></i>
         <span class="links_name">Ver productos</span>
       </a>
       <span class="tooltip">Ver productos</span>
     </li>
     

      <li>
       <a href="Controlador?accion=salir">
         <i class='bx bx-cog' ></i>
         <span class="links_name">Cerrar sesion</span>
       </a>
       <span class="tooltip">Cerrar sesion</span>
     </li>
   
    </ul>

</div>

`;