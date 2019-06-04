<?php
//Incluye el archivo header donde se encuentra el menu de modulos del sistema
include("header.php");

//Verfica la session de ingreso del usuario
if (!$_SESSION["ok"])

{

//Redirecciona al index,.php
  header("location:../");

}
?>


<div class="content-wrapper" style="min-height: 522px;">
<section class="content-header">
 <?php


  if ($inicio1 ==1) {
     # code...
 ?>


<?php 
 $pd = $conn->prepare("SELECT * from producto where cantidad<10");

  $pd->execute();

       $prod = $pd->rowcount();       
if ($prod >0){
?>
<?php


}
?>

 
</section>
 
<section class="content">

<?php  } 

?>







<?php if ($inicio2!="") {
    # code...
 ?>


<!-- Para inferior donde se muestrar otros modulos extras -->
<div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel bg-blue">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-database fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"></div>
                                    <div>Backup</div>
                                </div>
                            </div>
                        </div>
                        <a href="../backup/generatebackup.php">
                            <div class="panel-footer">
                                <span class="pull-left">Copia de seguridad</span>

                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                               
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel bg-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-briefcase fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"></div>
                                    <div>Tipo usuario</div>
                                </div>
                            </div>
                        </div>
                        <a href="../tipousuario/mostrar.php">
                            <div class="panel-footer">
                                <span class="pull-left">Ver Detalles</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel bg-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-institution fa-5x"></i>
                                </div>

                                <div class="col-xs-9 text-right">
                                    <div class="huge"></div>
                                    <div>Perfil Empresa</div>
                                </div>
                            </div>
                        </div>
                        <a href="../configbarrera/config.php">
                            <div class="panel-footer">
                                <span class="pull-left">Ver Detalles</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel bg-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-suitcase fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"></div>
                                    <div>Tipo Producto</div>
                                </div>
                            </div>
                        </div>
                        <a href="../tipoproducto/mostrar.php">
                            <div class="panel-footer">
                                <span class="pull-left">Ver Detalles</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>


            <?php } ?>

            <?php if ($inicio3!="") {
                # code...
            ?>


<?php }  ?> 
</section> 
 

<?php

//Incluye el archivo footer donde se encuentra el copyright
include("footer.php");

?>