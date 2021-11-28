<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Casa Comercial</title>
        <link rel='stylesheet' href='./css/login.css'/>
        <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU' crossorigin='anonymous'>
        <script src='https://kit.fontawesome.com/7fc2bb9c0c.js' crossorigin='anonymous'></script>

    </head>
    <body  class='fondo d-flex bg-dark justify-content-center align-items-center fondo '>
        <form action='Controlador' class='formLogin bg-white   p-2 mt-5 rounded ws-80 ws-50 d-flex flex-column justify-content-center align-items-center' method='POST' > 
            <div class='d-flex justify-content-center mb-3'> <i class='fas fa-user logoUser'></i></div> 
            <div class='input-group mb-3 mt-3 w-75 '> 
                <span class='input-group-text ' id='basic-addon1'> <i class='fas fa-envelope-open'></i> </span> 
                <input type='text' class='form-control bg-white ' placeholder='User' aria-label='Username' aria-describedby='basic-addon1' name='usuario' required autocomplete='off'/> 
            </div> 
            <div class='input-group mb-3 mt-2 w-75'> 
                <span class='input-group-text ' id='basic-addon1'> <i class='fas fa-lock'></i></i> </span> 
                <input type='password' class='form-control bg-white' placeholder='Password' aria-label='Username' aria-describedby='basic-addon1' name='password' required autocomplete='off'/> 
            </div> 
            <div class='input-group mb-2 mt-4 d-flex justify-content-center '> 
                <input class='btn btn-outline-dark' name='accion' value='Ingresar' type='submit'/> 
            </div> 
        </form> 
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
          let error =<%=request.getAttribute("exito")%>
          console.log(error);
          if (error === false) {
              Swal.fire({
                  title: 'Error!',
                  text: 'Porfavor verifique los datos',
                  icon: 'error',
                  confirmButtonColor: 'red',
                  confirmButtonText: 'OK',
                  heightAuto: false
              });
          }
        </script>

    </body>
</html>