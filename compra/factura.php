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


?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Sistema de inventario y facturaci&oacute;n</title> 
  <meta charset="utf-8">  
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-compatible" content="IE-edge">

    <script src="../js/eliminar.js"></script>
    <link rel="shortcut icon" href="../img/cerritopanoramico.ico" />
  <link rel="stylesheet" href="../Resources/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="../css/estilos.css">
  <script language="javascript">
function Clickheretoprint()
{ 
  var disp_setting="toolbar=yes,location=no,directories=yes,menubar=yes,"; 
      disp_setting+="scrollbars=yes,width=700, height=400, left=100, top=25"; 
  var content_vlue = document.getElementById("content").innerHTML; 
  
  var docprint=window.open("","",disp_setting); 
   docprint.document.open(); 
   docprint.document.write('</head><body onLoad="window.print()" style="width: 700px; font-size:11px; font-family:arial; font-weight:normal;">');          
   docprint.document.write(content_vlue); 
   docprint.document.close(); 
   docprint.focus(); 
}
</script>
 

 </head>

   <body onload="javascript:Clickheretoprint();">
    
<div class="clearfix"></div>
<div class="container">
  <div class="content" id="content">
<table align="center">
  <tr><td width="30%" rowspan="5">
<img style="width: 40%; height: 30%;" src="../img/cerrito.png">
        </td>

        <td>
          <h1>Reporte de Compra</h1>
        </td> 
        <td></td>                     
     </tr>

</table>
<br><br>
<?php
//consult para seleccionar todos los datos de la venta

  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $sql = "SELECT compra.*,proveedor.nombre  as nombrep, usuario.nombre as nomusu, usuario.apellido as apeusu FROM compra inner join proveedor on 
    compra.idproveedor= proveedor.idproveedor inner join usuario on compra.idusuario = usuario.idusuario  where idcompra = $id";
    $q = $conn->prepare($sql);
    $q->execute(array($id));

    $data = $q->fetch(PDO::FETCH_ASSOC);
    
     
    echo "<center>";
    echo "<font color ='black'>Fecha de Compra:  &nbsp; </font><label>".$data['fechacompra']."</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
    
      echo "<font color ='black'>Proveedor: &nbsp; </font><label>".$data['nombrep']."</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";

       echo "<font color ='black'>Usuario &nbsp; </font><label>".$data['nomusu']." ".$data['apeusu'];"</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";

    echo "</center>";


  $que = "SELECT detallecompra.*,producto.nombre as nombrepr FROM detallecompra inner join producto
  on detallecompra.idproducto = producto.idproducto WHERE idcompra = $id";
  $res = $conn->query($que);
  $filas = $res->fetchAll();
  $todo = count($filas);

  ?>

<br><br><br><br>
  <center><table class="table table-bordered datatable">
      <thead>
      <tr>
        <td>N</td>
        <td>Descripci&oacute;n</td>
        <td>Cantidad</td>
        <td>P/ Unitario</td>
        <td>SubTotal</td>

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
  echo "<tr><td  colspan='4'><div class='alert alert-danger alert-dismissable'>
              <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
              <h4>Aviso!!!</h4> No hay datos para mostrar
            </div></center></td></tr>";
}
      ?>

</tbody>


            </table></div></center>

      
<div>
        <center><footer>
<div >
<p align="center">Sistema de inventario y facturaci&oacute;n &copy; 2016</p>

</div>

</footer></center>
        
 </div>    
       
<div class="clearfix"></div>

</div>
</div>
      </div><!-- /#page-wrapper -->

    </div><!-- /#wrapper -->

    <!-- JavaScript -->

    <script src="../usuario/car/bootstrap.min.js"></script>
                                        
  </body>

</html>



