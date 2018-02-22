using System;
using System.Collections.Generic;

namespace AutopartsShop.Models
{
    public partial class CompanyEmployees
    {
        public CompanyEmployees()
        {
            Checks = new HashSet<Checks>();
        }

        public int CompanyEmployeeId { get; set; }
        public int? PersonId { get; set; }
        public int? CompanyId { get; set; }

        public Companies Company { get; set; }
        public People Person { get; set; }
        public ICollection<Checks> Checks { get; set; }
    }
}
