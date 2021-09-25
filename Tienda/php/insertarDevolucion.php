<?php 
session_start();

include './conexion.php';

$fecha1 = date("Y-m-d H:i:s");
$conexion->query("insert into devolucion (idVentaEncabezado,fecha,comentario,estado)  
     values( 
       '".$_POST['c_fname']."','$fecha1','".$_POST['motivo']."','1')   
   ")or die($conexion->error);


header("Location: ../gracias.php" );

?>