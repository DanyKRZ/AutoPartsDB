using System;
using System.Collections.Generic;

namespace AutopartsShop.Models
{
    public partial class People
    {
        public People()
        {
            Companies = new HashSet<Companies>();
            CompanyEmployees = new HashSet<CompanyEmployees>();
            Employees = new HashSet<Employees>();
        }

        public int PersonId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string MiddleName { get; set; }
        public int? PhoneNumberId { get; set; }
        public int? EmailId { get; set; }
        public int? AdressId { get; set; }
        public string PhotoUrl { get; set; }

        public Adresses Adress { get; set; }
        public Emails Email { get; set; }
        public PhoneNumbers PhoneNumber { get; set; }
        public ICollection<Companies> Companies { get; set; }
        public ICollection<CompanyEmployees> CompanyEmployees { get; set; }
        public ICollection<Employees> Employees { get; set; }
    }
}
