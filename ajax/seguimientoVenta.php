<?php
    
    require_once '../modelos/SeguimientoVenta.php';

    $articulo = new SeguimientoVenta();

    $idarticulo=isset($_POST["idarticulo"])? limpiarCadena($_POST["idarticulo"]):"";
    $idcategoria=isset($_POST["idcategoria"])? limpiarCadena($_POST["idcategoria"]):"";
    $nombre=isset($_POST["nombre"])? limpiarCadena($_POST["nombre"]):"";
    $stock=isset($_POST["stock"])? limpiarCadena($_POST["stock"]):"";
    $descripcion=isset($_POST["descripcion"])? limpiarCadena($_POST["descripcion"]):"";

    switch($_GET["op"])
    {
        case 'guardaryeditar':
                $rspta=$articulo->insertar($nombre,$idcategoria,$descripcion,$stock);
                $rspta=$articulo->editar($idarticulo);
                echo $rspta ? "Seguimiento de la Venta actualizado" : "Seguimiento de la Venta no se pudo actualizar";
        break;

        case 'desactivar':
                $rspta = $articulo->desactivar($idarticulo);
                echo $rspta ? "Articulo desactivada" : "Articulo no se pudo desactivar";
        break;

        case 'desactivarP':
                $rspta = $articulo->desactivarP($idarticulo);
                echo $rspta ? "Articulo desactivada" : "Articulo no se pudo desactivar";
        break;

        case 'activar':
            $rspta = $articulo->activar($idarticulo);
            echo $rspta ? "Articulo activado" : "Articulo no se pudo activar";
        break;

        case 'mostrar':
            $rspta = $articulo->mostrar($idarticulo);
            echo json_encode($rspta);
        break;

        case 'listar':
            $rspta = $articulo->listar();
            $data = Array();
            while ($reg = $rspta->fetch_object()) {
                $data[] = array(
                    "0"=>
                    '<button class="btn btn-warning" onclick="mostrar('.$reg->id.')" title="mostrar"><li class="fa fa-pencil"></li></button>'
                    ,
                     "1"=>$reg->fecha,
                     "2"=>$reg->faseseguimiento,
                    // "3"=>$reg->codigo,
                     "3"=>$reg->idventaencabezado,
                     "4"=>$reg->comentarios,
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
            require_once "../modelos/SeguimientoVenta.php";
            $categoria = new SeguimientoVenta();

            $rspta = $categoria->listarPP();

            while($reg = $rspta->fetch_object())
            {
                echo '<option value='.$reg->idFaseSeguimiento.'>'
                        .$reg->nombre.
                      '</option>';
               
            }
        break;

        case 'selectProveedor':
            require_once "../modelos/Proveedor.php";
            $proveedor = new Proveedor();

            $rspta = $proveedor->listarp();

            while($reg = $rspta->fetch_object())
            {
                echo '<option value='.$reg->idProveedor.'>'
                        .$reg->nombre.
                      '</option>';
               
            }
        break;
    }

?>