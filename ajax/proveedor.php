<?php
    
    require_once '../modelos/Proveedor.php';

    $persona = new Proveedor();

    $idpersona=isset($_POST["idpersona"])? limpiarCadena($_POST["idpersona"]):"";
    $tipo_persona=isset($_POST["tipo_persona"])? limpiarCadena($_POST["tipo_persona"]):"";
    $nombre=isset($_POST["nombre"])? limpiarCadena($_POST["nombre"]):"";
    $tipo_documento=isset($_POST["tipo_documento"])? limpiarCadena($_POST["tipo_documento"]):"";
    $num_documento=isset($_POST["num_documento"])? limpiarCadena($_POST["num_documento"]):"";
    $direccion=isset($_POST["direccion"])? limpiarCadena($_POST["direccion"]):"";
    $telefono=isset($_POST["telefono"])? limpiarCadena($_POST["telefono"]):"";
    $email=isset($_POST["email"])? limpiarCadena($_POST["email"]):"";
    $nit=isset($_POST["nit"])? limpiarCadena($_POST["nit"]):"";

    switch($_GET["op"])
    {
        case 'guardaryeditar':
            if (empty($idpersona)){
                $rspta=$persona->insertar($nombre,$direccion,$telefono,$nit,$email);
                echo $rspta ? "Proveedor registrado" : "Proveedor no se pudo registrar";
            }
            else {
                $rspta=$persona->editar($idpersona,$nombre,$direccion,$telefono,$nit,$email);
                echo $rspta ? "Proveedor actualizado" : "Proveedor no se pudo actualizar";
            } 
        break;

        case 'eliminar':
                $rspta = $persona->eliminar($idpersona);
                echo $rspta ? "Proveedor eliminado" : "Proveedor no se pudo eliminar";
        break;

        case 'mostrar':
            $rspta = $persona->mostrar($idpersona);
            echo json_encode($rspta);
        break;

        case 'listarp':
            $rspta = $persona->listarp();
            $data = Array();
            while ($reg = $rspta->fetch_object()) {
                $data[] = array(
                    "0"=>
                        '<button class="btn btn-warning" onclick="mostrar('.$reg->idProveedor.')"><li class="fa fa-pencil"></li></button>'.
                        ' <button class="btn btn-danger" onclick="eliminar('.$reg->idProveedor.')"><li class="fa fa-trash"></li></button>'
                        ,
                    "1"=>$reg->nombre,
                    "2"=>$reg->telefono,
                    "3"=>$reg->nit,
                    "4"=>$reg->correo
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