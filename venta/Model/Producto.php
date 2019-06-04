<?php
class Producto
{
	function obteneridorden($id){
		$sql = "SELECT * FROM venta WHERE idventa=$id";
		global $cnx;
		return $cnx->query($sql);
	}
	
	function getById($id){
		$sql = "SELECT * FROM producto WHERE idproducto=$id";
		global $cnx;
		return $cnx->query($sql);
	}

	function getBydetalle($idorden,$idproducto){
		$sql = "SELECT * FROM detalleventa WHERE idventa='$idorden' and idproducto = '$idproducto' ";
		global $cnx;
		return $cnx->query($sql);
	}

	
	function guardarVenta($idusuario,$idcliente,$idmesa,$idmesero){
		$sql = "INSERT INTO venta (fechaventa,idcliente,idusuario) values (NOW(),'$idcliente','$idusuario')";
		global $cnx;
		return $cnx->query($sql);
	}
	
	function getUltimaVenta()
	{
		$sql = "SELECT LAST_INSERT_ID() as ultimo";
		global $cnx;
		return $cnx->query($sql);
	}
	
	function guardarDetalleVenta($precio, $cantidad, $subtotal,$idorden,$idproducto){
		$sql = "INSERT INTO detalleventa (cantidad,precio,subtotal,idventa,idproducto) values ('$cantidad','$precio','$subtotal','$idorden','$idproducto')";
		global $cnx;
		return $cnx->query($sql);
	}

	function actualizar($cantidad,$idproducto){

		$sql ="UPDATE producto SET cantidad= cantidad-$cantidad, total = cantidad*preciounitario WHERE idproducto = '$idproducto'";

		global $cnx;
		return $cnx->query($sql);

	}

	function actualizardetalle($precio,$cantidad,$idorden,$idproducto){

		$sql ="UPDATE detalleventa SET cantidad = '$cantidad',precio = '$precio', subtotal = ($cantidad*$precio) where idventa = $idorden and idproducto = $idproducto";

		global $cnx;
		return $cnx->query($sql);

	}

	function actualizarorden($idusuario,$idcliente,$idmesa,$idmesero,$idorden){

		$sql ="UPDATE venta SET idusuario = $idusuario, idcliente = $idcliente where idventa = $idorden";

		global $cnx;
		return $cnx->query($sql);

	}



	function actualizarmesa($idmesa){

		/*$sql ="UPDATE mesa SET estado= 'Ocupada' WHERE idmesa = '$idmesa'";

		global $cnx;
		return $cnx->query($sql);*/
		$mensaje="Exito";
		return $mensaje;

	}
	function actualizarmes($idmesa){

		/*$sql ="UPDATE mesa SET estado= 'Disponible' WHERE idmesa = '$idmesa'";

		global $cnx;
		return $cnx->query($sql);*/
		$mensaje="Exito";
		return $mensaje;
	}
	function actualizarmesero($idmesero){

		/*$sql ="UPDATE mesero SET contadormesa= contadormesa+1 WHERE idmesero = '$idmesero'";

		global $cnx;
		return $cnx->query($sql);*/
		$mensaje="Exito";
		return $mensaje;
	}

	function actualizarmeser($idmesero){

		/*$sql ="UPDATE mesero SET contadormesa= contadormesa-1 WHERE idmesero = '$idmesero'";

		global $cnx;
		return $cnx->query($sql);*/
		$mensaje="Exito";
		return $mensaje;
	}
}