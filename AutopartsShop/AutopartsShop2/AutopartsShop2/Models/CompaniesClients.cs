using System;
using System.Collections.Generic;

namespace AutopartsShop.Models
{
    public partial class CompaniesClients
    {
        public int CompanyClientId { get; set; }
        public int? CompanyId { get; set; }

        public Companies Company { get; set; }
    }
}
