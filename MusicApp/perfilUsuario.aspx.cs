using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using MusicApp.model;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using MusicApp.model;
using CloudinaryDotNet;
using CloudinaryDotNet.Actions;
using System.Diagnostics;

namespace MusicApp
{
    public partial class PerfilUsuario : System.Web.UI.Page
    {
        public static usuario Usuario { get; set; }
        public static usuario UsuarioActivo { get; set; }
        public static userPost Post { get; set; }
        public static List<like> listaLike { get; set; }
        public static List<usuario> listaUsuarios { get; set; }
        public static List<comment> Comentarios { get; set; }
        public static List<userPost> listaPosts { get; set; }
        public static List<follow> listaFollows { get; set; }
        public static Cloudinary cloudinary { get; set; }
        public const string CLOUD_NAME = "musicapp123";
        public const string API_KEY = "842677593932239";
        public const string API_SECRET = "rVOaHekNwcIMY_paXQ-J-pMofFc";

        protected void Page_Load(object sender, EventArgs e)
        {
            var Id_usuario = Request.QueryString["Usuario"];

            try
            {
                WebRequest oRequest = WebRequest.Create("https://localhost:44342/api/Usuarios/" + Id_usuario);
                WebResponse oResponse = oRequest.GetResponse();
                StreamReader sr = new StreamReader(oResponse.GetResponseStream());
                string respuesta = sr.ReadToEnd().Trim();

                Usuario = JsonConvert.DeserializeObject<usuario>(respuesta);
            }
            catch (Exception)
            {
            }

            try
            {
                WebRequest oRequest = WebRequest.Create("https://localhost:44342/api/Posts?user=" + Id_usuario);
                WebResponse oResponse = oRequest.GetResponse();
                StreamReader sr = new StreamReader(oResponse.GetResponseStream());
                string respuesta = sr.ReadToEnd().Trim();

                listaPosts = JsonConvert.DeserializeObject<List<userPost>>(respuesta).OrderByDescending(x => x.Fecha_creacion).ToList();
            }
            catch (Exception)
            {
            }

            try
            {
                WebRequest oRequest = WebRequest.Create("https://localhost:44342/api/Comentarios");
                WebResponse oResponse = oRequest.GetResponse();
                StreamReader sr = new StreamReader(oResponse.GetResponseStream());
                string respuesta = sr.ReadToEnd().Trim();

                Comentarios = JsonConvert.DeserializeObject<List<comment>>(respuesta).OrderBy(x => x.Fecha).ToList();
            }
            catch (Exception)
            {
            }

            try
            {
                WebRequest oRequest = WebRequest.Create("https://localhost:44342/api/Likes/");
                WebResponse oResponse = oRequest.GetResponse();
                StreamReader sr = new StreamReader(oResponse.GetResponseStream());
                string respuesta = sr.ReadToEnd().Trim();

                listaLike = JsonConvert.DeserializeObject < List<like> >(respuesta);
            }
            catch (Exception)
            {
            }

            try
            {
                WebRequest oRequest = WebRequest.Create("https://localhost:44342/api/Follows/");
                WebResponse oResponse = oRequest.GetResponse();
                StreamReader sr = new StreamReader(oResponse.GetResponseStream());
                string respuesta = sr.ReadToEnd().Trim();

                listaFollows = JsonConvert.DeserializeObject<List<follow>>(respuesta);
            }
            catch (Exception)
            {
            }

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

            var fechaNac = Convert.ToDateTime(Usuario.Fecha_nac);
            var today = DateTime.Today;
            var edad = today.Year - fechaNac.Year;
            Usuario.edad = edad;
        }

        [WebMethod(EnableSession = true)]
        public static string getActiveUser(int Id_usuario)
        {
            try
            {
                WebRequest oRequest = WebRequest.Create("https://localhost:44342/api/Usuarios/" + Id_usuario);
                WebResponse oResponse = oRequest.GetResponse();
                StreamReader sr = new StreamReader(oResponse.GetResponseStream());
                string respuesta = sr.ReadToEnd().Trim();

                UsuarioActivo = JsonConvert.DeserializeObject<usuario>(respuesta);
            }
            catch (Exception)
            {
            }


            return ""+UsuarioActivo.Foto_perfil;
        }

        [WebMethod(EnableSession = true)]
        public static string updateUser(int Id_usuario, string Email, string Ciudad, string Instrumentos_fav, string Genero_musical, string Es_cantante, string Estado_en_banda_concierto, string Desc_personal, string Foto_perfil)
        {
            var url = setPhoto(Foto_perfil).ToString();
            usuario oU = new usuario() { Id_usuario = Id_usuario, Email = Email, Ciudad = Ciudad, Instrumentos_fav = Instrumentos_fav, Genero_musical_fav = Genero_musical, Es_cantante = Es_cantante, Estado_en_banda_concierto = Estado_en_banda_concierto, Desc_personal = Desc_personal, Foto_perfil = url };

            string result = "";
            WebRequest oRequest = WebRequest.Create("https://localhost:44342/api/Usuarios/" + Id_usuario);
            oRequest.Method = "PUT";
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
                return "Errorrrrrrrrrrrrrrrr";
            }


            return "OK";
        }

        public static string setPhoto(string imgName)
        {
            var imgPath = "C:\\Users\\Diego\\Downloads\\" + imgName;
            Account account = new Account(CLOUD_NAME, API_KEY, API_SECRET);
            cloudinary = new Cloudinary(account);
            var url = "";
            try
            {
                var uploadParams = new ImageUploadParams()
                {
                    File = new FileDescription(imgPath)

                };
                var uploadResult = cloudinary.Upload(uploadParams);
                url = uploadResult.SecureUrl.ToString();
            }
            catch (Exception e)
            {
                if (String.IsNullOrEmpty(Usuario.Foto_perfil))
                    return "https://res.cloudinary.com/musicapp123/image/upload/v1626981339/hbzfndyrfyyds6a9li7y.jpg";
                else
                    return Usuario.Foto_perfil;
            }


            return "" + url;
        }

