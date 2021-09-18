<?php
    require '../config/conexion.php';

    Class Ingreso 
    {
        public function __construct()
        {

        }

        public function insertar($fecha,$idproveedor,$idtienda,$impuesto,$usuario,$moneda,$total,$articulos,$cantidad)
        {
            $sql = "INSERT INTO compraencabezado (
                        fecha,
                        idproveedor,
                        total,
                        idusuario,
                        idtienda,
                        idtipomoneda,
                        impuesto
                    ) 
                    VALUES (
                        '$fecha',
                        '$idproveedor',
                        '$total',
                        '$usuario',
                        '$idtienda',
                        '$moneda',
                        '$impuesto'
                        )";
            
            //Devuelve id registrado
            $idingresonew = ejecutarConsulta_retornarID($sql);

            $num_elementos = 0;
            $sw = true;
            while($num_elementos < count($articulos))
            {
                $idarticulo = $articulos[$num_elementos];
                $cantart = $cantidad[$num_elementos];
                $sql_detalle ="INSERT INTO compradetalle (
                                    idproducto,
                                    idcompraencabezado,
                                    cantidad
                                )
                                VALUES (
                                    '$idarticulo',
                                    '$idingresonew',
                                    '$cantart'
                                )";

                ejecutarConsulta($sql_detalle) or $sw = false;
                $num_elementos = $num_elementos + 1;
            }

            return $sw;
        }

        public function modificar($idcompraencabezado,$estado,$articulos,$cantidad,$idtienda)
        {
           $sql= "UPDATE compraencabezado SET estado='$estado'
                   WHERE idcompraencabezado='$idcompraencabezado'";           
            if($estado==2){
                $num_elementos = 0;
                $sw = true;
                while($num_elementos < count($articulos))
                {
                    $idarticulo = $articulos[$num_elementos];
                    $cantart = $cantidad[$num_elementos];
                    $sql_detalle ="INSERT INTO inventario
                                    VALUES (
                                        '$idarticulo',
                                        '$idtienda',
                                        '$cantart'
                                    )
                                    ON DUPLICATE KEY UPDATE
                                    Cantidad     = (SELECT i.Cantidad from inventario i where i.idProducto='$idarticulo' and i.idTienda='$idtienda')+$cantart";

                    ejecutarConsulta($sql_detalle) or $sw = false;
                    $num_elementos = $num_elementos + 1;
                }
            }            
            return ejecutarConsulta($sql);
        }

        public function anular($idcompraencabezado)
        {
           /*$sql= "UPDATE compraencabezado SET estado=0
                   WHERE idcompraencabezado='$idcompraencabezado'";
            
            return ejecutarConsulta($sql);*/
        }
    
        public function mostrar($idcompraencabezado)
        {
            $sql = "SELECT i.idcompraencabezado, DATE(i.fecha) as fecha, i.idproveedor, u.nombre as usuario,
            i.idtienda, i.idtipomoneda, i.impuesto,i.total, i.estado 
        FROM compraencabezado i
        INNER JOIN usuario u ON i.idusuario = u.idusuario
        WHERE i.idcompraencabezado='$idcompraencabezado'";

            return ejecutarConsultaSimpleFila($sql);
        }

        public function listarDetalle($idcompraencabezado)
        {
            $sql = "SELECT di.idcompraencabezado, di.idproducto, a.nombre, di.cantidad, a.precio, a.preciocompra, a.idproducto
                    FROM compradetalle di
                    INNER JOIN producto a ON di.idproducto = a.idproducto
                    WHERE di.idcompraencabezado='$idcompraencabezado'";

            return ejecutarConsulta($sql);
        }

        public function listar()
        {
            $sql = "SELECT i.idcompraencabezado, DATE(i.fecha) as fecha, p.nombre as proveedor, u.idusuario, u.nombre as usuario,
            SUM(d.cantidad) as cantidadprod ,i.total, i.estado, i.impuesto, m.moneda, t.nombre as tienda
            FROM compraencabezado i
            INNER JOIN proveedor p ON i.idproveedor = p.idproveedor
            INNER JOIN usuario u ON i.idusuario = u.idusuario
            INNER JOIN compradetalle d ON d.idCompraEncabezado = i.idCompraEncabezado
            INNER JOIN tipomoneda m ON i.idtipomoneda = m.idtipomoneda
            INNER JOIN tienda t ON i.idtienda = t.idtienda
            group by i.idCompraEncabezado
            ORDER BY i.fecha desc";

            return ejecutarConsulta($sql);
        }

    }


?>