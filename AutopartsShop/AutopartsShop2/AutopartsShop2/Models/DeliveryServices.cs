using System;
using System.Collections.Generic;

namespace AutopartsShop.Models
{
    public partial class DeliveryServices
    {
        public DeliveryServices()
        {
            Companies = new HashSet<Companies>();
        }

        public int DeliveryServiceId { get; set; }
        public string DeliveryServiceName { get; set; }

        public ICollection<Companies> Companies { get; set; }
    }
}
