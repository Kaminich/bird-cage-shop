﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace backend_not_clear.Models
{
    public partial class StyleProduct
    {
        [Key]
        [Column("StyleID")]
        [StringLength(10)]
        public string StyleId { get; set; }
        [Key]
        [Column("ProductID")]
        [StringLength(10)]
        public string ProductId { get; set; }
        public bool Status { get; set; }

        [ForeignKey("ProductId")]
        [InverseProperty("StyleProduct")]
        public virtual Product Product { get; set; }
        [ForeignKey("StyleId")]
        [InverseProperty("StyleProduct")]
        public virtual Style Style { get; set; }
    }
}