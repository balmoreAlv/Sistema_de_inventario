<?php
//funcion para poder modificar los registros
class perfil{
	VAR $id;
	VAR $nombreempresa;
	VAR $telefono;
	VAR $email;
	VAR $impuesto;
	VAR $moneda;
	VAR $direccion;
	VAR $ciudad;
	VAR $departamento;
	VAR $lema;

	function modificar($nombreempresa,$telefono,$email,$impuesto,$moneda,$direccion,$ciudad,$departamento,$lema,$id)
		{
			require_once('../../conexion/conexion.php');
			$conn = conexion();
			$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$sql = "UPDATE perfil SET nombreempresa = '$nombreempresa', telefono = '$telefono', email = '$email', impuesto = '$impuesto', moneda = '$moneda', direccion = '$direccion', ciudad = '$ciudad', departamento = '$departamento', lema = '$lema' where id_perfil = '1'";
	$stmt = $conn->prepare($sql);
	$stmt->execute();
	header("location:config.php");
	}
  }
?>
			