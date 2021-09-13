using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace musicAppAPI.Models.DTO
{
    public class ComentarioDTO
    {
        public int Id_comentario { get; set; }
        public string Comentario1 { get; set; }
        public DateTime? Fecha { get; set; }
        public int? Id_post { get; set; }
        public int? Id_usuario { get; set; }
    }
}