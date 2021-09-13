using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace musicAppAPI.Models.DTO
{
    public class UsuarioDTO
    {
        public int Id_usuario { get; set; }
        [Required]
        public string Email { get; set; }
        [Required]
        public string Nombre { get; set; }
        [Required]
        public string Apellidos { get; set; }
        [Required]
        public string Contraseña { get; set; }
        public string verifContra { get; set; }
        [Required]
        public string Fecha_nac { get; set; }
        [Required]
        public string Ciudad { get; set; }
        [Required]
        public string Genero { get; set; }
        public string Foto_perfil { get; set; }
    }
}