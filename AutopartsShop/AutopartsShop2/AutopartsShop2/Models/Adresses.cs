using System;
using System.Collections.Generic;

namespace AutopartsShop.Models
{
    public partial class Adresses
    {
        public Adresses()
        {
            Companies = new HashSet<Companies>();
            DeliveryReceipt = new HashSet<DeliveryReceipt>();
            People = new HashSet<People>();
        }

        public int AdressId { get; set; }
        public int? CountryId { get; set; }
        public string City { get; set; }
        public string Adress1 { get; set; }
        public string Adress2 { get; set; }

        public Countries Country { get; set; }
        public ICollection<Companies> Companies { get; set; }
        public ICollection<DeliveryReceipt> DeliveryReceipt { get; set; }
        public ICollection<People> People { get; set; }
    }
}
