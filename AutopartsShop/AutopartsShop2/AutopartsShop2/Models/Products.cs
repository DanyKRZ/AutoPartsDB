using System;
using System.Collections.Generic;

namespace AutopartsShop.Models
{
    public partial class Products
    {
        public Products()
        {
            CheckDetails = new HashSet<CheckDetails>();
        }

        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string VendorCode { get; set; }
        public string ProductCardShop { get; set; }
        public string ProductCard1 { get; set; }
        public string ProductCard2 { get; set; }
        public decimal PurchasedPrice { get; set; }
        public decimal SellingPrice { get; set; }
        public DateTime? ManufacturingDate { get; set; }
        public int? ManufacturerId { get; set; }
        public int? CarModelId { get; set; }
        public int? CategoryId { get; set; }
        public int QuantityNumber { get; set; }
        public string ProductAlias { get; set; }
        public string PhotoUrl { get; set; }

        public CarModels CarModel { get; set; }
        public Categories Category { get; set; }
        public Manufacturers Manufacturer { get; set; }
        public ICollection<CheckDetails> CheckDetails { get; set; }
    }
}
