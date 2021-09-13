<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="MusicApp.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Principal</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="css" runat="server">
    <style>
        .lista {
            position: sticky;
        }



        .mainContainer {
            max-width: 70%;
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

        .sendButton:hover {
            width: 54px;
            height: 54px;
            margin-bottom: 3px !important;
        }

        .cont {
            padding-left: 35px;
            padding-right: 35px;
        }


        @media (max-width: 1531px) {
            .lista {
                display: none;
            }

            .mainContainer {
                max-width: 100%;
            }

            h5 {
                font-size: 12px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-3 lista cont mt-3">
        <div class="p-3 pr-5">
            <h2 style="text-align: center;">Usuarios que sigues</h2>
            <table class="table">
                <tbody>
                    <tr>
                        <td>
                            <div class="fotoPost" style="width: 40px; height: 40px;"></div>
                        </td>
                        <td class="pt-3" style="font-size: 18px"><a href="#">Jacob Thornton</a></td>
                    </tr>
                    <tr>
                        <td>
                            <div class="fotoPost" style="width: 40px; height: 40px;"></div>
                        </td>
                        <td class="pt-3" style="font-size: 18px"><a href="#">Jacob Thornton</a></td>
                    </tr>
                    <tr>
                        <td>
                            <div class="fotoPost" style="width: 40px; height: 40px;"></div>
                        </td>
                        <td class="pt-3" style="font-size: 18px"><a href="#">Jacob Thornton</a></td>
                    </tr>
                    <tr>
                        <td>
                            <div class="fotoPost" style="width: 40px; height: 40px;"></div>
                        </td>
                        <td class="pt-3" style="font-size: 18px"><a href="#">Jacob Thornton</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="p-3 pr-5">
            <h2 style="text-align: center;">Agrupaciones que sigues</h2>
            <table class="table">
                <tbody>
                    <tr>
                        <td>
                            <div class="fotoPost" style="width: 40px; height: 40px;"></div>
                        </td>
                        <td class="pt-3" style="font-size: 18px"><a href="#">Las obejas</a></td>
                    </tr>
                    <tr>
                        <td>
                            <div class="fotoPost" style="width: 40px; height: 40px;"></div>
                        </td>
                        <td class="pt-3" style="font-size: 18px"><a href="#">Las obejas</a></td>
                    </tr>
                    <tr>
                        <td>
                            <div class="fotoPost" style="width: 40px; height: 40px;"></div>
                        </td>
                        <td class="pt-3" style="font-size: 18px"><a href="#">Las obejas</a></td>
                    </tr>
                    <tr>
                        <td>
                            <div class="fotoPost" style="width: 40px; height: 40px;"></div>
                        </td>
                        <td class="pt-3" style="font-size: 18px"><a href="#">Las obejas</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="col-12 mainContainer">
        <div class="mt-4 ml-5 mr-5 postContainer" >
            <div class="row">
                <div class="d-flex align-items-center">
                    <div class="col-2 col-lg-1 mr-4 fotoPost" style="min-width: 130px; min-height: 130px; max-width: 130px; max-height: 130px; margin-left: 50px; ">
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
                            <div class="col-12 m-1 ml-2" ">
                                <h5>Hello, we made a new song. Check it out! Lorem Ip Eaasd</h5>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex justify-content-end mt-2">
                        <img class="rounded-circle mr-3 interaction" id="like" style="display: block" width="40px" height="40px" src="assets/icons/unfilledFav.svg" onclick="onLike('like')" />
                        <img class="rounded-circle mr-3 interaction" id="liked" style="display: none" id="like" width="40px" height="40px" src="assets/icons/fav.svg" onclick="onLike('like')" />

                        <img class="rounded-circle mr-2 interaction" id="closedChat" style="display: block" width="40px" height="40px" src="assets/icons/chat.svg" onclick="onChat('closedChat')" />
                        <img class="rounded-circle mr-2 interaction" id="openedChat" style="display: none; " width="40px" height="40px" src="assets/icons/chatfilled.svg" onclick="onChat('closedChat')" />
                    </div>
                </div>
            </div>
            <div id="comment1" class="postComment">
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
            <div id="comment2" class="postComment">
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
                        <img class="sendButton" src="/assets/icons/send.svg" width="50" height="50" alt="" style="cursor:pointer" onclick="setMessage()">
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
                <div id="comment12" class="postComment" >
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
                <div id="comment22" class="postComment" >
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
                    <div class="col-2 col-lg-1 mr-4 fotoPost" style="min-width: 130px; min-height: 130px; max-width: 130px; max-height: 130px; margin-left: 50px; ">
                    </div>
                </div>
                <div class="col-6 col-lg-8 mt-4 mr-4 ml-4 mb-1">
                    <h2>Las obejas</h2>
                    <div class="mr-2">
                                    <div class="container-audio">
                                        <audio controls >
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
            <div id="comment13" class="postComment">
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
            <div id="comment23" class="postComment">
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
                        <img class="sendButton" src="/assets/icons/send.svg" width="50" height="50" alt="" style="cursor:pointer" onclick="setMessage()">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <script>

</script>
</asp:Content>