        [WebMethod(EnableSession = true)]
        public static string registerPost(int Id_usuario, string Mensaje, string Archivo_mp3)
        {
            DateTime today = DateTime.Now;
            var url = "";
            if(string.IsNullOrEmpty(Archivo_mp3))
            {
                url = null;
            } else { url = setAudio(Archivo_mp3).ToString();  }

            userPost oUP = new userPost() { Id_usuario = Id_usuario, Mensaje = Mensaje, Archivo_mp3 = url, Fecha_creacion = today };

            string result = "";
            WebRequest oRequest = WebRequest.Create("https://localhost:44342/api/Posts/");
            oRequest.Method = "POST";
            oRequest.ContentType = "application/json;charset-UTF-8";

            using (var oSW = new StreamWriter(oRequest.GetRequestStream()))
            {
                string json = JsonConvert.SerializeObject(oUP, Formatting.Indented);

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
                return "Errorrrrrrrrrrrrrrrr";
            }


            return "OK";
        }

        [WebMethod(EnableSession = true)]
        public static string registerComment(int Id_post, int Id_usuario, string Comentario1)
        {
            DateTime today = DateTime.Now;
            comment oComment = new comment() { Id_post = Id_post, Id_usuario = Id_usuario, Comentario1 = Comentario1, Fecha = today };

            string result = "";
            WebRequest oRequest = WebRequest.Create("https://localhost:44342/api/Comentarios/");
            oRequest.Method = "POST";
            oRequest.ContentType = "application/json;charset-UTF-8";

            using (var oSW = new StreamWriter(oRequest.GetRequestStream()))
            {
                string json = JsonConvert.SerializeObject(oComment, Formatting.Indented);

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
                return "Errorrrrrrrrrrrrrrrr";
            }


            return "OK";
        }

        [WebMethod(EnableSession = true)]
        public static string registerLike(int Id_post, int Id_usuario)
        {
            like oLike = new like() { Id_post = Id_post, Id_usuario = Id_usuario };

            string result = "";
            WebRequest oRequest = WebRequest.Create("https://localhost:44342/api/Likes/");
            oRequest.Method = "POST";
            oRequest.ContentType = "application/json;charset-UTF-8";

            using (var oSW = new StreamWriter(oRequest.GetRequestStream()))
            {
                string json = JsonConvert.SerializeObject(oLike, Formatting.Indented);

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
                return "Errorrrrrrrrrrrrrrrr";
            }


            return "OK";
        }

        [WebMethod(EnableSession = true)]
        public static string deleteLike(int Id_post, int Id_usuario)
        {
            string result = "";
            WebRequest oRequest = WebRequest.Create("https://localhost:44342/api/Likes?id_usuario="+Id_usuario+"&id_post="+Id_post);
            oRequest.Method = "DELETE";
            oRequest.ContentType = "application/json;charset-UTF-8";
            
            try
            {
                WebResponse oResponse = oRequest.GetResponse();
                using (var osR = new StreamReader(oResponse.GetResponseStream()))
                    result = osR.ReadToEnd().Trim();
            }
            catch (Exception e)
            {
                return "Errorrrrrrrrrrrrrrrr";
            }

            return "OK";
        }

        [WebMethod(EnableSession = true)]
        public static string follow(int Id_follower)
        {
            follow oFollow = new follow() { Id_follower = Id_follower, Id_following = Usuario.Id_usuario };

            string result = "";
            WebRequest oRequest = WebRequest.Create("https://localhost:44342/api/Follows/");
            oRequest.Method = "POST";
            oRequest.ContentType = "application/json;charset-UTF-8";

            using (var oSW = new StreamWriter(oRequest.GetRequestStream()))
            {
                string json = JsonConvert.SerializeObject(oFollow, Formatting.Indented);

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
                return "Errorrrrrrrrrrrrrrrr";
            }


            return "OK";
        }

        [WebMethod(EnableSession = true)]
        public static string unFollow(int Id_follower)
        {

            string result = "";
            WebRequest oRequest = WebRequest.Create("https://localhost:44342/api/Follows?id_follower=" + Id_follower + "&id_following=" + Usuario.Id_usuario);
            oRequest.Method = "DELETE";
            oRequest.ContentType = "application/json;charset-UTF-8";

            try
            {
                WebResponse oResponse = oRequest.GetResponse();
                using (var osR = new StreamReader(oResponse.GetResponseStream()))
                    result = osR.ReadToEnd().Trim();
            }
            catch (Exception e)
            {
                return "Errorrrrrrrrrrrrrrrr";
            }

            return "OK";
        }

        public static string setAudio(string mp3Name)
        {
            var Path = "C:\\Users\\Diego\\Downloads\\" + mp3Name;
            Account account = new Account(CLOUD_NAME, API_KEY, API_SECRET);
            cloudinary = new Cloudinary(account);
            var url = "";
            try
            {
                var uploadParams = new VideoUploadParams()
                {
                    File = new FileDescription(Path)

                };
                var uploadResult = cloudinary.Upload(uploadParams);
                url = uploadResult.SecureUrl.ToString();
            }
            catch (Exception e)
            {
                return null;
                if (String.IsNullOrEmpty(Post.Archivo_mp3))
                    return "https://res.cloudinary.com/musicapp123/image/upload/v1626981339/hbzfndyrfyyds6a9li7y.jpg";
                else
                    return Usuario.Foto_perfil;
            }


            return "" + url;
        }
    }
}