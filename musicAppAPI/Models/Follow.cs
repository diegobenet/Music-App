//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace musicAppAPI.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Follow
    {
        public int id_follows { get; set; }
        public Nullable<int> Id_follower { get; set; }
        public Nullable<int> Id_following { get; set; }
    
        public virtual Usuario Usuario { get; set; }
        public virtual Usuario Usuario1 { get; set; }
    }
}
