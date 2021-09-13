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
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod(EnableSession = true)]
        public static string validarToken(string token)
        {
            token oToken;

            try
            {
                WebRequest oRequest = WebRequest.Create("https://localhost:44342/api/Tokens?Nombre=" + token);
                WebResponse oResponse = oRequest.GetResponse();
                StreamReader sr = new StreamReader(oResponse.GetResponseStream());
                string respuesta = sr.ReadToEnd().Trim();

                oToken = JsonConvert.DeserializeObject<token>(respuesta);
            }
            catch (Exception e)
            {
                return "Token invalido";
            }
            return "OK";
        }

        [WebMethod(EnableSession = true)]
        public static string getFilter(string filter)
        {
            try
            {
                WebRequest oRequest = WebRequest.Create("https://localhost:44342/api/Usuarios/?filtro=" + filter);
                WebResponse oResponse = oRequest.GetResponse();
                StreamReader sr = new StreamReader(oResponse.GetResponseStream());
                string respuesta = sr.ReadToEnd().Trim();

                return ""+respuesta;
            }
            catch (Exception)
            {
                return "error";
            }
        }
    }
}