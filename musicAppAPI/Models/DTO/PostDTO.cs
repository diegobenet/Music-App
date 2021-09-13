using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace musicAppAPI.Models.DTO
{
    public class PostDTO
    {
        public PostDTO()
        {
            this.Comentario = new HashSet<Comentario>();
            this.Like = new HashSet<Like>();
        }
        public int Id_post { get; set; }
        public int? Id_usuario { get; set; }
        public int? Id_agrupacion { get; set; }
        public string Archivo_mp3 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Comentario> Comentario { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Like> Like { get; set; }
        public string Mensaje { get; set; }
        public string Creador { get; set; }
        public System.DateTime Fecha_creacion { get; set; }
    }
}