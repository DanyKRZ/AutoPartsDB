using System;
using System.Collections.Generic;

namespace AutopartsShop.Models
{
    public partial class CarBrands
    {
        public CarBrands()
        {
            CarModels = new HashSet<CarModels>();
        }

        public int BrandId { get; set; }
        public string BrandName { get; set; }
        public int? CountryId { get; set; }

        public Countries Country { get; set; }
        public ICollection<CarModels> CarModels { get; set; }
    }
}
