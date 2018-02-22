using System;
using System.Collections.Generic;

namespace AutopartsShop.Models
{
    public partial class Employees
    {
        public Employees()
        {
            Checks = new HashSet<Checks>();
        }

        public int EmployeeId { get; set; }
        public int? PersonId { get; set; }
        public int? WorkPositionId { get; set; }
        public decimal SalaryRate { get; set; }
        public DateTime HiredDate { get; set; }

        public People Person { get; set; }
        public WorkPositions WorkPosition { get; set; }
        public ICollection<Checks> Checks { get; set; }
    }
}
