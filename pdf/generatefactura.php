<?php

//Permite solo que ingrese el usuario que ha iniciado sesion.
session_start();
if (!$_SESSION["ok"])

{


  header("location:../");
}

include 'convertidor.php';
if (!empty(intval(@$_GET['id_factura']))) {

        $id = intval($_GET['id_factura']);
       
    }else{

      $id = 0;
        echo "<script>alert('Su factura no se puede generar!')</script>";
   echo " <style type='text/css'> body{ background: url(../imagenes/oscuro.jpg);}  </style>
   <body><center><img align='center' src='../imagenes/cerrito.png'><br><h1>*Lo Siento ha ocurrido un error!!!</h1></center></body>";
    echo "<script>window.close();</script>";
    exit;
    }

  //hora y fecha
      date_default_timezone_set('America/El_Salvador'); 
    $fecha = date('d-m-Y g:i:s A');



require_once  '../conexion/conexion.php'; 
    $conn = conexion();
//consult para seleccionar todos los datos de la venta

    //Consulta a la tabla y le damos un limite
 $command = "SELECT detalleventa.cantidad,producto.nombre as nombrepr,producto.descripcion as descri,detalleventa.precio,detalleventa.subtotal FROM detalleventa inner join producto
  on detalleventa.idproducto = producto.idproducto WHERE idventa = '$id'";
//Conexion donde ejecuta
$resultado = $conn->prepare($command);
$resultado->execute();
//Total de registros encontrados
$total = $resultado->rowcount();
//array
$data = array();

//Estructura ciclica de repeticion
while($rowss = $resultado->fetch())
{
    $datoss[] = $rowss;
}

  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $sql = "SELECT venta.*,usuario.nombre as nombrep,usuario.apellido as apell, cliente.nombre as nom,cliente.apellido as ape,cliente.email,cliente.direccion,cliente.telefono,cliente.dui FROM venta inner join usuario on 
    venta.idusuario= usuario.idusuario inner join cliente on venta.idcliente = cliente.idcliente where idventa = $id";
    $q = $conn->prepare($sql);
    $q->execute(array($id));

    $data = $q->fetch(PDO::FETCH_ASSOC);
    $nombres=$data['nombrep']." ".$data['apell'];
    $tele= $data['telefono'];
    $emai=$data['email'];
   
    $rowcount = $q->rowcount();


    if ($rowcount==0)
    {
    echo "<script>alert('Su factura no se puede generar!')</script>";
   echo " <style type='text/css'> body{ background: url(../imagenes/oscuro.jpg);}  </style>
   <body><center><img align='center' src='../imagenes/cerrito.png'><br><h1>*Lo Siento ha ocurrido un error!!!</h1></center></body>";
    echo "<script>window.close();</script>";
    exit;

    }


$que ="SELECT sum(cantidad) as cant,sum(subtotal) as totaldinero FROM detalleventa  WHERE idventa = $id";
 $qu = $conn->prepare($que);
    $qu->execute(array($id));

    $dato = $qu->fetch(PDO::FETCH_ASSOC);
    $totaldiner=$dato['totaldinero'];
     $cant=$dato['cant'];
    $mesr = $totaldiner*0.1;
  

$dat = date('d-m-y');



if ((($data['nom']) =="&") && (($data['ape'])=="&")) {
 $nombrescompleto ="________________________________<br>";
 $clientefecha ="Cliente no registrado ".$dat;
}else{
  $nombrescompleto=$data['nom']." ".$data['ape'];
  $clientefecha =$nombrescompleto." ".$dat;
}

if ($data['dui'] == "") {
  $dui ="____________________________________<br>";
}else{
  $dui=$data['dui'];
}

if ($data['telefono'] == "") {
  $telefonos ="______________________________<br>";
}else{
  $telefonos=$data['telefono'];
}

if ($data['email'] == "") {
  $emailes ="_________________________________<br>";
}else{
  $emailes=$data['email'];
}

