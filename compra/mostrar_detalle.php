<?php
//Permite solo que ingrese el usuario que ha iniciado sesion.
session_start();
if (!$_SESSION["ok"])

{


  header("location:../index.php");
}

if (!empty($_GET['id'])) {
  $id = $_GET['id'];
}

include_once('../conexion/conexion.php');
    $conn = conexion();

include('../menu/mostrartipo.php');
$connection = conexion();


?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Sistema de inventario y facturaci&oacute;n</title> 
  <meta charset="utf-8">  
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-compatible" content="IE-edge">
  <script src="../js/listardatos.js"></script>
    <script src="../js/eliminar.js"></script>
    <link rel="shortcut icon" href="../img/cerritopanoramico.ico" />
  <link rel="stylesheet" href="../Resources/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="../css/estilos.css">
   <script language="javascript">
function imprimircomprobante()
{ 

  
  var disp_setting="toolbar=yes,location=no,directories=yes,menubar=yes,"; 
      disp_setting+="scrollbars=yes,width=1350, height=600, center=center, top=40"; 
  var content_vlue = document.getElementById("content").innerHTML; 
  
  var docprint=window.open("","",disp_setting); 
   docprint.document.open(); 
   docprint.document.write('</head><body onLoad="window.print()" style="width: 710px; font-size:13px; font-family:arial; font-weight:normal;">');          
   docprint.document.write(content_vlue); 
   docprint.document.close(); 
   docprint.focus(); 

}
</script>
 

 </head>
<body>

 <?php

   include("../menu/principal.php");


   ?>

   
<div class="clearfix"></div>
<section class="content-header">
  <a href="mostrar.php" class="btn pull-right btn-default"><i class="glyphicon glyphicon-circle-arrow-left"></i> Atrás</a>
</section><section class="content-header">
  <a href="javascript:imprimircomprobante();"class="btn pull-right btn-default"><i class="glyphicon glyphicon-print"></i> Imprimir</a>
</section>
<div class="content" id="content">

<table border="0" width="100%" align="center" cellpading="0" cellspacing="0" style="" class="logo">
        <tbody><tr>
          <td ><img style="width: 60%; height: 55%;" src="../imagenes/loguito.png"> </td>
          <td align="center" width="60%" style=""> <h1>Hoja de Compras</h1></td>
          <td align="right" width="20%" style=""><img style="width: 100%; height: 20%;"  src="../imagenes/logo.png"> </td>

        </tr>
      </tbody></table><?php 
          date_default_timezone_set('America/El_Salvador');
          
                $dia=date("l");
                if ($dia=="Monday") $dia="Lunes";
                if ($dia=="Tuesday") $dia="Martes";
                if ($dia=="Wednesday") $dia="Miércoles";
                if ($dia=="Thursday") $dia="Jueves";
                if ($dia=="Friday") $dia="Viernes";
                if ($dia=="Saturday") $dia="Sabado";
                if ($dia=="Sunday") $dia="Domingo";

                $mes=date("F");
                if ($mes=="January") $mes="Enero";
                if ($mes=="February") $mes="Febrero";
                if ($mes=="March") $mes="Marzo";
                if ($mes=="April") $mes="Abril";
                if ($mes=="May") $mes="Mayo";
                if ($mes=="June") $mes="Junio";
                if ($mes=="July") $mes="Julio";
                if ($mes=="August") $mes="Agosto";
                if ($mes=="September") $mes="Setiembre";
                if ($mes=="October") $mes="Octubre";
                if ($mes=="November") $mes="Noviembre";
                if ($mes=="December") $mes="Diciembre";

                $ano=date("Y");
                $dia2=date("d");
                //setlocale(LC_ALL,"es_ES");
                //echo strftime("%A %d de %B del %Y");
                //$Today = date('y:m:d',mktime());
                //$new = date('l, d, F, Y', strtotime($Today));
                //echo $new;
                echo "$dia, $dia2 de $mes del $ano&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                $hora = date("H:i:s");
                echo $hora;
          ?><hr>

