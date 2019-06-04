function eliminartipo(id){
 alertify.confirm("<p><img src='../img/warning.png'>&nbsp;&nbsp;&nbsp;&nbsp;<b>¿Realmente desea eliminar este tipo usuario?</b><br><br></p>",
  function (e) {
          if (e) {

            alertify.success("Se eliminó correctamente ");
             setTimeout('location.href="../tipousuario/guardar.php?id='+id+'"', 1900);
           
          } else { alertify.error("Ha cancelado la eliminación");
          }
        });


}



function eliminarusuario(id){
 alertify.confirm("<p><img src='../img/warning.png'>&nbsp;&nbsp;&nbsp;&nbsp;<b>¿Realmente desea eliminar este usuario?</b><br><br></p>",
  function (e) {
          if (e) {

            alertify.success("Se eliminó correctamente ");
            setTimeout('location.href="../usuario/eliminar.php?id='+id+'"', 1900);
           
          } else { alertify.error("Ha cancelado la eliminación");
          }
        });


}

function eliminarcliente(id){
 alertify.confirm("<p><img src='../img/warning.png'>&nbsp;&nbsp;&nbsp;&nbsp;<b>¿Realmente desea eliminar este registro?</b><br><br></p>",
  function (e) {
          if (e) {

            alertify.success("Se eliminó correctamente ");
             setTimeout('location.href="../cliente/eliminar.php?id='+id+'"', 1900);
           
          } else { alertify.error("Ha cancelado la eliminación");
          }
        });


}


function eliminarproveedor(id){
 alertify.confirm("<p><img src='../img/warning.png'>&nbsp;&nbsp;&nbsp;&nbsp;<b>¿Realmente desea eliminar este registro?</b><br><br></p>",
  function (e) {
          if (e) {

            alertify.success("Se eliminó correctamente ");
             setTimeout('location.href="../proveedor/eliminar.php?id='+id+'"', 1900);
           
          } else { alertify.error("Ha cancelado la eliminación");
          }
        });


}


function eliminartipoproducto(id){
 alertify.confirm("<p><img src='../img/warning.png'>&nbsp;&nbsp;&nbsp;&nbsp;<b>¿Realmente desea eliminar este registro?</b><br><br></p>",
  function (e) {
          if (e) {

            alertify.success("Se eliminó correctamente ");
             setTimeout('location.href="../tipoproducto/eliminar.php?id='+id+'"', 1900);
           
          } else { alertify.error("Ha cancelado la eliminación");
          }
        });


}


function eliminarproducto(id){
 alertify.confirm("<p><img src='../img/warning.png'>&nbsp;&nbsp;&nbsp;&nbsp;<b>¿Realmente desea eliminar este registro?</b><br><br></p>",
  function (e) {
          if (e) {

            alertify.success("Se eliminó correctamente ");
             setTimeout('location.href="../producto/eliminar.php?id='+id+'"', 1900);
           
          } else { alertify.error("Ha cancelado la eliminación");
          }
        });


}


function eliminarproduccion(id){
 alertify.confirm("<p><img src='../img/warning.png'>&nbsp;&nbsp;&nbsp;&nbsp;<b>¿Realmente desea eliminar este registro?</b><br><br></p>",
  function (e) {
          if (e) {

            alertify.success("Se eliminó correctamente ");
             setTimeout('location.href="../produccion/eliminar.php?id='+id+'"', 1900);
           
          } else { alertify.error("Ha cancelado la eliminación");
          }
        });


}



function eliminarproductocompra(id){
 alertify.confirm("<p><img src='../img/warning.png'>&nbsp;&nbsp;&nbsp;&nbsp;<b>¿Realmente desea eliminar este registro?</b><br><br></p>",
  function (e) {
          if (e) {

            alertify.success("Se eliminó correctamente ");
             setTimeout('location.href="../productocompra/eliminar.php?id='+id+'"', 1900);
           
          } else { alertify.error("Ha cancelado la eliminación");
          }
        });



 
}



