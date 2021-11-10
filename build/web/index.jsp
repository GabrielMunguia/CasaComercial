<%-- 
    Document   : index
    Created on : 10-04-2021, 03:05:28 PM
    Author     : GabrielMunguia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<% 

//  HttpSession s= request.getSession();
//  String x=  (String)s.getAttribute("login");
//  if(x=="true"){
//        response.sendRedirect("Controlador");
//  }else{
      out.println("<!DOCTYPE html>");
      out.println(" <html lang='es'> ");
      out.println(" <meta charset='UTF-8'>");
      out.println("  <meta http-equiv='X-UA-Compatible' content='IE=edge'>");
      out.println(" <meta name='viewport' content='width=device-width, initial-scale=1.0'>");
      out.println(" <title>Casa Comercial</title>");
      out.println("   <link rel='stylesheet' href='./css/login.css'/>");

      out.println("  <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU' crossorigin='anonymous'>");
      out.println("  <script src='https://kit.fontawesome.com/7fc2bb9c0c.js' crossorigin='anonymous'></script>");
      out.println("</head>");
      out.println("<body  class='fondo d-flex bg-dark justify-content-center align-items-center fondo '>");
      out.println(" <form action='Controlador' class='formLogin bg-white   p-2 mt-5 rounded ws-80 ws-50 d-flex flex-column justify-content-center align-items-center' method='POST' >");
      out.println(" <div class='d-flex justify-content-center mb-3'> <i class='fas fa-user logoUser'></i></div>");
      out.println("<div class='input-group mb-3 mt-3 w-75 '>");
      out.println(" <span class='input-group-text ' id='basic-addon1'> <i class='fas fa-envelope-open'></i> </span>");
      out.println(" <input type='text' class='form-control bg-white ' placeholder='User' aria-label='Username' aria-describedby='basic-addon1' name='usuario' required autocomplete='off'>");
      out.println(" </div>");
      out.println("  <div class='input-group mb-3 mt-2 w-75'>");
      out.println("  <span class='input-group-text ' id='basic-addon1'> <i class='fas fa-lock'></i></i> </span>");
      out.println("  <input type='password' class='form-control bg-white' placeholder='Password' aria-label='Username' aria-describedby='basic-addon1' name='password' required autocomplete='off'>");
      out.println("    </div>");
      out.println("<div class='input-group mb-2 mt-4 d-flex justify-content-center '>");
      out.println("  <input class='btn btn-outline-dark' name='accion' value='Ingresar' type='submit'/>");
      out.println(" </div>");
      out.println("    </form>");
      out.println("</body>");
      out.println("</html>");
      
 
    
      
      
      
        
//  }
  
  
 

%>
