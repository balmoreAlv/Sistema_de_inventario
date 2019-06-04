<?php
// se declaran variables a utilizar en la clase tipoproducto segun la base de datos
class tipoproducto{

	VAR $idtipoproducto;
	VAR $nombre;
	

//funcion que sirve para guardar los datos de la materia
	function guardar($nombre)
	{
	try{
 		require_once('../conexion/conexion.php');

 		$conn = conexion();

 		//prepare el sql and bind parameters
 		$stmt = $conn->prepare("CALL guardar_tipoproducto(:a);");
			
 		$stmt->bindParam(':a',$a);
 	
 		//insert a row
 		$a = $nombre;		 		
 
 		$stmt->execute();

 	 }catch(PDOExcepcion $e){
 		echo "Error:".$e->getMessage();
 	}
}

//funcion para poder modificar los registros
	VAR $id;
	function modificar($nombre,$id)
		{
			require_once('../conexion/conexion.php');
			$conn = conexion();
			$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


		$sql = "CALL modificar_tipoproducto('$nombre','$id')";

		$stmt = $conn->prepare($sql);
		$stmt->execute();
			
		}
	
	//funcion para poder eliminar los registros
	function eliminar($id){
		
		require_once('../conexion/conexion.php');
		$conn = conexion();
		
		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$sql = "CALL eliminar_tipoproducto('$id')";

			$conn->exec($sql);
			
	}
		


}
?>