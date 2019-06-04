<?php
//clase cliente 
	class Cliente{
		//variables de la clase
		var $id;
		var $nombre;
		var $apellido;
		var $dui;
		var $telefono;
		var $direccion;
		var $email;
//funcion para guardar los datos del cliente
		function generate_insert($nombre, $apellido, $dui, $telefono, $direccion, $email)
		{
		

		try {
			//conexion a la base de datos
			require_once('../conexion/conexion.php');
			$conn=conexion();
			//Query insert 
			$stmt = $conn->prepare("CALL guardar_cliente(:a, :b, :c, :d, :e, :f)");
		$stmt->bindParam(':a', $a);
		$stmt->bindParam(':b', $b);
		$stmt->bindParam(':c', $c);
		$stmt->bindParam(':d', $d);
		$stmt->bindParam(':e', $e);
		$stmt->bindParam(':f', $f);
		
		$a = $nombre;
 		$b = $apellido;
 		$c =$dui;
 		$d = $telefono;
 		$e = $direccion;
 		$f = $email;

 
		$stmt->execute();

		} catch (PDOException $e) {
			echo "Error:".$e->getMessage();
		}
			
		}
	

	//Fiuncion para eliminar un cliente

		function eliminar($id)
		{
		try{
			//Conexion al la base de datos
			require_once'../conexion/conexion.php';
			$conn = conexion();
			//Query de leiminacion delete
		$sql = "CALL eliminar_cliente('$id')";

		$conn->exec($sql);

					
		}catch(PDOException $e){
		echo $sql. "<br>" . $e->getMessage();

		}
		}
		//Funcion para modificar los datos del cliente
		function editar($nombre, $apellido,$dui, $telefono, $direccion, $email, $id)
		{
			try {
				//conexion a la base de datos
				require_once'../conexion/conexion.php';
				$conn=conexion();
				//Query update	
		$sql = "CALL modificar_cliente('$nombre', '$apellido','$dui', '$telefono', '$direccion', '$email', '$id')";
		$stmt = $conn->prepare($sql);
		//Ejecuta la consulta
		$stmt->execute();
		
	} catch (PDOException $e) {
		echo $sql."<br>".$e->getMessage();
	}
		}


	}	
?>