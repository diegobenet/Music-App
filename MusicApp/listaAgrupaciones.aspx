<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="listaAgrupaciones.aspx.cs" Inherits="MusicApp.listaAgrupaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Lista de Agrupaciones</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="css" runat="server">
    <style>
        .line-break {
            width: 100%;
        }

        .tarjetaAgrupacion {
            cursor: pointer;
        }

            .tarjetaAgrupacion:hover {
                box-shadow: 0 1px 3px rgba(0,0,0,0.50), 0 1px 2px rgba(0,0,0,0.50);
            }

        a.customCard {
            color: black;
        }

            a.customCard:hover {
                text-decoration: none;
            }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-12 mt-3">
        <div class="d-flex justify-content-end p-3 pr-5 mr-5">
            <a class="btn primary-button ml-4" style="width: 140px; height: 35px;" href="/FormularioAgrupaciones">Crear Agrupacion</a>
        </div>
    </div>
    <div class="col-12">
        <div class="d-flex justify-content-center">
            <div class="d-flex align-items-center " style="width: 1300px; height: 60px; border: 1px solid; border-radius: 15px">
                <img class="ml-3" src="/assets/icons/filter.svg" width="45" height="45" alt="">
                <div class="d-flex justify-content-around" style="width: 600px">
                    <select class="form-select form-select-lg selec" aria-label="Default select example" id="genero" name="genero">
                        <option selected>Ciudad</option>
                        <option value="1">Masculino</option>
                        <option value="2">Femenino</option>
                    </select>
                    <select class="form-select form-select-lg selec" aria-label="Default select example" id="genero" name="genero">
                        <option selected>Genero musical</option>
                        <option value="1">Masculino</option>
                        <option value="2">Femenino</option>
                    </select>
                    <select class="form-select form-select-lg selec" aria-label="Default select example" id="genero" name="genero">
                        <option selected>En busqueda de integrante</option>
                        <option value="1">Si</option>
                        <option value="2">No</option>
                    </select>
                </div>
            </div>

        </div>
        <div class="d-flex justify-content-center" style="flex-wrap: wrap;">
            <div class="d-flex justify-content-start ml-5" style="width: 1300px; flex-wrap: wrap">
                <a href="/perfilAgrupacion" class="customCard">
                    <div class="d-flex justify-content-between tarjetaAgrupacion mt-2 mb-2 mr-4" style="width: 620px; height: 120px; border: 1px solid;">
                        <div class="d-flex justify-content-start">
                            <div class="mr-4 fotoPost" style="min-width: 110px; min-height: 110px; max-width: 110px; max-height: 110px; margin-left: 20px; margin-top: 5px">
                            </div>
                            <div class="mt-2">
                                <h3 style="margin-bottom: 1px;">Las Obejas</h3>
                                <h3 style="margin-bottom: 32px">Rock</h3>
                                <h3>Monterrey</h3>
                            </div>
                        </div>
                        <div class="mt-2">
                            <div class="mr-4">
                                <h3>12 Miembros</h3>
                                <h3 style="color: #9E49B5"></h3>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="/perfilAgrupacion" class="customCard">
                    <div class="d-flex justify-content-between tarjetaAgrupacion mt-2 mb-2 mr-4" style="width: 620px; height: 120px; border: 1px solid;">
                        <div class="d-flex justify-content-start">
                            <div class="mr-4 fotoPost" style="min-width: 110px; min-height: 110px; max-width: 110px; max-height: 110px; margin-left: 20px; margin-top: 5px">
                            </div>
                            <div class="mt-2">
                                <h3 style="margin-bottom: 1px;">Las Obejas</h3>
                                <h3 style="margin-bottom: 32px">Rock</h3>
                                <h3>Monterrey</h3>
                            </div>
                        </div>
                        <div class="mt-2">
                            <div class="mr-4">
                                <h3>12 Miembros</h3>
                                <h3 style="color: #9E49B5">Busca Integrante</h3>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="/perfilAgrupacion" class="customCard">
                    <div class="d-flex justify-content-between tarjetaAgrupacion mt-2 mb-2 mr-4" style="width: 620px; height: 120px; border: 1px solid;">
                        <div class="d-flex justify-content-start">
                            <div class="mr-4 fotoPost" style="min-width: 110px; min-height: 110px; max-width: 110px; max-height: 110px; margin-left: 20px; margin-top: 5px">
                            </div>
                            <div class="mt-2">
                                <h3 style="margin-bottom: 1px;">Las Obejas</h3>
                                <h3 style="margin-bottom: 32px">Rock</h3>
                                <h3>Monterrey</h3>
                            </div>
                        </div>
                        <div class="mt-2">
                            <div class="mr-4">
                                <h3>12 Miembros</h3>
                                <h3 style="color: #9E49B5"></h3>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="/perfilAgrupacion" class="customCard">
                    <div class="d-flex justify-content-between tarjetaAgrupacion mt-2 mb-2 mr-4" style="width: 620px; height: 120px; border: 1px solid;">
                        <div class="d-flex justify-content-start">
                            <div class="mr-4 fotoPost" style="min-width: 110px; min-height: 110px; max-width: 110px; max-height: 110px; margin-left: 20px; margin-top: 5px">
                            </div>
                            <div class="mt-2">
                                <h3 style="margin-bottom: 1px;">Las Obejas</h3>
                                <h3 style="margin-bottom: 32px">Rock</h3>
                                <h3>Monterrey</h3>
                            </div>
                        </div>
                        <div class="mt-2">
                            <div class="mr-4">
                                <h3>12 Miembros</h3>
                                <h3 style="color: #9E49B5"></h3>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="/perfilAgrupacion" class="customCard">
                    <div class="d-flex justify-content-between tarjetaAgrupacion mt-2 mb-2 mr-4" style="width: 620px; height: 120px; border: 1px solid;">
                        <div class="d-flex justify-content-start">
                            <div class="mr-4 fotoPost" style="min-width: 110px; min-height: 110px; max-width: 110px; max-height: 110px; margin-left: 20px; margin-top: 5px">
                            </div>
                            <div class="mt-2">
                                <h3 style="margin-bottom: 1px;">Las Obejas</h3>
                                <h3 style="margin-bottom: 32px">Rock</h3>
                                <h3>Monterrey</h3>
                            </div>
                        </div>
                        <div class="mt-2">
                            <div class="mr-4">
                                <h3>12 Miembros</h3>
                                <h3 style="color: #9E49B5">Busca Integrante</h3>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="/perfilAgrupacion" class="customCard">
                    <div class="d-flex justify-content-between tarjetaAgrupacion mt-2 mb-2 mr-4" style="width: 620px; height: 120px; border: 1px solid;">
                        <div class="d-flex justify-content-start">
                            <div class="mr-4 fotoPost" style="min-width: 110px; min-height: 110px; max-width: 110px; max-height: 110px; margin-left: 20px; margin-top: 5px">
                            </div>
                            <div class="mt-2">
                                <h3 style="margin-bottom: 1px;">Las Obejas</h3>
                                <h3 style="margin-bottom: 32px">Rock</h3>
                                <h3>Monterrey</h3>
                            </div>
                        </div>
                        <div class="mt-2">
                            <div class="mr-4">
                                <h3>12 Miembros</h3>
                                <h3 style="color: #9E49B5">Busca Integrante</h3>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="/perfilAgrupacion" class="customCard">
                    <div class="d-flex justify-content-between tarjetaAgrupacion mt-2 mb-2 mr-4" style="width: 620px; height: 120px; border: 1px solid;">
                        <div class="d-flex justify-content-start">
                            <div class="mr-4 fotoPost" style="min-width: 110px; min-height: 110px; max-width: 110px; max-height: 110px; margin-left: 20px; margin-top: 5px">
                            </div>
                            <div class="mt-2">
                                <h3 style="margin-bottom: 1px;">Las Obejas</h3>
                                <h3 style="margin-bottom: 32px">Rock</h3>
                                <h3>Monterrey</h3>
                            </div>
                        </div>
                        <div class="mt-2">
                            <div class="mr-4">
                                <h3>12 Miembros</h3>
                                <h3 style="color: #9E49B5"></h3>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="/perfilAgrupacion" class="customCard">
                    <div class="d-flex justify-content-between tarjetaAgrupacion mt-2 mb-2 mr-4" style="width: 620px; height: 120px; border: 1px solid;">
                        <div class="d-flex justify-content-start">
                            <div class="mr-4 fotoPost" style="min-width: 110px; min-height: 110px; max-width: 110px; max-height: 110px; margin-left: 20px; margin-top: 5px">
                            </div>
                            <div class="mt-2">
                                <h3 style="margin-bottom: 1px;">Las Obejas</h3>
                                <h3 style="margin-bottom: 32px">Rock</h3>
                                <h3>Monterrey</h3>
                            </div>
                        </div>
                        <div class="mt-2">
                            <div class="mr-4">
                                <h3>12 Miembros</h3>
                                <h3 style="color: #9E49B5"></h3>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="/perfilAgrupacion" class="customCard">
                    <div class="d-flex justify-content-between tarjetaAgrupacion mt-2 mb-2 mr-4" style="width: 620px; height: 120px; border: 1px solid;">
                        <div class="d-flex justify-content-start">
                            <div class="mr-4 fotoPost" style="min-width: 110px; min-height: 110px; max-width: 110px; max-height: 110px; margin-left: 20px; margin-top: 5px">
                            </div>
                            <div class="mt-2">
                                <h3 style="margin-bottom: 1px;">Las Obejas</h3>
                                <h3 style="margin-bottom: 32px">Rock</h3>
                                <h3>Monterrey</h3>
                            </div>
                        </div>
                        <div class="mt-2">
                            <div class="mr-4">
                                <h3>12 Miembros</h3>
                                <h3 style="color: #9E49B5">Busca Integrante</h3>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <script>

</script>
</asp:Content>
