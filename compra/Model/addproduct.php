<?php 

class addproduct{
	
	function obtenerid($id,$idproducto){
		$sql = "SELECT * FROM detallecompra WHERE idcompra=$id and idproducto=$idproducto";
		global $cnx;
		return $cnx->query($sql);
	}

	

	function actualizardetalle($cantidad,$precio,$idcompra,$idproducto){

		$sql ="UPDATE detallecompra SET cantidad = cantidad+$cantidad,precio=$precio, subtotal = cantidad*precio where idcompra = $idcompra and idproducto = $idproducto";

		global $cnx;
		return $cnx->query($sql);

	}

		

	function guardarDetallecompra($precio, $cantidad, $subtotal,$idcompra,$idproducto){
		$sql = "INSERT INTO detallecompra (precio,cantidad,subtotal,idcompra,idproducto) values ('$precio','$cantidad','$subtotal','$idcompra','$idproducto')";
		global $cnx;
		return $cnx->query($sql);
	}

	
	function getById($id){
		$sql = "SELECT * FROM producto WHERE idproducto=$id";
		global $cnx;
		return $cnx->query($sql);
	}

	function actualizar($cantidad,$precio,$idproducto){

		$sql ="UPDATE producto SET cantidad= cantidad+$cantidad,preciounitario=$precio,total = cantidad*preciounitario WHERE idproducto = '$idproducto'";

		global $cnx;
		return $cnx->query($sql);

	}
}

 ?>