var tabla;

//Función que se ejecuta al inicio
function init(){
	mostrarform(false);
	listar();

	//Cargamos los items al select proveedor
	$.post("../ajax/venta.php?op=selectCliente", function(r){
	            $("#idcliente").html(r);
	            $('#idcliente').selectpicker('refresh');
	});	

	$.post(
        "../ajax/ingreso.php?op=selectTienda",
        function(data)
        {
            $("#idtienda").html(data);
            $("#idtienda").selectpicker('refresh');
        }
    );

    $.post(
        "../ajax/ingreso.php?op=selectMoneda",
        function(data)
        {        
            $("#idmoneda").html(data);
            $("#idmoneda").selectpicker('refresh');
        }
    );

	$.post(
        "../ajax/venta.php?op=selectPago",
        function(data)
        {        
            $("#idtipodepago").html(data);
            $("#idtipodepago").selectpicker('refresh');
        }
    );
}

//Función limpiar
function limpiar()
{

	$("#idcliente").val("");
	$("#codigo").val("");
	$("#descuento").val("");
	$("#total").val("");
	$("#iva").val("");
	$("#btnAgregarArt").prop("disabled",true);
    $("#btnAgregarArt").prop("title",'Seleccione primero la tienda');
	$("#total_venta").val("");
	$(".filas").remove();
	$("#total").html("0");

	//Obtenemos la fecha actual
	var now = new Date();
	var day = ("0" + now.getDate()).slice(-2);
	var month = ("0" + (now.getMonth() + 1)).slice(-2);
	var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
    $('#fecha_hora').val(today);
	evaluar();

}

//Función mostrar formulario
function mostrarform(flag)
{
	limpiar();
	if (flag)
	{
		$("#listadoregistros").hide();
		$("#formularioregistros").show();
		//$("#btnGuardar").prop("disabled",false);
		$("#btnagregar").hide();
		listarArticulos();

		$("#btnGuardar").hide();
		$("#btnCancelar").show();
		$("#btnAgregarArt").show();
		detalles=0;
	}
	else
	{
		$("#listadoregistros").show();
		$("#formularioregistros").hide();
		$("#btnagregar").show();
	}
}

//Función cancelarform
function cancelarform()
{
	limpiar();
	mostrarform(false);
}

function bloquearTienda()
{
    if($("#idtienda").val()!=0){
        $("#idtienda").prop("disabled",true);
		listarArticulos();
        $("#btnAgregarArt").prop("title",'Agregar artículos');
        $("#btnAgregarArt").prop("disabled",false);
    }

}


//Función Listar
function listar()
{
	tabla=$('#tbllistado').dataTable(
	{
		"aProcessing": true,//Activamos el procesamiento del datatables
	    "aServerSide": true,//Paginación y filtrado realizados por el servidor
	    dom: 'Bfrtip',//Definimos los elementos del control de tabla
	    buttons: [		          
		            'copyHtml5',
		            'excelHtml5',
		            'csvHtml5',
		            'pdf'
		        ],
		"ajax":
				{
					url: '../ajax/venta.php?op=listar',
					type : "get",
					dataType : "json",						
					error: function(e){
						console.log(e.responseText);	
					}
				},
		"bDestroy": true,
		"iDisplayLength": 5,//Paginación
	    "order": [[ 0, "desc" ]]//Ordenar (columna,orden)
	}).DataTable();
}


//Función ListarArticulos
function listarArticulos()
{
	var idtienda = $("#idtienda").val();
	tabla=$('#tblarticulos').dataTable(
	{
		"aProcessing": true,//Activamos el procesamiento del datatables
	    "aServerSide": true,//Paginación y filtrado realizados por el servidor
	    dom: 'Bfrtip',//Definimos los elementos del control de tabla
	    buttons: [		          
		            
		        ],
		"ajax":
				{
					url: '../ajax/venta.php?op=listarArticulosVenta',
					data:{idtienda:idtienda},
					type : "get",
					dataType : "json",						
					error: function(e){
						console.log(e.responseText);	
					}
				},
		"bDestroy": true,
		"iDisplayLength": 5,//Paginación
	    "order": [[ 0, "desc" ]]//Ordenar (columna,orden)
	}).DataTable();
}
//Función para guardar o editar

