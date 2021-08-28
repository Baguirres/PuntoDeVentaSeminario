<?php
    require '../config/conexion.php';

    Class Cliente 
    {
        public function __construct()
        {

        }

        public function insertar($nombre,$apellido,$fechan,$email,$telefono,$direccion,$nit)
        {
            $sql = "INSERT INTO cliente (
                    Nombre,
                    Apellido,
                    FechaNacimiento,
                    Correo,
                    Telefono,
                    Direccion,
                    NIT
                   ) 
                    VALUES (
                        '$nombre',
                        '$apellido',
                        '$fechan',
                        '$email',
                        '$telefono',
                        '$direccion',
                        '$nit'
                        )";
            
            return ejecutarConsulta($sql);
        }

        public function editar($idcliente,$nombre,$apellido,$fechan,$email,$telefono,$direccion,$nit)
        {
            $sql = "UPDATE cliente SET 
                    nombre='$nombre',
                    apellido='$apellido',
                    fechaNacimiento='$fechan',
                    direccion='$direccion',
                    telefono='$telefono',
                    nit='$nit',
                    correo='$email'
                    WHERE idCliente='$idcliente'";
            
            return ejecutarConsulta($sql);
        }

        
        public function eliminar($idpersona)
        {
            $sql= "DELETE FROM cliente 
                   WHERE idCliente='$idpersona'";
            
            return ejecutarConsulta($sql);
        }


        //METODO PARA MOSTRAR LOS DATOS DE UN REGISTRO A MODIFICAR
        public function mostrar($idpersona)
        {
         
            $sql = "SELECT * FROM cliente 
                    WHERE idCliente='$idpersona'";

            return ejecutarConsultaSimpleFila($sql);
        }

        //METODO PARA LISTAR LOS REGISTROS
        public function listarp()
        {
            $sql = "SELECT * FROM cliente";

            return ejecutarConsulta($sql);
        }

    }

?>