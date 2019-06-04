<?php
// se declaran variables a utilizar en la clase materia
//segun la base de datos
class producto{
	VAR $idproducto;
	VAR $nombre;
	VAR $descripcion;
	VAR $cantidad;
	VAR $precio_unitario;
	var $total;
    VAR $idtipoproducto;
	
//funcion que sirve para guardar los datos de la materia
	function guardar($nombre,$descripcion,$idtipoproducto)
	{

		date_default_timezone_set('America/El_Salvador'); 
		$fecha = date('Y-m-d H:i:s');

	try{
 		require_once('../conexion/conexion.php');

 		$conn = conexion();

 		//guarda los datos que estan ingresados en el formulario en la base de datos
 		$stmt = $conn->prepare("CALL guardar_producto(:a,:b,:c,:d,:e,:f,:g,:h)");
			
 		$stmt->bindParam(':a',$a);
 		$stmt->bindParam(':b',$b);
 		$stmt->bindParam(':c',$c);
 		$stmt->bindParam(':d',$d);
 		$stmt->bindParam(':e',$e);
 		$stmt->bindParam(':f',$f);
 		$stmt->bindParam(':g',$g);
 		$stmt->bindParam(':h',$h);
 		
	
 	
 		//insert a row
 		$a = $nombre;
 		$b = $descripcion;
 		$c = '0';
 		$d = '0.00';
 		$e = '0.00';
 		$f = '0000-00-00';
 		$g = "Activo";
 		$h = $idtipoproducto;


 
 		$stmt->execute();

 	 }catch(PDOExcepcion $e){
 		echo "Error:".$e->getMessage();
 	}
}



//funcion para poder modificar los registros
	VAR $id;
	function modificar($nombre,$descripcion,$idtipoproducto,$id)
		{
			require_once('../conexion/conexion.php');
			$conn = conexion();
			$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


		$sql = "CALL modificar_producto('$nombre','$descripcion','$idtipoproducto','$id')";

		$stmt = $conn->prepare($sql);
		$stmt->execute();
			
		}
	
	//funcion para eliminar registro
	function eliminar($id){
		
		require_once('../conexion/conexion.php');
		$conn = conexion();
		
		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$sql = "CALL eliminar_producto('$id')";

			$conn->exec($sql);
			
	}





}
?>