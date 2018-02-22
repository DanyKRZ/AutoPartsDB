using System;
using System.Collections.Generic;

namespace AutopartsShop.Models
{
    public partial class TypesOfPayment
    {
        public TypesOfPayment()
        {
            DeliveryReceipt = new HashSet<DeliveryReceipt>();
        }

        public int TypeOfPaymentId { get; set; }
        public string TypeOfPaymentName { get; set; }

        public ICollection<DeliveryReceipt> DeliveryReceipt { get; set; }
    }
}
