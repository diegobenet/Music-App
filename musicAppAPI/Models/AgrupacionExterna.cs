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
    
    public partial class AgrupacionExterna
    {
        public int Id_agrupacion_externa { get; set; }
        public string Nombre { get; set; }
        public Nullable<System.DateTime> Fecha_inicio { get; set; }
        public Nullable<System.DateTime> Fecha_fin { get; set; }
        public Nullable<int> Id_usuario { get; set; }
    
        public virtual Usuario Usuario { get; set; }
    }
}
