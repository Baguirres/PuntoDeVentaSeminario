<?php
    
    require_once '../modelos/Cliente.php';

    $cliente = new Cliente();

    $idcliente=isset($_POST["idcliente"])? limpiarCadena($_POST["idcliente"]):"";
    $nombre=isset($_POST["nombre"])? limpiarCadena($_POST["nombre"]):"";
    $apellido=isset($_POST["apellido"])? limpiarCadena($_POST["apellido"]):"";
    $fechan=isset($_POST["fechan"])? limpiarCadena($_POST["fechan"]):"";
    $direccion=isset($_POST["direccion"])? limpiarCadena($_POST["direccion"]):"";
    $telefono=isset($_POST["telefono"])? limpiarCadena($_POST["telefono"]):"";
    $email=isset($_POST["email"])? limpiarCadena($_POST["email"]):"";
    $nit=isset($_POST["nit"])? limpiarCadena($_POST["nit"]):"";

    switch($_GET["op"])
    {
        case 'guardaryeditar':
            if (empty($idcliente)){
                $rspta=$cliente->insertar($nombre,$apellido,$fechan,$email,$telefono,$direccion,$nit);
                echo $rspta ? "Cliente registrado" : "Cliente no se pudo registrar";
            }
            else {
                $rspta=$cliente->editar($idcliente,$nombre,$apellido,$fechan,$email,$telefono,$direccion,$nit);
                echo $rspta ? "Cliente actualizado" : "Cliente no se pudo actualizar";
            } 
        break;

        case 'eliminar':                
                $rspta = $cliente->eliminar($idcliente);
                echo $rspta ? "Cliente eliminado" : "Cliente no se pudo eliminar";
        break;

        case 'mostrar':
            $rspta = $cliente->mostrar($idcliente);
            echo json_encode($rspta);
        break;

        case 'listarp':
   
            $rspta = $cliente->listarp();
            $data = Array();
            while ($reg = $rspta->fetch_object()) {
                $data[] = array(
                    "0"=>
                        '<button class="btn btn-warning" onclick="mostrar('.$reg->idCliente.')"><li class="fa fa-pencil"></li></button>'.
                        ' <button class="btn btn-danger" onclick="eliminar('.$reg->idCliente.')"><li class="fa fa-trash"></li></button>'
                        ,
                    "1"=>$reg->Nombre,
                    "2"=>$reg->Apellido,
                    "3"=>$reg->Telefono,
                    "4"=>$reg->Correo,
                    "5"=>$reg->NIT
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