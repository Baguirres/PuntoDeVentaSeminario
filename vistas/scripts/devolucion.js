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


}

//funcion limpiar
function limpiar()
{
    $("#iddevolucion").val("");
    $("#noVenta").val("");
    $("#motivo").val("");
    var now = new Date();
    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);
    var today = now.getFullYear()+"-"+(month)+"-"+(day);
    $("#fecha").val(today);
    $("#informacion").html("");

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
                    url: '../ajax/devolucion.php?op=listarp',
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
        url: "../ajax/devolucion.php?op=guardaryeditar",
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

function mostrar(iddevolucion)
{
    $.post(
        "../ajax/devolucion.php?op=mostrar",
        {iddevolucion:iddevolucion},
        function(data,status)
        {
            data = JSON.parse(data);
            console.log(data)
            mostrarform(true);

            $("#noVenta").val(data.idVentaEncabezado);
            $("#fecha").val(data.fecha);
            $("#motivo").val(data.comentario);
            $("#iddevolucion").val(data.idDevolucion);
            let variable = $("#noVenta").val();
            $.post(
                "../ajax/devolucion.php?op=listarBusqueda&id="+variable,
                function(data,status)
                {
                    $("#motivo").prop("disabled",false);
                    $("#fecha").prop("disabled",false);
                    $("#idestado").prop("disabled",false);
                    // console.log(data)
                    $("#informacion").html("");
                    $("#informacion").html(data);
                }
            );
        }
    );
}

function buscar()
{
    let variable = $("#noVenta").val();
    $.post(
        "../ajax/devolucion.php?op=listarBusqueda&id="+variable,
        function(data,status)
        {
            // console.log(data)
            $("#informacion").html("");
            $("#informacion").html(data);
        }
    );
}

$("#noVenta").on('keypress', function (e) {

    if (e.key === 'Enter' || e.keyCode == 13) {   
        e.preventDefault();   
        let variable = $("#noVenta").val();
        $.post(
            "../ajax/devolucion.php?op=listarBusqueda&id="+variable,
            function(data,status)
            {
                $("#motivo").prop("disabled",false);
                $("#fecha").prop("disabled",false);
                $("#idestado").prop("disabled",false);
                // console.log(data)
                $("#informacion").html("");
                $("#informacion").html(data);
            }
        );
  
    }
});

init();