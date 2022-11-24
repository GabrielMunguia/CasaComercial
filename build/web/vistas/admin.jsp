<%-- 
    Document   : index
    Created on : 10-04-2021, 03:05:28 PM
    Author     : GabrielMunguia
--%>
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
         <link rel="stylesheet" href="./css/paginaPrincipal.css"/>
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/7fc2bb9c0c.js" crossorigin="anonymous"></script>

    </head>
    <body >

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
       <section class="home-section bg-white  ">
            <div>
                <div class="container-fluid d-flex justify-content-center align-items-center">
                    <div class="d-flex w-100 justify-content-around mt-4">
                        <!-- EMPIEZA-->
                        <div class="slider text-dark">
                            <!-- fade css -->
                            <div class="myslide">
                                    <div class="txt text-dark">
                                        <h1>BIENVENIDO</h1>
                                        <h1>AL PORTAL DE VENTAS</h1>                                         
                                    </div>
                                    <img src="./img/1.png" style="width: 100%; height: 100%;">
                            </div>
		
                            <div class="myslide">
                                    <div class="txt">
                                            <h1>EMPLEADO DEL MES</h1>
                                            <p>Préparate aún puedes ser el vendedor del mes<br>Quedan pocos días!</p>
                                    </div>
                                    <img src="./img/2.png" style="width: 100%; height: 100%;">
                            </div>
		
                            <div class="myslide">
                                    <div class="txt">
                                            <h1>BLACK FRIDAY!</h1>
                                            <p>Viernes 26<br>de noviembre</p>
                                    </div>
                                    <img src="./img/3.png" style="width: 100%; height: 100%;">
                            </div>
		
                            <div class="myslide">
                                    <div class="txt">
                                            <h1>REFIERE A TUS AMIGOS</h1>
                                            <p>Necesitamos súper vendedores<br>para estas fiestas navideñas</p>
                                    </div>
                                    <img src="./img/4.png" style="width: 100%; height: 100%;">
                            </div>
		
                            <div class="myslide">
                                    <div class="txt">
                                            <h1>REUNIÓN ADMINISTRATIVA</h1>
                                            <p>Próximamente<br>Jueves 2 de Diciembre</p>
                                    </div>
                                    <img src="./img/5.png" style="width: 100%; height: 100%;">
                            </div>
                            <!-- /fade css -->
		
                            <!-- onclick js -->
                            <a class="prev text-decoration-none" onclick="plusSlides(-1)">&#10094;</a>
                            <a class="next text-decoration-none" onclick="plusSlides(1)">&#10095;</a>
		
                            <div class="dotsbox" style="text-align:center">
                                    <span class="dot" onclick="currentSlide(1)"></span>
                                    <span class="dot" onclick="currentSlide(2)"></span>
                                    <span class="dot" onclick="currentSlide(3)"></span>
                                    <span class="dot" onclick="currentSlide(4)"></span>
                                    <span class="dot" onclick="currentSlide(5)"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script type="module" src="./scripts/dash.js" crossorigin="anonymous"></script>
                <script  src="./scripts/paginaPrincipal.js" crossorigin="anonymous"></script>
  
      
    




    </body>
</html>
