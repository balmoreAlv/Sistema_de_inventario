<?php

include("../menu/header.php");

include("../lib/paginacion.php");

include_once('../conexion/conexion.php');
    $connection = conexion();

$pagination = new paginacion($connection);


$pagination->rowCount("SELECT * FROM cliente");
$pagination->config(3, 14);
$sql = "SELECT * FROM cliente ORDER BY idcliente DESC LIMIT $pagination->start_row, $pagination->max_rows";
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
<input type="date" value="<?php date_default_timezone_set('America/El_Salvador');  echo date('Y-m-d'); ?>" id="desde" class="form-control pull-right"   required>
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
<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Exportar Excel <span class="fa fa-caret-down"></span></button>
<ul class="dropdown-menu">
<li><a href="../excel/exportarclientes.php"><i class="fa fa-download"></i> Todos</a></li>

</ul>
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
<h3 class="box-title">Reporte de clientes </h3>
</div> 
<div class="box-body">
<div class="table-responsive">
<table class="table table-condensed table-hover table-striped">
<tbody><tr>
<th>ID</th>
<th>Nombre completo </th>
<th>Dui</th>
<th>Teléfono</th>
<th>Dirección</th>
<th>Agregado</th>

</tr>

 <?php

 if ($rowcount > 0) {
   
    foreach($model as $row)
    {
        echo "<tr>";
        echo "<td>".$row['idcliente']."</td>";
        echo "<td>".$row['nombre']." ".$row['apellido']."</td>";

        $dui =$row['dui'];
        $tele = $row['telefono'];

        if ($dui != "") {
          echo "<td><li class='fa fa-info'></li> " .$row['dui']."</td>";
        }else{
          echo "<td><label class='btn btn-xs btn-info' data-toggle='modal' data-target='#modal_update' onclick='editarcliente(".$row['idcliente'].");'> No existe registro </label></td>";
        }

        if ($tele != "") {
            echo "<td><li class='fa fa-phone'></li> ".$row['telefono']."</td>";
        }else{
             echo "<td><label class='btn btn-xs btn-info' data-toggle='modal' data-target='#modal_update' onclick='editarcliente(".$row['idcliente'].");'> No existe registro </label></td>";
        }



        echo "<td>".$row['direccion']."</td>";

     
      echo "<td>".date("d-m-Y", strtotime($row['fecha']))."</td>";


    }
 
    ?>





</tr>

</tbody></table>
</div>
</div> 
<div class="box-footer clearfix">
Mostrando <?php
$quer = "SELECT * FROM cliente";
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