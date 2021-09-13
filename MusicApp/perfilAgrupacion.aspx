<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="perfilAgrupacion.aspx.cs" Inherits="MusicApp.perfilAgrupacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Perfil Agrupacion</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="css" runat="server">
    <style>
        .mainContainer {
            max-width: 100%;
            padding-bottom: 25px;
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

        .animateButton:hover {
            width: 32px;
            height: 32px;
        }

        .sendButton:hover {
            width: 54px;
            height: 54px;
            margin-bottom: 3px !important;
        }

        .notButton {
            font-size: 18px;
            text-decoration: underline;
            background-color: transparent;
            border: 0px;
        }

            .notButton:hover {
                text-decoration: underline;
            }

            .notButton:focus {
                border: 0px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="background-color: #CBADD5; width: 100%; height: 305px">
        <div class="col-4 col-lg-3 fotoProfile" style="padding-left: 150px; padding-top: 50px">
            <div class="fotoPost pb-3" style="width: 200px; height: 200px;"></div>

            <div class="custom-file mt-2" style="width: 250px; display: none" id="editPhoto">
                <input type="file" class="custom-file-input" id="customFileLang">
                <label class="custom-file-label" for="customFileLang">foto.jpg</label>
            </div>
        </div>
        <div class="col-4" style="padding-top: 40px">
            <div class="d-flex justify-content-start">
                <h2>Gustavo Flores Gonzales</h2>
                <button type="button" class="btn primary-button ml-4">Seguir</button>
            </div>

            <div class="d-flex">
                <div class="" style="cursor: pointer">
                    <button type="button" class="btn notButton" data-toggle="modal" data-target="#exampleModalCenter">6 Miembros</button>
                </div>
            </div>
            <div id="infoGeneral" class="mt-3 ml-2">
                <div id="textoInfoGeneral">
                    <h5>Genero: Rock / Pop</h5>
                    <h5>Ciudad: Monterrey</h5>
                </div>
                <div id="infoGeneralEditar" style="display: none">

                    <div class="d-flex">
                        <h5>Genero: </h5>
                        <input type="text" class="form-control verif ml-3" id="editGenero" name="editGenero" value="Pop / Rock" style="max-width: 150px; max-height: 30px; background-color: #F7F7F7">
                    </div>
                    <div class="d-flex">
                        <h5>Ciudad: </h5>
                        <input type="text" class="form-control verif ml-3" id="editCiudad" name="editCiudad" value="Monterrey" style="max-width: 120px; max-height: 30px; background-color: #F7F7F7">
                    </div>

                </div>
            </div>
        </div>
        <div class="col-4" style="padding-top: 40px">
            <div class="d-flex justify-content-end">
                <button type="button" class="btn primary-button ml-4" style="width: 130px; height: 35px;">Solicitar unirse</button>
            </div>
            <div class="mt-4 textPill" style="background-color: #D3BBDC; overflow: auto; min-height: 112px">
                <div id="comentario" class="p-2">
                    <p>Hola! somos las Obejas. Tocamos todos los domingos a las 6:00pm en el parque.</p>
                </div>
                <div id="editarComentario" class="p-2" style="display: none">
                    <div class="col-7 col-lg-8 mt-2 mb-2 ml-2">
                        <textarea type="tex" class="form-control" id="editComment" name="editComment" placeholder="Escribir un comentario aqui..." style="height: 70px; background-color: #F7F7F7; width: 410px"
                            rows="3">Hola! somos las Obejas. Tocamos todos los domingos a las 6:00pm en el parque.</textarea>
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
                    <h5 class="modal-title w-100" id="exampleModalLongTitle">Integrantes</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                        <div class="row" style="overflow:auto; height:280px">
                            <div class="col-12 mb-2">
                                <div class="d-flex align-items-center" style="border-bottom: 1px solid; height: 48px; background-color: white;">
                                    <div class="fotoPost ml-2" style="width: 40px; height: 40px"></div>
                                    <h3 class="ml-4" style="margin-bottom: 0px">Pedro Ignacio Torres</h3>
                                </div>
                            </div>
                            <div class="col-12 mb-2">
                                <div class="d-flex align-items-center" style="border-bottom: 1px solid; height: 48px; background-color: white;">
                                    <div class="fotoPost ml-2" style="width: 40px; height: 40px"></div>
                                    <h3 class="ml-4" style="margin-bottom: 0px">Pedro Ignacio Torres</h3>
                                </div>
                            </div>
                            <div class="col-12 mb-2">
                                <div class="d-flex align-items-center" style="border-bottom: 1px solid; height: 48px; background-color: white;">
                                    <div class="fotoPost ml-2" style="width: 40px; height: 40px"></div>
                                    <h3 class="ml-4" style="margin-bottom: 0px">Pedro Ignacio Torres</h3>
                                </div>
                            </div>
                            <div class="col-12 mb-2">
                                <div class="d-flex align-items-center" style="border-bottom: 1px solid; height: 48px; background-color: white;">
                                    <div class="fotoPost ml-2" style="width: 40px; height: 40px"></div>
                                    <h3 class="ml-4" style="margin-bottom: 0px">Pedro Ignacio Torres</h3>
                                </div>
                            </div>
                            <div class="col-12 mb-2">
                                <div class="d-flex align-items-center" style="border-bottom: 1px solid; height: 48px; background-color: white;">
                                    <div class="fotoPost ml-2" style="width: 40px; height: 40px"></div>
                                    <h3 class="ml-4" style="margin-bottom: 0px">Pedro Ignacio Torres</h3>
                                </div>
                            </div>
                            <div class="col-12 mb-2">
                                <div class="d-flex align-items-center" style="border-bottom: 1px solid; height: 48px; background-color: white;">
                                    <div class="fotoPost ml-2" style="width: 40px; height: 40px"></div>
                                    <h3 class="ml-4" style="margin-bottom: 0px">Pedro Ignacio Torres</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                <div class="modal-footer d-flex justify-content-between">
                    <button type="button" class="btn secondary-button" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-4 lista cont mt-3">
            <div class="p-3 pr-5">
                <h2 style="text-align: center;">Usuarios con solicitud pendiente</h2>
                <table class="table">
                    <tbody>
                        <tr>
                            <td class="d-flex">
                                <div class="fotoPost mr-3" style="width: 40px; height: 40px;"></div>
                            </td>
                            <td>
                                <span class="pt-2" style="font-size: 18px"><a href="#">German Fuentes</a></span>
                            </td>
                            <td>
                                <div class="d-flex justify-content-end">
                                    <img class="animateButton" style="margin-right:10px; cursor:pointer" src="/assets/icons/done.svg" width="30" height="30" alt="">
                                    <img class="animateButton" style=" cursor:pointer" src="/assets/icons/redClear.svg" width="30" height="30" alt="">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="d-flex">
                                <div class="fotoPost mr-3" style="width: 40px; height: 40px;"></div>
                            </td>
                            <td>
                                <span class="pt-2" style="font-size: 18px"><a href="#">Rodrigo Garza</a></span>
                            </td>
                            <td>
                                <div class="d-flex justify-content-end">
                                    <img class="animateButton" style="margin-right:10px; cursor:pointer" src="/assets/icons/done.svg" width="30" height="30" alt="">
                                    <img class="animateButton" style=" cursor:pointer" src="/assets/icons/redClear.svg" width="30" height="30" alt="">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="d-flex">
                                <div class="fotoPost mr-3" style="width: 40px; height: 40px;"></div>
                            </td>
                            <td>
                                <span class="pt-2" style="font-size: 18px"><a href="#">Federico Garza Fernandez</a></span>
                            </td>
                            <td>
                                <div class="d-flex justify-content-end">
                                    <img class="animateButton" style="margin-right:10px; cursor:pointer" src="/assets/icons/done.svg" width="30" height="30" alt="">
                                    <img class="animateButton" style=" cursor:pointer" src="/assets/icons/redClear.svg" width="30" height="30" alt="">
                                </div>
                            </td>
                        </tr>
                       <tr>
                            <td class="d-flex">
                                <div class="fotoPost mr-3" style="width: 40px; height: 40px;"></div>
                            </td>
                            <td>
                                <span class="pt-2" style="font-size: 18px"><a href="#">Eduardo Guzman Lorenzo</a></span>
                            </td>
                           <td>
                                <div class="d-flex justify-content-end">
                                    <img class="animateButton" style="margin-right:10px; cursor:pointer" src="/assets/icons/done.svg" width="30" height="30" alt="">
                                    <img class="animateButton" style=" cursor:pointer" src="/assets/icons/redClear.svg" width="30" height="30" alt="">
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-12 col-lg-8 mainContainer mt-4">
            <div class="mt-4 ml-5 mr-5 makePost">
                <div class="d-flex justify-content-center">
                    <h1>Crear un post</h1>
                </div>
                <div class="d-flex">

                    <div class="col-2 col-lg-1 mt-3 mr-3 mb-3 fotoPost" style="min-width: 90px; min-height: 90px; max-width: 90px; max-height: 90px; margin-left: 50px"></div>
                    <div class="ml-4 mt-2">

                        <div class="custom-file" style="width: 450px">
                            <input type="file" class="custom-file-input" id="customFileLang">
                            <label class="custom-file-label" for="customFileLang">Choose file</label>
                        </div>
                        <div class="d-flex">
                            <div class=" mt-3 mb-3" style="width: 450px;">
                                <textarea type="tex" class="form-control writeComment" id="postMessage" name="postMessage" placeholder="Escribir un comentario aqui..." rows="3"></textarea>
                            </div>
                            <div class="col-1 pl-2 ml-2" style="margin-top: 25px">
                                <img class="sendButton" src="/assets/icons/send.svg" width="50" height="50" alt="" style="cursor: pointer" onclick="setMessage()">
                            </div>
                        </div>

                    </div>

                </div>
            </div>
            <div class="mt-2 ml-5 mr-5 postContainer">
                <div class="row">
                    <div class="d-flex align-items-center">
                        <div class="col-2 col-lg-1 mr-4 fotoPost" style="min-width: 130px; min-height: 130px; max-width: 130px; max-height: 130px; margin-left: 50px;">
                        </div>
                    </div>
                    <div class="col-6 col-lg-8 mt-4 mr-4 ml-4 mb-1">
                        <h2>Las obejas</h2>
                        <div class=" mr-2">
                            <div class="container-audio">
                                <audio controls>
                                    <source src="assets/music/allstar.mp3" type="audio/ogg">
                                    Your browser dose not Support the audio Tag
                                </audio>
                            </div>
                        </div>
                        <div class="postContent">
                            <div class="row">
                                <div class="col-12 m-1 ml-2">
                                    <h5>Hello, we made a new song. Check it out! Lorem Ip Eaasd</h5>
                                </div>


                            </div>


                        </div>

                        <div class="d-flex justify-content-end mt-2">
                            <img class="rounded-circle mr-3 interaction" id="like" style="display: block" width="40px" height="40px" src="assets/icons/unfilledFav.svg" onclick="onLike('like')" />
                            <img class="rounded-circle mr-3 interaction" id="liked" style="display: none" id="like" width="40px" height="40px" src="assets/icons/fav.svg" onclick="onLike('like')" />

                            <img class="rounded-circle mr-2 interaction" id="closedChat" style="display: block" width="40px" height="40px" src="assets/icons/chat.svg" onclick="onChat('closedChat')" />
                            <img class="rounded-circle mr-2 interaction" id="openedChat" style="display: none" width="40px" height="40px" src="assets/icons/chatfilled.svg" onclick="onChat('closedChat')" />
                        </div>
                    </div>
                </div>
                <div id="comment1" class="postComment" style="max-width: 810px">
                    <div class="row">
                        <div class="col-2 col-lg-1 mt-2 ml-3 mr-3 mb-3  fotoPost" style="min-width: 100px; min-height: 100px; margin-left: 50px!important;">
                        </div>
                        <div class="col-6 col-lg-8 mt-1 mr-4 ml-4 mb-1">
                            <h2>Ignacio Perez</h2>
                            <div class="postCommentContent">
                                <div class="m-1 ml-2">
                                    <h5>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore </h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="comment2" class="postComment" style="max-width: 810px">
                    <div class="row">
                        <div class="col-2 col-lg-1 mt-2 ml-3 mr-3 mb-3 fotoPost" style="min-width: 100px; min-height: 100px; margin-left: 50px!important;">
                        </div>
                        <div class="col-6 col-lg-8 mt-1 mr-4 ml-4 mb-1">
                            <h2>Gabierl Perez</h2>
                            <div class="postCommentContent">
                                <div class="m-1 ml-2">
                                    <h5>adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore </h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="profileComment">
                    <div class="row">
                        <div class="col-2 col-lg-3 mt-2  mb-2 fotoPost" style="min-width: 70px; min-height: 70px; max-width: 70px; max-height: 70px; margin-left: 60px!important;">
                        </div>
                        <div class="col-7 col-lg-8 mt-2 mb-2 ml-2">
                            <textarea type="tex" class="form-control writeComment" id="createMessage" name="createMessage" placeholder="Escribir un comentario aqui..." rows="3"></textarea>
                        </div>
                        <div class="col-1 pl-1 mt-3">
                            <img class="sendButton" src="/assets/icons/send.svg" width="50" height="50" alt="" style="cursor: pointer" onclick="setMessage()">
                        </div>
                    </div>
                </div>
            </div>
            <div class="mt-2 ml-5 mr-5 postContainer">
                <div class="row">
                    <div class="d-flex align-items-center">
                        <div class="col-2 col-lg-1 mr-4 fotoPost" style="min-width: 130px; min-height: 130px; max-width: 130px; max-height: 130px; margin-left: 50px;">
                        </div>
                    </div>
                    <div class="col-6 col-lg-8 mt-4 mr-4 ml-4 mb-1">
                        <h2>Las obejas</h2>
                        <div class=" mr-2">
                            <div class="container-audio">
                                <audio controls>
                                    <source src="assets/music/allstar.mp3" type="audio/ogg">
                                    Your browser dose not Support the audio Tag
                                </audio>
                            </div>
                        </div>
                        <div class="postContent">
                            <div class="row">
                                <div class="col-12 m-1 ml-2">
                                    <h5>Hello, we made a new song. Check it out! Lorem Ip Eaasd</h5>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex justify-content-end mt-2">
                            <img class="rounded-circle mr-3 interaction" id="like2" style="display: block" width="40px" height="40px" src="assets/icons/unfilledFav.svg" onclick="onLike('like2')" />
                            <img class="rounded-circle mr-3 interaction" id="like2d" style="display: none" id="like" width="40px" height="40px" src="assets/icons/fav.svg" onclick="onLike('like2')" />

                            <img class="rounded-circle mr-2 interaction" id="closedChat2" style="display: block" width="40px" height="40px" src="assets/icons/chat.svg" onclick="onChat('closedChat2')" />
                            <img class="rounded-circle mr-2 interaction" id="openedChat2" style="display: none" width="40px" height="40px" src="assets/icons/chatfilled.svg" onclick="onChat('closedChat2')" />
                        </div>
                    </div>
                </div>
                <div id="comment12" class="postComment" style="max-width: 810px">
                    <div class="row">
                        <div class="col-2 col-lg-1 mt-2 ml-3 mr-3 mb-3  fotoPost" style="min-width: 100px; min-height: 100px; margin-left: 50px!important;">
                        </div>
                        <div class="col-6 col-lg-8 mt-1 mr-4 ml-4 mb-1">
                            <h2>Ignacio Perez</h2>
                            <div class="postCommentContent">
                                <div class="m-1 ml-2">
                                    <h5>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore </h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="comment22" class="postComment" style="max-width: 810px">
                    <div class="row">
                        <div class="col-2 col-lg-1 mt-2 ml-3 mr-3 mb-3 fotoPost" style="min-width: 100px; min-height: 100px; margin-left: 50px!important;">
                        </div>
                        <div class="col-6 col-lg-8 mt-1 mr-4 ml-4 mb-1">
                            <h2>Gabierl Perez</h2>
                            <div class="postCommentContent">
                                <div class="m-1 ml-2">
                                    <h5>adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore </h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="profileComment">
                    <div class="row">
                        <div class="col-2 col-lg-3 mt-2  mb-2 fotoPost" style="min-width: 70px; min-height: 70px; max-width: 70px; max-height: 70px; margin-left: 60px!important;">
                        </div>
                        <div class="col-7 col-lg-8 mt-2 mb-2 ml-2">
                            <textarea type="tex" class="form-control writeComment" id="createMessage" name="createMessage" placeholder="Escribir un comentario aqui..." rows="3"></textarea>
                        </div>
                        <div class="col-1 pl-1 mt-3">
                            <img class="sendButton" src="/assets/icons/send.svg" width="50" height="50" alt="" style="cursor: pointer" onclick="setMessage()">
                        </div>
                    </div>
                </div>
            </div>
            <div class="mt-4 ml-5 mr-5 postContainer">
                <div class="row">
                    <div class="d-flex align-items-center">
                        <div class="col-2 col-lg-1 mr-4 fotoPost" style="min-width: 130px; min-height: 130px; max-width: 130px; max-height: 130px; margin-left: 50px;">
                        </div>
                    </div>
                    <div class="col-6 col-lg-8 mt-4 mr-4 ml-4 mb-1">
                        <h2>Las obejas</h2>
                        <div class="mr-2">
                            <div class="container-audio">
                                <audio controls>
                                    <source src="assets/music/allstar.mp3" type="audio/ogg">
                                    Your browser dose not Support the audio Tag
                                </audio>
                            </div>
                        </div>
                        <div class="postContent">
                            <div class="row">
                                <div class="col-12 m-1 ml-2">
                                    <h5>Hello, we made a new song. Check it out! Lorem Ip Eaasd</h5>
                                </div>


                            </div>

                        </div>
                        <div class="d-flex justify-content-end mt-2">
                            <img class="rounded-circle mr-3 interaction" id="like3" style="display: block" width="40px" height="40px" src="assets/icons/unfilledFav.svg" onclick="onLike('like3')" />
                            <img class="rounded-circle mr-3 interaction" id="like3d" style="display: none" width="40px" height="40px" src="assets/icons/fav.svg" onclick="onLike('like3')" />

                            <img class="rounded-circle mr-2 interaction" id="closedChat3" style="display: block" width="40px" height="40px" src="assets/icons/chat.svg" onclick="onChat('closedChat3')" />
                            <img class="rounded-circle mr-2 interaction" id="openedChat3" style="display: none" width="40px" height="40px" src="assets/icons/chatfilled.svg" onclick="onChat('closedChat3')" />
                        </div>
                    </div>
                </div>
                <div id="comment13" class="postComment" style="max-width: 810px">
                    <div class="row">
                        <div class="col-2 col-lg-1 mt-2 ml-3 mr-3 mb-3  fotoPost" style="min-width: 100px; min-height: 100px; margin-left: 50px!important;">
                        </div>
                        <div class="col-6 col-lg-8 mt-1 mr-4 ml-4 mb-1">
                            <h2>Raul Perez</h2>
                            <div class="postCommentContent">
                                <div class="m-1 ml-2">
                                    <h5>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore </h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="comment23" class="postComment" style="max-width: 810px">
                    <div class="row">
                        <div class="col-2 col-lg-1 mt-2 ml-3 mr-3 mb-3 fotoPost" style="min-width: 100px; min-height: 100px; margin-left: 50px!important;">
                        </div>
                        <div class="col-6 col-lg-8 mt-1 mr-4 ml-4 mb-1">
                            <h2>Federico Perez</h2>
                            <div class="postCommentContent">
                                <div class="m-1 ml-2">
                                    <h5>adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore </h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="profileComment">
                    <div class="row">
                        <div class="col-2 col-lg-3 mt-2  mb-2 fotoPost" style="min-width: 70px; min-height: 70px; max-width: 70px; max-height: 70px; margin-left: 60px!important;">
                        </div>
                        <div class="col-7 col-lg-8 mt-2 mb-2 ml-2">
                            <textarea type="tex" class="form-control writeComment" id="createMessage" name="createMessage" placeholder="Escribir un comentario aqui..." rows="3"></textarea>
                        </div>
                        <div class="col-1 pl-1 mt-3">
                            <img class="sendButton" src="/assets/icons/send.svg" width="50" height="50" alt="" style="cursor: pointer" onclick="setMessage()">
                        </div>
                    </div>
                </div>
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
        })

        function estadoInfo(estado) {
            if (estado == 'editar') {
                $("#textoInfoGeneral").hide();
                $("#comentario").hide();
                $("#infoGeneralEditar").show();
                $("#editarComentario").show();
                $("#editPhoto").show();

                $("#botonEditar").hide();
                $("#botonGuardar").show();
            } else {
                $("#textoInfoGeneral").show();
                $("#comentario").show();
                $("#infoGeneralEditar").hide();
                $("#editarComentario").hide();
                $("#editPhoto").hide();

                $("#botonEditar").show();
                $("#botonGuardar").hide();
            }

        }
    </script>
</asp:Content>
