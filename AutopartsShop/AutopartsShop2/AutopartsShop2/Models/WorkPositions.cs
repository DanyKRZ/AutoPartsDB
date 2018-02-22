using System;
using System.Collections.Generic;

namespace AutopartsShop.Models
{
    public partial class WorkPositions
    {
        public WorkPositions()
        {
            Employees = new HashSet<Employees>();
        }

        public int WorkPositionId { get; set; }
        public string WorkPositionName { get; set; }

        public ICollection<Employees> Employees { get; set; }
    }
}
