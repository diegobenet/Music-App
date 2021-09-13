using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MusicApp.model
{
    public class userPost
    {
        public int Id_post { set; get; }
        public string Mensaje { set; get; }
        public string Archivo_mp3 { set; get; }
        public DateTime Fecha_creacion { set; get; }
        public int Id_usuario { set; get; }
        public string Nombre { set; get; }
        public string Apellido { set; get; }
        public usuario usuario { set; get; }
    }
}