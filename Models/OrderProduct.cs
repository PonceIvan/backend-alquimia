﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace backendAlquimia.Models;

[Table("OrderProduct")]
public partial class OrderProduct
{
    [Key]
    public int PedidoProductoId { get; set; }

    public int? IdPedido { get; set; }

    public int? ProductosId { get; set; }

    [ForeignKey("IdPedido")]
    [InverseProperty("OrderProducts")]
    public virtual Order? IdPedidoNavigation { get; set; }

    [ForeignKey("ProductosId")]
    [InverseProperty("OrderProducts")]
    public virtual Product? Productos { get; set; }
}