function guardaryeditar(e)
{
	var fecha = $("#fecha_hora").val();
    var nit = $("#nit").val();
    var idtienda = $("#idtienda").val();
    var usuario = $("#idusuario").val();
    var moneda = $("#idmoneda").val();
	var pago = $("#idtipodepago").val();
    var total = $("#total_compra").val();
    var articulos = [];
    var cantidad = [];
	var descuento = [];
    for(var i=0; i<cont;i++){
        articulos.push($('#idarticulo'+i).val());
        cantidad.push($('#cantidad'+i).val());
		descuento.push($('#descuento'+i).val());
    }
    if (nit==''){
        bootbox.alert('Debe de llenar los datos del cliente');
    }else if(moneda==0 || moneda==null || moneda==''){
        bootbox.alert('Debe de seleccionar la moneda');
    }else if(pago==0 || pago==null || pago==''){
        bootbox.alert('Debe de seleccionar la forma de pago');
    }else{
        /*$.post(
            "../ajax/ingreso.php?op=guardaryeditar",
            {fecha:fecha,idproveedor:idproveedor,idtienda:idtienda,articulos:articulos,cantidad:cantidad,impuesto:impuesto, usuario:usuario, moneda:moneda, total:total},
            function(e)
            {
                bootbox.alert(e);
                desbloquear(false);
            }
        );*/
    }
    detalles=0;
    desbloquear();
}

function mostrar(idventaencabezado)
{
	
	$.post("../ajax/venta.php?op=mostrar",{idventaencabezado : idventaencabezado}, function(data, status)
	{
		data = JSON.parse(data);		
		
		mostrarform(true);
		
		$("#idcliente").val(data.nit);
		$("#idcliente").selectpicker('refresh');
		$("#idtienda").val(data.idtienda);
		$("#idtienda").selectpicker('refresh');
		$("#idmoneda").val(data.idtipomoneda);
		$("#idmoneda").selectpicker('refresh');
		$("#idtipodepago").val(data.idtipodepago);
		$("#idtipodepago").selectpicker('refresh');

		$("#nit").val(data.nit);            
		$("#usuario").val(data.usuario);
		$("#fecha_hora").val(data.fecha);
		//$("#total").html('Q '+data.total);            
		$("#idcompraencabezado").html(data.idcompraencabezado); 
		
		//Ocultar y mostrar botones
		$("#btnGuardar").hide();
		$("#btnCancelar").show();
		$("#btnAgregarArt").hide();
		$("#estado").css('display',"block");
		$("#idproveedor").prop("disabled",true);
		$("#idtienda").prop("disabled",true);
		$("#fecha_hora").prop("disabled",true);
		$("#usuario").prop("disabled",true);
		$("#usuario").prop("disabled",true);
		$("#idmoneda").prop("disabled",true);
		$("#impuestos").prop("disabled",true);
 	});

 	$.post("../ajax/venta.php?op=listarDetalle&id="+idventaencabezado,function(r){
	        $("#detalles").html(r);
	});	
}

function ponerCliente(){
	var nit = $("#nit").val();
	$("#idcliente").val(nit);
	$('#idcliente').selectpicker('refresh');
}

function ponerNit(){
	var nit = $("#idcliente").val();
	$("#nit").val(nit);
}

//Función para anular registros
function anular(idventaencabezado)
{
	/*bootbox.confirm("¿Está Seguro de anular la venta?", function(result){
		if(result)
        {
        	$.post("../ajax/venta.php?op=anular", {idventaencabezado : idventaencabezado}, function(e){
				console.log(e);
        		bootbox.alert(e);
	            tabla.ajax.reload();
        	});	
        }
	})*/
}

