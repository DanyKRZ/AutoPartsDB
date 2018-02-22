using System;
using System.Collections.Generic;

namespace AutopartsShop.Models
{
    public partial class CarModels
    {
        public CarModels()
        {
            Products = new HashSet<Products>();
        }

        public int CarModelId { get; set; }
        public string CarModelName { get; set; }
        public string EngineType { get; set; }
        public string CarcassType { get; set; }
        public string OtherSpecification { get; set; }
        public int? BrandId { get; set; }

        public CarBrands Brand { get; set; }
        public ICollection<Products> Products { get; set; }
    }
}
