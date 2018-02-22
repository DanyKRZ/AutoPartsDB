using System;
using System.Collections.Generic;

namespace AutopartsShop.Models
{
    public partial class Countries
    {
        public Countries()
        {
            Adresses = new HashSet<Adresses>();
            CarBrands = new HashSet<CarBrands>();
            Manufacturers = new HashSet<Manufacturers>();
        }

        public int CountryId { get; set; }
        public string CountryName { get; set; }

        public ICollection<Adresses> Adresses { get; set; }
        public ICollection<CarBrands> CarBrands { get; set; }
        public ICollection<Manufacturers> Manufacturers { get; set; }
    }
}
