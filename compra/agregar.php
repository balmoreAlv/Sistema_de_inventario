<?php 

//Permite solo que ingrese el usuario que ha iniciado sesion.
session_start();
if (!$_SESSION["ok"])

{


  header("location:../index.php");
}



include_once('../conexion/conexion.php');
    $conn = conexion();






include('../menu/mostrartipo.php'); 


$_SESSION['detalle1'] = array();



?>

<?php

if (!empty($_GET['id'])) {
	$id = $_GET['id'];



    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $sql = "SELECT compra.*,proveedor.* FROM compra  inner join proveedor on compra.idproveedor= proveedor.idproveedor where idcompra = '$id'";
    $q = $conn->prepare($sql);
    
    $q->execute(array($id));

    $data = $q->fetch(PDO::FETCH_ASSOC);

    $idd = $data['idcompra'];
    $nombre = $data['nombre'];
    


}elseif(empty($_GET['id'])){
	header("location:mostrar.php");

}


?>


 



<!DOCTYPE html>
<html lang="en" oncontextmenu="return false">
  <head>
        <title>Cerrito Panorámico</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../img/cerritopanoramico.ico" />
      <link rel="stylesheet" type="text/css" href="../css/estilos.css">
       <link   href="../boot/css/bootstrap.min.css" rel="stylesheet">
    <script src="../bootstrap/js/bootstrap.min.js"></script>
        <!-- Bootstrap -->
    <script src="libs/js/jquery.js"></script>
    <script type="text/javascript" src="libs/ajaxagrega.js"></script>	 <!-- Alertity -->
    <link rel="stylesheet" href="libs/js/alertify/themes/alertify.core.css" />
	<link rel="stylesheet" href="libs/js/alertify/themes/alertify.bootstrap.css" id="toggleCSS" />
    <script src="libs/js/alertify/lib/alertify.min.js"></script>
    <script src="ajax1.js"></script>
    <script src="../usuario/car/jquery-1.10.2.js"></script>





<body>
   <?php

   include("../menu/principal.php");


   ?>

   
<div class="clearfix"></div>

<!-- formulario de registro de Cliente -->



          <div class="page-header">
			<h1>Agregar Productos a la Compra</h1>
		</div>
		
	
		
 		<div class="row">
 			<div class="col-md-6">
				<div>Proveedor:<input type="text" value="<?php echo $nombre;?>" name="nombre" id="nombre" class="form-control"></div>
					</div>


			<div class="col-md-6">	

			<input type="hidden" name="idcompra" value="<?php echo $idd;?>" id="idcompra">
				<div>Producto:
				<select name="cbo_producto" id="cbo_producto" onchange="load(this.value)" class="col-md-2 form-control">
					<option value="0">Seleccione un producto</option>
					 <?php
                  
                        
                  $sql = "SELECT * FROM producto where cantidad >=1 order by idproducto desc";

                        $result = $conn->query($sql);

                        $rows = $result->fetchAll();


                      foreach ($rows as $row) { 

                      echo "<option value='";
                      echo $row['idproducto'];           
                              
                      echo "'>";
                      echo $row['nombre']; 
                      

                      echo "</option>";

                      }

                        ?>


                        </select>
                          
                        
				</div>

			</div>
			 <div id="myDiv"></div>
         
			
    			
    <div class='col-md-6'><div><div><br>Cantidad:<input  type='text' placeholder="cantidad"   class='form-control' name='cantidades' id='cantidades'></div></div></div>
			
			<div class="col-md-7">
				<div style="margin-top: 19px;">
				<br><button type="button" class="btn btn-primary btn-agregar-producto" onmousemove="if(parseFloat(cantidades.value) > parseFloat(cantidadexistente.value))
				{alert('Información Importante: \n Sobrepasa la Cantidad Existente En Producto Seleccionado'); cantidades.value='';}"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;Agregar Productos</button>
				<button type="button"  class="btn btn btn-success guardar-carrito"><span class="glyphicon glyphicon-floppy-saved"></span>&nbsp;Guardar</button>

				<a href="mostrar_detalle.php?id=<?php echo $id;?>" class="btn btn-warning"> <span class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;Atr&aacute;s</a>
				</div>
			</div>
		</div>
		
		<br>
		<div class="panel panel-primary">
			 <div class="panel-heading">
		        <h3 class="panel-title">Listado de Compras de Productos</h3>
		      </div>
			<div class="panel-body detalle-producto">
				<?php if(count($_SESSION['detalle1'])>0){?>
					<table class="table">
					    <thead>
					        <tr>
					            <th>Nombre Producto</th>
					            <th>Cantidad</th>
					            <th>Precio</th>
					            <th>Subtotal</th>
					            <th></th>
					        </tr>
					    </thead>
					    <tbody>
					    	<?php 
					    	foreach($_SESSION['detalle1'] as $k => $detalle){ 
					    	?>
					        <tr>
					        	<td><?php echo $detalle['producto'];?></td>
					            <td><?php echo $detalle['cantidad'];?></td>
					            <td><?php echo $detalle['precio'];?></td>
					            <td><?php echo $detalle['subtotal'];?></td>
					            <td><button type="button" class="btn btn-sm btn-danger eliminar-producto" id="<?php echo $detalle['id'];?>"><span class="glyphicon glyphicon-trash"></span>&nbsp;Eliminar</button></td>
					        </tr>
					        <?php }?>
					    </tbody>
					</table>
				<?php }else{?>
				<div class="alert alert-success alert-dismissable">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
              <h4>Aviso!!!</h4> No hay Productos Agregados
            </div>
				<?php }?>
			</div>
		</div>
		
                  

<center><footer>
<div >
<p align="center">Sistema de inventario y facturaci&oacute;n &copy; 2018</p>

</div>

</footer></center>


                  


<div class="clearfix"></div>

  <br>
  </div>
</div>
      </div><!-- /#page-wrapper -->

    </div><!-- /#wrapper -->

    <!-- JavaScript -->

  <script src="../usuario/car/bootstrap.min.js"></script>


  </body>
</html>

