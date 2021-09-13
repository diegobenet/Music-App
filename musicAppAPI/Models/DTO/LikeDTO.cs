using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace musicAppAPI.Models.DTO
{
    public class LikeDTO
    {
        public int Id_like { get; set; }
        public int Id_post { get; set; }
        public int Id_usuario { get; set; }
    }
}