using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace AutopartsShop.Models
{
    public partial class AutopartsShopContext : DbContext
    {
        public AutopartsShopContext(DbContextOptions<AutopartsShopContext> options):base(options)    
        {

        }
        public virtual DbSet<Adresses> Adresses { get; set; }
        public virtual DbSet<CarBrands> CarBrands { get; set; }
        public virtual DbSet<CarModels> CarModels { get; set; }
        public virtual DbSet<Categories> Categories { get; set; }
        public virtual DbSet<CheckDetails> CheckDetails { get; set; }
        public virtual DbSet<Checks> Checks { get; set; }
        public virtual DbSet<Companies> Companies { get; set; }
        public virtual DbSet<CompaniesClients> CompaniesClients { get; set; }
        public virtual DbSet<CompaniesProviders> CompaniesProviders { get; set; }
        public virtual DbSet<CompanyEmployees> CompanyEmployees { get; set; }
        public virtual DbSet<Countries> Countries { get; set; }
        public virtual DbSet<DeliveryAdditionalInformation> DeliveryAdditionalInformation { get; set; }
        public virtual DbSet<DeliveryReceipt> DeliveryReceipt { get; set; }
        public virtual DbSet<DeliveryServices> DeliveryServices { get; set; }
        public virtual DbSet<DeliveryStatuses> DeliveryStatuses { get; set; }
        public virtual DbSet<Emails> Emails { get; set; }
        public virtual DbSet<Employees> Employees { get; set; }
        public virtual DbSet<Manufacturers> Manufacturers { get; set; }
        public virtual DbSet<People> People { get; set; }
        public virtual DbSet<PhoneNumbers> PhoneNumbers { get; set; }
        public virtual DbSet<Products> Products { get; set; }
        public virtual DbSet<TypesOfCheck> TypesOfCheck { get; set; }
        public virtual DbSet<TypesOfPayment> TypesOfPayment { get; set; }
        public virtual DbSet<WorkPositions> WorkPositions { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                  optionsBuilder.UseSqlServer(@"Data Source=DANYLO-KORZHENE;Initial Catalog=AutopartsShop;Integrated Security=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Adresses>(entity =>
            {
                entity.HasKey(e => e.AdressId);

                entity.Property(e => e.Adress1).HasMaxLength(100);

                entity.Property(e => e.Adress2).HasMaxLength(100);

                entity.Property(e => e.City)
                    .IsRequired()
                    .HasMaxLength(60);

                entity.HasOne(d => d.Country)
                    .WithMany(p => p.Adresses)
                    .HasForeignKey(d => d.CountryId)
                    .HasConstraintName("FK__Adresses__Countr__04E4BC85");
            });

            modelBuilder.Entity<CarBrands>(entity =>
            {
                entity.HasKey(e => e.BrandId);

                entity.HasIndex(e => e.BrandName)
                    .HasName("UQ__CarBrand__2206CE9B12C56A44")
                    .IsUnique();

                entity.Property(e => e.BrandName)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.HasOne(d => d.Country)
                    .WithMany(p => p.CarBrands)
                    .HasForeignKey(d => d.CountryId)
                    .HasConstraintName("FK__CarBrands__Count__3E52440B");
            });

            modelBuilder.Entity<CarModels>(entity =>
            {
                entity.HasKey(e => e.CarModelId);

                entity.Property(e => e.CarModelName)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.CarcassType).HasMaxLength(100);

                entity.Property(e => e.EngineType).HasMaxLength(100);

                entity.Property(e => e.OtherSpecification).HasMaxLength(100);

                entity.HasOne(d => d.Brand)
                    .WithMany(p => p.CarModels)
                    .HasForeignKey(d => d.BrandId)
                    .HasConstraintName("FK__CarModels__Brand__5DCAEF64");
            });

            modelBuilder.Entity<Categories>(entity =>
            {
                entity.HasKey(e => e.CategoryId);

                entity.HasIndex(e => e.CategoryName)
                    .HasName("UQ__Categori__8517B2E0D68DAB82")
                    .IsUnique();

                entity.Property(e => e.CategoryName)
                    .IsRequired()
                    .HasMaxLength(100);
            });

            modelBuilder.Entity<CheckDetails>(entity =>
            {
                entity.Property(e => e.SaledPrice).HasColumnType("money");

                entity.HasOne(d => d.Check)
                    .WithMany(p => p.CheckDetails)
                    .HasForeignKey(d => d.CheckId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__CheckDeta__Check__47A6A41B");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.CheckDetails)
                    .HasForeignKey(d => d.ProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__CheckDeta__Produ__489AC854");
            });

            modelBuilder.Entity<Checks>(entity =>
            {
                entity.HasKey(e => e.CheckId);

                entity.Property(e => e.DateOfIssue).HasColumnType("datetime");

                entity.Property(e => e.TotalSum).HasColumnType("money");

                entity.HasOne(d => d.CustomerCompanyEmployee)
                    .WithMany(p => p.Checks)
                    .HasForeignKey(d => d.CustomerCompanyEmployeeId)
                    .HasConstraintName("FK__Checks__CompanyE__503BEA1C");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.Checks)
                    .HasForeignKey(d => d.EmployeeId)
                    .HasConstraintName("FK__Checks__Employee__40058253");

                entity.HasOne(d => d.TypeOfCheck)
                    .WithMany(p => p.Checks)
                    .HasForeignKey(d => d.TypeOfCheckId)
                    .HasConstraintName("FK__Checks__TypeOfCh__56E8E7AB");
            });

            modelBuilder.Entity<Companies>(entity =>
            {
                entity.HasKey(e => e.CompanyId);

                entity.Property(e => e.CompanyName)
                    .IsRequired()
                    .HasMaxLength(60);

                entity.Property(e => e.PreferredDeliveryServiceDepartment).HasMaxLength(30);

                entity.HasOne(d => d.Adress)
                    .WithMany(p => p.Companies)
                    .HasForeignKey(d => d.AdressId)
                    .HasConstraintName("FK__Companies__Adres__2180FB33");

                entity.HasOne(d => d.PhoneNumber)
                    .WithMany(p => p.Companies)
                    .HasForeignKey(d => d.PhoneNumberId)
                    .HasConstraintName("FK__Companies__Phone__236943A5");

                entity.HasOne(d => d.PreferredCompanyAgent)
                    .WithMany(p => p.Companies)
                    .HasForeignKey(d => d.PreferredCompanyAgentId)
                    .HasConstraintName("FK__Companies__Prefe__245D67DE");

                entity.HasOne(d => d.PreferredDeliveryService)
                    .WithMany(p => p.Companies)
                    .HasForeignKey(d => d.PreferredDeliveryServiceId)
                    .HasConstraintName("FK__Companies__Prefe__22751F6C");
            });

            modelBuilder.Entity<CompaniesClients>(entity =>
            {
                entity.HasKey(e => e.CompanyClientId);

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.CompaniesClients)
                    .HasForeignKey(d => d.CompanyId)
                    .HasConstraintName("FK__Companies__Compa__32AB8735");
            });

            modelBuilder.Entity<CompaniesProviders>(entity =>
            {
                entity.HasKey(e => e.CompanyProviderId);

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.CompaniesProviders)
                    .HasForeignKey(d => d.CompanyId)
                    .HasConstraintName("FK__Companies__Compa__2FCF1A8A");
            });

            modelBuilder.Entity<CompanyEmployees>(entity =>
            {
                entity.HasKey(e => e.CompanyEmployeeId);

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.CompanyEmployees)
                    .HasForeignKey(d => d.CompanyId)
                    .HasConstraintName("FK__CompanyEm__Compa__2BFE89A6");

                entity.HasOne(d => d.Person)
                    .WithMany(p => p.CompanyEmployees)
                    .HasForeignKey(d => d.PersonId)
                    .HasConstraintName("FK__CompanyEm__Perso__2B0A656D");
            });

            modelBuilder.Entity<Countries>(entity =>
            {
                entity.HasKey(e => e.CountryId);

                entity.HasIndex(e => e.CountryName)
                    .HasName("UQ__Countrie__E056F201312B6A2F")
                    .IsUnique();

                entity.Property(e => e.CountryName)
                    .IsRequired()
                    .HasMaxLength(100);
            });

            modelBuilder.Entity<DeliveryAdditionalInformation>(entity =>
            {
                entity.Property(e => e.CostOfService).HasColumnType("money");

                entity.HasOne(d => d.DeliveryReceipt)
                    .WithMany(p => p.DeliveryAdditionalInformation)
                    .HasForeignKey(d => d.DeliveryReceiptId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__DeliveryA__Deliv__7C1A6C5A");
            });

            modelBuilder.Entity<DeliveryReceipt>(entity =>
            {
                entity.Property(e => e.ArrivalDate).HasColumnType("datetime");

                entity.Property(e => e.Comments).HasMaxLength(100);

                entity.Property(e => e.DeliveryServiceReceiptNumber)
                    .IsRequired()
                    .HasMaxLength(35);

                entity.Property(e => e.DepartureDate).HasColumnType("datetime");

                entity.HasOne(d => d.Adress)
                    .WithMany(p => p.DeliveryReceipt)
                    .HasForeignKey(d => d.AdressId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__DeliveryR__Adres__74794A92");

                entity.HasOne(d => d.Check)
                    .WithMany(p => p.DeliveryReceiptCheck)
                    .HasForeignKey(d => d.CheckId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__DeliveryR__Check__756D6ECB");

                entity.HasOne(d => d.CompanyEmployee)
                    .WithMany(p => p.DeliveryReceiptCompanyEmployee)
                    .HasForeignKey(d => d.CompanyEmployeeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__DeliveryR__Compa__76619304");

                entity.HasOne(d => d.DeliveryService)
                    .WithMany(p => p.DeliveryReceiptDeliveryService)
                    .HasForeignKey(d => d.DeliveryServiceId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__DeliveryR__Deliv__7755B73D");

                entity.HasOne(d => d.DeliveryStatus)
                    .WithMany(p => p.DeliveryReceipt)
                    .HasForeignKey(d => d.DeliveryStatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__DeliveryR__Deliv__7849DB76");

                entity.HasOne(d => d.TypeOfPayment)
                    .WithMany(p => p.DeliveryReceipt)
                    .HasForeignKey(d => d.TypeOfPaymentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__DeliveryR__TypeO__793DFFAF");
            });

            modelBuilder.Entity<DeliveryServices>(entity =>
            {
                entity.HasKey(e => e.DeliveryServiceId);

                entity.Property(e => e.DeliveryServiceName)
                    .IsRequired()
                    .HasMaxLength(60);
            });

            modelBuilder.Entity<DeliveryStatuses>(entity =>
            {
                entity.HasKey(e => e.DeliveryStatusId);

                entity.HasIndex(e => e.DeliveryStatusName)
                    .HasName("UQ__Delivery__932489752D913874")
                    .IsUnique();

                entity.Property(e => e.DeliveryStatusName)
                    .IsRequired()
                    .HasMaxLength(35);
            });

            modelBuilder.Entity<Emails>(entity =>
            {
                entity.HasKey(e => e.EmailId);

                entity.Property(e => e.HomeMail)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.PrivateMail)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.WorkMail)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Employees>(entity =>
            {
                entity.HasKey(e => e.EmployeeId);

                entity.Property(e => e.HiredDate).HasColumnType("date");

                entity.Property(e => e.SalaryRate).HasColumnType("money");

                entity.HasOne(d => d.Person)
                    .WithMany(p => p.Employees)
                    .HasForeignKey(d => d.PersonId)
                    .HasConstraintName("FK__Employees__Perso__3A4CA8FD");

                entity.HasOne(d => d.WorkPosition)
                    .WithMany(p => p.Employees)
                    .HasForeignKey(d => d.WorkPositionId)
                    .HasConstraintName("FK__Employees__WorkP__3B40CD36");
            });

            modelBuilder.Entity<Manufacturers>(entity =>
            {
                entity.HasKey(e => e.ManufacturerId);

                entity.Property(e => e.ManufacturerName)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.HasOne(d => d.Country)
                    .WithMany(p => p.Manufacturers)
                    .HasForeignKey(d => d.CountryId)
                    .HasConstraintName("FK__Manufactu__Count__4222D4EF");
            });

            modelBuilder.Entity<People>(entity =>
            {
                entity.HasKey(e => e.PersonId);

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(60);

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(60);

                entity.Property(e => e.MiddleName).HasMaxLength(60);

                entity.Property(e => e.PhotoUrl)
                    .HasColumnName("PhotoURL")
                    .HasMaxLength(100);

                entity.HasOne(d => d.Adress)
                    .WithMany(p => p.People)
                    .HasForeignKey(d => d.AdressId)
                    .HasConstraintName("FK__People__AdressId__17F790F9");

                entity.HasOne(d => d.Email)
                    .WithMany(p => p.People)
                    .HasForeignKey(d => d.EmailId)
                    .HasConstraintName("FK__People__EmailId__17036CC0");

                entity.HasOne(d => d.PhoneNumber)
                    .WithMany(p => p.People)
                    .HasForeignKey(d => d.PhoneNumberId)
                    .HasConstraintName("FK__People__PhoneNum__160F4887");
            });

            modelBuilder.Entity<PhoneNumbers>(entity =>
            {
                entity.HasKey(e => e.PhoneNumberId);

                entity.Property(e => e.CellPhoneNumber).HasMaxLength(30);

                entity.Property(e => e.HomePhoneNumber).HasMaxLength(30);

                entity.Property(e => e.WorkPhoneNumber)
                    .IsRequired()
                    .HasMaxLength(30);
            });

            modelBuilder.Entity<Products>(entity =>
            {
                entity.HasKey(e => e.ProductId);

                entity.Property(e => e.ManufacturingDate).HasColumnType("date");

                entity.Property(e => e.PhotoUrl)
                    .HasColumnName("PhotoURL")
                    .HasMaxLength(100);

                entity.Property(e => e.ProductAlias).HasMaxLength(50);

                entity.Property(e => e.ProductCard1).HasMaxLength(100);

                entity.Property(e => e.ProductCard2).HasMaxLength(100);

                entity.Property(e => e.ProductCardShop).HasMaxLength(100);

                entity.Property(e => e.ProductName)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.PurchasedPrice).HasColumnType("money");

                entity.Property(e => e.SellingPrice).HasColumnType("money");

                entity.Property(e => e.VendorCode)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.HasOne(d => d.CarModel)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.CarModelId)
                    .HasConstraintName("FK__Products__CarMod__656C112C");

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.CategoryId)
                    .HasConstraintName("FK__Products__Catego__66603565");

                entity.HasOne(d => d.Manufacturer)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.ManufacturerId)
                    .HasConstraintName("FK__Products__Manufa__6477ECF3");
            });

            modelBuilder.Entity<TypesOfCheck>(entity =>
            {
                entity.HasKey(e => e.TypeOfCheckId);

                entity.HasIndex(e => e.TypeOfCheckName)
                    .HasName("UQ__TypesOfC__D39E08BED42F29B3")
                    .IsUnique();

                entity.Property(e => e.TypeOfCheckName)
                    .IsRequired()
                    .HasMaxLength(25);
            });

            modelBuilder.Entity<TypesOfPayment>(entity =>
            {
                entity.HasKey(e => e.TypeOfPaymentId);

                entity.HasIndex(e => e.TypeOfPaymentName)
                    .HasName("UQ__TypesOfP__8D6B27F1236F6FB5")
                    .IsUnique();

                entity.Property(e => e.TypeOfPaymentName)
                    .IsRequired()
                    .HasMaxLength(25);
            });

            modelBuilder.Entity<WorkPositions>(entity =>
            {
                entity.HasKey(e => e.WorkPositionId);

                entity.HasIndex(e => e.WorkPositionName)
                    .HasName("UQ__WorkPosi__C2F9D60DBEF91885")
                    .IsUnique();

                entity.Property(e => e.WorkPositionName)
                    .IsRequired()
                    .HasMaxLength(50);
            });
        }
    }
}