if ($data['direccion'] == "") {
  $direcciones ="______________________________<br>";
}else{
  $direcciones=$data['direccion'];
}

$html = '
<html>
<head>

<style>
body {font-family: sans-serif;
  font-size: 10pt;
}
p { margin: 0pt; }
table.items {
  border: 0.1mm solid #000000;
}
td { vertical-align: top; }
.items td {
  border-left: 0.1mm solid #000000;
  border-right: 0.1mm solid #000000;
}
table thead td { background-color: #EEEEEE;
  text-align: center;
  border: 0.1mm solid #000000;
  font-variant: small-caps;
}
.items td.blanktotal {
  background-color: #EEEEEE;
  border: 0.1mm solid #000000;
  background-color: #FFFFFF;
  border: 0mm none #000000;
  border-top: 0.1mm solid #000000;
  border-right: 0.1mm solid #000000;
}
.items td.totals {
  text-align: right;
  border: 0.1mm solid #000000;
}
.items td.cost {
  text-align: "." center;
}
</style>
</head>

<body>

<!--mpdf
<htmlpageheader name="myheader">
<table border="0" width="100%" align="center" cellpading="0" cellspacing="0" style="" >
        <tbody><tr>
          <td width="20%" style="text-align: left;" ><img src="../imagenes/cerrito.png" style="width:125px;"> </td>
          <td align="center" width="60%" style=""><h2>Factura de venta</h2></td>
          <td a width="30%" style="text-align: right;">No.<br /><span style="font-weight: bold; font-size: 12pt;">0'.$data['idventa'].'</span></td>
        </tr>
      </tbody></table>
</htmlpageheader>

<htmlpagefooter name="myfooter">
<div style="border-top: 1px solid #000000; font-size: 9pt; text-align: center; padding-top: 3mm; ">
P&aacute;gina {PAGENO} de {nb}
</div>
</htmlpagefooter>

<sethtmlpageheader name="myheader" value="on" show-this-page="1" />
<sethtmlpagefooter name="myfooter" value="on" />
mpdf-->

<div style="text-align: right">Fecha:&nbsp;'.$fecha.'</div>

<br />

<table class="items" width="100%" style="font-size: 9pt; border-collapse: collapse; " cellpadding="8">
<thead>
<tr>

<td width="10%">CANTIDAD</td>
<td width="20%">PRODUCTO</td>
<td width="40%">DESCRIPCI&Oacute;N</td>
<td width="15%">PRECIO UNITARIO</td>
<td width="15%">SUBTOTAL</td>
</tr>
</thead>
<tbody>';

    foreach($datoss as $row)
    {
        $html .='<!-- END ITEMS HERE --><tr>

<td align="center">'.$row['cantidad'].'</td>
<td>'.$row['nombrepr'].'</td>
<td>'.$row['descri'].'</td>
<td class="cost">$ '.$row['precio'].'</td>
<td class="cost">$ '.$row['subtotal'].'</td>
</tr>';
     }

$html .='
<!-- ITEMS HERE -->
</tbody>
</table>


<div style="text-align: center; font-style: italic;">
  <br><center><h3>Gracias por su compra!</h3></center><br></div>
</body>
</html>
';


//==============================================================
//==============================================================
//==============================================================
//==============================================================
//==============================================================
//==============================================================

define('_MPDF_PATH','');
include("lib/pdf/mpdf.php");

$mpdf=new mPDF('c','A4','','',15,15,41,41,10,10); 
$mpdf->SetProtection(array('print'));
$mpdf->SetTitle("Factura Comercial de Venta Para: ".$clientefecha);
$mpdf->SetAuthor("Alumnos ULS");
$mpdf->SetWatermarkText("Sistema de inventario y facturación");
$mpdf->showWatermarkText = true;
$mpdf->watermark_font = 'DejaVuSansCondensed';





$mpdf->WriteHTML($html);


$mpdf->Output($clientefecha.'.pdf','I');

exit;

