<?php
    require '../config/conexion.php';

    Class Trabajador 
    {
        public function __construct()
        {

        }

        public function insertar($nombre,$apellido,$fechanacimiento,$fechaingreso,$correo,$telefono,$direccion)
        {
            $sql = "INSERT INTO empleado (
                    nombre,
                    apellido,
                    fechanacimiento,
                    fechaingreso,
                    correo,
                    telefono,
                    direccion
                   ) 
                    VALUES (
                        '$nombre',
                        '$apellido',
                        '$fechanacimiento',
                        '$fechaingreso',
                        '$correo',
                        '$telefono',
                        '$direccion'
                        )";
            
            return ejecutarConsulta($sql);
        }

        public function editar($idempleado,$nombre,$apellido,$fechanacimiento,$fechaingreso,$correo,$telefono,$direccion)
        {
            $sql = "UPDATE empleado SET 
                    nombre='$nombre', 
                    apellido='$apellido',
                    fechanacimiento='$fechanacimiento',
                    fechaingreso='$fechaingreso',
                    correo='$correo',
                    telefono='$telefono',
                    direccion='$direccion'
                    WHERE idempleado='$idempleado '";
            
            return ejecutarConsulta($sql);
        }

        
        public function eliminar($idpersona)
        {
            /*$sql= "DELETE FROM persona 
                   WHERE idpersona='$idpersona'";
            
            return ejecutarConsulta($sql);*/
        }


        //METODO PARA MOSTRAR LOS DATOS DE UN REGISTRO A MODIFICAR
        public function mostrar($idempleado)
        {
            $sql = "SELECT 
                        idempleado,nombre, apellido, fechanacimiento, fechaingreso, correo, telefono, direccion, estado
                    FROM Empleado
                    WHERE idempleado='$idempleado'";

            return ejecutarConsultaSimpleFila($sql);
        }

        //METODO PARA LISTAR LOS REGISTROS
        public function listarp()
        {
            $sql = "SELECT 
                        idempleado,nombre, apellido, fechanacimiento, fechaingreso, correo, telefono, direccion, estado
                    FROM Empleado";
            return ejecutarConsulta($sql);
        }
    }

?>