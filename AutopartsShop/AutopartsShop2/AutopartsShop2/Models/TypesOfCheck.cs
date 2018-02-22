using System;
using System.Collections.Generic;

namespace AutopartsShop.Models
{
    public partial class TypesOfCheck
    {
        public TypesOfCheck()
        {
            Checks = new HashSet<Checks>();
        }

        public int TypeOfCheckId { get; set; }
        public string TypeOfCheckName { get; set; }

        public ICollection<Checks> Checks { get; set; }
    }
}
