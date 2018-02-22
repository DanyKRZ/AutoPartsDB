using System;
using System.Collections.Generic;

namespace AutopartsShop.Models
{
    public partial class Companies
    {
        public Companies()
        {
            CompaniesClients = new HashSet<CompaniesClients>();
            CompaniesProviders = new HashSet<CompaniesProviders>();
            CompanyEmployees = new HashSet<CompanyEmployees>();
        }

        public int CompanyId { get; set; }
        public string CompanyName { get; set; }
        public int? AdressId { get; set; }
        public int? PreferredDeliveryServiceId { get; set; }
        public string PreferredDeliveryServiceDepartment { get; set; }
        public int? PhoneNumberId { get; set; }
        public int? PreferredCompanyAgentId { get; set; }
        public int? EmailId { get; set; }

        public Adresses Adress { get; set; }
        public PhoneNumbers PhoneNumber { get; set; }
        public People PreferredCompanyAgent { get; set; }
        public DeliveryServices PreferredDeliveryService { get; set; }
        public ICollection<CompaniesClients> CompaniesClients { get; set; }
        public ICollection<CompaniesProviders> CompaniesProviders { get; set; }
        public ICollection<CompanyEmployees> CompanyEmployees { get; set; }
    }
}
