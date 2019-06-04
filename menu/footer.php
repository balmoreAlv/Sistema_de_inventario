<!-- Modal para mostrar los desarrolladores del sistema o copyright-->
<form class="form-horizontal" action="#" method="POST"  accept-charset="utf-8"   autocomplete="off" role="form" >
 
<div class="modal fade" id="modal_info" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
<h4 class="modal-title">Desarrolladores</h4>

</div>

<div class="modal-body">
<div class="form-group">

<div class="col-sm-12" >
<li><a href="">Balmore Alvarez Martinez</a> </li>
<li><a href="">Emerson</a></li>
<li><a href="">Jazmin</a></li>
<li><a href="">Karina</a></li>


</div>
</div>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>

</div>
</div>
</div>
</div>
</form>

</div>
<footer class="main-footer">
<div class="pull-right hidden-xs">
<b><a href="#" data-toggle="modal" data-target="#modal_info">Desarrollado por: Estudiantes de Diseño de Sistemas</a></b>
</div>
<strong>Copyright &copy; 2019 <a href="#"  target="_blank">Sistema de Inventario Y Facturaci&oacute;n</a></strong> Todos los derechos reservados.
</footer> </div> 

<script src="./lib/jQuery-2.1.4.min.js"></script>
<script src="../lib/bootstrap.min.js"></script>
<script src="../lib/app.min.js"></script>



</body></html>

<?php


//Revision de session de ingreso al sistema

if (!$_SESSION["ok"])

{


  header("location:../");

}

?>