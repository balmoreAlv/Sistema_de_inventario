<?php

include "../menu/header.php";
if (!$_SESSION["ok"]) {

//redirecciona al index.php del sistema o login si no existe la session
    header("location:../");

} else {

}


if (!empty($_GET['idprivilegio'])) {
  $idprivilegio =$_GET['idprivilegio'];

  if (($idprivilegio!=0) || ($idprivilegio!="")) {
    # code...
 

$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$sql = "SELECT modulos.*,tipousuario.nombre FROM modulos inner join tipousuario on modulos.idtipousuario=tipousuario.idtipousuario  where modulos.idtipousuario = '$idprivilegio'";
$q   = $conn->prepare($sql);

$q->execute();

$data = $q->fetch();
$idtipos=$data['idtipousuario'];

if ($idtipos!=$idprivilegio) {
   echo "<script>window.location='mostrar.php';</script>";
}
$nombretipo =$data['nombre'];
$inicio1 = $data['inicio1'];
$inicio2      = $data['inicio2'];
$inicio3   = $data['inicio3'];

$compra = $data['compra'];
$inventario    = $data['inventario'];
$evento = $data['evento'];
$restaurante = $data['restaurante'];
$contacto = $data['contacto'];
$venta=$data['venta'];
$reporte=$data['reporte'];
$configuracion=$data['configuracion'];
$admin=$data['admin'];

if ($inicio1!="") {
 $inicio1='checked="true"';
}
if ($inicio2!="") {
 $inicio2='checked="true"';
}
if ($inicio3!="") {
 $inicio3='checked="true"';
}
if ($compra!="") {
 $compra='checked="true"';
}
if ($inventario!="") {
 $inventario='checked="true"';
}
if ($evento!="") {
 $evento='checked="true"';
}
if ($restaurante!="") {
 $restaurante='checked="true"';
}
if ($contacto!="") {
 $contacto='checked="true"';
}
if ($venta!="") {
 $venta='checked="true"';
}
if ($reporte!="") {
 $reporte='checked="true"';
}
if ($configuracion!="") {
 $configuracion='checked="true"';
}
if ($admin!="") {
 $admin='checked="true"';
}

?>
 <style>
#imga {

 width: 200px;
  height: 225px;
}

#imgaa {

 width: 60px;
  height: 80px;
}

#imgas {

    width: 100px;
  height: 120px;
}

</style>
<div class="content-wrapper" style="min-height: 400px;">
<section class="content-header">

</section>

  <div class="form-panel">
    <div class="container-fluid">
      <div class="row">
      <form method="POST" action="editarper.php" >
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 toppad" >


          <div class="panel panel-primary">
            <div class="panel-heading">
              <h3 class="panel-title"><i class='fa fa-edit'></i> Privilegios</h3>
            </div>
            <div class="panel-body">
              <div class="row">

  
<div class="modal-body">
<div id="loader2" class="text-center"></div>
<div class="outer_div2"> <div class="form-group  ">
<label for="nombres" class="col-sm-2 control-label">Tipo Usuario:</label>
<div class="col-sm-4">
<input type="hidden" name="idtipouser" value="<?php echo $idtipos; ?>">
<input type="text" class="form-control" name="nombres" value="<?php echo $nombretipo; ?>" >

</div>
</div>
<table class="table table-hover table-nomargin">
<thead>
<tr>
<th>Módulo</th>

</tr>
</thead>
<tbody>
<tr>
<td>
Inicio Secci&oacute;n 1
</td>
<td><input type="checkbox" name="inicio1" value="1" class="ck" <?php echo $inicio1; ?> ></td>

</tr>
<tr>
<td>
Inicio Secci&oacute;n 2
</td>
<td><input type="checkbox" name="inicio2" value="1" class="ck" <?php echo $inicio2; ?>  ></td>

</tr>
<tr>
<td>
Inicio Secci&oacute;n 3
</td>
<td><input type="checkbox" name="inicio3" value="1" class="ck" <?php echo $inicio3; ?> ></td>

</tr>
<tr>
<td>
Compras 
</td>
<td><input type="checkbox" name="compras" value="1" class="ck" <?php echo $compra; ?> ></td>

</tr>
<tr>
<td>
Inventario 
</td>
<td><input type="checkbox" name="inventario" value="1" class="ck" <?php echo $inventario; ?> ></td>

</tr>
<tr>
<td>
Eventos Especiales 
</td>
<td><input type="checkbox" name="eventos" value="1" class="ck"  <?php echo $evento; ?>></td>
</tr>
<tr>
<td>
Restaurante 
</td>
<td><input type="checkbox" name="restaurante" value="1" class="ck" <?php echo $restaurante; ?> ></td>
</tr>
<tr>
<td>
Contactos 
</td>
<td><input type="checkbox" name="contactos" value="1" class="ck" <?php echo $contacto; ?> ></td>
</tr>
<tr>
<td>
Ventas 
</td>
<td><input type="checkbox" name="ventas" value="1" class="ck" <?php echo $venta; ?> ></td>

</tr>
<tr>
<td>
Reportes 
</td>
<td><input type="checkbox" name="reportes" value="1" class="ck"  <?php echo $reporte; ?>></td>

</tr>
<tr>
<td>
Configuraci&oacute;n 
</td>
<td><input type="checkbox" name="configuracion" value="1" class="ck" <?php echo $configuracion; ?>></td>
</tr>
<tr>
<td>
Administrar Usuarios 
</td>
<td><input type="checkbox" name="admonuser" value="1" class="ck" <?php echo $admin; ?> ></td>

</tr>

</tbody>
</table></div>
</div>


 


<center><button type="submit" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-refresh"></i> Actualizar Privilegios</button></center>





                </div>
        <div class='col-md-12' id="resultados_ajax"></div><!-- Carga los datos ajax -->
              </div>
            </div>
              
          </div>
        </div>
    </form>
      </div>
    </div>





</section>

  <?php

   }else{
      echo "<script>window.location='mostrar.php';</script>";
   }
}elseif(empty($_GET['idprivilegio'])){
 echo "<script>window.location='mostrar.php';</script>";
}
include "../menu/footer.php"
?>

