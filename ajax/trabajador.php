<?php
    
    require_once '../modelos/Trabajador.php';

    $trabajador = new Trabajador();

    $idempleado=isset($_POST["idempleado"])? limpiarCadena($_POST["idempleado"]):"";
    $nombre=isset($_POST["nombre"])? limpiarCadena($_POST["nombre"]):"";
    $apellido=isset($_POST["apellido"])? limpiarCadena($_POST["apellido"]):"";
    $fechanac=isset($_POST["fechanac"])? limpiarCadena($_POST["fechanac"]):"";
    $fechaing=isset($_POST["fechaing"])? limpiarCadena($_POST["fechaing"]):"";
    $correo=isset($_POST["correo"])? limpiarCadena($_POST["correo"]):"";
    $telefono=isset($_POST["telefono"])? limpiarCadena($_POST["telefono"]):"";
    $direccion=isset($_POST["direccion"])? limpiarCadena($_POST["direccion"]):"";

    switch($_GET["op"])
    {
        case 'guardaryeditar':
            if (empty($idempleado)){
                $rspta=$trabajador->insertar($nombre,$apellido,$fechanac,$fechaing,$correo,$telefono,$direccion);
                echo $rspta ? "Persona registrada" : "Persona no se pudo registrar";
            }
            else {
                $rspta=$trabajador->editar($idempleado,$nombre,$apellido,$fechanac,$fechaing,$correo,$telefono,$direccion);
                echo $rspta ? "Persona actualizada" : "Persona no se pudo actualizar";
            }
        break;

        case 'eliminar':
                /*$rspta = $persona->eliminar($idpersona);
                echo $rspta ? "Persona eliminada" : "Persona no se pudo eliminar";*/
        break;

        case 'mostrar':
            $rspta = $trabajador->mostrar($idempleado);
            echo json_encode($rspta);
        break;

        case 'listarp':
            $rspta = $trabajador->listarp();
            $data = Array();
            while ($reg = $rspta->fetch_object()) {
                $data[] = array(
                    "0"=>
                        '<button class="btn btn-warning" onclick="mostrar('.$reg->idempleado.')"><li class="fa fa-pencil"></li></button>'.
                        ' <button class="btn btn-danger" onclick="eliminar('.$reg->idempleado.')"><li class="fa fa-trash"></li></button>'
                        ,
                    "1"=>$reg->idempleado,
                    "2"=>$reg->nombre.' '.$reg->apellido,
                    "3"=>$reg->fechanacimiento,
                    "4"=>$reg->fechaingreso,
                    "5"=>$reg->correo,
                    "6"=> $reg->telefono,
                    "7"=> $reg->direccion,
                    "8"=>($reg->estado) ?'<span class="label bg-green">Activado</span>':'<span class="label bg-red">Desactivado</span>'
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

    }

?>