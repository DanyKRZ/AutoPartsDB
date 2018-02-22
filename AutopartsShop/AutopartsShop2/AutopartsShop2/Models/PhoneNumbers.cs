using System;
using System.Collections.Generic;

namespace AutopartsShop.Models
{
    public partial class PhoneNumbers
    {
        public PhoneNumbers()
        {
            Companies = new HashSet<Companies>();
            People = new HashSet<People>();
        }

        public int PhoneNumberId { get; set; }
        public string WorkPhoneNumber { get; set; }
        public string CellPhoneNumber { get; set; }
        public string HomePhoneNumber { get; set; }

        public ICollection<Companies> Companies { get; set; }
        public ICollection<People> People { get; set; }
    }
}
