
<?php

//Permite solo que ingrese el usuario que ha iniciado sesion.
//con la session amacenada al ingresar con los datos correctos
session_start();
if (!$_SESSION["ok"])

{

//redirecciona al index.php del sistema o login si no existe la session
  header("location:../");

}else{

}

//incluimos el archivo de conexion para hacer el puente a la base de datos
include_once('../conexion/conexion.php');
    $conn = conexion();

//guardamos las sessiones en unas variables
$usuario = $_SESSION['usuario'];
$clave = $_SESSION['pass'];

//Pdo Errorcapture
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
//Hacemos la consulta del usuario que ha iniciado sesion con las variables de session almacenadas.
//Consultando los datos respectivos
  $qg = $conn->prepare("SELECT usuario.*,tipousuario.nombre as nombretipo FROM usuario INNER JOIN tipousuario ON 
    usuario.idtipousuarios = tipousuario.idtipousuario where usuario = '$usuario' and clave = MD5('$clave')");
      $qg->execute();

      //guardando en variables los datos de  la consulta
      $tiposmostrar = $qg->fetch(PDO::FETCH_ASSOC);
      $idtipouser=$tiposmostrar['idtipousuarios'];
      $tipo = $tiposmostrar['nombretipo'];
      $nombre = $tiposmostrar['usuario'];
      $pass=md5($tiposmostrar['clave']);

      $apellido = $tiposmostrar['apellido'];
      $nombres = $tiposmostrar['nombre'];
      $estado = $tiposmostrar['estado'];

      //condicion si el tipo de usuario esta vacio o el estado es inactivo
      if (($tipo == "") or ($estado == "Inactivo") ) {
        header("location: ../index.php");
      }


      $sss = "SELECT modulos.*,tipousuario.nombre FROM modulos inner join tipousuario on modulos.idtipousuario=tipousuario.idtipousuario  where modulos.idtipousuario = '$idtipouser'";
$query  = $conn->prepare($sss);

$query->execute();

$datas = $query->fetch();
$idtipos=$datas['idtipousuario'];
$nombretipos =$datas['nombre'];
$inicio1 = $datas['inicio1'];
$inicio2      = $datas['inicio2'];
$inicio3   = $datas['inicio3'];

$compra = $datas['compra'];
$inventario    = $datas['inventario'];
$evento = $datas['evento'];
$negocio = $datas['negocio'];
$contacto = $datas['contacto'];
$venta=$datas['venta'];
$reporte=$datas['reporte'];
$configuracion=$datas['configuracion'];
$admin=$datas['admin'];







// consulta para poder seleccionar la cantidad de productos y sacar el total
      $c = $conn->prepare("SELECT sum(cantidad) as cantidad FROM producto");

      $c->execute();

      $totalc = $c->fetch(PDO::FETCH_ASSOC);
         
            
         $t = $totalc['cantidad'];

// consulta para poder seleccionar la cantidad de productos y sacar el total
       $p = $conn->prepare("SELECT count(*) as existencia FROM producto where cantidad >1");

        $p->execute();

        $exis = $p->fetch(PDO::FETCH_ASSOC);


          $totalp = $exis['existencia'];  

// consulta para poder seleccionar el total de clientes 
      $cli = $conn->prepare("SELECT count(*) as cliente FROM cliente where idcliente >1");

      $cli->execute();

      $cl = $cli->fetch(PDO::FETCH_ASSOC);
         
            
         $clientes = $cl['cliente'];  

// consulta para poder seleccionar los nuevos registros de cliente
      $ss = $conn->prepare("SELECT * FROM cliente where idcliente >1 order by idcliente DESC LIMIT 10");

      $ss->execute();
      $to = $ss->rowcount();
         date_default_timezone_set('America/El_Salvador'); 
        $anno = date('Y');
// consulta para poder seleccionar el total de ventas 

// consulta para poder seleccionar el total de ventas 

// consulta para poder seleccionar el total de proveedores
      $pr = $conn->prepare("SELECT count(*) as provee FROM proveedor");

      $pr->execute();

      $vee = $pr->fetch(PDO::FETCH_ASSOC);
         
            
         $pv = $vee['provee'];  

// consulta para poder seleccionar los nuevos registros de proveedores
      $pro = $conn->prepare("SELECT * FROM proveedor order by idproveedor DESC LIMIT 10");

      $pro->execute();
      $gg = $pro->rowcount();



        


        
$sqlf = "SELECT * FROM perfil where idperfil = '1'";
$qt   = $conn->prepare($sqlf);

$qt->execute();

$datos = $qt->fetch();

$logo_url = $datos['logo'];
$favico_url = $datos['favicon'];
$user_url = $datos['imgenusers'];
$radios=$datos['color'];
         




?>


 

<!-- Inicio de documento html-->
<!DOCTYPE html>

<html lang="es" oncontextmenu="return false" >

<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

<link rel="shortcut icon" href="data:image/jpg;base64,<?php echo base64_encode($favico_url); ?>" />

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script>

  $(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
</script>
<input type="hidden" value="&nbsp;Sistema de inventario y facturaci&oacute;n" id="titulo">
<script LANGUAGE="JavaScript"> 
var titulo=document.getElementById('titulo').value; 
var espera=300; 
var refresco=null; 
function title() { 
document.title=titulo; 
titulo=titulo.substring(1,titulo.length)+titulo.charAt(0); 
refresco=setTimeout("title()",espera);} 
title(); 
</script>


<!-- librerias bootstrap y estilos html-->

<link rel="stylesheet" type="text/css" href="../lib/animacion.css">
<!--
<link rel="stylesheet" type="text/css" href="../lib/social.css">
<link rel="stylesheet" type="text/css" href="../lib/font.css">
-->

 <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../lib/bootstrap.min.css">
<link rel="stylesheet" href="../lib/boot.css">
 
 <!-- Inconos Font awesome -->
<link rel="stylesheet" href="../iconos_fa/css/font-awesome.min.css">


 
<script src="../lib/bootstrap.min.js"></script>

<script src="../js/print.js"></script>
<!-- Estilos personalizado bootstrap -->
 
<link rel="stylesheet" href="../lib/stiloadmin.css">

 
<link rel="stylesheet" href="../lib/_all-skins.min.css">

<script src="../lib/selec/jquery-1.11.0.min.js"></script>



<!-- Para mostrar el select buscar en un select-->
   <script src="../lib/selectbuscar/core.js"></script>
   
    <!-- core js files -->
    <link rel="stylesheet" href="../lib/selectbuscar/chosen.css">
    <script src="../lib/selectbuscar/chosen.jquery.min.js"></script>
<!-- Mensajes de dialogo alertify-->
<script type="text/javascript" src="../js/alertify.js"></script>
    <link rel="stylesheet" href="../js/alertify.core.css" />
    <link rel="stylesheet" href="../js/alertify.default.css" />








<!-- Funcion Para mostrar la hora en tiempo real-->
  <script language="javascript" type="text/javascript">


/* muestra la hora en tiempo real en el sistema */
<!-- Begin
var timerID = null;
var timerRunning = false;
function stopclock (){
if(timerRunning)
clearTimeout(timerID);
timerRunning = false;
}
function showtime () {
var now = new Date();
var hours = now.getHours();
var minutes = now.getMinutes();
var seconds = now.getSeconds()
var timeValue = "" + ((hours >12) ? hours -12 :hours)
if (timeValue == "0") timeValue = 12;
timeValue += ((minutes < 10) ? ":0" : ":") + minutes
timeValue += ((seconds < 10) ? ":0" : ":") + seconds
timeValue += (hours >= 12) ? " P.M." : " A.M."
document.getElementById('face').innerHTML=timeValue;
timerID = setTimeout("showtime()",1000);
timerRunning = true;
}
function startclock() {
stopclock();
showtime();
}
window.onload=startclock;


//Funcion para mostrar un mensaje de dialogo y cerrar la sesion del sistema
 function salir(){
     alertify.confirm("<p><img src='../img/warning.png'>&nbsp;&nbsp;&nbsp;&nbsp;<b>¿Realmente desea abandonar el sistema?</b><br><br></p>",
  function (e) {
          if (e) {

            alertify.success("Abandonando el sistema !!!");
            setTimeout('location.href="../recuperar/cerrar.php"', 1900);
           
          } else { alertify.error("Gracias. Puede seguir en el sistema");
          }
        });
   }

//Funcion para validar que los input  text solo acepten letra
     function soloLetras(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
       especiales = "8-37-39-46";

       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)==-1 && !tecla_especial){
            return false;
        }
    }
