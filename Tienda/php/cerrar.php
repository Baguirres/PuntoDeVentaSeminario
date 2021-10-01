<?php 

session_start();
include './conexion.php';

    $_SESSION['idusuario'] = null;
    $_SESSION['nombre'] = null;
    $_SESSION['idcliente'] = null;

    header("Location: ../index.php" );



?>