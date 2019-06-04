<?php

include("../menu/header.php");

include("../lib/paginacion.php");

include_once('../conexion/conexion.php');
    $connection = conexion();

$pagination = new paginacion($connection);


$pagination->rowCount("SELECT * FROM cliente");
$pagination->config(3, 14);
$sql = "SELECT * FROM proveedor ORDER BY idproveedor DESC LIMIT $pagination->start_row, $pagination->max_rows";
$query = $connection->prepare($sql);
$query->execute();
$rowcount = $query->rowcount();
$model = array();
while($rows = $query->fetch())
{
    $model[] = $rows;
}

?>

<script type="text/javascript" src="../js/print.js"></script>




<div class="content-wrapper" style="min-height: 522px;">
 
<section class="content-header">
<div class="row">

<div class="col-xs-3">
<div class="input-group">
<div class="input-group-addon">
<i class="fa fa-calendar"></i>
</div>
<input type="date" value="<?php echo date('Y-m-d'); ?>" id="desde" class="form-control pull-right"   required>
</div> 
</div>
<div class="col-xs-1">
<div class="input-group">
<h5><b>HASTA</b></h5>
</div> 
</div>

<div class="col-xs-3">
<div class="input-group">
<div class="input-group-addon">
<i class="fa fa-calendar"></i>
</div>
<input type="date" id="hasta" value="<?php echo date('Y-m-d'); ?>" class="form-control pull-right"   required>
</div> 
</div>
<div class="col-xs-1">
<div id="loader" class="text-center"></div>
</div>
<div class="col-xs-5 ">
<div class="btn-group pull-right">
<a  onclick="reportetodoproveedor();" class="btn btn-default"><i class="fa fa-print"></i> Imprimir todo</a>
<a   onclick="imprimirreportproveedor();" class="btn btn-default "><i class="fa fa-print"></i>  Imprimir fechas</a>



</div>
</div>


</div>
</section>
 
<section class="content">

<div class="outer_div">
<div class="row">
<div class="col-md-12">
<div class="box box-success">
<div class="box-header with-border">
<h3 class="box-title">Reporte de Proveedores </h3>
</div> 
<div class="box-body">
<div class="table-responsive">
<table class="table table-condensed table-hover table-striped">
<tbody><tr>
<th>ID</th>
<th>Empresa</th>
<th>Cód.</th>
<th>Teléfono</th>
<th>Email</th>
<th>Dirección</th>
<th>Nombre Contacto</th>
<th>Teléfono Contacto</th>
<th>Agregado</th>
<th>Estado</th>

</tr>

 <?php

 if ($rowcount > 0) {
   
    foreach($model as $row)
    {
         echo "<tr>";
        echo "<td>".$row['idproveedor']."</td>";
        echo "<td>".$row['nombre']."</td>";
         echo "<td>".$row['codigo']."</td>";
        echo "<td> <span class='fa fa-phone'> </span> ".$row['telefono']."</td>";
         echo "<td> <span class='fa fa-envelope'> </span> ".$row['email']."</td>";
        echo "<td>".$row['direccion']."</td>";
        echo "<td>".$row['nombrecontacto']."</td>";
        echo "<td> <span class='fa fa-phone'> </span> ".$row['telefonocontacto']."</td>";




    

       echo "<td>".date("d-m-Y", strtotime($row['fecha']))."</td>";


        $esta = $row['estado'];
        echo "<td>";


        if ($esta =="Activo") {
          echo "<span class='btn btn-xs btn-success' data-toggle='modal' data-target='#modal_activar' onclick='activarproveedor(".$row['idproveedor'].");'>".$esta."</span>";
        }elseif($esta =="Inactivo"){
          echo "<span class='btn btn-xs btn-danger' data-toggle='modal' data-target='#modal_activar' onclick='activarproveedor(".$row['idproveedor'].");'>".$esta."</span>";

        }


         
      



    }
 
    ?>





</tr>

</tbody></table>
</div>
</div> 
<div class="box-footer clearfix">
Mostrando <?php
$quer = "SELECT * FROM proveedor";
$qy = $connection->prepare($quer);

$qy->execute();

$rowcoun = $qy->rowcount();




 echo $rowcount." de ". $rowcoun." registros";?><ul class="pagination pagination-sm no-margin pull-right"><?php
$pagination->pages("btn");
?></ul>
</div>


<?php
}else{



	
	echo "<tr><td colspan='10'><div class='alert alert-warning alert-dismissable'>
              <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
              <h4>Aviso!!!</h4>* No se encontraron datos para mostrar.
            </div></td></tr></table>";


}

?>
</div> 
</div> 
</div> 
</div> 
</section> 
</div> 



<?php

include("../menu/footer.php");

?>