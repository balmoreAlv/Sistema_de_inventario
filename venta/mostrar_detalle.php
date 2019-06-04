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
  <title>Cerrito Panorámico</title> 
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
  var estado = document.getElementById('estad').value;
  if (estado == 'Pendiente') {
    alert('Debe Cancelar la Venta Para imprimir');
  }else{
  
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
}
</script>


<script type="text/javascript">
  function imprimir_factura(id_factura){
      document.location = '../pdf/pdf/documentos/ver_factura.php?id_factura='+id_factura,'Factura','','1024','768','true';
    }

</script>



<script type="text/javascript">

function agregar(id){
   var estado = document.getElementById('estad').value;
  if (estado == 'Pendiente') {

    window.location = "agregar.php?id=" +id;

  }else{
    alert('No puede agregar más productos al la Venta.! \n Ya se encuentra cancelada');

    }
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
  <a href="javascript:imprimir_factura('<?php echo $id; ?>');"    class="btn pull-right btn-default"><i class="glyphicon glyphicon-print" ></i> Imprimir</a>
</section>
<section class="content-header">
  <a onclick="agregar('<?php echo $id; ?>');"  class="btn pull-right btn-default"><i class="glyphicon glyphicon-plus-sign" ></i> Agregar Productos</a>
</section>
<section class="content-header">
  <a href="Controller/aplicar.php?id=<?php echo $id;?>"  class="btn pull-right btn-default"><i class="glyphicon glyphicon-plus-sign" ></i> Aplicar Venta</a>
</section><hr align="right" width="0">


  
<div class="content" id="content">

<table border="0" width="100%" align="center" cellpading="0" cellspacing="0" style="" class="logo">
        <tbody><tr>
          <td ><img style="width: 50%; height: 50%;" src="../imagenes/loguito.png"> </td>
          <td align="center" width="60%" style=""> <h3>Km. 6 1⁄2 Carretera Panorámica Chinameca.</h3></td>
          <td align="right" width="20%" style=""><img style="width: 80%; height: 35%;"  src="../imagenes/factura.png"> </td>

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
    $sql = "SELECT orden.*,usuario.nombre as nombrep,usuario.apellido as apell, cliente.nombre as nom,cliente.apellido as ape,cliente.dui,cliente.direccion FROM orden inner join usuario on 
    orden.idusuario= usuario.idusuario inner join cliente on orden.idcliente = cliente.idcliente where idorden = $id";
    $q = $conn->prepare($sql);
    $q->execute(array($id));

    $data = $q->fetch(PDO::FETCH_ASSOC);
    
     
  ?>
 <table bgcolor="white" align="center" border="0" width="100%" cellpadding="0" cellspacing="0">



           <tbody><tr>

             <td align="left" width="10%" nowrap=""><font size="2">Nº de factura:</font></td>

             <td style="border-bottom:1px solid black" align="left" colspan="10%"><font style="font-size: 15;font-family: serif;font-weight:bold"><?php echo $data['idorden']; ?></font></td>

           </tr>

           <tr>

             <td align="left" width="10%" nowrap=""><font size="2">Fecha compra:</font></td>

             <td style="border-bottom:1px solid black" align="left" colspan="10%"><font size="2"><?php echo $data['fechaorden']; ?></font></td>

           </tr>

           <tr>

             <td align="left" width="10%" nowrap=""><font size="2">Nombre y Apellido:</font></td>

             <td style="border-bottom:1px solid black" align="left" colspan="10%"><font size="2"><?php echo $data['nom']." ".$data['ape']; ?></font></td>

           </tr>

           <tr>

             <td align="left" width="10%" nowrap=""><font size="2">Dui o Nit:</font></td>

             <td style="border-bottom:1px solid black" align="left" colspan="10%">

              <font size="2"><?php echo $data['dui']; ?></font> 

              

             </td>

           </tr>

           <tr>

             <td align="left" width="10%" nowrap=""><font size="2">Atendió:</font></td>

             <td style="border-bottom:1px solid black" align="left" colspan="10%"><font size="2"><?php echo $data['nombrep']." ".$data['apell']; ?></font></td>

           </tr>

           <tr>

             <td align="left" width="10%" nowrap=""><font size="2">Dirección:</font></td>

             <td style="border-bottom:1px solid black" align="left" colspan="10%"><font size="2"><?php echo $data['direccion']; ?></font></td>

           </tr>

           

      

           <tr>

             <td align="center" width="100%" colspan="40"><br>

        <font size="2"><b>Gracias por su compra !!!</b></font>

       </td>

           </tr>

         

          </tbody></table>







  <?php

$estado = $data['estado'];
 echo "<input type='hidden' value='$estado' id='estad'>";

  $que = "SELECT detalleorden.*,producto.nombre as nombrepr,producto.preciounitario FROM detalleorden inner join producto
  on detalleorden.idproducto = producto.idproducto WHERE idorden = $id";
  $res = $conn->query($que);
  $filas = $res->fetchAll();
  $todo = count($filas);

  ?>
<hr>
  <center><table border="1" class="table table-bordered table-striped table-hover" cellpading="0" data-responsive="table" cellspacing="0" align="center" width="100%">
      <thead>
      <tr>
      <td><b> Cantidad</b></td>
        <td><b>Nombre Producto</b></td>
      <td><b>P/Unitario</b></td>
        <td><b>Ventas Exentas</b></td>
        <td><b>Subtotal</b></td>
        <?php
        if ($todo>=1) {
          # code...
        
  foreach ($filas as $mostrar) {


  ?>


</thead>
<tbody>
      </tr>
      <tr>
      <td><?php echo $mostrar['cantidad'] ; ?></td>
        <td><?php echo $mostrar['nombrepr'] ; ?></td>
        <td><?php echo $mostrar['preciounitario'] ; ?></td>
        <td></td>
         <td><?php echo $mostrar['subtotal'] ; ?></td>
   <?php

}


  $query = $conn->prepare("SELECT sum(subtotal) AS total FROM detalleorden where idorden = '$id'");
      $query->execute();


      $totalparcial = $query->fetch(PDO::FETCH_ASSOC)['total'];
   ?>

<tr>
    <td colspan="2"><b>Cantidad en Letras:</b></td>
          <td colspan="2" style=" text-align:right;"><strong style="font-size: 12px;">Total: &nbsp;</strong></td>
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
  <?php
$est = $conn->prepare("SELECT * FROM orden where idorden = '$id'");
      $est->execute();


      $estado = $est->fetch(PDO::FETCH_ASSOC)['estado'];

      if ($estado  == 'Pendiente') {
        echo "<p class='alert alert-warning'><i class='glyphicon glyphicon-time'></i> Aviso!!! Esta venta esta pendiente</p>";
      }elseif ($estado == 'Finalizado') {
       echo "<p class='alert alert-info'><i class='glyphicon glyphicon-ok-sign'></i> Aviso!!! Esta venta esta completada</p>";
      }
  ?>
  
        <center><footer>
<div >
<p align="center">Sistema de inventario y facturaci&oacute;n Cerrito panorámico &copy; 2016</p>

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



