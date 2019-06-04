<?php 
	class Provider{
		//se defincin las variables segun la tabla del proveedor que existe en la base de datos
		var $id;
		var $nombre_empresa;
		var $codigo;
		var $telefono;
		var $email;
		var $direccion;
		var $nombre_contacto;
		var $telcont;


		//funcion que guarda los datos del proveedor
		function save($nombre_empresa, $codigo, $telefono, $email, $direccion, $nombre_contacto, $telcont,$estado,$fecha,$razon){

			date_default_timezone_set('America/El_Salvador'); 
			$fecha = date('Y-m-d H:i:s');
			try {
				require_once('../conexion/conexion.php');
				$conn=conexion();

				$sql="CALL guardar_proveedor('$nombre_empresa', '$codigo', '$telefono', '$email', '$direccion', '$nombre_contacto', '$telcont', '$estado', '$fecha', '$razon')";
				$stmt = $conn->prepare($sql);
				$stmt->execute();

			} catch (PDOException $e) {
			echo "Error:".$e->getMessage();
			}
		}

			//funcion que lista todos los proveedores almacenados 
		
			//funcion qie permite editar los proveedor
		function edit($nombre_empresa, $codigo, $telefono, $email, $direccion, $nombre_contacto, $telcont,$id)
		{
			require_once('../conexion/conexion.php');
			$conn = conexion();
			$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


			$sql = "CALL modificar_proveedor('$nombre_empresa', '$codigo', '$telefono', '$email', '$direccion', '$nombre_contacto', '$telcont', '$id')";

			$stmt = $conn->prepare($sql);
			$stmt->execute();
				
	}
}

	?>