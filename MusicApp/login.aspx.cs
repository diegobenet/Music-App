using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Newtonsoft.Json;
using MusicApp.model;
using System.Text;
using System.Security.Cryptography;
using System.Text.RegularExpressions;

namespace MusicApp
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod(EnableSession = true)]
        public static string iniciarSesion(string usuario, string contrasenia)
        {
            usuario oUsuario;

            try
            {
                WebRequest oRequest = WebRequest.Create("https://localhost:44342/api/Usuarios?usr=" + usuario);
                WebResponse oResponse = oRequest.GetResponse();
                StreamReader sr = new StreamReader(oResponse.GetResponseStream());
                string respuesta = sr.ReadToEnd().Trim();

                oUsuario = JsonConvert.DeserializeObject<usuario>(respuesta);
                string contra = encriptar(contrasenia);

                if (contra != oUsuario.Contraseña) return "Usuario o contraseña incorrecta";
            }
            catch (Exception e)
            {
                return "Usuario o contraseña incorrecta";
            }

            string token = Convert.ToBase64String(Guid.NewGuid().ToByteArray());
            token = Regex.Replace(token, @"\+", "");
            
            DateTime date = DateTime.Now;
            int exp = 1;

            token oT = new token() { Nombre = token, Fecha = date, Expiracion = exp, Id_usuario = oUsuario.Id_usuario };
            try
            {
                string result = "";
                WebRequest oRequest = WebRequest.Create("https://localhost:44342/api/Tokens");
                oRequest.Method = "POST";
                oRequest.ContentType = "application/json;charset-UTF-8";

                using (var oSW = new StreamWriter(oRequest.GetRequestStream()))
                {
                    string json = JsonConvert.SerializeObject(oT, Formatting.Indented);

                    oSW.Write(json);
                    oSW.Flush();
                    oSW.Close();
                }

                WebResponse oResponse = oRequest.GetResponse();
                using (var osR = new StreamReader(oResponse.GetResponseStream()))
                    result = osR.ReadToEnd().Trim();
            }
            catch (Exception e)
            {
                return "error "+e;
            }

            return ""+token+" "+oT.Id_usuario;
        }

        public static string encriptar(string contrasenia)
        {
            string hash = "a123";
            string contra;

            byte[] data = UTF8Encoding.UTF8.GetBytes(contrasenia);
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                byte[] keys = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(hash));
                using (TripleDESCryptoServiceProvider tripleDes = new TripleDESCryptoServiceProvider() { Key = keys, Mode = CipherMode.ECB, Padding = PaddingMode.PKCS7 })
                {
                    ICryptoTransform transform = tripleDes.CreateEncryptor();
                    byte[] results = transform.TransformFinalBlock(data, 0, data.Length);
                    contra = Convert.ToBase64String(results);
                    return contra;
                }
            }
        }
    }
}