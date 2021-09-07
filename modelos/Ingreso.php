<?php
    require '../config/conexion.php';

    Class Ingreso 
    {
        public function __construct()
        {

        }

        public function insertar($idproveedor,$idusuario,$tipo_comprobante,$serie_comprobante,$num_comprobante,$fecha_hora,$impuesto,$total_compra,$idarticulo,$cantidad,$precio_compra,$precio_venta)
        {
            /*$sql = "INSERT INTO ingreso (
                        idproveedor,
                        idusuario,
                        tipo_comprobante,
                        serie_comprobante,
                        num_comprobante,
                        fecha_hora,
                        impuesto,
                        total_compra,
                        estado
                    ) 
                    VALUES (
                        '$idproveedor',
                        '$idusuario',
                        '$tipo_comprobante',
                        '$serie_comprobante',
                        '$num_comprobante',
                        '$fecha_hora',
                        '$impuesto',
                        '$total_compra',
                        'Aceptado'
                        )";
            
            //Devuelve id registrado
            $idingresonew = ejecutarConsulta_retornarID($sql);

            $num_elementos = 0;
            $sw = true;

            while($num_elementos < count($idarticulo))
            {
                $sql_detalle ="INSERT INTO detalle_ingreso (
                                    idingreso,
                                    idarticulo,
                                    cantidad,
                                    precio_compra,
                                    precio_venta
                                )
                                VALUES (
                                    '$idingresonew',
                                    '$idarticulo[$num_elementos]',
                                    '$cantidad[$num_elementos]',
                                    '$precio_compra[$num_elementos]',
                                    '$precio_venta[$num_elementos]'
                                )";

                ejecutarConsulta($sql_detalle) or $sw = false;

                $num_elementos = $num_elementos + 1;
            }

            return $sw;*/
        }

        public function anular($idcompraencabezado)
        {
           /*$sql= "UPDATE compraencabezado SET estado=0
                   WHERE idcompraencabezado='$idcompraencabezado'";
            
            return ejecutarConsulta($sql);*/
        }
    
        public function mostrar($idcompraencabezado)
        {
            /*$sql = "SELECT i.idcompraencabezado, DATE(i.fecha) as fecha, i.idproveedor, p.nombre as proveedor, u.idusuario, u.nombre as usuario,
                            i.total, i.estado 
                    FROM compraencabezado i
                    INNER JOIN proveedor p ON i.idproveedor = p.idproveedor
                    INNER JOIN usuario u ON i.idusuario = u.idusuario
                    WHERE i.idcompraencabezado='$idcompraencabezado'";

            return ejecutarConsultaSimpleFila($sql);*/
        }

        public function listarDetalle($idcompraencabezado)
        {
            /*$sql = "SELECT di.idcompraencabezado, di.idproducto, a.nombre, di.cantidad, a.precio
                    FROM compradetalle di
                    INNER JOIN producto a ON di.idproducto = a.idproducto
                    WHERE di.idcompraencabezado='$idcompraencabezado'";

            return ejecutarConsulta($sql);*/
        }

        public function listar()
        {
            $sql = "SELECT i.idcompraencabezado, DATE(i.fecha) as fecha, p.nombre as proveedor, u.idusuario, u.nombre as usuario,
            SUM(d.cantidad) as cantidadprod ,i.total, i.estado 
            FROM compraencabezado i
            INNER JOIN proveedor p ON i.idproveedor = p.idproveedor
            INNER JOIN usuario u ON i.idusuario = u.idusuario
            INNER JOIN compradetalle d ON d.idCompraEncabezado = i.idCompraEncabezado
            ORDER BY i.fecha desc";

            return ejecutarConsulta($sql);
        }

    }

?>