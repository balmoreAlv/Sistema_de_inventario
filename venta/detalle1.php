<?php 
@session_start();
?>
<?php if(count($_SESSION['detalle1'])>0){?>
	<table class="table table-hover">
	    <thead>
	        <tr>
	            <th>Nombre Producto</th>
	            <th>Cantidad</th>
	            <th>Precio Producto</th>
				<th>Subtotal</th>
	            <th>Opciones</th>
	        </tr>
	    </thead>
	    <tbody>
	    	<?php 
	    	$total = 0;
	    	foreach($_SESSION['detalle1'] as $k => $detalle){ 
			$total += $detalle['subtotal'];
	    	?>
	        <tr>
	        	<td><?php echo $detalle['producto'];?></td>
	            <td><?php echo $detalle['cantidad'];?></td>
	            <td><?php echo $detalle['precio'];?></td>
	            
	            
				<td><?php echo $detalle['subtotal'];?></td>
	            <td><button type="button" class="btn btn-sm btn-danger eliminar-producto" id="<?php echo $detalle['id'];?>"><span class="glyphicon glyphicon-trash"></span>&nbsp;Eliminar</button></td>
	        </tr>
	        <?php }?>
	        <tr>
	        	<td colspan="3" class="text-right">Total</td>
	        	<td><?php echo $total;?></td>
	        	<td></td>
	        </tr>
	    </tbody>
	</table>
<?php }else{?>
<div class="alert alert-success alert-dismissable">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
              <h4>Aviso!!!</h4> No hay Productos Agregados
            </div>
<?php }?>

<script type="text/javascript" src="libs/ajaxagrega.js"></script>