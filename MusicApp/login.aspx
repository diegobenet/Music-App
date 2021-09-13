<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="MusicApp.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Login</title>
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
            height: 480px;
            border-radius: 50px;
            margin-right: 130px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.50), 0 1px 2px rgba(0,0,0,0.50);
        }

        .verif {
            height: 45px;
            opacity: 60%; 
            border-color: red; 
            border-width: 0px;
        }

        .primary-button {
            border-radius: 50px;
            height: 55px;
            width: 185px;
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

            .form-group {
                margin-bottom: 1.7rem;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <div class="title d-flex justify-content-start m-12 col-lg-5 mt-3">
        <div class="">
            <img class="logo" src="assets/img/logo.png" />
        </div>
        <div class="ml-3 mt-2 pr-4">
            <h1>Music App</h1>
            <h2>Conectando musicos.</h2>
        </div>
    </div>
    <div class="d-flex align-items-center ml-lg-5 mt-5 col-lg-6">
        <form class="p-4 formulario mt-5">
            <h1 class="text-center">Iniciar Sesión</h1>
            <h3 class="text-center mb-5"><a href="/register">Crear una cuenta</a></h3>
            <div class="form-group">
                <input type="text" class="form-control verif" id="usuario" name="usuario" placeholder="Ingresar correo electronico o nombre">
            </div>
            <div class="form-group">
                <input type="password" class="form-control verif" id="contrasenia" name="contrasenia" placeholder="Contraseña" >
            </div>
            <div class="alert alert-danger" style="visibility: hidden; height: 35px; padding: 4px;" id="mensaje" role="alert">
                <strong id="estado"></strong>
            </div>
            <div class="text-center mt-1">
                <button type="button" id="action" name="action" class="btn primary-button">Iniciar Sesión</button>
            </div>
            <h3 class="text-center mt-4"><a href="">¿Olvidaste tu contraseña?</a></h3>
        </form>
    </div>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <script>
        $(document).ready(function () {
            localStorage.clear();
        });

        $("#action").click(function () {
            var usuario = $("#usuario").val();
            var contrasenia = $("#contrasenia").val();
            
            var ver = verify(usuario, contrasenia);
            if (ver) {
                $.ajax({
                    type: "POST",
                    url: "login.aspx/iniciarSesion",
                    data: "{'usuario':\"" + usuario + "\",'contrasenia':\"" + contrasenia + "\" }",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                     
                        if (response.d == "Usuario o contraseña incorrecta" || response.d.search("error") != -1) {
                            $("#estado").text(response.d);
                            $("#mensaje").css("visibility", "visible");
                        } else {
                            var ret = response.d.split(" ");
                            var token = ret[0];
                            var Id_usuario = ret[1];

                            localStorage.setItem("token", token);
                            localStorage.setItem("Id_usuario", Id_usuario);
                            window.location.href = "home.aspx"
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

        function verify(usuario, contrasenia)
        {
            var okay = true;
            
            $("#mensaje").css("visibility", "hidden");
            $("#usuario").css("border-width", "0px");
            $("#contrasenia").css("border-width", "0px");

            if (usuario == '') {
                $("#usuario").css("border-width", "2px");
                okay = false;
            }

            if (contrasenia == '') {
                $("#contrasenia").css("border-width", "2px");
                okay = false
            }
            return okay;
        }

    </script>
</asp:Content>
