<?php 

class addproduct{
	
	function obtenerid($id,$idproducto){
		$sql = "SELECT * FROM detalleventa WHERE idventa=$id and idproducto=$idproducto";
		global $cnx;
		return $cnx->query($sql);
	}

	function obteneridcortesia($id,$idproducto){
		/*$sql = "SELECT * FROM cortesia WHERE idorden=$id and idproducto=$idproducto";
		global $cnx;
		return $cnx->query($sql);*/
		$mensaje="Exito";
		return $mensaje;
	}


	function actualizardetalle($precio,$cantidad,$idorden,$idproducto){

		$sql ="UPDATE detalleventa SET cantidad = cantidad+'$cantidad', precio = '$precio' where idventa = $idorden and idproducto = '$idproducto'";

		global $cnx;
		return $cnx->query($sql);

	}

	function actualizarcortesia($cantidad,$idorden,$idproducto){

		/*$sql ="UPDATE cortesia SET cantidad = cantidad+$cantidad, subtotal = cantidad*precio where idorden = $idorden and idproducto = $idproducto";

		global $cnx;
		return $cnx->query($sql);*/
		$mensaje="Exito";
		return $mensaje;
	}

	function guardarDetalleVenta($precio, $cantidad, $subtotal,$idorden,$idproducto){
		$sql = "INSERT INTO detalleventa (cantidad, precio,subtotal,idventa,idproducto) values ('$cantidad','$precio','$subtotal','$idorden','$idproducto')";
		global $cnx;
		return $cnx->query($sql);
	}

	function guardarcortesia($precio, $cantidad, $subtotal,$idorden,$idproducto){
		/*$sql = "INSERT INTO cortesia (precio,cantidad,subtotal,idorden,idproducto,fechacortesia) values ('$precio','$cantidad','$subtotal','$idorden','$idproducto',NOW())";
		global $cnx;
		return $cnx->query($sql);*/
		$mensaje="Exito";
		return $mensaje;
	}

	function getById($id){
		$sql = "SELECT * FROM producto WHERE idproducto=$id";
		global $cnx;
		return $cnx->query($sql);
	}

	function actualizar($cantidad,$idproducto){

		$sql ="UPDATE producto SET cantidad= cantidad-$cantidad,total = cantidad*preciounitario WHERE idproducto = '$idproducto'";

		global $cnx;
		return $cnx->query($sql);

	}
}

 ?>