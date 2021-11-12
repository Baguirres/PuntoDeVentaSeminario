<?php
    require '../config/conexion.php';

    Class Minimo 
    {
        public function __construct()
        {

        }


        public function modificar($idcategoria,$caracteristicas)
        {
            $sql= "DELETE FROM caracteristicascategoria
            WHERE idcategoria='$idcategoria'";  
            ejecutarConsulta($sql);

            $num_elementos = 0;
            $sw = true;
            while($num_elementos < count($caracteristicas))
            {
                $idcar = $caracteristicas[$num_elementos];
                if($idcar!=-1){
                    $sql_detalle ="INSERT INTO caracteristicascategoria
                                VALUES (
                                    '$idcategoria',
                                    '$idcar'
                                )";

                    ejecutarConsulta($sql_detalle) or $sw = false;
                }
                $num_elementos = $num_elementos + 1;
            }           
            return ($sw);
        }

        public function anular($idcompraencabezado)
        {
           /*$sql= "UPDATE compraencabezado SET estado=0
                   WHERE idcompraencabezado='$idcompraencabezado'";
            
            return ejecutarConsulta($sql);*/
        }
    
        public function mostrar($idcompraencabezado,$id2)
        {
            $sql = "SELECT m.idproducto, p.nombre as producto, m.idtienda, t.nombre as tiendatienda,m.cantidadminima 
            from minimos m,producto p,tienda t where m.idproducto=p.idproducto and m.idtienda=t.idtienda and
             m.idproducto='$idcompraencabezado' and m.idtienda='$id2'";

            return ejecutarConsultaSimpleFila($sql);
        }

        public function listarDetalle($idcompraencabezado)
        {
            $sql = "SELECT c.* 
            FROM caracteristica c 
            INNER JOIN caracteristicascategoria cc ON c.idcaracteristica = cc.idcaracteristica 
            INNER JOIN categoria ca ON ca.idCateogira = cc.idCategoria 
            WHERE cc.idcategoria='$idcompraencabezado'";

            return ejecutarConsulta($sql);
        }

        public function listar()
        {
            $sql = "SELECT m.idproducto, p.nombre as producto, m.idtienda, t.nombre as tienda,m.cantidadminima 
            from minimos m,producto p,tienda t where m.idproducto=p.idproducto and m.idtienda=t.idtienda";

            return ejecutarConsulta($sql);
        }

        public function listarCar()
        {
            $sql = "SELECT * from caracteristica";
            return ejecutarConsulta($sql);
        }

    }


?>