using System;
using System.Collections.Generic;

namespace AutopartsShop.Models
{
    public partial class Emails
    {
        public Emails()
        {
            People = new HashSet<People>();
        }

        public int EmailId { get; set; }
        public string WorkMail { get; set; }
        public string PrivateMail { get; set; }
        public string HomeMail { get; set; }

        public ICollection<People> People { get; set; }
    }
}
