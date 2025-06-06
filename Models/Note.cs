﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace backendAlquimia.Models;

public partial class Note
{
    [Key]
    public int Id { get; set; }

    [StringLength(50)]
    public string Nombre { get; set; } = null!;

    public int FamiliaOlfativaId { get; set; }

    [StringLength(50)]
    public string Descripcion { get; set; } = null!;

    public int PiramideOlfativaId { get; set; }

    [ForeignKey("FamiliaOlfativaId")]
    [InverseProperty("Notes")]
    public virtual OlfactoryFamily FamiliaOlfativa { get; set; } = null!;

    [InverseProperty("NotaId1Navigation")]
    public virtual ICollection<FormulaNote> FormulaNoteNotaId1Navigations { get; set; } = new List<FormulaNote>();

    [InverseProperty("NotaId2Navigation")]
    public virtual ICollection<FormulaNote> FormulaNoteNotaId2Navigations { get; set; } = new List<FormulaNote>();

    [InverseProperty("NotaId3Navigation")]
    public virtual ICollection<FormulaNote> FormulaNoteNotaId3Navigations { get; set; } = new List<FormulaNote>();

    [InverseProperty("NotaId4Navigation")]
    public virtual ICollection<FormulaNote> FormulaNoteNotaId4Navigations { get; set; } = new List<FormulaNote>();

    [InverseProperty("Nota")]
    public virtual ICollection<IncompatibleNote> IncompatibleNoteNota { get; set; } = new List<IncompatibleNote>();

    [InverseProperty("NotaIncompatible")]
    public virtual ICollection<IncompatibleNote> IncompatibleNoteNotaIncompatibles { get; set; } = new List<IncompatibleNote>();

    [ForeignKey("PiramideOlfativaId")]
    [InverseProperty("Notes")]
    public virtual OlfactoryPyramid PiramideOlfativa { get; set; } = null!;
}
