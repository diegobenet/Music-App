using MusicApp.model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MusicApp
{
    public partial class Principal : System.Web.UI.MasterPage
    {
        public string url { get; set; }
        public static List<usuario> listaUsuarios { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            url = HttpContext.Current.Request.Url.AbsoluteUri;

            try
            {
                WebRequest oRequest = WebRequest.Create("https://localhost:44342/api/Usuarios");
                WebResponse oResponse = oRequest.GetResponse();
                StreamReader sr = new StreamReader(oResponse.GetResponseStream());
                string respuesta = sr.ReadToEnd().Trim();

                listaUsuarios = JsonConvert.DeserializeObject<List<usuario>>(respuesta);
            }
            catch (Exception)
            {
            }

        }
        
    }
}