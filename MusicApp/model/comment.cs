using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MusicApp.model
{
    public class comment
    {
        public int Id_comentario { get; set; }
        public string Comentario1 { get; set; }
        public DateTime? Fecha { get; set; }
        public int Id_post { get; set; }
        public int Id_usuario { get; set; }

    }
}