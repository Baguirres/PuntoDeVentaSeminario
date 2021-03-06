var tabla;

//Funcion que se ejecuta al inicio
function init()
{
    mostrarform(false);
    listar();

    $("#formulario").on("submit",function(e)
    {
        guardaryeditar(e);
    })

    //Cargamos los items al select categoria
    $.post(
        "../ajax/tienda.php?op=selectCategoria",
        function(data)
        {        
            //console.log(data);
            $("#idmunicipio").html(data);
            $("#idmunicipio").selectpicker('refresh');
        }
    );

}

//funcion limpiar
function limpiar()
{
    $("#idtienda").val("");
    $("#nombre").val("");
    $("#direccion").val("");
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
                    url: '../ajax/bitacora.php?op=listar',
                    type: "get",
                    dataType:"json",
                    error: function(e) {
                        console.log(e.responseText);
                    }
                },
                "bDestroy": true,
                "iDisplayLength": 10, //Paginacion
                "order": [[0,"desc"]] //Ordenar (Columna, orden)
            
            })
        .DataTable();
}



//funcion para guardar o editar
function guardaryeditar(e)
{
    e.preventDefault(); //No se activar?? la acci??n predeterminada del evento
	$("#btnGuardar").prop("disabled",true);
    var formData = new FormData($("#formulario")[0]);
    
    $.ajax({
        url: "../ajax/tienda.php?op=guardaryeditar",
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
    bootbox.confirm("??Estas seguro de desactivar el Articulo?",function(result){
        if(result)
        {
            $.post(
                "../ajax/tienda.php?op=desactivar",
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
    bootbox.confirm("??Estas seguro de activar el Articulo?",function(result){
        if(result)
        {
            $.post(
                "../ajax/tienda.php?op=activar",
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

function generarbarcode()
{
    var codigo = $("#codigo").val();
    JsBarcode("#barcode",codigo);
    $("#print").show();
}

function imprimir()
{
    $("#print").printArea();
}



init();