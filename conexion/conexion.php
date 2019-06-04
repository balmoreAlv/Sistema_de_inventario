<?php


date_default_timezone_set('America/El_Salvador'); 
		
/*@header("Content-Type: text/html;charset=iso-8859-1");*/
//Funcion que contiene el enlace a la base de datos.
function conexion(){
	$conn = null;
	$host = 'localhost';
	$db = 'db_barrera';
	$user = 'root';
	$pwd = '';
	
try{
	$conn = new PDO('mysql:host='.$host.'; dbname='.$db,$user,$pwd/*,array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES  \'UTF8\'')*/);
	//echo 'Conexion satisfactoria.<br>';
	
}catch(PDOException $e){

	
exit();
	
}
return $conn;
	
}


?>