<?php
//consult para seleccionar todos los datos de la venta

  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $sql = "SELECT compra.*,proveedor.nombre as nombrep, proveedor.nombrecontacto,usuario.nombre as nomuser, usuario.apellido FROM compra inner join proveedor on 
    compra.idproveedor= proveedor.idproveedor inner join usuario on compra.idusuario = usuario.idusuario where idcompra = $id";
    $q = $conn->prepare($sql);
    $q->execute(array($id));

    $data = $q->fetch(PDO::FETCH_ASSOC);
    
     
    echo "<font face='arial' size='5'style='color:black;'>Compra#: </font><label style='color:blue;'><u><font size='4'>".$data['idcompra']."</font></u></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
    echo "<font  face='arial' size='4'  color ='black'>Fecha: </font><label style='color:blue;'><u><font size='4'>".$data['fechacompra']."</font></u></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
     echo "<font color ='black' size='4'>Empresa: </font><label style='color:blue;'><u><font size='4'>".$data['nombrep']."</font></u></label>&nbsp;&nbsp;<hr>";
      echo "<font color ='black' size='4'>Nombre Contacto: </font><label style='color:blue;'><u><font size='4'>".$data['nombrecontacto']."</font></u></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
       echo "<font color ='black' size='4' >Usuario: </font><label style='color:blue;'><u><font size='4'>".$data['nomuser']." ".$data['apellido']."</font></u></label>";


  $que = "SELECT detallecompra.*,producto.nombre as nombrepr FROM detallecompra inner join producto
  on detallecompra.idproducto = producto.idproducto WHERE idcompra = $id";
  $res = $conn->query($que);
  $filas = $res->fetchAll();
  $todo = count($filas);

  ?>
<hr>
  <center><table border="1" class="table table-bordered table-striped table-hover" cellpading="0" data-responsive="table" cellspacing="0" align="center" width="100%">
      <thead>
      <tr>
      <td>No.</td>
        <td>Nombre Producto</td>
        <td>Cantidad</td>
        <td>P/ Unitario</td>
        <td>Subtotal</td>
        <?php
        if ($todo>=1) {
          # code...
        
  foreach ($filas as $mostrar) {


  ?>


</thead>
<tbody>
      </tr>
      <tr>
      <td><?php echo $mostrar['iddetallecompra'] ; ?></td>
        <td><?php echo $mostrar['nombrepr'] ; ?></td>
        <td><?php echo $mostrar['cantidad'] ; ?></td>
        <td><?php echo $mostrar['precio'] ; ?></td>
         <td><?php echo $mostrar['subtotal'] ; ?></td>
   <?php

}


  $query = $conn->prepare("SELECT sum(subtotal) AS total FROM detallecompra where idcompra = '$id'");
      $query->execute();


      $totalparcial = $query->fetch(PDO::FETCH_ASSOC)['total'];
   ?>

<tr>
  
          <td colspan="4" style=" text-align:right;"><strong style="font-size: 12px;">Total: &nbsp;</strong></td>
            <td><?php echo "<span class='glyphicon glyphicon-usd'></span> ".$totalparcial;?></td>



      </tr>
      <?php

}else{
  echo "<tr><td  colspan='5'><div class='alert alert-danger alert-dismissable'>
              <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
              <h4>Aviso!!!</h4> No hay datos para mostrar
            </div></center></td></tr>";
}
      ?>

</tbody>


            </table>
            
           
        
          </div></center>

      
<div>
        <footer>
<div >
<p align="center">Sistema de inventario y facturaci&oacute;n &copy; 2016</p>

</div>

</footer></center>
        
     
       
<div class="clearfix"></div>

</div>
</div>
      </div><!-- /#page-wrapper -->

    </div><!-- /#wrapper -->

    <!-- JavaScript -->

    <script src="../usuario/car/bootstrap.min.js"></script>
                                        
  </body>

</html>



