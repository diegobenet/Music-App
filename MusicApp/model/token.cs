using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MusicApp.model
{
    public class token
    {
        public string Nombre { set; get;  }
        public DateTime Fecha { set; get; }
        public int Expiracion { set; get; }
        public int Id_usuario { set; get; }
    }
}