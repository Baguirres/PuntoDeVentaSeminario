<?php
    
    require_once '../modelos/Tienda.php';

    $tienda = new Tienda();

    $idtienda=isset($_POST["idtienda"])? limpiarCadena($_POST["idtienda"]):"";
    $idmunicipio=isset($_POST["idmunicipio"])? limpiarCadena($_POST["idmunicipio"]):"";
    $nombre=isset($_POST["nombre"])? limpiarCadena($_POST["nombre"]):"";
    $direccion=isset($_POST["direccion"])? limpiarCadena($_POST["direccion"]):"";

    switch($_GET["op"])
    {
        case 'guardaryeditar':
            if (empty($idtienda)){
                $rspta=$tienda->insertar($nombre,$direccion,$idmunicipio);
                echo $rspta ? "Tienda registrado" : "Tienda no se pudo registrar";
            }
            else {
                $rspta=$tienda->editar($idtienda,$nombre,$direccion,$idmunicipio);
                echo $rspta ? "Tienda actualizado" : "Tienda no se pudo actualizar";
            }
        break;

        case 'desactivar':
                $rspta = $tienda->desactivar($idtienda);
                echo $rspta ? "Tienda desactivada" : "Tienda no se pudo desactivar";
        break;

        case 'activar':
            $rspta = $tienda->activar($idtienda);
            echo $rspta ? "Tienda activado" : "Tienda no se pudo activar";
        break;

        case 'mostrar':
            // echo ('<script>console.log("'.$idtienda.'")</script>');  
            $rspta = $tienda->mostrar($idtienda);
            echo json_encode($rspta);
        break;

        case 'listar':
            $rspta = $tienda->listar();
            $data = Array();
            while ($reg = $rspta->fetch_object()) {
                $data[] = array(
                    "0"=> '<button class="btn btn-warning" onclick="mostrar('.$reg->idtienda.')"><li class="fa fa-pencil"></li></button>'.
                    ' <button class="btn btn-primary" onclick="desactivar('.$reg->idtienda.')"><li class="fa fa-close"></li></button>',
                     "1"=>$reg->nombre,
                     "2"=>$reg->direccion,
                     "3"=>$reg->municipio
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

        case 'selectCategoria':
            require_once "../modelos/Tienda.php";
            $categoria = new Tienda();

            $rspta = $categoria->listarMunicipio();

            while($reg = $rspta->fetch_object())
            {
                echo '<option value='.$reg->idMunicipio.'>'
                        .$reg->nombre.
                      '</option>';
               
            }
        break;
    }

?>