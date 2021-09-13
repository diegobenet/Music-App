using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace musicAppAPI.Models.DTO
{
    public class AgrupacionesUsuariosDTO
    {
        public int Id_agrupacionesUsuarios { get; set; }
        public int Id_usuario { get; set; }
        public int Id_agrupacion { get; set; }
    }
}