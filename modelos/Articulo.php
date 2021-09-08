<?php
    require '../config/conexion.php';

    Class Articulo 
    {
        public function __construct()
        {

        }

        public function insertar($idcategoria,$nombre,$stock,$imagen)
        {
            $sql = "INSERT INTO 
                        producto (
                            nombre,
                            idCategoria,
                            precio,
                            imagen
                        ) 
                    VALUES (
                        '$nombre',
                        '$idcategoria',
                        '$stock',
                        '$imagen')";
            
            return ejecutarConsulta($sql);
        }

        public function editar($idarticulo,$idcategoria,$nombre,$stock,$imagen)
        {
            $sql = "UPDATE producto SET 
                    idCategoria ='$idcategoria',
                    nombre = '$nombre', 
                    precio = '$stock', 
                    imagen = '$imagen' 
                    WHERE idproducto='$idarticulo'";
            
            return ejecutarConsulta($sql);
        }

        //METODOS PARA ACTIVAR ARTICULOS
        public function desactivar($idarticulo)
        {
            $sql= "DELETE from producto 
            WHERE idproducto='$idarticulo'";
            // $sql= "UPDATE articulo SET condicion='0' 
            //        WHERE idarticulo='$idarticulo'";
            
            return ejecutarConsulta($sql);
        }

        public function activar($idarticulo)
        {
            $sql= "UPDATE articulo SET condicion='1' 
                   WHERE idarticulo='$idarticulo'";
            
            return ejecutarConsulta($sql);
        }

        //METODO PARA MOSTRAR LOS DATOS DE UN REGISTRO A MODIFICAR
        public function mostrar($idarticulo)
        {
            $sql = "SELECT * FROM producto 
                    WHERE idproducto='$idarticulo'";

            return ejecutarConsultaSimpleFila($sql);
        }

        //METODO PARA LISTAR LOS REGISTROS
        public function listar()
        {

            $sql = "SELECT 
                    p.idproducto, 
                    p.idcategoria, 
                    c.nombre as categoria,
                    p.nombre,
                    p.precio,
                    p.imagen
                    FROM producto p
                    INNER JOIN categoria c 
                    ON p.idcategoria = c.idcateogira";

            return ejecutarConsulta($sql);
        }

        public function listarProducto(){
 
            $sql = "SELECT * from producto";

            return ejecutarConsulta($sql);
        }
        //Listar registros activos
        public function listarxProveedor($idproveedor)
        {
            $sql = "SELECT 
                    p.idproducto, 
                    p.idcategoria, 
                    c.nombre as categoria,
                    p.nombre,
                    p.precio,
                    p.preciocompra,
                    p.imagen
                    FROM producto p
                    INNER JOIN categoria c 
                    ON p.idcategoria = c.idcateogira
                    WHERE p.idproveedor='$idproveedor'";

            return ejecutarConsulta($sql);
        }

        public function listarxBodega($idbodega,$idtienda)
        {
            $sql = "SELECT 
                    p.idproducto, 
                    p.idcategoria, 
                    c.nombre as categoria,
                    p.nombre,
                    p.precio,
                    p.imagen,
                    i.cantidad,
                    (SELECT CANTIDAD FROM INVENTARIO WHERE IDTIENDA='$idtienda' and idproducto=p.idproducto) as stocktienda
                    FROM producto p
                    INNER JOIN categoria c 
                    ON p.idcategoria = c.idcateogira
                    INNER JOIN inventario i 
                    ON i.idproducto = p.idproducto
                    WHERE i.idtienda='$idbodega' AND i.cantidad>0";

            return ejecutarConsulta($sql);
        }

        public function listarActivosVenta()
        {
            $sql = "SELECT 
                    p.idproducto, 
                    p.idcategoria, 
                    c.nombre as categoria,
                    p.nombre,
                    p.precio,
                    p.imagen
                    FROM producto p
                    INNER JOIN categoria c 
                    ON p.idcategoria = c.idcateogira";

            /*$sql = "SELECT 
                    a.idarticulo, 
                    a.idcategoria, 
                    c.nombre as categoria,
                    a.codigo,
                    a.nombre,
                    a.stock,
                    (
                        SELECT precio_venta 
                        FROM detalle_ingreso
                        WHERE idarticulo = a.idarticulo
                        ORDER BY iddetalle_ingreso 
                        desc limit 0,1 

                    ) as precio_venta, 
                    a.descripcion,
                    a.imagen,
                    a.condicion
                    FROM articulo a 
                    INNER JOIN categoria c 
                    ON a.idcategoria = c.idcategoria
                    WHERE a.condicion = '1'";*/

            return ejecutarConsulta($sql);
        }
    }

?>