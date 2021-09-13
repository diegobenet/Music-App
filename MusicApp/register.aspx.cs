using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using Newtonsoft.Json;
using MusicApp.model;
using System.Text;
using System.Security.Cryptography;

namespace MusicApp
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod(EnableSession = true)]
        public static string crearUsuario(string email, string nombre, string apellido, string contrasenia, string verifContra, string fechaNac, string ciudad, string genero)
        {
            if (contrasenia != verifContra) return "Contraseñas deben coincidir";

            string contra = encriptar(contrasenia);
            string vContra = encriptar(verifContra);

            usuario oU = new usuario() { Email = email , Nombre = nombre, Apellidos = apellido, Contraseña = contra, verifContra = vContra, Fecha_nac = fechaNac, Ciudad = ciudad, Genero = genero, Foto_perfil = "https://res.cloudinary.com/musicapp123/image/upload/v1626981339/hbzfndyrfyyds6a9li7y.jpg" };

            string result = "";
            WebRequest oRequest = WebRequest.Create("https://localhost:44342/api/Usuarios");
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
            } catch (Exception e)
            {
                return "Error de servidor" ;
            }
            
            
            return "OK";
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