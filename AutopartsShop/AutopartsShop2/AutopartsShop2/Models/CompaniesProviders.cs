using System;
using System.Collections.Generic;

namespace AutopartsShop.Models
{
    public partial class CompaniesProviders
    {
        public int CompanyProviderId { get; set; }
        public int? CompanyId { get; set; }

        public Companies Company { get; set; }
    }
}
