<?php
    require '../config/conexion.php';

    Class Consultas
    {
        public function __construct()
        {

        }

        public function comprafecha($fecha_inicio, $fecha_fin)
        {
            $sql = "SELECT 
                    DATE(i.fecha) as fecha,
                    u.nombre as usuario,
                    p.nombre as proveedor,
                    t.nombre as tienda,
                    m.moneda as moneda,
                    SUM(d.cantidad) as cantidadprod,
                    i.total,
                    i.impuesto,
                    i.estado
                FROM compraencabezado i
                INNER JOIN proveedor p ON i.idproveedor = p.idproveedor
                INNER JOIN usuario u ON i.idusuario = u.idusuario
                INNER JOIN compradetalle d ON d.idCompraEncabezado = i.idCompraEncabezado
                INNER JOIN tipomoneda m ON i.idtipomoneda = m.idtipomoneda
                INNER JOIN tienda t ON i.idtienda = t.idtienda
                WHERE 
                        DATE(i.fecha) >= '$fecha_inicio'
                    AND
                        DATE(i.fecha) <= '$fecha_fin'
                        group by i.idCompraEncabezado";

            return ejecutarConsulta($sql);
        }

        public function ventasfecha($fecha_inicio, $fecha_fin)
        {
            $sql = "SELECT 
            DATE(v.fecha) as fecha,
            u.nombre as usuario,
            p.nombre as cliente,
            t.nombre as tienda,
            v.descuento,
            v.iva,
            v.total,
            v.iva,
            v.estado,
            SUM(d.cantidad) as cantidadprod
        FROM
            ventaencabezado v
        INNER JOIN ventadetalle d ON d.idventaencabezado = v.idventaencabezado
        INNER JOIN cliente p ON v.idcliente = p.idcliente
        INNER JOIN usuario u ON v.idusuario = u.idusuario
        INNER JOIN tienda t ON v.idtienda = t.idtienda
                    WHERE 
                        DATE(v.fecha) >= '$fecha_inicio'
                    AND
                        DATE(v.fecha) <= '$fecha_fin'
        group by v.idventaencabezado";

            return ejecutarConsulta($sql);
        }

        public function ventasfechacliente($fecha_inicio, $fecha_fin, $idcliente)
        {
            $sql = "SELECT 
            DATE(v.fecha) as fecha,
            u.nombre as usuario,
            p.nombre as cliente,
            t.nombre as tienda,
            v.descuento,
            v.iva,
            v.total,
            v.iva,
            v.estado,
            SUM(d.cantidad) as cantidadprod
        FROM
            ventaencabezado v
        INNER JOIN ventadetalle d ON d.idventaencabezado = v.idventaencabezado
        INNER JOIN cliente p ON v.idcliente = p.idcliente
        INNER JOIN usuario u ON v.idusuario = u.idusuario
        INNER JOIN tienda t ON v.idtienda = t.idtienda
                    WHERE 
                        DATE(v.fecha) >= '$fecha_inicio'
                    AND
                        DATE(v.fecha) <= '$fecha_fin'
                    AND
                        v.idcliente = '$idcliente'
        group by v.idventaencabezado";

            return ejecutarConsulta($sql);
        }

        public function devolucionfecha($fecha_inicio, $fecha_fin)
        {
            $sql = "SELECT 
            DATE(v.fecha) as fechaventa,
            u.nombre as usuario,
            p.nombre as cliente,
            t.nombre as tienda,
            v.total,
            SUM(d.cantidad) as cantidadprod,
            de.fecha as fechadevolucion,
            de.comentario,
            de.estado
        FROM
            devolucion de
        INNER JOIN ventaencabezado v ON v.idventaencabezado= de.idventaencabezado
        INNER JOIN ventadetalle d ON d.idventaencabezado = v.idventaencabezado
        INNER JOIN cliente p ON v.idcliente = p.idcliente
        INNER JOIN usuario u ON v.idusuario = u.idusuario
        INNER JOIN tienda t ON v.idtienda = t.idtienda
                    WHERE 
                        DATE(de.fecha) >= '$fecha_inicio'
                    AND
                        DATE(de.fecha) <= '$fecha_fin'
        group by v.idventaencabezado";

            return ejecutarConsulta($sql);
        }

        public function devolucionfechacliente($fecha_inicio, $fecha_fin, $idcliente)
        {
            $sql = "SELECT 
            DATE(v.fecha) as fechaventa,
            u.nombre as usuario,
            p.nombre as cliente,
            t.nombre as tienda,
            v.total,
            SUM(d.cantidad) as cantidadprod,
            de.fecha as fechadevolucion,
            de.comentario,
            de.estado
        FROM
            devolucion de
        INNER JOIN ventaencabezado v ON v.idventaencabezado= de.idventaencabezado
        INNER JOIN ventadetalle d ON d.idventaencabezado = v.idventaencabezado
        INNER JOIN cliente p ON v.idcliente = p.idcliente
        INNER JOIN usuario u ON v.idusuario = u.idusuario
        INNER JOIN tienda t ON v.idtienda = t.idtienda
                    WHERE 
                        DATE(de.fecha) >= '$fecha_inicio'
                    AND
                        DATE(de.fecha) <= '$fecha_fin'
                    AND
                        v.idcliente = '$idcliente'
        group by v.idventaencabezado";

            return ejecutarConsulta($sql);
        }

        public function bitacorafecha($fecha_inicio, $fecha_fin)
        {
            $sql = "SELECT b.idBitacora, u.nombre  as usuario, b.fecha, b.accion from bitacora b, usuario u WHERE b.idUsuario=u.idUsuario
                    AND 
                        DATE(b.fecha) >= '$fecha_inicio'
                    AND
                        DATE(b.fecha) <= '$fecha_fin'";

            return ejecutarConsulta($sql);
        }

        public function bitacorafechausuario($fecha_inicio, $fecha_fin, $idcliente)
        {
            $sql = "SELECT b.idBitacora, u.nombre  as usuario, b.fecha, b.accion from bitacora b, usuario u WHERE b.idUsuario=u.idUsuario
                    AND 
                        DATE(b.fecha) >= '$fecha_inicio'
                    AND
                        DATE(b.fecha) <= '$fecha_fin'
                    AND
                        b.idusuario = '$idcliente'";

            return ejecutarConsulta($sql);
        }

        public function inventarioxtienda($idtienda)
        {
            $sql = "SELECT 
                        p.nombre,
                        p.precio,
                        p.descripcion,
                        pr.nombre as proveedor,
                        p.estado,
                        i.cantidad,
                        t.nombre as tienda
                    FROM inventario i
                    INNER JOIN producto p ON i.idproducto = p.idproducto
                    INNER JOIN proveedor pr ON pr.idproveedor = p.idproveedor
                    INNER JOIN tienda t ON t.idtienda = i.idtienda
                    WHERE i.idtienda='$idtienda'";

            return ejecutarConsulta($sql);
        }

        public function inventario()
        {
            $sql = "SELECT 
                        p.nombre,
                        p.precio,
                        p.descripcion,
                        pr.nombre as proveedor,
                        p.estado,
                        SUM(i.cantidad) as cantidad,
                        'General' as tienda
                    FROM inventario i
                    INNER JOIN producto p
                    ON i.idproducto = p.idproducto
                    INNER JOIN proveedor pr
                    ON pr.idproveedor = p.idproveedor
                    INNER JOIN tienda t ON t.idtienda = i.idtienda
                    GROUP BY p.idproducto
                    ORDER BY tienda";

            return ejecutarConsulta($sql);
        }

        public function totalCompraHoy()
        {
            $sql= "SELECT 
                        IFNULL(SUM(total),0) as total_compra
                    FROM
                        compraencabezado
                    WHERE
                        DATE(fecha) = curdate()";
            
            return ejecutarConsulta($sql);
        }

        public function totalVentaHoy()
        {
            $sql= "SELECT 
                        IFNULL(SUM(total),0) as total_venta
                    FROM
                        ventaencabezado
                    WHERE
                        DATE(fecha) = curdate()";
            
            return ejecutarConsulta($sql);
        }


        public function comprasUlt10dias()
        {
            $sql= "SELECT CONCAT(DAY(fecha),'/',MONTH(fecha)) as fecha2, SUM(total) as total FROM COMPRAENCABEZADO WHERE MONTH(fecha)=MONTH(NOW()) GROUP BY DAY(fecha) ORDER BY fecha";
            
            return ejecutarConsulta($sql);
        }

        public function ventasUlt10dias()
        {
            $sql= "SELECT CONCAT(DAY(fecha),'/',MONTH(fecha)) as fecha2, SUM(total) as total FROM ventaencabezado WHERE MONTH(fecha)=MONTH(NOW()) GROUP BY DAY(fecha) ORDER BY fecha";
            
            return ejecutarConsulta($sql);
        }

        public function compras12meses()
        {
            $sql= "SELECT 
                        DATE_FORMAT(fecha,'%M') as fecha,
                        SUM(total) as total
                    FROM
                        compraencabezado
                    WHERE YEAR(fecha)=YEAR(NOW())
                    GROUP BY
                        MONTH(fecha) 
                    ORDER BY
                        MONTH(fecha) 
                    ";
            
            return ejecutarConsulta($sql);
        }

        public function ventas12meses()
        {
            $sql= "SELECT 
                        DATE_FORMAT(fecha,'%M') as fecha,
                        SUM(total) as total
                    FROM
                        ventaencabezado
                    WHERE YEAR(fecha)=YEAR(NOW())
                    GROUP BY
                        MONTH(fecha) 
                    ORDER BY
                        MONTH(fecha) 
                    ";
            
            return ejecutarConsulta($sql);
        }

    }

?>