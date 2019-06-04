<?php

//Permite solo que ingrese el usuario que ha iniciado sesion.
session_start();
if (!$_SESSION["ok"]) {

    header("location:../");
}

include '../../conexion/conexion.php';
$connection = conexion();

if (!empty(intval($_GET['desde'] != 0)) and !empty(intval($_GET['hasta'] != 0))) {

    $desde = $_GET['desde'];
    $hasta = $_GET['hasta'];

//Query con l tabla cliente
    $sql = "SELECT producto.*,tipoproducto.nombre as nombproducto, tipoproducto.idtipoproducto as idtipo FROM producto
   INNER JOIN tipoproducto ON producto.idtipoproductos = tipoproducto.idtipoproducto where  producto.fechav BETWEEN '$desde' AND '$hasta' order by idproducto desc";

    $q = $connection->prepare($sql);
    //Ejecuta la consulta
    $q->execute();
    $total = $q->rowcount();
    $model = array();
    //arrary de datos
    while ($rows = $q->fetch()) {
        $model[] = $rows;
    }

} elseif (!empty(intval($_GET['desde'] == 0)) and !empty(intval($_GET['hasta'] == 0))) {
    $desde = "Todos" . $hasta;

    $sql = "SELECT producto.*,tipoproducto.nombre as nombproducto, tipoproducto.idtipoproducto as idtipo FROM producto
   INNER JOIN tipoproducto ON producto.idtipoproductos = tipoproducto.idtipoproducto order by idproducto desc";

    $q = $connection->prepare($sql);
    //Ejecuta la consulta
    $q->execute();
    $total = $q->rowcount();
    $model = array();
    //arrary de datos
    while ($rows = $q->fetch()) {
        $model[] = $rows;
    }

} else {
    echo "<script>alert('Error. El reporte no puede mostrarse!')</script>";
    echo " <style type='text/css'> body{ background: url(../imagenes/fondo.jpg);}  </style>
   <body><center><img align='center' src='../imagenes/uls.jpg'><br><h1>*Lo Siento ha ocurrido un error!!!</h1></center></body>";
    echo "<script>window.close();</script>";
    exit;
}

//hora y fecha
date_default_timezone_set('America/El_Salvador');
$fecha = date('d-m-Y g:i:s A');

$html = '
<html>
<head>
<style>
body {font-family: sans-serif;
  font-size: 10pt;
}
p { margin: 0pt; }

td { vertical-align: top; }

#ds tr td {
  text-align: center;
  border: 0.1mm solid #000000;

}


</style>

</head>
<body>

<!--mpdf
<htmlpageheader name="myheader">
<table border="0" width="100%" align="center" cellpading="0" cellspacing="0" style="" >
        <tbody><tr>
          <td width="20%" style="text-align: left;" ><img src="../../imagenes/uls.jpg" style="width:170px;"> </td>
          <td align="center" width="45%" style="">Sistema de inventario y facturación<br><br>Producto</td>
          <td a width="30%" style="text-align: right;">Fecha Impresi&oacute;n.<br /><span style="font-weight: bold; font-size: 10pt;">' . $fecha . '</span></td>
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








<br />

<table id="ds" width="100%" style="font-size: 10pt; border-collapse: collapse; " cellpadding="8">

<thead>
<tr style="background-color:#EEEEEE;">
<td colspan="6"><b>Reporte de Producto:<b>&nbsp;&nbsp;' . $total . '&nbsp;&nbsp;registros</td>

<td colspan="8">';
if (($desde == 0) && ($hasta==0)) {
 $html .= $desde.$hasta;
}elseif  (($desde != 0) && ($hasta!=0)){
  $html .= date("d-m-Y", strtotime($desde))."  - ".date("d-m-Y", strtotime($hasta));
}


$html .='</td>



</tr>
<tr style="background-color:#FA8072;">
<td>ID</td>
<td>Nombre</td>
<td>Descripci&oacute;n</td>
<td>Existencia</td>
<td>Precio/U</td>
<td>Total</td>
<td>Tipo/P</td>
<td>Fecha/V</td>
</tr>
</thead>

<tbody><!-- END ITEMS HERE -->';
$sumae =0;
$sumas =0;
$sumac  = 0;
$suma   = 0;
$sumast = 0;
if ($total != 0) {
    # code...

    foreach ($model as $row) {

        $suma += $row['preciounitario'];
        $sumac += $row['cantidad'];
        $sumast += $row['total'];
        $html .= '<tr><td>' . $row["idproducto"] . '</td><td>' . $row['nombre'] . '</td>';

        $html .= '<td>' . $row['descripcion'] . '</td>';

        $html .= '<td style="background-color:#EEEEEE;">'.$row['cantidad'].'</td>';        
      
        $html .= '<td style="background-color:#EEEEEE;">' . $row['preciounitario'] . '</td>';
        $html .= '<td style="background-color:#EEEEEE;">' . $row['total'] . '</td>';
        $html .= '<td>' . $row['nombproducto'] . '</td>';
        $html .= '<td>' . date("d-m-Y", strtotime($row['fechav'])) . '</td>';

        $html .= '</tr>';

    }

    $html .= '<tr><td align="right" colspan="3">Totales </td><td style="background-color:#EEEEEE;">' . $sumac . '</td><td style="background-color:#EEEEEE;">'. $suma . '</td><td style="background-color:#EEEEEE;">' . $sumast . '</td><td colspan="4"></td></tr>';

} else {

    echo "<script>alert('Error. No se encontraron datos que mostrar!')</script>";
    echo " <style type='text/css'> body{ background: url(../imagenes/oscuro.jpg);}  </style>
   <body><center><img align='center' src='../imagenes/cerrito.png'><br><h1>*Lo Siento ha ocurrido un error!!!</h1></center></body>";
    echo "<script>window.close();</script>";
    exit;
}



$html .= '




</tbody>
</table>





</body>
</html>
';

//==============================================================
//==============================================================
//==============================================================
//==============================================================
//==============================================================
//==============================================================

define('_MPDF_PATH', '');
include "../lib/pdf/mpdf.php";

$mpdf = new mPDF('c', 'A4', '', '', 15, 15, 41, 41, 10, 10);
$mpdf->SetProtection(array('print'));
$mpdf->SetTitle("Reporte Producto Inventariado ".$fecha);
$mpdf->SetAuthor("Estudiantes ULS");
$mpdf->SetWatermarkText("Sistema de inventario y facturación");
$mpdf->showWatermarkText = true;
$mpdf->watermark_font    = 'DejaVuSansCondensed';

$mpdf->WriteHTML($html);

$mpdf->Output('Reporte Producto  ' . $fecha . '.pdf', 'I');

exit;
