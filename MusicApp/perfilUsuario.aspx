<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="perfilUsuario.aspx.cs" Inherits="MusicApp.PerfilUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Perfil Usuario</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="css" runat="server">
    <style>
        .disabled-button {
            border-radius: 50px;
            height: 32px;
            width: 90px;
            font-size: 14px;
            background-color: #CBADD5;
            border-color: white;
            color: black;
        }

        .lista {
            position: sticky;
        }

        .mainContainer {
            max-width: 100%;
            padding-bottom: 25px;
        }

        .postContainer {
            background-color: #9B63AE;
        }


        .interaction {
            cursor: pointer;
            margin-bottom: 8px;
        }

            .interaction:hover {
                width: 42px;
                height: 42px;
                margin-bottom: 6px !important;
            }

        .sendButton:hover {
            width: 54px;
            height: 54px;
            margin-bottom: 3px !important;
        }

        .cont {
            padding-left: 35px;
            padding-right: 35px;
        }

        .textPill {
            border-radius: 20px;
        }

        .fotoProfile {
            padding-left: 150px;
            padding-top: 60px;
        }

        @media (max-width: 1531px) {
            .fotoProfile {
                padding-left: 60px !important;
            }

            .lista {
                display: none;
            }

            .mainContainer {
                max-width: 100%;
                min-width: 900px;
            }

            h5 {
                font-size: 12px;
            }
        }

        .outerDivFull {
            margin: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="background-color: #CBADD5; width: 100%; height: 305px" id="profileContent">
        <div class="col-4 col-lg-3 fotoProfile" style="padding-left: 150px; padding-top: 50px">
            <div class="fotoPost pb-3" style="width: 200px; height: 200px; background-image: url(<%= Usuario.Foto_perfil%> )"></div>

            <div class="custom-file mt-2" style="width: 250px; display: none" id="editPhoto">
                <input type="file" class="custom-file-input" id="customFileLang">
                <label class="custom-file-label" for="customFileLang"><%= Usuario.Foto_perfil %></label>
            </div>
        </div>
        <div class="col-4" style="padding-top: 40px">
            <div class="d-flex justify-content-start" id="followButtons">
                <h2><%= Usuario.Nombre%> <%= Usuario.Apellidos %></h2>

                <% var x1 = "display: none"; var y1 = "display: block"; %>

                <%foreach (var f in listaFollows) if (f.Id_following == Usuario.Id_usuario && f.Id_follower == UsuarioActivo.Id_usuario)
                                    { x1 = "display: block"; y1 = "display: none"; }%>
                <%if (UsuarioActivo.Id_usuario == Usuario.Id_usuario) { x1 = "display: none"; y1 = "display: none"; }%>

                <button id="buttonSeguir" style="<%=y1 %>" type="button" class="btn primary-button ml-4" onclick="follow()">Seguir</button>
                <button id="buttonDejarSeguir" style="<%=x1 %>; width: 120px" type="button" class="btn primary-button ml-4" onclick="unFollow()">Dejar de Seguir</button>
            </div>

            <div class=" mt-3">
                <button id="buttonGeneral" type="button" class="btn secondary-button ml-2 disabled" onclick="toggleInfo('General')">General</button>
                <button id="buttonMusical" type="button" class="btn disabled-button ml-3" onclick="toggleInfo('Musical')">Musical</button>
            </div>
            <div id="infoGeneral" class="mt-3 ml-2">
                <div id="textoInfoGeneral">
                    <h5>Email: <%= Usuario.Email %></h5>
                    <h5>Edad: <%= Usuario.edad %> años</h5>
                    <h5>Genero: <%= Usuario.Genero %></h5>
                    <h5>Ciudad: <%= Usuario.Ciudad %></h5>
                </div>
                <div id="infoGeneralEditar" style="display: none">

                    <div class="d-flex">
                        <h5>Email: </h5>
                        <input type="text" class="form-control verif ml-3" id="editEmail" name="editEmail" value="<%= Usuario.Email %>" style="max-width: 200px; max-height: 30px; background-color: #F7F7F7">
                    </div>
                    <div class="d-flex">
                        <h5>Edad: <%= Usuario.edad %> años</h5>
                    </div>
                    <div class="d-flex">
                        <h5>Genero: <%= Usuario.Genero %></h5>
                    </div>
                    <div class="d-flex">
                        <h5>Ciudad: </h5>
                        <input type="text" class="form-control verif ml-3" id="editCiudad" name="editCiudad" value="<%= Usuario.Ciudad %>" style="max-width: 220px; max-height: 30px; background-color: #F7F7F7">
                    </div>

                </div>
            </div>
            <div id="infoMusical" style="display: none" class="mt-3 ml-2">
                <div id="textoInfoMusical">
                    <h5>Instrumento favorito: <% if (String.IsNullOrEmpty(Usuario.Instrumentos_fav))
                                                  { %>
                                                    NA <% } %>
                        <% else
                            { %>
                        <%=Usuario.Instrumentos_fav %>
                        <% } %></h5>

                    <h5>Genero favorito: <% if (String.IsNullOrEmpty(Usuario.Genero_musical_fav))
                                             { %>
                                                    NA <% } %>
                        <% else
                            { %>
                        <%=Usuario.Genero_musical_fav %>
                        <% } %></h5>

                    <h5>¿Cantante? <% if (String.IsNullOrEmpty(Usuario.Es_cantante))
                                       { %>
                                                    NA <% } %>
                        <% else
                            { %>
                        <%=Usuario.Es_cantante %>
                        <% } %></h5>

                    <h5>¿Participado en banda/concierto? <% if (String.IsNullOrEmpty(Usuario.Estado_en_banda_concierto))
                                                             { %>
                                                            NA <% } %>
                        <% else
                            { %>
                        <%=Usuario.Estado_en_banda_concierto %>
                        <% } %></h5>
                </div>
                <div id="infoMusicalEditar" style="display: none">
                    <div class="d-flex">
                        <h5>Instrumento favorito: </h5>
                        <input type="text" class="form-control verif ml-3" id="editInstrumento" name="editInstrumento" value="<%= Usuario.Instrumentos_fav %>" style="max-width: 120px; max-height: 30px; background-color: #F7F7F7">
                    </div>
                    <div class="d-flex">
                        <h5>Genero favorito: </h5>
                        <input type="text" class="form-control verif ml-3" id="editGeneroMusical" name="editGeneroMusical" value="<%= Usuario.Genero_musical_fav %>" style="max-width: 120px; max-height: 30px; background-color: #F7F7F7">
                    </div>
                    <div class="d-flex">
                        <h5>¿Cantante? </h5>
                        <div class="switchToggle ml-3">
                            <input onclick="checkSwitch('switch1')" type="checkbox" id="switch1" <%if (!String.IsNullOrEmpty(Usuario.Es_cantante) && Usuario.Es_cantante.Equals("Si"))
                                { %>
                                checked value="on" <% }
                                else
                                {%>
                                value="off" <%} %> />
                            <label for="switch1"></label>
                        </div>
                    </div>
                    <div class="d-flex">
                        <h5>¿Participado en banda/concierto? </h5>
                        <div class="switchToggle ml-3">
                            <input type="checkbox" onclick="checkSwitch('switch2')" id="switch2" <%if (!String.IsNullOrEmpty(Usuario.Estado_en_banda_concierto) && String.Equals(Usuario.Estado_en_banda_concierto, "Si"))
                                { %>
                                checked value="on" <% }
                                else
                                {%>
                                value="off" <%} %> />
                            <label for="switch2"></label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-4" style="padding-top: 40px">
            <div class="d-flex justify-content-end">
                <button id="registrarBanda" type="button" class="btn primary-button ml-4" style="width: 130px; height: 35px;" data-toggle="modal" data-target="#exampleModalCenter">Registrar Banda</button>
            </div>
            <div class="mt-4 textPill" style="background-color: #D3BBDC; overflow: auto; min-height: 112px">
                <div id="comentario" class="p-2">
                    <p><%= Usuario.Desc_personal %></p>
                </div>
                <div id="editarComentario" class="p-2" style="display: none">
                    <div class="col-7 col-lg-8 mt-2 mb-2 ml-2">
                        <textarea type="tex" class="form-control" id="editComment" name="editComment" placeholder="Escribir un comentario aqui..." style="height: 70px; background-color: #F7F7F7; width: 410px"
                            rows="3"><%= Usuario.Desc_personal %></textarea>
                    </div>
                </div>
            </div>
            <div class="mt-5 d-flex justify-content-end">
                <button id="botonEditar" type="button" class="btn secondary-button ml-4" onclick="estadoInfo('editar')">Editar</button>
                <button id="botonGuardar" type="button" class="btn secondary-button ml-4" style="display: none" onclick="estadoInfo('guardar')">Guardar</button>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h3 class="modal-title w-100" id="exampleModalLongTitle">Registrar banda a tu perfil</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="d-flex">
                        <h4>¿La banda pertenece a Music App?</h4>
                        <div class="switchToggle ml-3">
                            <input type="checkbox" id="bandaEnApp" checked>
                            <label for="bandaEnApp"></label>
                        </div>
                    </div>
                    <div>
                        <input type="text" class="form-control verif ml-3 mt-3" id="nombreBanda" name="nombreBanda" placeholder="Nombre de la banda" style="max-width: 400px; max-height: 50px; background-color: #F7F7F7">
                        <div id="noEnApp" class="d-flex" style="display: none!important">
                            <input type="text" class="form-control verif ml-3 mt-3" id="fechaInicio" name="fechaInicio" placeholder="Fecha Inicio" style="max-width: 193px; max-height: 50px; background-color: #F7F7F7">
                            <input type="text" class="form-control verif ml-3 mt-3" id="fechaFin" name="fechaFin" placeholder="Fecha Fin" style="max-width: 193px; max-height: 50px; background-color: #F7F7F7">
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-between">
                    <button type="button" class="btn secondary-button" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn primary-button" style="width: 100px">Guardar</button>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-4 lista cont mt-3">
            <div class="p-3 pr-5">
                <h2 style="text-align: center;">Grupos en los que paricipo</h2>
                <table class="table">
                    <tbody>
                        <tr>
                            <td class="d-flex">
                                <div class="fotoPost mr-3" style="width: 40px; height: 40px;"></div>
                                <span class="pt-2" style="font-size: 18px"><a href="#">Las Obejas</a></span>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="d-flex ">
                                <div class="fotoPost mr-3" style="width: 40px; height: 40px;"></div>
                                <span class="pt-2" style="font-size: 18px"><a href="#">Las Obejas</a></span>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="pt-3" style="font-size: 18px; padding-left: 68px">Los Juanes</td>
                            <td>1996-2014</td>
                        </tr>
                        <tr>
                            <td class="pt-3" style="font-size: 18px; padding-left: 68px">Los Pablos</td>
                            <td>2014-2021</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-12 col-lg-8 mainContainer mt-4">
            <div class="mt-4 ml-5 mr-5 makePost" id="makePost">
                <div class="d-flex justify-content-center">
                    <h1>Crear un post</h1>
                </div>
                <div class="d-flex">

                    <div class="col-2 col-lg-1 mt-3 mr-3 mb-3 fotoPost" style="border: 1px solid #808080; min-width: 90px; min-height: 90px; max-width: 90px; max-height: 90px; margin-left: 50px; background-image: url(<%= Usuario.Foto_perfil%> )"></div>
                    <div class="ml-4 mt-2">

                        <div class="custom-file" style="width: 450px">
                            <input type="file" class="custom-file-input" id="customFileLang2">
                            <label class="custom-file-label" for="customFileLang2">Choose mp3 file</label>
                        </div>
                        <div class="d-flex">
                            <div class=" mt-3 mb-3" style="width: 450px;">
                                <textarea type="tex" class="form-control writeComment" id="postMessage" name="postMessage" placeholder="Escribir un comentario aqui..." rows="3"></textarea>
                            </div>
                            <div class="col-1 pl-2 ml-2" style="margin-top: 25px">
                                <img class="sendButton" src="/assets/icons/send.svg" width="50" height="50" alt="" style="cursor: pointer" onclick=" registrarPost(); clearPostMessage()">
                            </div>
                        </div>

                    </div>

                </div>
            </div>
            <div id="id_posts">
                <% foreach (var item in listaPosts)
                    { %>
                <div class="mt-4 ml-5 mr-5 postContainer">
                    <div class="row">
                        <div class="d-flex align-items-center">
                            <div class="col-2 col-lg-1 mr-4 fotoPost" style="min-width: 130px; min-height: 130px; max-width: 130px; max-height: 130px; margin-left: 50px; background-image: url(<%= Usuario.Foto_perfil%>); border: 1px solid #808080;">
                            </div>
                        </div>
                        <div class="col-6 col-lg-8 mt-4 mr-4 ml-4 mb-1" style="width: 600px">
                            <h2><%= item.usuario.Nombre%>  <%= item.usuario.Apellidos %></h2>
                            <%if (item.Archivo_mp3 != null)
                                { %>

                            <div class=" mr-2">
                                <div class="container-audio">
                                    <audio controls>
                                        <source src=" <%= item.Archivo_mp3 %>" type="audio/ogg">
                                        Your browser dose not Support the audio Tag
                                    </audio>
                                </div>
                            </div>
                            <%} %>
                            <div class="postContent">
                                <div class="row">
                                    <div class="col-12 m-1 ml-2">
                                        <h5><%= item.Mensaje %> </h5>
                                    </div>
                                </div>
                            </div>
                            <% var x = "display: none"; var y = "display: block"; %>
                            <%foreach (var l in listaLike) if (l.Id_post == item.Id_post && l.Id_usuario == UsuarioActivo.Id_usuario)
                                    { x = "display: block"; y = "display: none"; }%>



                            <div class="d-flex justify-content-end mt-2" id="interactionIcons<%=item.Id_post%>">
                                <% var likeCount = 0;%>
                                <%foreach (var l in listaLike) if (l.Id_post == item.Id_post) { likeCount++; }%>
                                <h2><%=likeCount %> </h2>
                                <img class="rounded-circle mr-3 interaction" id="like<%=item.Id_post%>" style="<%=y %>" width="40px" height="40px" src="assets/icons/unfilledFav.svg" onclick="onLike('like<%=item.Id_post%>')" />
                                <img class="rounded-circle mr-3 interaction" id="like<%=item.Id_post%>d" style="<%=x %>" id="like" width="40px" height="40px" src="assets/icons/fav.svg" onclick="onLike('like<%=item.Id_post%>')" />

                                <img class="rounded-circle mr-2 interaction" id="closedChat<%=item.Id_post%>" style="display: block" width="40px" height="40px" src="assets/icons/chat.svg" onclick="onChat('<%=item.Id_post%>')" />
                                <img class="rounded-circle mr-2 interaction" id="openedChat<%=item.Id_post%>" style="display: none" width="40px" height="40px" src="assets/icons/chatfilled.svg" onclick="onChat('<%=item.Id_post%>')" />
                            </div>
                        </div>
                    </div>
                    <div id="comments<%=item.Id_post%>" style="display: none">
                        <% foreach (var c in Comentarios) if (item.Id_post == c.Id_post)
                                { %>
                        <div id="comment1" class="postComment" style="max-width: 810px">
                            <div class="row">
                                <%foreach (var lu in listaUsuarios) if (c.Id_usuario == lu.Id_usuario)
                                        {%>
                                <div class="col-2 col-lg-1 mt-2 ml-3 mr-3 mb-3  fotoPost" style="min-width: 100px; min-height: 100px; margin-left: 50px!important; background-image: url(<%= lu.Foto_perfil %>); border: 1px solid #808080">
                                </div>

                                <div class="col-6 col-lg-8 mt-1 mr-4 ml-4 mb-1">
                                    <h2><%= lu.Nombre %> <%=lu.Apellidos %></h2>
                                    <%} %>
                                    <div class="postCommentContent">
                                        <div class="m-1 ml-2">
                                            <h5><%= c.Comentario1 %></h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%} %>
                    </div>

                    <div class="profileComment">
                        <div class="row">
                            <div class="col-2 col-lg-3 mt-2  mb-2 fotoPost" style="min-width: 70px; min-height: 70px; max-width: 70px; max-height: 70px; margin-left: 60px!important; background-image: url( <%= UsuarioActivo.Foto_perfil %>); border: 1px solid #808080;">
                            </div>
                            <div class="col-7 col-lg-8 mt-2 mb-2 ml-2">
                                <textarea type="tex" class="form-control writeComment" id="createMessage<%= item.Id_post%>" name="createMessage" placeholder="Escribir un comentario aqui..." rows="3"></textarea>
                            </div>
                            <div class="col-1 pl-1 mt-3">
                                <img class="sendButton" src="/assets/icons/send.svg" width="50" height="50" alt="" style="cursor: pointer" onclick="setMessage('<%= item.Id_post%>')">
                            </div>
                        </div>
                    </div>
                </div>
                <%} %>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <script>
        $(document).ready(function () {
            $('#customFileLang').on('change', function () {
                //get the file name
                var fileName = $(this).val().substr(12);
                //replace the "Choose a file" label
                $(this).next('.custom-file-label').html(fileName);
            })

            $('#customFileLang2').on('change', function () {
                //get the file name
                var fileName = $(this).val().substr(12);
                //replace the "Choose a file" label
                $(this).next('.custom-file-label').html(fileName);
            })

            var curUsuario = new URL(window.location.href).searchParams.get("Usuario");
            var activeUser = localStorage.getItem("Id_usuario");

            if (curUsuario != activeUser) {
                $('#botonEditar').hide();
                $('#makePost').hide();
                $('#registrarBanda').css("visibility", "hidden");
            }


        })

        $('#bandaEnApp').click(function () {
            $('noEnApp').hide();
            console.log('eee' + $("#bandaEnApp").attr('checked'));
            if ($('#bandaEnApp').attr('checked') != "checked") {
                $('#noEnApp').attr('style', 'display:none !important');
                $('#bandaEnApp').attr('checked', true);
            } else {
                console.log('aas2')
                $('#noEnApp').show();
                $('#bandaEnApp').removeAttr('checked');
            }
        });

        function toggleInfo(tipo) {
            $("#infoGeneral").hide();
            $("#infoMusical").hide();
            if (tipo == 'General') {
                $("#buttonGeneral").addClass('disabled');
                $("#buttonGeneral").addClass('secondary-button');
                $("#buttonGeneral").removeClass('disabled-button');

                $("#buttonMusical").removeClass('disabled');
                $("#buttonMusical").removeClass('secondary-button');
                $("#buttonMusical").addClass('disabled-button');
                $("#infoGeneral").show();
            } else {
                $("#buttonMusical").addClass('disabled');
                $("#buttonMusical").addClass('secondary-button');
                $("#buttonMusical").removeClass('disabled-button');

                $("#buttonGeneral").removeClass('disabled');
                $("#buttonGeneral").removeClass('secondary-button');
                $("#buttonGeneral").addClass('disabled-button');
                $("#infoMusical").show();
            }
        }

        function estadoInfo(estado) {
            if (estado == 'editar') {
                $("#textoInfoGeneral").hide();
                $("#textoInfoMusical").hide();
                $("#comentario").hide();
                $("#infoGeneralEditar").show();
                $("#infoMusicalEditar").show();
                $("#editarComentario").show();
                $("#editPhoto").show();

                $("#botonEditar").hide();
                $("#botonGuardar").show();
            } else {
                UpdateUser().done(function () {
                    $("#textoInfoGeneral").show();
                    $("#textoInfoMusical").show();
                    $("#comentario").show();
                    $("#infoGeneralEditar").hide();
                    $("#infoMusicalEditar").hide();
                    $("#editarComentario").hide();
                    $("#editPhoto").hide();

                    $("#botonEditar").show();
                    $("#botonGuardar").hide();
                });
            }

        }

        function UpdateUser() {
            var user = localStorage.getItem("Id_usuario");
            var email = $("#editEmail").val().toString();
            var ciudad = $("#editCiudad").val().toString();
            var instrumentoFav = $("#editInstrumento").val().toString();
            var generoMusical = $("#editGeneroMusical").val().toString();
            var esCantante = $("#switch1").val().toString();
            var bandaConcierto = $("#switch2").val().toString();
            var desc = $("#editComment").val().toString();
            var photo = $("#customFileLang").val().substr(12);


            if (esCantante == "on") {
                esCantante = "Si";
            } else {
                esCantante = "No"
            }

            if (bandaConcierto == "on") {
                bandaConcierto = "Si";
            } else {
                bandaConcierto = "No"
            }

            var data = JSON.stringify({
                Id_usuario: user, Email: email, Ciudad: ciudad, Instrumentos_fav: instrumentoFav, Genero_musical: generoMusical,
                Es_cantante: esCantante, Estado_en_banda_concierto: bandaConcierto, Desc_personal: desc, Foto_perfil: photo
            })

            var ver = verify(email, ciudad);
            if (ver) {
                $.ajax({
                    type: "POST",
                    url: "perfilUsuario.aspx/updateUser",
                    data: data,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",

                    success: function (response) {
                        console.log(response.d);
                        $("#profileContent").load(" #profileContent > *");
                        
                    },
                    failure: function (response) {
                        //alert(response.d);
                        toast = '<span class="toast-yellow">Se produjo un error, intenta de nuevo<span>';
                        M.toast({ html: toast });

                    }
                });
            }
        }

        function verify(email, ciudad) {
            var okay = true;

            $("#usuario").css("border-width", "0px");
            $("#contrasenia").css("border-width", "0px");

            if (email == '') {
                $("#editEmail").css("border-width", "2px");
                $("#editEmail").css("border-color", "red");
                okay = false;
            }

            if (ciudad == '') {
                $("#editCiudad").css("border-width", "2px");
                $("#editCiudad").css("border-color", "red");
                okay = false
            }
            return okay;
        }

        function registrarPost() {
            var mp3 = $("#customFileLang2").val().substr(12);
            var mensaje = $("#postMessage").val().toString();
            var user = localStorage.getItem("Id_usuario");

            var data = JSON.stringify({
                Id_usuario: user, Mensaje: mensaje, Archivo_mp3: mp3
            })

            $.ajax({
                type: "POST",
                url: "perfilUsuario.aspx/registerPost",
                data: data,
                contentType: "application/json; charset=utf-8",
                dataType: "json",

                success: function (response) {
                    console.log(response.d);
                    $("#id_posts").load(" #id_posts > *");
                },
                failure: function (response) {
                    //alert(response.d);
                    console.log('cc');
                    toast = '<span class="toast-yellow">Se produjo un error, intenta de nuevo<span>';
                    M.toast({ html: toast });

                }
            });
        }

        function follow() {
            var follower = localStorage.getItem("Id_usuario");
            var data = JSON.stringify({
                Id_follower: follower
            })
            $.ajax({
                type: "POST",
                url: "perfilUsuario.aspx/follow",
                data: data,
                contentType: "application/json; charset=utf-8",
                dataType: "json",

                success: function (response) {
                    console.log(response.d);
                    $("#followButtons").load(" #followButtons > *");
                },
                failure: function (response) {
                    //alert(response.d);
                    console.log('cc');
                    toast = '<span class="toast-yellow">Se produjo un error, intenta de nuevo<span>';
                    M.toast({ html: toast });

                }
            });
        }

        function unFollow() {
            var follower = localStorage.getItem("Id_usuario");
            var data = JSON.stringify({
                Id_follower: follower
            })
            $.ajax({
                type: "POST",
                url: "perfilUsuario.aspx/unFollow",
                data: data,
                contentType: "application/json; charset=utf-8",
                dataType: "json",

                success: function (response) {
                    console.log(response.d);
                    $("#followButtons").load(" #followButtons > *");
                },
                failure: function (response) {
                    //alert(response.d);
                    console.log('cc');
                    toast = '<span class="toast-yellow">Se produjo un error, intenta de nuevo<span>';
                    M.toast({ html: toast });

                }
            });
        }
    </script>
</asp:Content>
