using System;
using System.Collections.Generic;

namespace AutopartsShop.Models
{
    public partial class Manufacturers
    {
        public Manufacturers()
        {
            Products = new HashSet<Products>();
        }

        public int ManufacturerId { get; set; }
        public string ManufacturerName { get; set; }
        public int? CountryId { get; set; }

        public Countries Country { get; set; }
        public ICollection<Products> Products { get; set; }
    }
}
