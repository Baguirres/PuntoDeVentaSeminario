<?php 
//Incluímos inicialmente la conexión a la base de datos
require "../config/Conexion.php";

Class Venta
{
	//Implementamos nuestro constructor
	public function __construct()
	{

	}
	
	//Implementamos un método para anular la venta
	public function anular($idventaencabezado)
	{
		$sql="UPDATE ventaencabezado 
			  SET estado=0 
			  WHERE idventaencabezado='$idventaencabezado'";

		return ejecutarConsulta($sql);
	}


	//Implementar un método para mostrar los datos de un registro a modificar
	public function mostrar($idventaencabezado)
	{
		$sql="SELECT 
					v.idventaencabezado,
					v.idtienda,
					DATE(v.fecha) as fecha,
					u.nombre as usuario,
					c.nit,
					v.idtipomoneda,
					v.idtipodepago
				FROM ventaencabezado v 
				INNER JOIN usuario u ON v.idusuario=u.idusuario
				INNER JOIN cliente c ON v.idcliente=c.idcliente
				WHERE v.idventaencabezado='$idventaencabezado'";

		return ejecutarConsultaSimpleFila($sql);
	}

	public function listarDetalle($idventaencabezado)
	{
		$sql="SELECT 
				dv.idventaencabezado,
				dv.idproducto,
				p.nombre,
				dv.cantidad,
				p.precio,
				dv.descuento,
				(p.precio*dv.cantidad)*0.12 as iva,
				(dv.cantidad*p.precio)-dv.descuento as subtotal 
				FROM ventadetalle dv 
				inner join producto p 
				on dv.idproducto=p.idproducto
				where dv.idventaencabezado='$idventaencabezado'";

		return ejecutarConsulta($sql);
	}

	//Implementar un método para listar los registros
	public function listar()
	{
		$sql="SELECT v.idventaencabezado, DATE(v.fecha) as fecha, c.nombre, c.apellido, v.total, 
					v.descuento, v.iva, v.estado, SUM(vd.cantidad) as cantidadprod, m.moneda, t.nombre as tienda, p.nombre as pago 
					FROM ventaencabezado v 
					INNER JOIN ventadetalle vd ON v.idVentaEncabezado=vd.idVentaEncabezado 
					INNER JOIN cliente c ON v.idcliente=c.idcliente 
					INNER JOIN tipomoneda m ON v.idtipomoneda = m.idtipomoneda 
					INNER JOIN tienda t ON v.idtienda = t.idtienda 
					INNER JOIN tipodepago p ON v.idtipodepago = p.idtipodepago 
					ORDER by v.fecha desc";
			   
		return ejecutarConsulta($sql);		
	}

	public function ventaCabecera($idventa)
	{
		/*$sql= "SELECT 
				v.idventa,
				v.idcliente,
				p.nombre as cliente,
				p.direccion,
				p.tipo_documento,
				p.num_documento,
				p.email,
				p.telefono,
				v.idusuario,
				u.nombre as usuario,
				v.tipo_comprobante,
				v.serie_comprobante,
				v.num_comprobante,
				DATE(v.fecha_hora) as fecha,
				v.impuesto,
				v.total_venta
			  FROM
			  	venta v
			  INNER JOIN
			  	persona p
			  ON
			  	v.idcliente = p.idpersona
			  INNER JOIN
			  	usuario u
			  ON
			  	v.idusuario = u.idusuario
		      WHERE
			  	v.idventa = '$idventa'";

		return ejecutarConsulta($sql);*/
	}
	
	public function ventaDetalle($idventa)
	{
		/*$sql = "SELECT
					a.nombre as articulo,
					a.codigo,
					d.cantidad,
					d.precio_venta,
					d.descuento,
					(d.cantidad*d.precio_venta-d.descuento) as subtotal
				FROM
					detalle_venta d
				INNER JOIN	
					articulo a
				ON
					d.idarticulo = a.idarticulo
				WHERE
					d.idventa = '$idventa'";

		return ejecutarConsulta($sql);*/
	}
}
?>