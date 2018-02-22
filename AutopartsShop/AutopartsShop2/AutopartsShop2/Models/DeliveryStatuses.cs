using System;
using System.Collections.Generic;

namespace AutopartsShop.Models
{
    public partial class DeliveryStatuses
    {
        public DeliveryStatuses()
        {
            DeliveryReceipt = new HashSet<DeliveryReceipt>();
        }

        public int DeliveryStatusId { get; set; }
        public string DeliveryStatusName { get; set; }

        public ICollection<DeliveryReceipt> DeliveryReceipt { get; set; }
    }
}
