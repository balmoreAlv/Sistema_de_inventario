<?php

class tipo{
	//definir variables para la clase tipo de usuario segun la tabla usuario en la base de datos
	var $nombre;

	//funcion que guardar los datos del tipo de usuario
	
	function guardar($nombre)
	{
	try{
				
 		include_once('../conexion/conexion.php');

 		$conn = conexion();


 		//prepare el sql and bind parameters
 		$stmt = $conn->prepare('CALL guardar_tipousuario(:a)');
			
 		$stmt->bindParam(':a',$a); 	

 		//insert a row
 		$a = $nombre;
 
 
 		$stmt->execute();
 		
 		




 	 }catch(PDOExcepcion $e){
 		echo "Error:".$e->getMessage();

 	}
	}

//Funcion para modifcar los datos del tipo de id
	var $id;
	function modificar($nombre,$id)
	{
		//conexion archivo para hacer la instancia
		require_once('../conexion/conexion.php');
		$conn = conexion();
		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

		//Query
	$sql = "CALL modificar_tipousuario('$nombre','$id')";

	$stmt = $conn->prepare($sql);
	$stmt->execute();

	
		
	}

	//funcion que sirve para eliminar los datos del tipo de usuario
	function eliminar($id){
		//Conexion 
		require_once('../conexion/conexion.php');
		$conn = conexion();

		try{
		
		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$sql = "CALL eliminar_tipousuario('$id')";

			$conn->exec($sql);


			}catch(PDOExcepcion $e){
 		echo "Error:".$e->getMessage();

 	}
			
	}


}
?>