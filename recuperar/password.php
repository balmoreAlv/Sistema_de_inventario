

  <!DOCTYPE html>
<!-- Documento html5 -->
<html oncontextmenu="return false" >
<head lang="es">
<!--  Imagen que se muestrar en la pestaña del navegador-->
  <link rel="shortcut icon" href="../img/icono.ico" />

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <!-- Titulo qu aparece en la pestaña -->
 <title>Restaurante | Cerrito Panorámico</title>
	<!-- Latest compiled and minified CSS -->
  <!-- Libreria bootstrap paara darle estilos al documento -->
	<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../lib/bootstrap.min.css">
 
 <!-- Iconos fa fa -->
<link rel="stylesheet" href="../iconos_fa/css/font-awesome.min.css">
  
  <!-- Libreria personalizadda para dar estilos como bootstrap -->
 <link rel="stylesheet" href="../lib/boot.css">
<link rel="stylesheet" href="../lib/stiloadmin.css">


  <!-- CSS para darle estilo de ancho alto etc al contenedor -->
   <link href="pass.css" type="text/css" rel="stylesheet" />
   <!-- mostrar imagen en el cuerpo del documento -->
   <style type="text/css">

   html{

    background: url(../imagenes/fondo.jpg);
   }

   </style>
</head>
<body >
<?php

//incluye el menu negro q se encuentra en la parte de arriba
 include './images/block.php'; 

 ?>
 <div class="container">
 
        <div class="card card-container">
        <div class="table-responsive">
            <img id="profile-img" class="profile-img-card" src="../imagenes/imagen.png" />

            <p id="profile-name" class="profile-name-card"></p>

            <?php
            //captura en una variable el parametro send para mostrar el respectivo mensaje
              if (!empty($_GET['send'])) {
                $correo = $_GET['send'];
                //Si el email no existe muestra el siguiente mensaje
                if ($correo == "errormail") {
                  echo '<p class="alert alert-danger">Lo siento. E-mail no existe. No se envio su nueva contraseña. Espere...</p>';
                  echo"<meta http-equiv='refresh' content='4; url=http://localhost/cerritopanoramico/recuperar/password.php'/ >";
                
                  //Si el coódigo captcha en erroneo muestra el siguiente mensaje
                }elseif ($correo == "errorcod") {
                  echo '<p class="alert alert-danger">Error. Código/ E-mail ingresado es incorrecto. Por Favor Espere...</p>';
                  echo"<meta http-equiv='refresh' content='4; url=http://localhost/cerritopanoramico/recuperar/password.php'/ >";
                   //Si el correo, codigo captcha es correcto muestra el siguiente mensaje de su nueva contraseña es enviada
                }else{
                  echo '<p class="alert alert-success">Excelente. Su nueva contraseña es: <font size="3">'.$correo.'</font> Por Favor Espere...</p>';
                  echo"<meta http-equiv='refresh' content='25; url=http://localhost/cerritopanoramico/index.php'/ >";
                }
              }

            ?>
            <!-- Titulo del encabezado del formulario -->
            <h4><b><i>Recuperar Contraseña</i></b></h4>
            <!-- Formulario de recuperacion de contraseña -->
            <form method="post" accept-charset="utf-8" action="correo.php" name="loginform" autocomplete="off" role="form" class="form-signin">
			                <span id="reauth-email" class="reauth-email"></span>
                     <label> E-mail:</label>
                     <!-- Input del email para ingresarlo correctamente -->
                <input class="form-control" placeholder="Ingrese su email" name="email" type="email" value="" autofocus="" required><br>
                <label> Digita el Código  Captcha:</label>
                <!-- Imagen captcha qu hace refecrencia -->
                <img src="captcha.php" border="1" width="100%"><br><br>

                <input type="text" class="form-control" name="code" placeholder="Ingresa el código" required><br>
                <!-- Boton submit -->
                <button type="submit" class="btn btn btn-primary" name="acciones"  value=""><span class="fa fa-unlock"> </span> Restablecer Contraseña</button>
                 <!-- Redirecciona al login  -->
                <a href="../index.php" class="btn btn-success"><span class="fa fa-user"> </span> Inicio de Sesión</a>
            </form><br><!-- /form -->
            
        </div><!-- /card-container -->
         <!-- Derechos reservados del autor y redireccina al sitio web -->
        <center><strong>Copyright © 2016 <a href="http://fademype.org.sv/fademype/?p=1647" target="_blank"><font color="black">Sistema de Restaurante Cerrito Panorámico</font></a></strong></center>
    <br></div><!-- /container -->
    </div>
  </body>
</html>

	