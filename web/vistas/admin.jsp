<%-- 
    Document   : index
    Created on : 10-04-2021, 03:05:28 PM
    Author     : GabrielMunguia
--%>
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
        <title>Casa Comercial</title>
        <link rel="stylesheet" href="./css/style.css"/>
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/7fc2bb9c0c.js" crossorigin="anonymous"></script>

    </head>
    <body >
        <div id="dash" class="sidebar open overflow-scroll ">

        </div>
        <section class="home-section bg-x ">

            <div>
                <div class="container-fluid d-flex justify-content-center align-items-center">
                    <div class="d-flex w-100 justify-content-around mt-5">
                        <div class="  bg-dark p-2">
                          <canvas id="myChart" width="500" height="200"></canvas>
                        </div>
                         <div class="bg-dar  bg-dark p-2">
                          <canvas id="myChart2" width="500" height="200"></canvas>
                        </div>
                        
                    </div>



                </div>
            </div>
        </section>
        <script type="module" src="./scripts/dash.js" crossorigin="anonymous"></script>
        <script src="./scripts/Chart.min.js" />
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
  const labels = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
];
const data = {
  labels: labels,
  datasets: [{
    label: 'My First dataset',
    backgroundColor: 'rgb(255, 99, 132)',
    borderColor: 'rgb(255, 99, 132)',
    data: [0, 10, 5, 2, 20, 30, 45],
  }]
};
const config = {
  type: 'line',
  data: data,
  options: {}
};
const myChart = new Chart(
    document.getElementById('myChart'),
    config
  );
  const config2 = {
  type: 'doughnut',
  data: data,
};
const data2 = {
  labels: [
    'Red',
    'Blue',
    'Yellow'
  ],
  datasets: [{
    label: 'My First Dataset',
    data: [300, 50, 100],
    backgroundColor: [
      'rgb(255, 99, 132)',
      'rgb(54, 162, 235)',
      'rgb(255, 205, 86)'
    ],
    hoverOffset: 4
  }]
  
 
};
   const myChart2 = new Chart(
    document.getElementById('myChart2'),
    config2
  );
  
  
</script>
 



    </body>
</html>
