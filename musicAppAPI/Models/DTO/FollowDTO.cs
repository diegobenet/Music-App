using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace musicAppAPI.Models.DTO
{
    public class FollowDTO
    {
        public int id_follows { get; set; }
        public Nullable<int> Id_follower { get; set; }
        public Nullable<int> Id_following { get; set; }
    }
}