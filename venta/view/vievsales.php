<?php

//conexion();
//Verificar si no vienen vaciosS
$action = (isset($_REQUEST['action'])&& $_REQUEST['action'] !=NULL)?$_REQUEST['action']:'';



//si se cumple a condicion
	if($action == 'ajax'){


			// escaping, additionally removing everything that could be (html/javascript-) code
    //addslashes(str) para no permitir sqlinjection
         $q = addslashes(strip_tags($_REQUEST['q'], ENT_QUOTES));
         //Creamos un array de acuerdo alas columnas de nuestrar tabla. en este caso es un inner join con la tabla tipo usuario
		 $aColumns = array('idventa','venta.fechaventa','cliente.nombre','cliente.apellido','usuario.nombre','usuario.apellido');//Columnas de busqueda
		 $sTable = "venta"; // nombre de la tabla
		 $sWhere = ""; //Condicion para hacer la busqueda con where
     //Si no esta vacio el parametro q viene con el metodo get
	if ( $_GET['q'] != "" )
		{
			$sWhere = "WHERE (";
			for ( $i=0 ; $i<count($aColumns) ; $i++ )
			{
				$sWhere .= $aColumns[$i]." LIKE '%".$q."%' OR ";
			}
			$sWhere = substr_replace( $sWhere, "", -3 );
			$sWhere .= ')';
		
   }







		include '../../lib/pagination.php'; //incluir el archivo de paginación
		//las variables de paginación
		$page = (isset($_REQUEST['page']) && !empty($_REQUEST['page']))?$_REQUEST['page']:1;
    
    $mostrartodo=(isset($_REQUEST['per_page']));
    if ($mostrartodo!="") {
      $porpagina=$_REQUEST['per_page'];
    }else
    {
      $porpagina=5;
    }
    


		$per_page = $porpagina; //la cantidad de registros que desea mostrar
		$adjacents  = 2; //brecha entre páginas después de varios adyacentes
		$offset = ($page - 1) * $per_page;
		//Cuenta el número total de filas de la tabla*/


//Incluimos la conexion para instanciarla
	include '../../conexion/conexion.php';	
$connection = conexion();
//Query con la tabla y hacer el respectivo inner join
$count_query = "SELECT venta.idventa,venta.fechaventa,concat(cliente.nombre,' ',cliente.apellido) as nombrecliente,concat(usuario.nombre,' ',usuario.apellido) nombreusuario FROM $sTable inner join cliente on venta.idcliente=cliente.idcliente INNER JOIN usuario on venta.idusuario = usuario.idusuario $sWhere order by venta.idventa desc";
//Ejecuta el query
$query = $connection->prepare($count_query);



//Si es verdadero la consulta
if ($query->execute()) {

	$rowcount = $query->rowcount();
	
}
//Tptal paginas
$total_pages = ceil($rowcount/$per_page);
		$reload = '../mostrar.php';




//Query a la tabla con el inner join
$sql = "SELECT venta.idventa,venta.fechaventa,concat(cliente.nombre,' ',cliente.apellido) as nombrecliente,concat(usuario.nombre,' ',usuario.apellido) nombreusuario FROM $sTable inner join cliente on venta.idcliente=cliente.idcliente INNER JOIN usuario on venta.idusuario = usuario.idusuario $sWhere order by venta.idventa desc LIMIT $offset,$per_page";

$q = $connection->prepare($sql);
$q->execute();
//Ejecuta lel query
//Mostrar el tota de registros almaceados en el query
$total = $q->rowcount();
$model = array();
//Array
while($rows = $q->fetch())
{
    $model[] = $rows;
}



$qg = $connection->prepare("SELECT sum(subtotal) as tot FROM detalleventa");
       $qg->execute();

    $data = $qg->fetch(PDO::FETCH_ASSOC);

    $t = $data['tot'];
    $to=$t*0.1;
    $tota=$t+$to; 

?>

<script type="text/javascript" src="../js/editar.js"></script>
<!-- tabla dond mostramos los datos-->
<table class="table table-condensed table-hover table-striped">

<tbody>
	<tr>
  <!-- Encabezado de la tablas-->
<th>ID</th>
<th>Fecha</th>
<th>Nombre Cliente</th>
<th>Nombre Usuario</th>
<th>Total</th>
<th></th>
	</tr>

<?php
//Si es mayor a cero hacemos el foreach para recorrer los datos almacenados
if ($rowcount !=0){
	?>
<?php
$totalp=0;
foreach($model as $row)
    {
      //Mostrar los datos en celdas y filas
        echo "<tr>";
        echo "<td>".$row['idventa']."</td>";
        echo "<td>".$row['fechaventa']."</td>";
        echo "<td>";
          if ($row['nombrecliente']=="& &") {
            echo "<span class='badge label-danger'>Cliente no registrado </span>";
          }else{
            echo $row['nombrecliente'];
          }

        echo "</td>";
       echo "<td>".$row['nombreusuario']."</td>";


        include_once('../../conexion/conexion.php');
    $conn = conexion();

         $consult = $conn->prepare("SELECT sum(subtotal) as totales FROM detalleventa where idventa = ".$row['idventa']."");
       $consult->execute();

    $daa = $consult->fetch(PDO::FETCH_ASSOC);

    $totals=$daa['totales'];
    
        echo "<td><span class='badge label-primary'><li class='glyphicon glyphicon-usd '></li> ".number_format($totals,2)."</span></td>";
       
        ?>
      
<input type="hidden" value="<?php echo $row['nombrecliente'];?>" id="nombreclient<?php echo $row['idventa'];?>">
<input type="hidden" value="<?php echo $totalp;?>" id="totalpaga<?php echo $row['idventa'];?>">


    

      </td>
  <td>
        
<div class='btn-group pull-right'>
<button type='button' class='btn btn-default dropdown-toggle' data-toggle='dropdown' aria-expanded='false'>Acciones <span class='fa fa-caret-down'></span></button>
<ul class='dropdown-menu'>

  <li><a style='cursor:pointer;'  target='_blank' href='<?php echo "../pdf/generatefactura.php?id_factura=".$row['idventa'].""; ?>'><i class='fa fa-download'></i> Imprimir</a></li>

<!--li><a style='cursor:pointer;' href="./editventa.php?id_venta=<?php //echo $row['idventa']; ?>"><i class='fa fa-edit'></i> Editar</a></li-->

</ul>
</div> 
</td>

<?php
    }
 
    ?>

</tr>
</tbody>

</table>
<br>
<!-- mostrar la paginacion del los datos-->
<div class="box-footer clearfix">
		<?php
//mostrar los datos totaless
     echo "Mostrando  ".$total." de ".$rowcount." registros";?>



<?php
//mostrar paginacion de datos
 echo paginate($reload, $page, $total_pages, $adjacents)?>


</div>





<?php
}else {
  //Si no se cumple lo anterior muestra el siguiente mensaje
			?>
			</table>
			<div class="alert alert-warning alert-dismissable">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
              <h4 style="text-align: center;">Aviso!!!</h4><h5 style="text-align: center;">No hay datos para mostrar</h5> 
            </div>
			<?php
		}

	}


                     

?>

