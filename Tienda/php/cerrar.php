<?php 

session_start();
include './conexion.php';

    $_SESSION['idusuario'] = null;
    $_SESSION['nombre'] = null;
    $_SESSION['idcliente'] = null;
    $_SESSION['name'] = null;
    $_SESSION['ape'] = null;
    $_SESSION['nit'] = null;
    $_SESSION['direccion'] = null;
    $_SESSION['correo'] = null;
    $_SESSION['telefono'] = null;

    header("Location: ../index.php" );



?>