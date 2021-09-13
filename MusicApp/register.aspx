<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="MusicApp.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Register</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="css" runat="server">
    <style>
        .title {
            padding-top: 150px;
            padding-left: 250px;
            margin-right: 0px !important;
            margin-left: 0px !important;
        }

        .logo {
            max-height: 100px;
            max-width: 100px;
        }

        .formulario {
            border-width: 1px;
            border-style: solid;
            border-color: #707070;
            width: 650px;
            height: 530px;
            border-radius: 50px;
            margin-right: 130px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.50), 0 1px 2px rgba(0,0,0,0.50);
        }

        .selec {
            opacity: 60%;
            width: 265px;
            height: 38px;
            border-width: 0px;
            border-color: red;
        }

        .verif {
            opacity: 60%;
            border-color: red;
            border-width: 0px;
        }

        .primary-button {
            border-radius: 50px;
            height: 50px;
            width: 150px;
            font-size: 24px;
            background-color: #8E24AA;
            color: white;
            box-shadow: 0 1px 3px rgba(0,0,0,0.40), 0 1px 2px rgba(0,0,0,0.40);
        }

            .primary-button:hover {
                background-color: #73118D;
                box-shadow: 0 1px 3px rgba(0,0,0,0.40), 0 1px 2px rgba(0,0,0,0.40);
            }

        @media (max-width: 992px) {
            .title {
                padding-top: 10px;
            }

            .formulario {
                margin-left: 100px;
            }

            .title {
                padding-left: 290px;
            }

            .selec {
                width: 284px;
            }

            .form-group {
                margin-bottom: 1.2rem;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <div class="title d-flex justify-content-start m-12 col-lg-5 mt-5">
        <div class="">
            <img class="logo" src="assets/img/logo.png" />
        </div>
        <div class="ml-3 mt-2">
            <h1>Music App</h1>
            <h2>Conectando musicos.</h2>
        </div>
    </div>
    <div class="d-flex align-items-center ml-lg-5 mt-5 col-lg-6">
        <form class="p-4 formulario mt-5">
            <h1 class="text-center">Registrar cuenta</h1>
            <h3 class="text-center mb-3"><a href="/login">¿Ya tienes cuenta?</a></h3>
            <div class="form-group">
                <input type="email" class="form-control verif" id="email" name="email" placeholder="Ingresar correo electronico">
            </div>
            <div class="form-group row">
                <div class="col">
                    <input type="text" class="form-control verif" id="nombre" name="nombre" placeholder="Nombre">
                </div>
                <div class="col">
                    <input type="text" class="form-control verif" id="apellido" name="apellido" placeholder="Apellido">
                </div>
            </div>
            <div class="form-group row">
                <div class="col">
                    <input type="password" class="form-control verif" id="contrasenia" name="contrasenia" placeholder="Contraseña">
                </div>
                <div class="col">
                    <input type="password" class="form-control verif" id="verifContra" name="verifContra" placeholder="Verificar Contraseña">
                </div>
            </div>
            <div class="form-group row">
                <div class="col">
                    <input type="date" class="form-control verif" id="fechaNac" name="fechaNac">
                </div>
                <div class="col">
                    <input type="text" class="form-control verif" id="ciudad" name="ciudad" placeholder="Ciudad">
                </div>
            </div>
            <div class="form-group row">
                <div class="col">
                    <select class="form-select form-select-lg selec" aria-label="Default select example" id="genero" name="genero">
                        <option selected>Seleccionar genero</option>
                        <option value="M">Masculino</option>
                        <option value="F">Femenino</option>
                    </select>
                </div>

            </div>
            <div class="alert alert-danger" style="visibility: hidden; height: 35px; padding: 4px;" id="mensaje" role="alert">
                <strong id="estado"></strong>
            </div>
            <div class="text-center mt-1">
                <button type="button" id="action" name="action" class="btn primary-button">Registrar</button>
            </div>
        </form>
    </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <script>
        $("#action").click(function () {
            var email = $("#email").val();
            var nombre = $("#nombre").val();
            var apellido = $("#apellido").val();
            var contrasenia = $("#contrasenia").val();
            var verifContra = $("#verifContra").val();
            var fechaNac = $("#fechaNac").val();
            var ciudad = $("#ciudad").val();
            var genero = $("#genero").val();

            var ver = verify(email, nombre, apellido, contrasenia, verifContra, fechaNac, ciudad, genero);
            if (ver) {
                $.ajax({
                    type: "POST",
                    url: "register.aspx/crearUsuario",
                    data: "{'email':\"" + email + "\",'nombre':\"" + nombre + "\",'apellido':\"" + apellido + "\",'contrasenia':\"" + contrasenia + "\",'verifContra':\"" + verifContra
                        + "\", 'fechaNac': \"" + fechaNac + "\",'ciudad':\"" + ciudad + "\",'genero':\"" + genero + "\"}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        console.log(response.d);
                        if (response.d == "Contraseñas deben coincidir" || response.d.search("error") != -1) {
                            $("#estado").text(response.d);
                            $("#mensaje").css("visibility", "visible");
                        } else {
                            window.location.href = "login.aspx"
                        }
                        
                    },
                    failure: function (response) {
                        //alert(response.d);
                        toast = '<span class="toast-yellow">Se produjo un error, intenta de nuevo<span>';
                        M.toast({ html: toast });

                    }
                });
            }
        });

        function verify(email, nombre, apellido, contrasenia, verifContra, fechaNac, ciudad, genero) {
            var okay = true;
            $("#mensaje").css("visibility", "hidden");
            $("#email").css("border-width", "0px");
            $("#nombre").css("border-width", "0px");
            $("#apellido").css("border-width", "0px");
            $("#contrasenia").css("border-width", "0px");
            $("#verifContra").css("border-width", "0px");
            $("#fechaNac").css("border-width", "0px");
            $("#ciudad").css("border-width", "0px");
            $("#genero").css("border-width", "0px");

            if (email == '') {
                $("#email").css("border-width", "2px");
                okay = false;
            }
            if (nombre == '') {
                $("#nombre").css("border-width", "2px");
                okay = false
            }
            if (apellido == '') {
                $("#apellido").css("border-width", "2px");
                okay = false
            }
            if (contrasenia == '') {
                $("#contrasenia").css("border-width", "2px");
                okay = false
            }
            if (verifContra == '') {
                $("#verifContra").css("border-width", "2px");
                okay = false
            }
            if (fechaNac == '') {
                $("#fechaNac").css("border-width", "2px");
                okay = false
            }
            if (ciudad == '') {
                $("#ciudad").css("border-width", "2px");
                okay = false
            }
            if (genero == 'Seleccionar genero') {
                $("#genero").css("border-width", "2px");
                okay = false
            }

            return okay;
        }
    </script>
</asp:Content>
