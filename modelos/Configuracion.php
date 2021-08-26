<?php
    require '../config/conexion.php';

    Class Configuracion 
    {
        public function __construct()
        {

        }

        public function editar($idempresa,$empresa,$nit,$eslogan,$mision,$vision,$valores,$logo)
        {
            $sql = "UPDATE empresa SET 
                    nombre='$empresa', 
                    nit='$nit',
                    eslogan='$eslogan',
                    mision='$mision',
                    vision='$vision',
                    valores='$valores',
                    logo='$logo'
                    WHERE idempresa='$idempresa'";
            
            return ejecutarConsulta($sql);
        }
    
        public function mostrar($idempresa)
        {
            $sql = "SELECT 
                        idempresa,
                        nombre,
                        nit,
                        eslogan,
                        mision,
                        vision,
                        valores,
                        logo
                    FROM empresa
                    WHERE idempresa='$idempresa'";

            return ejecutarConsultaSimpleFila($sql);
        }

        public function listar()
        {
            $sql = "SELECT 
                        idempresa,
                        nombre,
                        nit,
                        eslogan,
                        mision,
                        vision,
                        valores,
                        logo
                    FROM empresa";

            return ejecutarConsulta($sql);
        }

    }

?>