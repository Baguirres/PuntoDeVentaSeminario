<?php

    session_start();
    
    require_once '../modelos/Usuario.php';

    $usuario = new Usuario();

    $idusuario=isset($_POST["idusuario"])? limpiarCadena($_POST["idusuario"]):"";
    $nombre=isset($_POST["usuario"])? limpiarCadena($_POST["usuario"]):"";
    $clave=isset($_POST["clave"])? limpiarCadena($_POST["clave"]):"";
    $secretclave=isset($_POST["secretclave"])? limpiarCadena($_POST["secretclave"]):"";
    $imagen=isset($_POST["imagen"])? limpiarCadena($_POST["imagen"]):"";
    //$permiso=isset($_POST["permiso"])? limpiarCadena($_POST["permiso"]):"";
    $idempleado=isset($_POST["Empleado"])? limpiarCadena($_POST["Empleado"]):"";

    switch($_GET["op"])
    {
        case 'guardaryeditar':

            if(!file_exists($_FILES['imagen']['tmp_name']) || !is_uploaded_file($_FILES['imagen']['tmp_name']))
            {
                $imagen = $_POST["imagenactual"];
            }
            else
            {
                $ext = explode(".",$_FILES["imagen"]["name"]);
                if($_FILES['imagen']['type'] == "image/jpg" || $_FILES['imagen']['type'] == "image/jpeg" || $_FILES['imagen']['type'] == "image/png")
                {
                    $imagen = round(microtime(true)).'.'.end($ext);
                    move_uploaded_file($_FILES['imagen']['tmp_name'], "../files/usuarios/" . $imagen);
                }
            }

            //Hash SHA256 en la contraseña
            $clavehash = hash("SHA256",$clave);

            if (empty($idusuario)){
                $rspta=$usuario->insertar($nombre,$tipo_documento,$num_documento,$direccion,$telefono,$email,$cargo,$login,$clave,$imagen,$_POST['permiso']);
                echo $rspta ? "Usuario registrado" : "No se pudieron registrar todos los datos del usuario";
            }
            else {
                if($clave==$secretclave){
                    $rspta=$usuario->editar($idusuario,$nombre,$clave,$imagen,$idempleado,$_POST['permiso']);
                }else{
                    $rspta=$usuario->editar($idusuario,$nombre,$clavehash,$imagen,$idempleado,$_POST['permiso']);
                }
                echo $rspta ? "Usuario actualizado" : "Usuario no se pudo actualizar";
               
            }
        break;

        case 'desactivar':
                $rspta = $usuario->desactivar($idusuario);
                echo $rspta ? "Usuario desactivado" : "Usuario no se pudo desactivar";
        break;

        case 'selectEmpleado':
            require_once '../modelos/Trabajador.php';
            $trabajador = new Trabajador();

            $rspta = $trabajador->listarp();

            while($reg = $rspta->fetch_object())
            {
                echo '<option value='.$reg->idempleado.'>'.$reg->nombre.' '.$reg->apellido.'</option>';
            }
        break;

        case 'activar':
            $rspta = $usuario->activar($idusuario);
            echo $rspta ? "Usuario activado" : "Usuario no se pudo activar";
        break;

        case 'mostrar':
            $rspta = $usuario->mostrar($idusuario);
            echo json_encode($rspta);
        break;

        case 'listar':
            $rspta = $usuario->listar();
            $data = Array();
            while ($reg = $rspta->fetch_object()) {
                $data[] = array(
                    "0"=> ($reg->condicion) ? 
                        '<button class="btn btn-warning" onclick="mostrar('.$reg->idusuario.')"><li class="fa fa-pencil"></li></button>'.
                        '<button class="btn btn-danger" onclick="desactivar('.$reg->idusuario.')"><li class="fa fa-close"></li></button>'
                        :
                        '<button class="btn btn-warning" onclick="mostrar('.$reg->idusuario.')"><li class="fa fa-pencil"></li></button>'.
                        '<button class="btn btn-primary" onclick="activar('.$reg->idusuario.')"><li class="fa fa-check"></li></button>'
                        ,
                    "1"=>$reg->usuario,
                    "2"=>$reg->nombre.' '.$reg->apellido,
                    "3"=>$reg->correo,
                    "4"=>"<img src='../files/usuarios/".$reg->imagen."' height='50px' width='50px'>",
                    "5"=>($reg->condicion) ?'<span class="label bg-green">Activado</span>':'<span class="label bg-red">Desactivado</span>'
                );
            }
            $results = array(
                "sEcho"=>1, //Informacion para el datable
                "iTotalRecords" =>count($data), //enviamos el total de registros al datatable
                "iTotalDisplayRecords" => count($data), //enviamos el total de registros a visualizar
                "aaData" =>$data
            );
            echo json_encode($results);
        break;

        case 'permisos':
            //obtenemos los permisos de la tabla permisos
            require_once '../modelos/Permiso.php';
            $permiso = new Permiso();
            $rspta = $permiso->listar();

            //Obtener los permisos del usuario
            $id=$_GET['id'];
            $marcados = $usuario->listarmarcados($id);
            
            //declaramos el array para almacenar todos los permisos marcados
            $valores = array();

            //Almacenar los permisos asignados al usuario en el array
            while ($per = $marcados->fetch_object()) 
            {
                array_push($valores,$per->idpermiso);
            }

            while($reg = $rspta->fetch_object())
            {
                $sw = in_array($reg->idpermiso, $valores) ? 'checked' : '';

                echo '<li> 
                        <input type="checkbox" '.$sw.' name="permiso[]" value="'.$reg->idpermiso.'">'
                        .$reg->nombre.
                    '</li>';
            }
        break;


        case 'verificar':
            $logina = $_POST['logina'];
            $clavea = $_POST['clavea'];

            //Desencriptar clave SHA256
            $clavehash = hash("SHA256",$clavea);

            $rspta = $usuario->verificar($logina, $clavehash);

            $fetch = $rspta->fetch_object();

            if(isset($fetch))
            {
                //Declarando variables de session
                $_SESSION['idusuario'] = $fetch->idusuario;
                $_SESSION['nombre'] = $fetch->nombre;
                $_SESSION['imagen'] = $fetch->imagen;
                $_SESSION['login'] = $fetch->login;

                //Obtenemos los permisos del usuario
                $permisos = $usuario->listarmarcados($fetch->idusuario);

                //Array para almacenar los permisos
                $valores= array();

                while($per = $permisos->fetch_object())
                {
                    array_push($valores, $per->idpermiso);
                }

                //Determinando los accesos del usuario
                in_array(1,$valores) ? $_SESSION['escritorio'] = 1 : $_SESSION['escritorio'] = 0;
                in_array(2,$valores) ? $_SESSION['almacen'] = 1 : $_SESSION['almacen'] = 0;
                in_array(3,$valores) ? $_SESSION['compras'] = 1 : $_SESSION['compras'] = 0;
                in_array(4,$valores) ? $_SESSION['ventas'] = 1 : $_SESSION['ventas'] = 0;
                in_array(5,$valores) ? $_SESSION['acceso'] = 1 : $_SESSION['acceso'] = 0;
                in_array(6,$valores) ? $_SESSION['consultac'] = 1 : $_SESSION['consultac'] = 0;
                in_array(7,$valores) ? $_SESSION['consultav'] = 1 : $_SESSION['consultav'] = 0;
            }

            echo json_encode($fetch); //Retornando JSON
        break;

        case 'salir':
            session_unset(); //Limpiamos las variables de sesion
            session_destroy(); //Destriumos la sesion
            header("Location: ../index.php");
        break;

    }

?>