//Declaración de variables necesarias para trabajar con las compras y
//sus detalles
/*var impuesto=18;
var cont=0;
var detalles=0;
//$("#guardar").hide();
$("#btnGuardar").hide();
$("#tipo_comprobante").change(marcarImpuesto);*/

function marcarImpuesto()
  {
  	/*var tipo_comprobante=$("#tipo_comprobante option:selected").text();
  	if (tipo_comprobante=='Factura')
    {
        $("#impuesto").val(impuesto); 
    }
    else
    {
        $("#impuesto").val("0"); 
    }*/
  }
  var impuesto = 16;
  var cont = 0;
  var detalles= 0;
function agregarDetalle(idarticulo,articulo,precio,stock)
  {
	
	if(!yaExiste(idarticulo)){
		if(idarticulo != "")
		{
			var subtotal = 1 * precio;
			console.log(subtotal);
			var iva= precio*0.12;
			console.log(iva);
			var fila = '<tr class="filas" id="fila'+cont+'"> ' +
						'<td>'+
							'<button type="button" class="btn btn-danger" onclick="eliminarDetalle('+cont+')">X</button>'+
						'</td>'+
						'<td>' +
							'<input type="hidden" name="idarticulo'+cont+'" id="idarticulo'+cont+'" value="'+idarticulo+'">'+
							articulo +
						'</td>'+
						'<td>' +
							'<input type="number" name="cantidad'+cont+'" id="cantidad'+cont+'" onchange="modificarSubtotales()" min="1" max="'+stock+'" value=1>'+
						'</td>'+
						'<td>' +
								'<input type="hidden" name="precio'+cont+'" id="precio'+cont+'" value="'+precio+'">'+
								precio+
						'</td>'+
						'<td>' +
							'<span name="descuento'+cont+'" id="descuento'+cont+'">'+'Q0.00'+'</span>'+
						'</td>'+
						'<td>' +
							'<span name="iva'+cont+'" id="iva'+cont+'">'+iva+'</span>'+
						'</td>'+
						'<td>' +
							'<span name="subtotal'+cont+'" id="subtotal'+cont+'">'+subtotal+'</span>'+
						'</td>'+
					'</tr>';

			cont++;
			detalles++;
			$("#detalles").append(fila);
			modificarSubtotales(); 
		}
		else
		{
			alert("Error al ingresar el detalle, revisar los datos del articulo");
		}
	}
  }

  function yaExiste(idarticulo)
{
    for(var i=0; i<cont;i++){
        var id= $('#idarticulo'+i).val();
        if(id==idarticulo){
            bootbox.alert('Este producto ya está agregado');
            return true;
        }
    }
    return false;
}

function dosDecimales(n) {
	let t=n.toString();
	let regex=/(\d*.\d{0,2})/;
	return t.match(regex)[0];
  }

  function modificarSubtotales()
  {
	var subtotal=0;
    for(var i=0; i<cont;i++){
        var cantidad= $('#cantidad'+i).val();
        var precio= $('#precio'+i).val();
		var iva= $('#iva'+i).val();
        subtotal= parseInt(cantidad)*parseFloat(precio);
		iva = parseFloat(subtotal)*0.12;
        $('#subtotal'+i).html(subtotal);
		$('#iva'+i).html(dosDecimales(iva));
    }
    calcularTotales();

  }
  function calcularTotales()
{
    var total=0;
    if (cont>0){
        for(var i=0; i<cont;i++){
            var subtotal= $('#subtotal'+i).html();
            total += parseFloat(subtotal);
        }
    }    
    $("#total").html('Q '+total);
    $("#total_compra").val(total);

    evaluar();
}

  function evaluar(){
  	if (detalles>0)
    {
      $("#btnGuardar").show();
    }
    else
    {
      $("#btnGuardar").hide(); 
      cont=0;
    }
  }

  function eliminarDetalle(indice){
  	/*$("#fila" + indice).remove();
  	calcularTotales();
  	detalles=detalles-1;
  	evaluar()*/
  }

init();