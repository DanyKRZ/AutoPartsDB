using System;
using System.Collections.Generic;

namespace AutopartsShop.Models
{
    public partial class DeliveryAdditionalInformation
    {
        public int DeliveryAdditionalInformationId { get; set; }
        public int DeliveryReceiptId { get; set; }
        public int? NumberOfPlaces { get; set; }
        public double? Weight { get; set; }
        public decimal? CostOfService { get; set; }

        public DeliveryReceipt DeliveryReceipt { get; set; }
    }
}
