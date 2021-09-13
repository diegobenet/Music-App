<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="FormularioAgrupaciones.aspx.cs" Inherits="MusicApp.FormularioAgrupaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Registrar Agrupacion</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="css" runat="server">
    <style>
    	.backgr {
    		height: 90.5vh;
    		width: 100%;
    		background: linear-gradient(rgba(255,255,255,.8), rgba(255,255,255,.8)), url('assets/img/background.jpg');
    		background-size: cover;
    	}

    	.formulario {
    		border-width: 1px;
    		border-style: solid;
    		border-color: #707070;
    		width: 900px;
    		height: auto;
    		border-radius: 50px;
    		box-shadow: 0 1px 3px rgba(0,0,0,0.50), 0 1px 2px rgba(0,0,0,0.50);
    	}

    	.verif {
    		opacity: 60%;
    		border-color: red;
    		border-width: 0px;
    	}

    	button, input[type="submit"], input[type="reset"] {
    		background: none;
    		color: inherit;
    		border: none;
    		padding: 0;
    		font: inherit;
    		cursor: pointer;
    		outline: inherit;
    	}
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-12 backgr">
        <div class="d-flex justify-content-center">
            <div class="d-flex align-items-center mt-4">
                <form class="p-4 formulario">
                    <h1 class="text-center">Registrar agrupacion</h1>
                    <div class="form-group row mt-4">
                        <div class="col">
                            <input type="text" class="form-control verif" id="nombre" name="nombre" placeholder="Nombre">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <input type="text" class="form-control verif" id="generoMusical" name="generoMusical" placeholder="Genero Musical">
                        </div>
                        <div class="col">
                            <input type="text" class="form-control verif" id="ciudad" name="ciudad" placeholder="Ciudad">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <div class="custom-file mt-2" style="" id="photo">
                                <input type="file" class="custom-file-input" id="photoFile">
                                <label id="photoLabel" class="custom-file-label verif" for="photoFile" style="opacity: 80%">Subir foto de perfil</label>
                            </div>
                        </div>
                        <div class="col d-flex align-items-center">
                            <p style="margin-bottom: 0px">¿En busqueda de mas integrantes?</p>
                            <div class="switchToggle ml-3">
                                <input type="checkbox" id="switch1">
                                <label for="switch1" style="opacity: 80%"></label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row mt-4 pt-3  position-relative form-inline" style="border-top: 1px solid">
                        <div class="col-6">
                            <input type="text" class="form-control verif" id="buscar" name="buscar" placeholder="Buscar integrantes">
                        </div>
                        <span style="display: contents" id="searchUsuarios"></span>
                    </div>
                    <div id="newIntegrantes" class="form-group row" style="overflow: auto; height: 114px" id="integrantes">
                        

                    </div>
                    <div class="alert alert-danger" style="visibility: hidden; height: 35px; padding: 4px;" id="mensaje" role="alert">
                        <strong id="estado"></strong>
                    </div>
                    <div class="text-center ">
                        <button type="button" id="action" name="action" class="btn primary-button" style="font-size: 24px; width: 125px; height: 50px;">Registrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <script>
        var integrante = [];

        $("#action").click(function () {
            var nombre = $("#nombre").val();
            var ciudad = $("#ciudad").val();
            var generoMusical = $("#generoMusical").val();
            var fotoPerfil = $("#photoFile").val().substr(12);
            var buscaIntegrantes = $("#switch1").val();
            var data = JSON.stringify({
                nombre: nombre, ciudad: ciudad, generoMusical: generoMusical, fotoPerfil: fotoPerfil, integrantes: integrante
            })

            $.ajax({
                type: "POST",
                url: "FormularioAgrupaciones.aspx/crearAgrupacion",
                data: data,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log(response.d);
                    if (response.d == "Contraseñas deben coincidir" || response.d.search("error") != -1) {
                    } else {
                        window.location.href = "listaAgrupaciones.aspx"
                    }

                },
                failure: function (response) {
                    //alert(response.d);
                    toast = '<span class="toast-yellow">Se produjo un error, intenta de nuevo<span>';
                    M.toast({ html: toast });

                }
            });
        });


        $(document).ready(function () {
            $('#photoFile').on('change', function () {
                //get the file name
                var fileName = $(this).val().substr(12);
                //replace the "Choose a file" label
                $(this).next('.custom-file-label').html(fileName);
            });

            $('#buscar').on('keyup', function (e) {
                //get the file name
                var f = "" + $(this).val();
                if (e.which == 13) {

                    var data = JSON.stringify({
                        filter: f
                    })

                    $.ajax({
                        type: "POST",
                        url: "home.aspx/getFilter",
                        data: data,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",

                        success: function (response) {
                            var json = JSON.parse(response.d);
                            var spaan = $('#searchUsuarios');
                            spaan.empty();
                            var marge = 86;
                            $.each(json, function (i, elem) {
                                spaan.append("<div class='d-flex align-items-center position-absolute' style='border: 1px solid; border-top: 0px; height: 38px; background-color: white; width: 220px; margin-top:" + marge + "px; z-index: 101; opacity: 95%; cursor: pointer'> <button type='button' class='d-flex align-items-center' onClick='addUserCard(\"" + json[i].Id_usuario + "\",\"" + json[i].Nombre + " " + json[i].Apellidos + "\",\"" + json[i].Foto_perfil + "\")'> <div class='fotoPost ml-2' style='width: 20px; height: 23px; background-image: url(" + json[i].Foto_perfil + " )'></div> <p class='ml-3 mr-2' style='margin-bottom: 0px; font-size: 14px'>" + json[i].Nombre + " " + json[i].Apellidos + "</p> </button> </div >");
                                marge += 76;
                            });
                            //var json = JSON.parse(response.d);
                            //console.log("ae " + json);
                        },
                        failure: function (response) {
                            //alert(response.d);
                            toast = '<span class="toast-yellow">Se produjo un error, intenta de nuevo<span>';
                            M.toast({ html: toast });

                        }
                    });
                }
            });

        });

        $("#action").click(function () {
            var nombre = $("#nombre").val();
            var apellido = $("#apellido").val();
            var ciudad = $("#ciudad").val();
            var generoMusical = $("#generoMusical").val();
            var photoFile = $("#photoFile").val();

            var ver = verify(nombre, apellido, ciudad, generoMusical, photoFile);
            if (ver) {
                $.ajax({
                    type: "POST",
                    url: "login.aspx/iniciarSesion",
                    data: "{'nombre':\"" + nombre + "\",'apellido':\"" + apellido + "\",'ciudad':\"" + ciudad + "\",'generoMusical':\"" + generoMusical + "\",'photoFile':\"" + photoFile + "\" }",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {

                        console.log('aA: ' + response.d);

                    },
                    failure: function (response) {
                        //alert(response.d);
                        toast = '<span class="toast-yellow">Se produjo un error, intenta de nuevo<span>';
                        M.toast({ html: toast });

                    }
                });
            }
        });

        function verify(nombre, apellido, ciudad, generoMusical, photoFile) {
            var okay = true;
            console.log("aa" + photoFile);
            $("#mensaje").css("visibility", "hidden");
            $("#nombre").css("border-width", "0px");
            $("#apellido").css("border-width", "0px");
            $("#ciudad").css("border-width", "0px");
            $("#generoMusical").css("border-width", "0px");
            $("#photoLabel").css("border-width", "0px");

            if (nombre == '') {
                $("#nombre").css("border-width", "2px");
                okay = false;
            }

            if (apellido == '') {
                $("#apellido").css("border-width", "2px");
                okay = false;
            }

            if (ciudad == '') {
                $("#ciudad").css("border-width", "2px");
                okay = false
            }

            if (generoMusical == '') {
                $("#generoMusical").css("border-width", "2px");
                okay = false
            }

            if (photoFile == '') {
                $("#photoLabel").css("border-width", "1px");
                okay = false
            }

            return okay;
        }

        function addUserCard(id, nombre, foto) {
            var spaan = $('#searchUsuarios');
            var busc = $('#buscar');
            spaan.empty();
            busc.val('');
            if (jQuery.inArray(id, integrante) == -1) {
                i = integrante.length;
                integrante[i] = id;
                var div = $('#newIntegrantes');
                div.append("<div id='userCard"+id+"' class='col-6 mb-2'><div class='d-flex align-items-center justify-content-around' style='border: 1px solid; height: 48px; border-radius: 20px; background-color: white; opacity: 70%'><div class='fotoPost ml-2' style='width: 40px; height: 43px; background-image: url(" + foto + " )'></div><h3 class='ml-3' style='margin-bottom: 0px'>" + nombre + "</h3><img style='cursor: pointer' src='/assets/icons/clear.svg' width='20' height='20' alt='' onClick='removeUserCard(\"" + id + "\")'></div></div>");
            }
        }

        function removeUserCard(id) {
            index = integrante.indexOf(id);
            integrante[index] = null;
            var diiv = $('#userCard' + id);
            diiv.remove();
        }

    </script>
</asp:Content>