// End -->



//Funcion de validacion para que un input solo acepte numeros.
function justNumbers(e)
        {
        var keynum = window.event ? window.event.keyCode : e.which;
        if ((keynum == 8) || (keynum == 37) || (keynum == 39) || (keynum == 46))
        return true;
         
        return /\d/.test(String.fromCharCode(keynum));
        }


 


</script> 




</head>

<!-- Inicio del Body del menu-->
<body class="skin-<?php echo $radios; ?> sidebar-mini" >
<div class="wrapper">
<header class="main-header">
 
<a href="" class="logo">
 
<span class="logo-mini"><b>Men&uacute;</b></span>
 
<span class="logo-lg"><h4>Sistema de inventario y facturaci&oacute;n</h4></span>
</a>
 
<nav class="navbar navbar-static-top" role="navigation">
 
<a href="" class="sidebar-toggle" data-toggle="offcanvas" role="button">
<span class="sr-only">Toggle navigation </span>
</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;
<font size="6" color="gold">
 <script type="text/javascript">

 /* muestra la fecha en el area local en el sistema */
var dias_semana = new Array("Domingo","Lunes","Martes","Mi&eacute;rcoles","Jueves","Viernes","S&aacute;bado");
var meses = new Array ("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre", "Diciembre");
var fecha_actual = new Date();
 
