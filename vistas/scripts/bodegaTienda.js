var tabla;

//Funcion que se ejecuta al inicio
function init()
{
    mostrarform(true);
    listar();

    $("#formulario").on("submit",function(e)
    {
        guardaryeditar(e);
    })

    //Cargamos los items al select categoria
    $.post(
        "../ajax/tienda.php?op=selectTienda",
        function(data)
        {        
            //console.log(data);
            $("#idtienda").html(data);
            $("#idtienda").selectpicker('refresh');
        }
    );

    $.post(
        "../ajax/tienda.php?op=selectBodega",
        function(data)
        {        
            //console.log(data);
            $("#idbodega").html(data);
            $("#idbodega").selectpicker('refresh');
        }
    );

}

//funcion limpiar
function limpiar()
{
    $("#idtienda").val("");
    $("#nombre").val("");
    $("#direccion").val("");
    $("#btnAgregarArt").prop("disabled",true);
    $("#btnAgregarArt").prop("title",'Seleccione primero la bodega y la tienda');
    $("#idtienda").val(0);
    $("#idtienda").selectpicker('refresh');
    $("#idbodega").val(0);
    $("#idbodega").selectpicker('refresh');
}

function bloquear()
{
    if($("#idbodega").val()!=0){
        $("#idbodega").prop("disabled",true);
    }
    combosSelected();
}

function bloquearTienda()
{
    if($("#idtienda").val()!=0){
        $("#idtienda").prop("disabled",true);
    }
    combosSelected();
}

function combosSelected(){
    if($("#idtienda").val()!=0 && $("#idbodega").val()!=0){
        listarArticulos();
        $("#btnAgregarArt").prop("title",'Agregar artículos');
        $("#btnAgregarArt").prop("disabled",false);
    }
}

function desbloquear()
{
    $("#idbodega").prop("disabled",false);
    $("#idtienda").prop("disabled",false);
   //falta limpiar
   limpiar();
   bootbox.alert("Datos limpiados\n Tienda y bodega desbloqueados");
}

//funcion mostrar formulario
function mostrarform(flag)
{
    limpiar();

    if(flag)
    {
        $("#listadoregistros").hide();
        $("#formularioregistros").show();
        $("#btnGuardar").prop("disabled",false);
        $("#btnagregar").hide();
    }
    else
    {
        $("#listadoregistros").show();
        $("#formularioregistros").hide();
        $("#btnagregar").show();
    }
}

//Funcion cancelarform
function cancelarform()
{
    limpiar();
    mostrarform(false);
}

//Funcion listar
function listar()
{
    tabla = $('#tblistado')
        .dataTable(
            {
                "aProcessing":true, //Activamos el procesamiento del datatables
                "aServerSide":true, //Paginacion y filtrado realizados por el servidor
                dom: "Bfrtip", //Definimos los elementos del control de tabla
                buttons:[
                    'copyHtml5',
                    'excelHtml5',
                    'csvHtml5',
                    'pdf'
                ],
                "ajax":{
                    url: '../ajax/tienda.php?op=listarBodega',
                    type: "get",
                    dataType:"json",
                    error: function(e) {
                        console.log(e.responseText);
                    }
                },
                "bDestroy": true,
                "iDisplayLength": 5, //Paginacion
                "order": [[0,"desc"]] //Ordenar (Columna, orden)
            
            })
        .DataTable();
}

function listarArticulos()
{
    var idbodega = $("#idbodega").val();
    tabla = $('#tblarticulos')
        .dataTable(
            {
                "aProcessing":true, //Activamos el procesamiento del datatables
                "aServerSide":true, //Paginacion y filtrado realizados por el servidor
                dom: "Bfrtip", //Definimos los elementos del control de tabla
                buttons:[
                    
                ],
                "ajax":{
                    url: '../ajax/ingreso.php?op=listarArticulosBodega',
                    data:{idbodega:idbodega},
                    type: "get",
                    dataType:"json",
                    error: function(e) {
                        console.log(e.responseText);
                    }
                },
                "bDestroy": true,
                "iDisplayLength": 5, //Paginacion
                "order": [[0,"desc"]] //Ordenar (Columna, orden)
            
            })
        .DataTable();
}

//funcion para guardar o editar
function guardaryeditar(e)
{
    e.preventDefault(); //No se activará la acción predeterminada del evento
	$("#btnGuardar").prop("disabled",true);
    var formData = new FormData($("#formulario")[0]);
    
    $.ajax({
        url: "../ajax/tienda.php?op=guardaryeditarBodega",
        type: "POST",
        data: formData,
        contentType: false,
        processData: false,
        success: function(datos)
        {
            //console.log("succes");
            bootbox.alert(datos);
            mostrarform(false);
            tabla.ajax.reload();
        },
        error: function(error)
        {
            console.log("error: " + error);
        } 
    });

    limpiar();
}

function mostrar(idtienda)
{
    $.post(
        "../ajax/tienda.php?op=mostrar",
        {idtienda:idtienda},
        function(data,status)
        {
            data = JSON.parse(data);
            mostrarform(true);
           
            $("#idtienda").val(data.idTienda);
            $("#idmunicipio").val(data.idMunicipio);
            $('#idmunicipio').selectpicker('refresh');
            $("#nombre").val(data.nombre);
            $("#direccion").val(data.direccion);    

        }
    );
}

//funcion para descativar categorias
function desactivar(idtienda)
{
    bootbox.confirm("¿Estas seguro de desactivar la Bodega?",function(result){
        if(result)
        {
            $.post(
                "../ajax/tienda.php?op=desactivarBodega",
                {idtienda:idtienda},
                function(e)
                {
                    bootbox.alert(e);
                    tabla.ajax.reload();
        
                }
            );
        }
    });
}

function activar(idarticulo)
{
    bootbox.confirm("¿Estas seguro de activar la bodega?",function(result){
        if(result)
        {
            $.post(
                "../ajax/tienda.php?op=activarBodega",
                {idarticulo:idarticulo},
                function(e)
                {
                    bootbox.alert(e);
                    tabla.ajax.reload();
        
                }
            );
        }
    });
}

var cont = 0;

function agregarDetalle(idarticulo,articulo)
{
    var cantidad = 1;
    var precio_compra = 1;
    var precio_venta = 1;

    if(idarticulo != "")
    {
        var subtotal = cantidad * precio_compra;
        var fila = '<tr class="filas" id="fila'+cont+'"> ' +
                      '<td>'+
                           '<button type="button" class="btn btn-danger" onclick="eliminarDetalle('+cont+')">X</button>'+
                       '</td>'+
                      '<td>' +
                          '<input type="hidden" name="idarticulo[]" value="'+idarticulo+'">'+
                           articulo +
                       '</td>'+
                      '<td>' +
                          '<input type="number" name="cantidad[]" id="cantidad[]" value="'+cantidad+'">'+
                       '</td>'+
                      '<td>' +
                          '<button type="button" class="btn btn-info" onclick="modificarSubtotales()">'+
                            '<i class="fa fa-refresh"></i>'+
                          '</button>'+
                       '</td>'+
                   '</tr>';

        cont++;
        detalles++;
        $("#detalles").append(fila);
        modificarSubtotales(); 
    }
    else
    {
        alert("Error al ingresar el detalle, revisar los ddatos del articulo");
    }
}

function generarbarcode()
{
    /*var codigo = $("#codigo").val();
    JsBarcode("#barcode",codigo);
    $("#print").show();*/
}

function imprimir()
{
    /*$("#print").printArea();*/
}



init();