<?php

//Permite solo que ingrese el usuario que ha iniciado sesion.

session_start();
if (!$_SESSION["ok"])

{

//Redirecciona al index.php
  header("location:../");
}

//Verifica los datos del modal  que no esten vacios para editar
if (!empty($_POST)) {

  //Guardamos en variables los datos enviados desde el modal
   $id = $_POST['idtipouser'];
    $inicio1 = addslashes($_POST['inicio1']);
$inicio2      = addslashes($_POST['inicio2']);
$inicio3   = addslashes($_POST['inicio3']);

$compra = addslashes($_POST['compras']);
$inventario    = addslashes($_POST['inventario']);
$evento = addslashes($_POST['eventos']);
$restaurante = addslashes($_POST['restaurante']);
$contacto = addslashes($_POST['contactos']);
$venta=addslashes($_POST['ventas']);
$reporte=addslashes($_POST['reportes']);
$configuracion=addslashes($_POST['configuracion']);
$admin=addslashes($_POST['admonuser']);
include '../conexion/conexion.php';
$conn=conexion();

$sql ="UPDATE modulos SET inicio1='$inicio1',inicio2='$inicio2',inicio3=$inicio3,compra='$compra',inventario='$inventario',evento='$evento',restaurante='$restaurante',contacto='$contacto',venta='$venta',reporte='$reporte',configuracion='$configuracion',admin='$admin' WHERE idtipousuario ='$id' ";
$prepa=$conn->prepare($sql);
$prepa->execute();
  header("location: mostrar.php?modify=true");

  }else{

  	header("location: mostrar.php?modify=false");

  }

?>