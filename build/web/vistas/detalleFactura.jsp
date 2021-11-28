<%@page import="modelo.Usuario"%>
<%@page import="modelo.Producto"%>
<%@page import="modeloDAO.ProductoDAO"%>
<%@page import="modeloDAO.FacturaDetalladaDAO"%>
<%@page import="modelo.FacturaDetallada"%>
<%@page import="modelo.Factura"%>
<%@page import="modelo.Factura"%>
<%@page import="modeloDAO.FacturaDAO"%>

<%@page import="java.util.Iterator"%>

<%@page import="java.util.List"%>

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
           <link rel="stylesheet" href="./css/factura.css"/>
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
                case 2:{
                    
                    aside="gerente";
                }break;
                
                case 3:{
                    
                    aside="vendedor";
                }
                
                default:{
                aside="vendedor";
                }break;

            }

            
        %>
        <div id="<%= aside %>" class="sidebar open overflow-scroll ">

        </div>
        <section class="home-section bg-white ">
 <div class="container-fluid d-flex justify-content-center align-items-center flex-column mt-4">
    <div class="container" id="imprimir">
        
        <%
              int id = Integer.parseInt((String) request.getAttribute("idFactura"));
              FacturaDetallada fd = new FacturaDetallada();
               FacturaDetalladaDAO dao = new FacturaDetalladaDAO();
               fd=dao.list(id);
              FacturaDAO daoF = new FacturaDAO();
              System.out.println(daoF.getTotalFactura(id));
              fd.setTota(daoF.getTotalFactura(id));
          
              
          %>


      <div class="row text-center contact-info">
        <div class="col-lg-12 col-md-12 col-sm-12">
          <hr>
          <span>
            <strong>Correo : </strong> Comercial@gmail.com
          </span>
          <span>
            <strong>Llamadas : </strong> 60457714
          </span>

          <hr>
        </div>
      </div>

      <div class="row pad-top-botm client-info m-2">
        <div class="col-lg-6 col-md-6 col-sm-6">
          <h4> <strong>INFORMACION CLIENTE</strong></h4>
          <b>Nombre :</b> <%=fd.getNombreCliente() %>
           <br>
          <b>Codigo Cliente :</b> <%=fd.getIdCliente()%>

          <br>
          <b>Direccion :</b> <%=fd.getDireccionCliente()%>

          <br>
          <b>Numero contacto :</b> <%=fd.getTelCliente()%>

        </div>


        <div class="col-lg-6 col-md-6 col-sm-6 d-flex justify-content-between flex-wrap">

          <div class="m-2">
            <h4> <strong>Detalles pago </strong></h4>
            <b>Importe de la factura : <%=fd.getTota()%> USD </b>
            <br>
            <strong>Fecha de emision </strong>: <%=fd.getFecha()%>

            <br>
            <strong>Metodo de pago</strong> : <%=fd.getMetodoPago()%>
          </div>
          <div class="m-2">
            <h4> <strong>Atendio </strong></h4>
            <b>Codigo Empleado :<%=fd.getIdEmpleado()%> </b>
            <br>
            <strong>Nombre del empleado </strong>: <%=fd.getNombreEmpleado()%>


          </div>


        </div>

      </div>
      <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
          <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover">
              <thead>
                <tr>
                  <th>Producto</th>
                  <th>Descripcion</th>
                  <th>Cantidad.</th>
                  <th>Precio Unitario</th>
                  <th>Sub Total</th>
                </tr>
              </thead>
              

            
              <tbody>
                  <%
                       ProductoDAO daoProd= new ProductoDAO();
                    List<Producto>list=daoProd.listarProdVenta(id);
                    Iterator<Producto>iter=list.iterator();
                    Producto p=null;
                    while(iter.hasNext()){
                        p=iter.next();
            %>
                <tr>
                  <td> <%=p.getNombre()%></td>
                  <td><%=p.getDescripcion()%></td>
                  <td><%=p.getCantidad()%></td>
                  <td>$<%=p.getPrecioContado()%> USD</td>
                  <td>$<%=(p.getPrecioContado()*p.getCantidad())%>USD</td>
                </tr>
                
      <%}%>
              </tbody>
              
            </table>
          </div>
          <hr>
          <div class="ttl-amts">
            <h5> Monto total : <%=fd.getTota()%> USD </h5>
          </div>
          <hr>

        </div>
      </div>
      <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
          <strong> Importante: </strong>
          <ol>
            <li>
             Revise su producto antes de salir de la comercial
            </li>
            <li>
             Guarde su factura para cualquier clase de reclamo
            </li>
          </ol>
        </div>
      </div>
      <div class="row pad-top-botm">
        <div class="col-lg-12 col-md-12 col-sm-12">
          <hr>
          <a  id="btnImprimir" class="btn btn-outline-primary btn-lg d-print-none">Imprimir</a>
          &nbsp;&nbsp;&nbsp;
          

        </div>
      </div>
    </div>
  </div>

        </section>
        <script type="module" src="./scripts/dash.js" crossorigin="anonymous"></script>
        
        
        <script>
            
            const btn=document.getElementById('btnImprimir');
            btn.addEventListener('click',()=>{PrintElem()})
            function PrintElem()
{
    console.log('holaa')
    var mywindow = window.open('', 'PRINT', 'height=400,width=600');

    mywindow.document.write('<html><head><title>' + document.title  + '</title>');
     mywindow.document.write('   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">');
        mywindow.document.write('<link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet">');
     mywindow.document.write('    <link rel="stylesheet" href="./css/factura.css"/>')  
        
        mywindow.document.write('</head><body >');
    
    mywindow.document.write('<h1>' + document.title  + '</h1>');
    mywindow.document.write(document.getElementById("imprimir").innerHTML);
    mywindow.document.write('</body></html>');

    mywindow.document.close(); // necessary for IE >= 10
    mywindow.focus(); // necessary for IE >= 10*/

    mywindow.print();


    return true;
}
            
            
        </script>
    

     



    </body>
</html>