document.write(dias_semana[fecha_actual.getDay()] + ", " + fecha_actual.getDate() + " de " + meses[fecha_actual.getMonth()] + " del " + fecha_actual.getFullYear());
 
</script>,&nbsp;<span  id="face"></span></font>

       
      

<!-- En esta parte mostrar el nombre de usuario y desplega un cuatro con mas detalles-->
<div class="navbar-custom-menu">
<ul class="nav navbar-nav">
 
<li class="dropdown user user-menu">
<a href="#" class="dropdown-toggle" data-toggle="dropdown">
<img src="data:image/jpg;base64,<?php echo base64_encode($user_url); ?>" class="user-image" alt="User Image">
<span class="hidden-xs">Usuario <?php echo $nombre;  ?></span>
</a>
<ul class="dropdown-menu">
 
<li class="user-header">
<img src="data:image/jpg;base64,<?php echo base64_encode($user_url); ?>" class="img-circle" alt="User Image">
<p>
Usuario <?php echo $nombre; ?>
<small><?php echo $tipo; ?></small>
</p>
</li>
 
<li class="user-footer">
<div class="pull-left">
<!-- Cambiar Contraseña-->
<a href="../changepassword/changepass.php" class="list-group-item list-group-item-warning"><i class="fa fa-unlock"></i> Cambiar Contrase&ntilde;a</a>
</div>
<div class="pull-right">
<a  onclick="salir();" class="list-group-item list-group-item-warning "><i class="fa fa-power-off"></i> Salir</a>
</div>
</li>
</ul>
</li>
</ul>
</div>
</nav>
</header>
 
 <!-- Menu del sistema de inventario-->
<aside class="main-sidebar" tyle="height:auto; color: #191970">
 
<section class="sidebar" style="height:auto; color: #191970">
 
<div class="user-panel">
<div class="pull-left image">
<img src="data:image/jpg;base64,<?php echo base64_encode($logo_url); ?>"  class="img-circle" alt="User Image">
</div>
<div class="pull-left info">
<p><?php echo $tipo;?></p>
<a href=""><i class="fa fa-circle text-success"></i> Conectado</a>
</div>
</div>



<!-- En esta parte mostrar tods los modulos que podemos  encontrar
en el sistema, por ejemplo compras clientes, etc-->
<ul class="sidebar-menu">
<li class="header">OPCIONES</li>
<li class="active">

<!-- Menu de incio Link-->
<a href="../menu/menu.php">
<i class="fa fa-home"></i> <span>Inicio</span>
</a>
</li>

<?php if ($compra!="") {
  # code...
 ?>


<li class=" treeview">
<a href="#">
<i class="fa fa-truck"></i>
<span>Compras</span>
<i class="fa fa-angle-left pull-right"></i>
</a>
<ul class="treeview-menu">
<li class=""><a href="../compra/nuevacompra.php"><i class="glyphicon glyphicon-shopping-cart"></i> Nueva compra</a></li>
<li class=""><a href="../compra/mostrar.php"><i class="glyphicon glyphicon-th-list"></i> Historial de compras</a></li>
</ul>
</li>
<?php } ?>

