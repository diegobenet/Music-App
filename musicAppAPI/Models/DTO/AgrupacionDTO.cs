using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace musicAppAPI.Models.DTO
{
    public class AgrupacionDTO
    {
        public int Id_agrupacion { get; set; }
        public string Nombre { get; set; }
        public string Ciudad { get; set; }
        public string Genero_musical { get; set; }
        public string Foto { get; set; }
        public string Busca_integrantes { get; set; }
        public string Descripcion { get; set; }
    }
}