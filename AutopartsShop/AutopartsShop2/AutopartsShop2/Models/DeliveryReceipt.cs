using System;
using System.Collections.Generic;

namespace AutopartsShop.Models
{
    public partial class DeliveryReceipt
    {
        public DeliveryReceipt()
        {
            DeliveryAdditionalInformation = new HashSet<DeliveryAdditionalInformation>();
        }

        public int DeliveryReceiptId { get; set; }
        public int AdressId { get; set; }
        public DateTime ArrivalDate { get; set; }
        public int CheckId { get; set; }
        public int CompanyEmployeeId { get; set; }
        public string Comments { get; set; }
        public int DeliveryServiceId { get; set; }
        public string DeliveryServiceReceiptNumber { get; set; }
        public int DeliveryStatusId { get; set; }
        public DateTime DepartureDate { get; set; }
        public int TypeOfPaymentId { get; set; }

        public Adresses Adress { get; set; }
        public Checks Check { get; set; }
        public Checks CompanyEmployee { get; set; }
        public Checks DeliveryService { get; set; }
        public DeliveryStatuses DeliveryStatus { get; set; }
        public TypesOfPayment TypeOfPayment { get; set; }
        public ICollection<DeliveryAdditionalInformation> DeliveryAdditionalInformation { get; set; }
    }
}
