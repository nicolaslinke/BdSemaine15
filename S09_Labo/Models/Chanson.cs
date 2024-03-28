﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace S09_Labo.Models
{
    [Table("Chanson", Schema = "Musique")]
    public partial class Chanson
    {
        [Key]
        [Column("ChansonID")]
        public int ChansonId { get; set; }
        [StringLength(100)]
        public string Nom { get; set; } = null!;
        [Column("ChanteurID")]
        public int ChanteurId { get; set; }

        [ForeignKey("ChanteurId")]
        [InverseProperty("Chansons")]
        public virtual Chanteur Chanteur { get; set; } = null!;
    }
}
