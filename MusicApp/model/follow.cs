using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MusicApp.model
{
    public class follow
    {
        public int id_follows { get; set; }
        public int Id_follower { get; set; }
        public int Id_following { get; set; }
    }
}