<?php 
//Permite solo que ingrese el usuario que ha iniciado sesion.
session_start();
if (!$_SESSION["ok"])

{


  header("location:../index.php");
}

   require'../conexion/conexion.php';
  $conn = conexion();

//conexion ala base de datos
  


  if (!empty($_POST)) {
  
    
    $nombre_empresa = $_POST['mod_nombree'];
    $codigo = $_POST['mod_codigoe'];
    $telefono = $_POST['mod_tele'];
    $email = $_POST['mod_emaile'];
    $direccion = $_POST['mod_direccion'];
     $nombre_contacto = $_POST['mod_nombrec'];
    $telcont = $_POST['mod_telec'];

    //Selecciona dui o email de la tabla cliente para comparar si ya existe un cliente con ese dui, email



      //Instancia para almacenar los datos
      include('proveedor.php');
    $provee = new Provider();
    date_default_timezone_set('America/El_Salvador'); 
    $fecha = date('Y-m-d H:i:s');
    $estado = "Activo";
    $razon="Activo Correctamente";
    
    $sendParam = $provee->save($nombre_empresa, $codigo, $telefono, $email, $direccion, $nombre_contacto, $telcont,$estado,$fecha,$razon);
    
header("location:mostrar.php?message=true");
    
  }else{
    header("location:mostrar.php?message=false");
  }

  ?>