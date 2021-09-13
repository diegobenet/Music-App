using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MusicApp.model
{
    public class usuario
    {
        public int Id_usuario { set; get; }
        public string Email { set; get; }
        public string Nombre { set; get; }
        public string Apellidos { set; get; }
        public string Contraseña { set; get; }
        public string verifContra { set; get; }
        public string Fecha_nac { set; get; }
        public int edad { set; get; }
        public string Ciudad { set; get; }
        public string Genero { set; get; }
        public string Instrumentos_fav { get; set; }
        public string Genero_musical_fav { get; set; }
        public string Es_cantante { get; set; }
        public string Estado_en_banda_concierto { get; set; }
        public string Desc_personal { get; set; }
        public string Foto_perfil { get; set; }

    }
}