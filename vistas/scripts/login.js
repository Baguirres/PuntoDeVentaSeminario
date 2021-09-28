$("#frmAcceso").on('submit',function(e){
    e.preventDefault();
    usuarioa = $("#usuarioa").val();
    clavea = $("#clavea").val();

    $.post("../ajax/usuario.php?op=verificar",
        {
            usuarioa:usuarioa,
            clavea:clavea
        },
        function(data)
        {
            if(data != 'null')
            {
                $(location).attr("href","escritorio.php");
                bootbox.alert("Todo bien");
            }
            else
            {
                bootbox.alert("Usuario o contraseña incorrecta");
            }
        }
    );
})