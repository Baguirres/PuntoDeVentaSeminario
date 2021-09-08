<?php
    require '../config/conexion.php';

    Class Tienda 
    {
        public function __construct()
        {

        }

        public function insertar($nombre,$direccion,$idmunicipio)
        {
            $sql = "INSERT INTO 
                        tienda (
                            nombre,
                            direccion,
                            idMunicipio
                        ) 
                    VALUES (
                        '$nombre',
                        '$direccion',
                        '$idmunicipio'
                        )";
            
            return ejecutarConsulta($sql);
        }

        public function insertarBodega($nombre,$direccion,$idmunicipio)
        {
            $sql = "INSERT INTO 
                        tienda (
                            nombre,
                            direccion,
                            idMunicipio,
                            tipoTienda
                        ) 
                    VALUES (
                        '$nombre',
                        '$direccion',
                        '$idmunicipio',
                        0
                        )";
            
            return ejecutarConsulta($sql);
        }

        public function editar($idtienda,$nombre,$direccion,$idmunicipio)
        {
            $sql = "UPDATE tienda SET 
                    nombre = '$nombre', 
                    direccion = '$direccion', 
                    idMunicipio = '$idmunicipio' 
                    WHERE idTienda='$idtienda'";
            
            return ejecutarConsulta($sql);
        }

        //METODOS PARA ACTIVAR ARTICULOS
        public function desactivar($idarticulo)
        {
            $sql= "DELETE from tienda 
            WHERE idtienda='$idarticulo'";
            // $sql= "UPDATE articulo SET condicion='0' 
            //        WHERE idarticulo='$idarticulo'";
            
            return ejecutarConsulta($sql);
        }
        //METODOS PARA ACTIVAR ARTICULOS
        public function desactivarP($idarticulo)
        {
            $sql= "UPDATE tienda SET estado='0' 
                   WHERE idtienda='$idarticulo'";
            
            return ejecutarConsulta($sql);
        }

        public function activar($idarticulo)
        {
            $sql= "UPDATE tienda SET estado='1' 
                   WHERE idtienda='$idarticulo'";
            
            return ejecutarConsulta($sql);
        }

        //METODO PARA MOSTRAR LOS DATOS DE UN REGISTRO A MODIFICAR
        public function mostrar($idtienda)
        {
            $sql = "SELECT * FROM tienda 
                    WHERE idtienda='$idtienda'";

            return ejecutarConsultaSimpleFila($sql);
        }

        //METODO PARA LISTAR LOS REGISTROS
        public function listar()
        {

            $sql = "SELECT t.idtienda, t.nombre, t.direccion, m.nombre  as municipio, t.estado from tienda t, municipio m WHERE t.idmunicipio=m.idmunicipio
            and tipotienda=1";

            return ejecutarConsulta($sql);
        }

        public function listarBodega()
        {

            $sql = "SELECT t.idtienda, t.nombre, t.direccion, m.nombre  as municipio from tienda t, municipio m WHERE t.idmunicipio=m.idmunicipio
            and tipotienda=0";

            return ejecutarConsulta($sql);
        }

        public function listarProducto(){
 
            $sql = "SELECT * from producto";

            return ejecutarConsulta($sql);
        }

        public function listarMunicipio(){
 
            $sql = "SELECT * from municipio";

            return ejecutarConsulta($sql);
        }

    }

?>