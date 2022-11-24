<%@page import="modelo.Usuario"%>
<%@page import="modeloDAO.EmpleadoDAO"%>
<%@page import="modelo.Empleado"%>
<%@page import="modeloDAO.PagoDAO"%>
<%@page import="modelo.Pago"%>
<%@page import="modelo.DetalleCredito"%>
<%@page import="modeloDAO.CreditoDAO"%>
<%@page import="modeloDAO.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Credito"%>
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
        <title>CONBINI</title>
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
 <div class="container-fluid d-flex justify-content-center a32500.0lign-items-center flex-column mt-4">
    <div class="container" id="imprimir">
        
        <%
              int id = Integer.parseInt((String) request.getAttribute("idFactura"));
             
           
             CreditoDAO crdao= new CreditoDAO();
               Credito cr=crdao.list(id);
             ClienteDAO daoc= new ClienteDAO();
             Cliente c= daoc.list(cr.getIdCLiente());
             String estadoCredito="Incompleto";
            EmpleadoDAO edao = new EmpleadoDAO();
          Empleado em= edao.list(cr.getIdEMpleado());
             
             String claseCss="text-danger";
             PagoDAO daop =new PagoDAO();
                double totalPagadoAux = daop.getTotalPagos(id);
                System.out.println("exp = " + totalPagadoAux);
                if(totalPagadoAux==cr.getMontoCredito()){
                    estadoCredito="Pagado";
                    claseCss="text-success";
                }
             
             
          
              
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
          <h2>Estado credito : <span class="<%=claseCss%>"><%=estadoCredito%> <span> </h2>
        <div class="col-lg-6 col-md-6 col-sm-6">
          <h4> <strong>INFORMACION CLIENTE</strong></h4>
          <b>Nombre :</b> <%=c.getNombre()%>
           <br>
          <b>Codigo Cliente :</b> <%=c.getIdCliente()%>

          <br>
          <b>Direccion :</b> <%=c.getDireccion()%>

          <br>
          <b>Numero contacto :</b> <%=c.getTelefono()%>

        </div>


        <div class="col-lg-6 col-md-6 col-sm-6 d-flex justify-content-between flex-wrap">

          <div class="m-2">
            <h4> <strong>Detalles pago </strong></h4>
            <b>Importe de la factura : <%=cr.getMontoCredito()%> USD </b>
            <br>
            <strong>Fecha de emision </strong>: <%=cr.getFecha()%>

            <br>
          
          </div>
          <div class="m-2">
            <h4> <strong>Atendio </strong></h4>
            <b>Codigo Empleado :<%=cr.getIdEMpleado()%> </b>
            <br>
            <strong>Nombre del empleado </strong>: <%=em.getNom()%>


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
                      
                      DetalleCredito dc= new DetalleCredito();
                      
                       ProductoDAO daoProd= new ProductoDAO();
                    List<Producto>list=daoProd.listarProdCredito(id);
                    Iterator<Producto>iter=list.iterator();
                    Producto p=null;
                    while(iter.hasNext()){
                        p=iter.next();
            %>
                <tr>
                  <td> <%=p.getNombre()%></td>
                  <td><%=p.getDescripcion()%></td>
                  <td><%=p.getCantidad()%></td>
                  <td>$<%=p.getPrecioCredito()%> USD</td>
                  <td>$<%=(p.getPrecioCredito()*p.getCantidad())%>USD</td>
                </tr>
                
      <%}%>
              </tbody>
              
            </table>
          </div>
          <hr>
          <div class="ttl-amts">
            <h5> Monto total : <%=cr.getMontoCredito()%> USD </h5>
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
      <div class="row pad-top-botm d-print-none" >
        <div class="col-lg-12 col-md-12 col-sm-12 no-print d-print-none">
          <hr>
          <a  id="btnImprimir" class="btn btn-outline-primary btn-lg no-print d-print-none">Imprimir</a>
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
