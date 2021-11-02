var tabla;
var usuario = $("#idusuario").val();
//Funcion que se ejecuta al inicio
function init() {
    mostrarform(false);
    listar();

    $("#formulario").on("submit", function (e) {
        guardaryeditar(e);
    })
}

//funcion limpiar
function limpiar() {
    $("#idcategoria").val("");
    $("#nombre").val("");
    $("#desplegable").val("");
    $("#imagen").val("");
}

//funcion mostrar formulario
function mostrarform(flag) {
    limpiar();

    if (flag) {
        $("#listadoregistros").hide();
        $("#formularioregistros").show();
        $("#btnGuardar").prop("disabled", false);
        $("#btnagregar").hide();
    }
    else {
        $("#listadoregistros").show();
        $("#formularioregistros").hide();
        $("#btnagregar").show();
    }
}

//Funcion cancelarform
function cancelarform() {
    limpiar();
    mostrarform(false);
}

//Funcion listar
function listar() {
    tabla = $('#tblistado')
        .dataTable(
            {
                "aProcessing": true, //Activamos el procesamiento del datatables
                "aServerSide": true, //Paginacion y filtrado realizados por el servidor
                dom: "Bfrtip", //Definimos los elementos del control de tabla
                buttons: [
                    'copyHtml5',
                    'excelHtml5',
                    'csvHtml5',
                    'pdf'
                ],
                "ajax": {
                    url: '../ajax/caracteristicas.php?op=listar',
                    type: "get",
                    dataType: "json",
                    error: function (e) {
                        console.log(e.responseText);
                    }
                },
                "bDestroy": true,
                "iDisplayLength": 5, //Paginacion
                "order": [[0, "desc"]] //Ordenar (Columna, orden)

            })
        .DataTable();
    $.post(
        "../ajax/bitacora.php?op=insertar",
        { usuario: usuario, accion: "Visualizo Categorías" },
        function (f) {

        }
    );
}

//funcion para guardar o editar
function guardaryeditar(e) {
    e.preventDefault(); //No se activará la acción predeterminada del evento
    $("#btnGuardar").prop("disabled", true);
    var formData = new FormData($("#formulario")[0]);

    $.ajax({
        url: "../ajax/caracteristicas.php?op=guardaryeditar",
        type: "POST",
        data: formData,
        contentType: false,
        processData: false,
        success: function (datos) {
            //console.log("succes");
            bootbox.alert(datos);
            mostrarform(false);
            tabla.ajax.reload();
        },
        error: function (error) {
            console.log("error: " + error);
        }
    });
    $.post(
        "../ajax/bitacora.php?op=insertar",
        { usuario: usuario, accion: "Categoría Registrada" },
        function (f) {

        }
    );
    limpiar();
}

function mostrar(idcategoria) {
    $.post(
        "../ajax/caracteristicas.php?op=mostrar",
        { idcategoria: idcategoria },
        function (data, status) {
            data = JSON.parse(data);
            // console.log(data)
            mostrarform(true);

            $("#nombre").val(data.caracteristica);
            $("#desplegable").val(data.desplegable);
            $("#imagen").val(data.opciones);
            $("#idcategoria").val(data.id);
        }
    );
    $.post(
        "../ajax/bitacora.php?op=insertar",
        { usuario: usuario, accion: "Visualizó detalle de categoría " + idcategoria },
        function (f) {

        }
    );
}

//funcion para descativar categorias
function desactivar(idcategoria) {
    bootbox.confirm("¿Estas seguro de inactivar la Categoria?", function (result) {
        if (result) {
            $.post(
                "../ajax/caracteristicas.php?op=desactivar",
                { idcategoria: idcategoria },
                function (e) {
                    bootbox.alert(e);
                    tabla.ajax.reload();
                    $.post(
                        "../ajax/bitacora.php?op=insertar",
                        { usuario: usuario, accion: "Desactivó categoría con código " + idcategoria },
                        function (f) {

                        }
                    );
                }
            );
        }
    });
}

function activar(idcategoria) {
    bootbox.confirm("¿Estas seguro de activar la Categoria?", function (result) {
        if (result) {
            $.post(
                "../ajax/caracteristicas.php?op=activar",
                { idcategoria: idcategoria },
                function (e) {
                    bootbox.alert(e);
                    tabla.ajax.reload();
                    $.post(
                        "../ajax/bitacora.php?op=insertar",
                        { usuario: usuario, accion: "Activó categoría con código " + idcategoria },
                        function (f) {

                        }
                    );
                }
            );
        }
    });
}

init();