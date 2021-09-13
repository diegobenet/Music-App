using MusicApp.model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusicApp
{
    public partial class FormularioAgrupaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod(EnableSession = true)]
        public static string crearAgrupacion(string nombre, string ciudad, string generoMusical, string fotoPerfil, string[] integrantes)
        {

            agrupacion oU = new agrupacion() { Nombre = nombre, Ciudad = ciudad, Genero_musical = generoMusical, Foto = fotoPerfil };

            string result = "";
            WebRequest oRequest = WebRequest.Create("https://localhost:44342/api/Agrupacions");
            oRequest.Method = "POST";
            oRequest.ContentType = "application/json;charset-UTF-8";

            using (var oSW = new StreamWriter(oRequest.GetRequestStream()))
            {
                string json = JsonConvert.SerializeObject(oU, Formatting.Indented);

                oSW.Write(json);
                oSW.Flush();
                oSW.Close();
            }
            try
            {
                WebResponse oResponse = oRequest.GetResponse();
                using (var osR = new StreamReader(oResponse.GetResponseStream()))
                result = osR.ReadToEnd().Trim();
            }
            catch (Exception e)
            {
                return "Error de servidor";
            }

            registrarIntegrantes(integrantes);

            return "OK";
        }

        public static string registrarIntegrantes(string[] integrantes)
        {
            var agrupacionID = -1;
            try
            {
                WebRequest oRequest = WebRequest.Create("https://localhost:44342/api/LastAgrupacion");
                WebResponse oResponse = oRequest.GetResponse();
                StreamReader sr = new StreamReader(oResponse.GetResponseStream());
                string respuesta = sr.ReadToEnd().Trim();

                agrupacionID = JsonConvert.DeserializeObject<agrupacion>(respuesta).Id_agrupacion;
            }
            catch (Exception)
            {
                return "err";
            }

            for (var i = 0; integrantes.Length > i; i++ )
            {

            }



            return "ok";
        }
    }
}