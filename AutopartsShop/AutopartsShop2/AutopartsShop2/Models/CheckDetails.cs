using System;
using System.Collections.Generic;

namespace AutopartsShop.Models
{
    public partial class CheckDetails
    {
        public int CheckDetailsId { get; set; }
        public int CheckId { get; set; }
        public int ProductId { get; set; }
        public decimal SaledPrice { get; set; }
        public int NumberOfProducts { get; set; }

        public Checks Check { get; set; }
        public Products Product { get; set; }
    }
}