<?php if ($inventario!="") {
  # code...
?>
<li class=" treeview">
<a href="#">
<i class="glyphicon glyphicon-th-large"></i>
<span>Inventario</span>
<i class="fa fa-angle-left pull-right"></i>
</a>
<ul class="treeview-menu">
<li class=""><a href="../tipoproducto/mostrar.php"><i class="glyphicon glyphicon-glass"></i> Tipo producto</a></li>
<li class=""><a href="../producto/mostrar.php"><i class="glyphicon glyphicon-briefcase"></i> productos</a></li>
</ul>
</li>
<?php }  ?>

<?php if ($contacto!="") {
  # code...
 ?>
<li class=" treeview">
<a href="##">
<i class="fa fa-user"></i>
<span>Contactos</span>
<i class="fa fa-angle-left pull-right"></i>
</a>
<ul class="treeview-menu">
<li class=""><a href="../cliente/mostrar.php"><i class="glyphicon glyphicon-user"></i> Clientes</a></li>
<li class=""><a href="../proveedor/mostrar.php"><i class="fa fa-truck"></i> Proveedores</a></li>
</ul>
</li>

<?php } ?>


<?php if ($venta!="") {
  # code...
?>
<li class=" treeview">
<a href="#">
<i class="fa fa-dollar"></i> <span>Facturaci&oacute;n</span>
<i class="fa fa-angle-left pull-right"></i>
</a>
<ul class="treeview-menu">
<li class=""><a href="../venta/generarventa.php"><i class="fa fa-cart-plus"></i> Nueva venta <span class="badge">4</span></a></li>
<li class=""><a href="../venta/mostrar.php"><i class="glyphicon glyphicon-list-alt"></i> Administrar Ventas</a></li>
</ul>
</li>

<?php }  ?>



<?php if ($reporte!="") {
  # code...
 ?>
<li class=" treeview">
<a href="#">
<i class="glyphicon glyphicon-list-alt"></i> <span>Reportes</span>
<i class="fa fa-angle-left pull-right"></i>
</a>
<ul class="treeview-menu">
<li class=""><a href="../reportes/reportecompra.php"><i class="glyphicon glyphicon-list-alt"></i> Reporte Compras</a></li>

<li class=""><a href="../reportes/reportecliente.php"><i class="glyphicon glyphicon-list-alt"></i>Reporte clientes</a></li>

<li class=""><a href="../reportes/reporteusuario.php"><i class="glyphicon glyphicon-list-alt"></i> Reporte Usuario</a></li>
<li class=""><a href="../reportes/reporteproveedor.php" ><i class="glyphicon glyphicon-list-alt"></i>Reporte Proveedor</a></li>
<li class=""><a href="../reportes/reporteproducto.php" ><i class="glyphicon glyphicon-list-alt"></i>Reporte Producto</a></li>


</ul>
</li>


<?php } ?>

<?php if ($admin!="") {
  # code...
 ?>
<li class=" treeview">
<a href="#">
<i class="fa fa-lock"></i> <span>Administrar usuarios</span>
<i class="fa fa-angle-left pull-right"></i>
</a>
<ul class="treeview-menu">
<li class=""><a href="../tipousuario/mostrar.php"><i class="glyphicon glyphicon-briefcase"></i> Tipo de usuario</a></li>
<li class=""><a href="../usuario/mostrar.php"><i class="fa fa-users"></i> Usuarios</a></li>

</ul>
</li>


<?php } ?>
<?php if ($configuracion!="") {
  # code...
 ?>
<li class=" treeview">
<a href="#">
<i class="fa fa-wrench"></i> <span>Configuración</span>
<i class="fa fa-angle-left pull-right"></i>
</a>
<ul class="treeview-menu">
<li class=""><a href="../configbarrera/config.php"><i class="glyphicon glyphicon-briefcase"></i> Perfil del Sistema</a></li>
<li class=""><a href="../backup/generatebackup.php"><i class="fa fa-database"></i> Backup</a></li>
</ul>
</li>
<?php } ?>


</ul>
</section>
 
</aside>

