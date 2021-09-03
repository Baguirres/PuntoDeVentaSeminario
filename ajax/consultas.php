<?php
    
    require_once '../modelos/Consultas.php';

    $consulta = new Consultas();

    switch($_GET["op"])
    {

        case 'comprasfecha':

            $fecha_inicio = $_REQUEST["fecha_inicio"];
            $fecha_fin = $_REQUEST["fecha_fin"];

            $rspta = $consulta->comprafecha($fecha_inicio, $fecha_fin);
            $data = Array();

            while ($reg = $rspta->fetch_object()) {
                $data[] = array(
                    "0"=>$reg->fecha,
                    "1"=>$reg->usuario,
                    "2"=>$reg->proveedor,
                    "3"=>$reg->tipo_comprobante,
                    "4"=>$reg->serie_comprobante.' '.$reg->num_comprobante,
                    "5"=>$reg->total_compra,
                    "6"=>$reg->impuesto,
                    "7"=>($reg->estado== 'Aceptado') ?
                         '<span class="label bg-green">Aceptado</span>'
                         :      
                         '<span class="label bg-red">Anulado</span>'
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


        case 'ventasfechacliente':

            $fecha_inicio = $_REQUEST["fecha_inicio"];
            $fecha_fin = $_REQUEST["fecha_fin"];
            $idcliente = $_REQUEST["idcliente"];

            $rspta = $consulta->ventasfechacliente($fecha_inicio, $fecha_fin, $idcliente);
            $data = Array();

            while ($reg = $rspta->fetch_object()) {
                $data[] = array(
                    "0"=>$reg->fecha,
                    "1"=>$reg->usuario,
                    "2"=>$reg->cliente,
                    "3"=>$reg->tipo_comprobante,
                    "4"=>$reg->serie_comprobante.' '.$reg->num_comprobante,
                    "5"=>$reg->total_venta,
                    "6"=>$reg->impuesto,
                    "7"=>($reg->estado== 'Aceptado') ?
                         '<span class="label bg-green">Aceptado</span>'
                         :      
                         '<span class="label bg-red">Anulado</span>'
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

        case 'inventarioxtienda':

            $idtienda = $_REQUEST["idtienda"];

            $rspta = $consulta->inventarioxtienda($idtienda);
            $data = Array();

            while ($reg = $rspta->fetch_object()) {
                $data[] = array(
                    "0"=>$reg->nombre,
                    "1"=>$reg->precio,
                    "2"=>$reg->descripcion,
                    "3"=>$reg->proveedor,
                    "4"=>$reg->cantidad,
                    "5"=>($reg->estado) ?
                         '<span class="label bg-green">Activo</span>'
                         :      
                         '<span class="label bg-red">Inactivo</span>'
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

        case 'inventario':

            $rspta = $consulta->inventario();
            $data = Array();

            while ($reg = $rspta->fetch_object()) {
                $data[] = array(
                    "0"=>$reg->nombre,
                    "1"=>$reg->precio,
                    "2"=>$reg->descripcion,
                    "3"=>$reg->proveedor,
                    "4"=>$reg->cantidad,
                    "5"=>($reg->estado) ?
                         '<span class="label bg-green">Activo</span>'
                         :      
                         '<span class="label bg-red">Inactivo</span>'
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