using System;
using System.Collections.Generic;

namespace AutopartsShop.Models
{
    public partial class Checks
    {
        public Checks()
        {
            CheckDetails = new HashSet<CheckDetails>();
            DeliveryReceiptCheck = new HashSet<DeliveryReceipt>();
            DeliveryReceiptCompanyEmployee = new HashSet<DeliveryReceipt>();
            DeliveryReceiptDeliveryService = new HashSet<DeliveryReceipt>();
        }

        public int CheckId { get; set; }
        public int? EmployeeId { get; set; }
        public DateTime DateOfIssue { get; set; }
        public decimal TotalSum { get; set; }
        public int? CustomerCompanyEmployeeId { get; set; }
        public int? TypeOfCheckId { get; set; }

        public CompanyEmployees CustomerCompanyEmployee { get; set; }
        public Employees Employee { get; set; }
        public TypesOfCheck TypeOfCheck { get; set; }
        public ICollection<CheckDetails> CheckDetails { get; set; }
        public ICollection<DeliveryReceipt> DeliveryReceiptCheck { get; set; }
        public ICollection<DeliveryReceipt> DeliveryReceiptCompanyEmployee { get; set; }
        public ICollection<DeliveryReceipt> DeliveryReceiptDeliveryService { get; set; }
    }
}
