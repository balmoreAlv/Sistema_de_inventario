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
<th>Total</th>
<th>Usuario</th>
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
        include_once('../../conexion/conexion.php');
    $conn = conexion();

         $consult = $conn->prepare("SELECT sum(subtotal) as totales FROM detalleventa where idventa = ".$row['idventa']."");
       $consult->execute();

    $daa = $consult->fetch(PDO::FETCH_ASSOC);

    $totals=$daa['totales'];
    $totalp += $totals;

    
        echo "<td><span class='badge label-primary'><li class='glyphicon glyphicon-usd '></li> ".number_format($totals,2)."</span></td>";

        echo "<td>".$row['nombreusuario']."</td>";
        ?>
      
<input type="hidden" value="<?php echo $row['nombrecliente'];?>" id="nombreclient<?php echo $row['idventa'];?>">
<input type="hidden" value="<?php echo $totalas;?>" id="totalpaga<?php echo $row['idventa'];?>">

        <?php

        echo "</td>";

        
        echo "<td>";
        //botton de acciones
    

 } ?>
</ul>
</div> 
</td>

<?php
    }
 
    ?>

</tr>
<tr class="danger"> <td></td>
 <td></td>
 <td>Total por P&aacute;gina:</td>
<td><span class="badge label-success"><li class='glyphicon glyphicon-usd '></li> <?php echo number_format($totalp,2); ?></span></td>
 <td></td>
 </tr>


 <tr class="success"> <td></td>
 <td></td>
 <td>Total General:</td>
<td><span class="badge label-success"><li class='glyphicon glyphicon-usd '></li> <?php echo number_format($tota,2); ?></span></td>
 <td></td>

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
			
			<?php
		}                    

?>

