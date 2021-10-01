<?php 
session_start();

include './conexion.php';
if(!isset($_SESSION['carrito'])){header("Location: ../index.php");} 
$arreglo  = $_SESSION['carrito'];

$total= 0;
for($i=0; $i<count($arreglo);$i++){
  $total = $total+($arreglo[$i]['Precio'] * $arreglo[$i]['Cantidad']);
}
// $password="";
// if(isset($_POST['c_account_password'])){
//     if($_POST['c_account_password']!=""){
//         $password = $_POST['c_account_password'];
//     }
// }
// $re = $conexion->query("select id,email from usuario where email = '".$_POST['c_email_address']."'")or  die($conexion->error);
// $id_usuario = 0;
// if(mysqli_num_rows($re)>0){
//   $fila= mysqli_fetch_row($re);
//   $id_usuario=$fila[0];
// }else{
//   $conexion->query("insert into usuario (nombre,telefono,email,password,img_perfil,nivel)  
//     values( 
//       '".$_POST['c_fname']." ".$_POST['c_lname']."',
//       '".$_POST['c_phone']."',
//       '".$_POST['c_email_address']."',
//       '".sha1($password)."',
//       'default.jpg',
//       'cliente' 
//           )   
//   ")or die($conexion->error);
//   $id_usuario = $conexion->insert_id;
// }

$fecha1 = date("Y-m-d");
$fecha = date("Y-m-d H:i:s");
if($_SESSION['idusuario'] == null){
      $conexion->query("insert into cliente (nombre,apellido,direccion,telefono,correo,fechanacimiento,nit)  
      values( 
        '".$_POST['c_fname']."',
        '".$_POST['c_lname']."',
        '".$_POST['c_address']."',
      '".$_POST['c_phone']."',
      '".$_POST['c_email_address']."',
      '$fecha1',
      '".$_POST['c_nit']."'
            )   
    ")or die($conexion->error);

    $cliente = $conexion ->insert_id;
    $conexion -> query("insert into ventaencabezado(idcliente,fecha,total,idTipoDePago,idTienda,idTipoMoneda) values(".$cliente.",'$fecha','$total',1,1,1)")or die($conexion->error);
}else{
    $conexion -> query("insert into ventaencabezado(idcliente,fecha,total,idTipoDePago,idTienda,idTipoMoneda) values(".$_SESSION['idcliente'] .",'$fecha','$total',1,1,1)")or die($conexion->error);
}


$id_venta = $conexion ->insert_id;

// $id_venta = $conexion ->query ("select max(idventaencabezado) from ventaencabezado");
for($i=0; $i<count($arreglo);$i++){
  $conexion -> query("insert into ventadetalle (idventaencabezado,idproducto,cantidad,descuento) 
    values(
      $id_venta,
      ".$arreglo[$i]['Id'].",
      ".$arreglo[$i]['Cantidad'].",
      0
      ) ")or die($conexion->error);
  $conexion->query("update inventario set cantidad = cantidad -".$arreglo[$i]['Cantidad']." where idTienda=1 and idProducto=".$arreglo[$i]['Id']  )or die($conexion->error);    
}


$to =$_POST['c_email_address'];
$from='prueba@prueba.com';
$subject = "Compra Realizada";
$message = "Su compra fue realizada con exito siendo un total de Q".$total.", proximamente estara recibiendo actualización sobre el estado de su compra";
echo '';
mail($to,$subject,$message);

// $conexion->query(" insert into envios(pais,company, direccion,estado,cp,id_venta) values
//       (
//         '".$_POST['country']."',
//         '".$_POST['c_companyname']."',
//         '".$_POST['c_address']."',
//         '".$_POST['c_state_country']."',
//         '".$_POST['c_postal_zip']."',
//         $id_venta
//       )  
      
//       ")or die($conexion->error);
      
//include "./php/mail.php";  
// if(isset($_POST['id_cupon'])){
//   if($_POST['id_cupon']!=""){
//       $conexion->query("update cupones set status ='utilizado' where id=".$_POST['id_cupon'])or die($conexion->error); 
//       $conexion->query("update ventas set id_cupon =".$_POST['id_cupon']." where id=".$id_venta)or die($conexion->error); 
//   }

// }


unset($_SESSION['carrito']);
header("Location: ../thankyou.php" );

?>