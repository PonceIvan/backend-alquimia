﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace backendAlquimia.Models;

[PrimaryKey("LoginProvider", "ProviderKey")]
public partial class AspNetUserLogin
{
    [Key]
    public string LoginProvider { get; set; } = null!;

    [Key]
    public string ProviderKey { get; set; } = null!;

    public string? ProviderDisplayName { get; set; }

    public int UserId { get; set; }

    [ForeignKey("UserId")]
    [InverseProperty("AspNetUserLogins")]
    public virtual User User { get; set; } = null!;
}
