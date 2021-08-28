<?php
    require '../config/conexion.php';

    Class Usuario 
    {
        public function __construct()
        {

        }

        public function insertar($nombre,$clave,$imagen,$idempleado,$permisos)
        {
            $sql = "INSERT INTO usuario (
                        nombre,
                        clave,
                        imagen,
                        condicion
                    ) 
                    VALUES (
                        '$nombre',
                        '$clave',
                        '$imagen',
                        '1'
                        )";
            
            //return ejecutarConsulta($sql);
            $idusuarionew = ejecutarConsulta_retornarID($sql);

            $sql2 = "UPDATE empleado SET 
                    idusuario='$idusuarionew'
                    WHERE idempleado='$idempleado'";
            
            ejecutarConsulta($sql2);

            $num_elementos = 0;
            $sw = true;

            while($num_elementos < count($permisos))
            {
                $sql_detalle ="INSERT INTO usuario_permiso (
                                    idusuario,
                                    idpermiso
                                )
                                VALUES (
                                    '$idusuarionew',
                                    '$permisos[$num_elementos]'
                                )";

                ejecutarConsulta($sql_detalle) or $sw = false;

                $num_elementos = $num_elementos + 1;
            }

            return $sw;
        }

        public function editar($idusuario,$nombre,$clave,$imagen,$idempleado,$permisos)
        {
            $sql = "UPDATE usuario SET 
                    nombre='$nombre', 
                    clave='$clave',
                    imagen='$imagen'
                    WHERE idusuario='$idusuario'";
            
            ejecutarConsulta($sql);

            $sql2 = "UPDATE empleado SET 
                    idusuario='$idusuario'
                    WHERE idempleado='$idempleado'";
            
            ejecutarConsulta($sql2);

            //Eliminamos todos los permisos asignados para volverlos a registrar
            $sqldel = "DELETE FROM usuario_permiso
                        WHERE idusuario='$idusuario'";
            
            ejecutarConsulta($sqldel);

            $num_elementos = 0;
            $sw = true;

            while($num_elementos < count($permisos))
            {
                $sql_detalle = "INSERT INTO usuario_permiso(
                    idusuario,
                    idpermiso
                    )
                    VALUES (
                        '$idusuario',
                        '$permisos[$num_elementos]'
                    )";
                    ejecutarConsulta($sql_detalle) or $sw = false;
                    $num_elementos = $num_elementos + 1;
            }

            return $sw;
        }

        public function desactivar($idusuario)
        {
            $sql= "UPDATE usuario SET condicion=0 
                   WHERE idusuario='$idusuario'";
            
            return ejecutarConsulta($sql);
        }

        public function activar($idusuario)
        {
            $sql= "UPDATE usuario SET condicion=1 
                   WHERE idusuario='$idusuario'";
            
            return ejecutarConsulta($sql);
        }

        public function mostrar($idusuario)
        {
            $sql = "SELECT 
                        u.idusuario,
                        u.clave,
                        u.nombre as usuario,
                        t.nombre,
                        t.apellido,
                        u.imagen,
                        u.condicion     
                    FROM usuario u
                    INNER JOIN empleado t
                    ON t.idusuario=u.idusuario
                    WHERE u.idusuario='$idusuario'";

            return ejecutarConsultaSimpleFila($sql);
        }

        public function listar()
        {
            $sql = "SELECT 
                        u.idusuario,
                        u.nombre as usuario,
                        t.nombre,
                        t.apellido,
                        t.correo,
                        u.imagen,
                        u.condicion 
                    FROM usuario u
                    INNER JOIN empleado t
                    ON t.idusuario=u.idusuario";

            return ejecutarConsulta($sql);
        }

        public function listarmarcados($idusuario)
        {
           $sql = "SELECT * FROM usuario_permiso
                    WHERE idusuario='$idusuario'";
            
            return ejecutarConsulta($sql);
        }

        //Verficacion de acceso
        public function verificar($login,$clave)
        {
            $sql = "SELECT 
                        idusuario,
                        nombre,
                        tipo_documento,
                        num_documento,
                        telefono,
                        email,
                        cargo,
                        imagen,
                        login
                    FROM usuario
                    WHERE login='$login' 
                    AND clave='$clave'
                    AND condicion='1'";
            
            return ejecutarConsulta($sql);
        }

    }

?>