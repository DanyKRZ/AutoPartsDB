USE [master]
GO
/****** Object:  Database [AutopartsShop]    Script Date: 12/11/2017 11:36:03 PM ******/
CREATE DATABASE [AutopartsShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AutopartsShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AutopartsShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AutopartsShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AutopartsShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AutopartsShop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AutopartsShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AutopartsShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AutopartsShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AutopartsShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AutopartsShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AutopartsShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [AutopartsShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AutopartsShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AutopartsShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AutopartsShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AutopartsShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AutopartsShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AutopartsShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AutopartsShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AutopartsShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AutopartsShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AutopartsShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AutopartsShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AutopartsShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AutopartsShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AutopartsShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AutopartsShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AutopartsShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AutopartsShop] SET RECOVERY FULL 
GO
ALTER DATABASE [AutopartsShop] SET  MULTI_USER 
GO
ALTER DATABASE [AutopartsShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AutopartsShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AutopartsShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AutopartsShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AutopartsShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AutopartsShop', N'ON'
GO
ALTER DATABASE [AutopartsShop] SET QUERY_STORE = OFF
GO
USE [AutopartsShop]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [AutopartsShop]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/11/2017 11:36:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarBrands]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarBrands](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](100) NOT NULL,
	[CountryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturers]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturers](
	[ManufacturerId] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerName] [nvarchar](100) NOT NULL,
	[CountryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ManufacturerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarModels]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarModels](
	[CarModelId] [int] IDENTITY(1,1) NOT NULL,
	[CarModelName] [nvarchar](100) NOT NULL,
	[EngineType] [nvarchar](100) NULL,
	[CarcassType] [nvarchar](100) NULL,
	[OtherSpecification] [nvarchar](100) NULL,
	[BrandId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CarModelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[VendorCode] [nvarchar](100) NOT NULL,
	[ProductCardShop] [nvarchar](100) NULL,
	[ProductCard1] [nvarchar](100) NULL,
	[ProductCard2] [nvarchar](100) NULL,
	[PurchasedPrice] [money] NOT NULL,
	[SellingPrice] [money] NOT NULL,
	[ManufacturingDate] [date] NULL,
	[ManufacturerId] [int] NULL,
	[CarModelId] [int] NULL,
	[CategoryId] [int] NULL,
	[QuantityNumber] [int] NOT NULL,
	[ProductAlias] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Products]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_Products] as
SELECT P.ProductId, P.VendorCode, P.ProductName, M.ManufacturerName, C.CountryName, Br.BrandName, CM.CarModelName, CM.EngineType, Ct.CategoryName, 
P.PurchasedPrice, P.SellingPrice, P.QuantityNumber
FROM dbo.Products P
JOIN dbo.Manufacturers M on M.ManufacturerId = P.ManufacturerId
JOIN dbo.Countries C on C.CountryId = M.CountryId
JOIN dbo.CarModels CM on CM.CarModelId = P.CarModelId
JOIN dbo.CarBrands Br on Br.BrandId = CM.BrandId
JOIN dbo.Categories Ct on Ct.CategoryId = P.CategoryId
GO
/****** Object:  Table [dbo].[Adresses]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adresses](
	[AdressId] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NULL,
	[City] [nvarchar](60) NOT NULL,
	[Adress1] [nvarchar](100) NULL,
	[Adress2] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhoneNumbers]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneNumbers](
	[PhoneNumberId] [int] IDENTITY(1,1) NOT NULL,
	[WorkPhoneNumber] [nvarchar](30) NOT NULL,
	[CellPhoneNumber] [nvarchar](30) NULL,
	[HomePhoneNumber] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[PhoneNumberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Emails]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emails](
	[EmailId] [int] IDENTITY(1,1) NOT NULL,
	[WorkMail] [varchar](30) NOT NULL,
	[PrivateMail] [varchar](30) NULL,
	[HomeMail] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](60) NOT NULL,
	[LastName] [nvarchar](60) NOT NULL,
	[MiddleName] [nvarchar](60) NULL,
	[PhoneNumberId] [int] NULL,
	[EmailId] [int] NULL,
	[AdressId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_People]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_People] AS
SELECT PersonId, FirstName, LastName, WorkPhoneNumber, CellPhoneNumber, HomePhoneNumber, City,  Adress1, Adress2
FROM dbo.People P
JOIN dbo.PhoneNumbers Phn on Phn.PhoneNumberId = P.PhoneNumberId
JOIN dbo.Emails Eml on Eml.EmailId = P.EmailId
JOIN dbo.Adresses Ad on Ad.AdressId = P.AdressId
GO
/****** Object:  Table [dbo].[DeliveryServices]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryServices](
	[DeliveryServiceId] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryServiceName] [nvarchar](60) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](60) NOT NULL,
	[AdressId] [int] NULL,
	[PreferredDeliveryServiceId] [int] NULL,
	[PreferredDeliveryServiceDepartment] [nvarchar](30) NULL,
	[PhoneNumberId] [int] NULL,
	[PreferredCompanyAgentId] [int] NULL,
	[EmailId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Companies]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from dbo.Categories order by CategoryId

--select * 
--from dbo.CarModels CB

--select * 
--from dbo.CarBrands

--SELECT P.ProductId, P.VendorCode, P.ProductName, M.ManufacturerName, C.CountryName, Br.BrandName, CM.CarModelName, CM.EngineType, Ct.CategoryName, 
--P.PurchasedPrice, P.SellingPrice, P.QuantityNumber
--FROM dbo.Products P
--JOIN dbo.Manufacturers M on M.ManufacturerId = P.ManufacturerId
--JOIN dbo.Countries C on C.CountryId = M.CountryId
--JOIN dbo.CarModels CM on CM.CarModelId = P.CarModelId
--JOIN dbo.CarBrands Br on Br.BrandId = CM.BrandId
--JOIN dbo.Categories Ct on Ct.CategoryId = P.CategoryId

--select *
--from dbo. countries

--select *
--from dbo.Manufacturers

--SELECT *
--FROM dbo.DeliveryServices

--SELECT *
--FROM dbo.Adresses

--SELECT *
--FROM dbo.PhoneNumbers


--SELECT *
--FROM dbo.Emails

--select *
--from dbo.People

--select * from v_Products
--select * 
--from dbo.emails

--SELECT PersonId, FirstName, LastName, WorkPhoneNumber, CellPhoneNumber, HomePhoneNumber, City,  Adress1, Adress2
--FROM dbo.People P
--JOIN dbo.PhoneNumbers Phn on Phn.PhoneNumberId = P.PhoneNumberId
--JOIN dbo.Emails Eml on Eml.EmailId = P.EmailId
--JOIN dbo.Adresses Ad on Ad.AdressId = P.AdressId

CREATE VIEW [dbo].[V_Companies]
AS
SELECT CompanyId, CompanyName, Ad.City, Ad.Adress1, DeliveryServiceName, WorkPhoneNumber, WorkMail, Peop.LastName, Peop.FirstName
FROM dbo.Companies Cmp
JOIN dbo.Adresses Ad on Ad.AdressId = Cmp.AdressId
JOIN dbo.DeliveryServices DS on DS.DeliveryServiceId = Cmp.PreferredDeliveryServiceId
JOIN dbo. PhoneNumbers Phn on Phn.PhoneNumberId = Cmp.PhoneNumberId
JOIN dbo.Emails Eml on Eml.EmailId = Cmp.EmailId
JOIN dbo.People Peop on Peop.PersonId = Cmp.PreferredCompanyAgentId



GO
/****** Object:  Table [dbo].[CompaniesProviders]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompaniesProviders](
	[CompanyProviderId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyProviderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_CompaniesProviders]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--select * from dbo.Categories order by CategoryId

--select * 
--from dbo.CarModels CB

--select * 
--from dbo.CarBrands

--SELECT P.ProductId, P.VendorCode, P.ProductName, M.ManufacturerName, C.CountryName, Br.BrandName, CM.CarModelName, CM.EngineType, Ct.CategoryName, 
--P.PurchasedPrice, P.SellingPrice, P.QuantityNumber
--FROM dbo.Products P
--JOIN dbo.Manufacturers M on M.ManufacturerId = P.ManufacturerId
--JOIN dbo.Countries C on C.CountryId = M.CountryId
--JOIN dbo.CarModels CM on CM.CarModelId = P.CarModelId
--JOIN dbo.CarBrands Br on Br.BrandId = CM.BrandId
--JOIN dbo.Categories Ct on Ct.CategoryId = P.CategoryId

--select *
--from dbo. countries

--select *
--from dbo.Manufacturers

--SELECT *
--FROM dbo.DeliveryServices

--SELECT *
--FROM dbo.Adresses

--SELECT *
--FROM dbo.PhoneNumbers


--SELECT *
--FROM dbo.Emails

--select *
--from dbo.People

--select * from v_Products
--select * 
--from dbo.emails

--SELECT PersonId, FirstName, LastName, WorkPhoneNumber, CellPhoneNumber, HomePhoneNumber, City,  Adress1, Adress2
--FROM dbo.People P
--JOIN dbo.PhoneNumbers Phn on Phn.PhoneNumberId = P.PhoneNumberId
--JOIN dbo.Emails Eml on Eml.EmailId = P.EmailId
--JOIN dbo.Adresses Ad on Ad.AdressId = P.AdressId

CREATE VIEW [dbo].[V_CompaniesProviders]
AS
SELECT CP.CompanyId, CompanyName as 'CompanyProviderName', Ad.City, Ad.Adress1, DeliveryServiceName, WorkPhoneNumber, WorkMail, Peop.LastName, Peop.FirstName
FROM dbo.CompaniesProviders CP
JOIN dbo.Companies Cmp on Cmp.CompanyId =  CP.CompanyId
JOIN dbo.Adresses Ad on Ad.AdressId = Cmp.AdressId
JOIN dbo.DeliveryServices DS on DS.DeliveryServiceId = Cmp.PreferredDeliveryServiceId
JOIN dbo. PhoneNumbers Phn on Phn.PhoneNumberId = Cmp.PhoneNumberId
JOIN dbo.Emails Eml on Eml.EmailId = Cmp.EmailId
JOIN dbo.People Peop on Peop.PersonId = Cmp.PreferredCompanyAgentId


GO
/****** Object:  Table [dbo].[CompaniesClients]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompaniesClients](
	[CompanyClientId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_CompaniesClients]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_CompaniesClients]
AS
SELECT CP.CompanyId, CompanyName as 'CompanyClientName', Ad.City, Ad.Adress1, DeliveryServiceName, WorkPhoneNumber, WorkMail, Peop.LastName, Peop.FirstName
FROM dbo.CompaniesClients CP
JOIN dbo.Companies Cmp on Cmp.CompanyId =  CP.CompanyId
JOIN dbo.Adresses Ad on Ad.AdressId = Cmp.AdressId
JOIN dbo.DeliveryServices DS on DS.DeliveryServiceId = Cmp.PreferredDeliveryServiceId
JOIN dbo. PhoneNumbers Phn on Phn.PhoneNumberId = Cmp.PhoneNumberId
JOIN dbo.Emails Eml on Eml.EmailId = Cmp.EmailId
JOIN dbo.People Peop on Peop.PersonId = Cmp.PreferredCompanyAgentId

GO
/****** Object:  Table [dbo].[WorkPositions]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkPositions](
	[WorkPositionId] [int] IDENTITY(1,1) NOT NULL,
	[WorkPositionName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WorkPositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NULL,
	[WorkPositionId] [int] NULL,
	[SalaryRate] [money] NOT NULL,
	[HiredDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Employees]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[V_Employees]
AS
SELECT Emp.EmployeeId ,P.LastName, P.FirstName, Phn.WorkPhoneNumber, Eml.WorkMail, WorkPositionName, SalaryRate
FROM dbo.Employees Emp
JOIN dbo.People P on P.PersonId = Emp.PersonId
JOIN dbo.PhoneNumbers Phn on Phn.PhoneNumberId = P.PhoneNumberId
JOIN dbo.Emails Eml on Eml.EmailId = P.EmailId
JOIN dbo.WorkPositions WP on WP.WorkPositionId = Emp.WorkPositionId
GO
/****** Object:  Table [dbo].[CompanyEmployees]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyEmployees](
	[CompanyEmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NULL,
	[CompanyId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyEmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_CompanyEmployees]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_CompanyEmployees]
AS
SELECT CE.CompanyEmployeeId, CompanyName, P.LastName, P.FirstName, Phn.WorkPhoneNumber, Eml.WorkMail
FROM dbo.CompanyEmployees CE
JOIN dbo.Companies Cmp on Cmp.CompanyId = CE.CompanyId
JOIN dbo.People P on P.PersonId = CE.PersonId
JOIN dbo.PhoneNumbers Phn on Phn.PhoneNumberId = P.PhoneNumberId
JOIN dbo.Emails Eml on Eml.EmailId = P.EmailId
GO
/****** Object:  Table [dbo].[CheckDetails]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckDetails](
	[CheckDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[CheckId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[SaledPrice] [money] NOT NULL,
	[NumberOfProducts] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CheckDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_CheckDetails]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--use AutopartsShop
--GO	
	--create database AutopartsShop

--CREATE TABLE Categories
--(
--	CategoryId INT IDENTITY(1,1) PRIMARY KEY,
--	CategoryName NVARCHAR (100) NOT NULL UNIQUE
--)

--INSERT INTO dbo.Categories(CategoryName) VALUES ('Engine'), ('Lubrication system'), ('Cooling system'), ('Fuel injection system'), ('Braking system'), ('Exhaust system'), ('Transmission'), ('Chassis'), ('Electrical equipment'), ('Steering system'),  ('Ventilation and heating system'), 
--('Filters'), ('Carcass')

--select * from dbo.Categories order by CategoryId

--CREATE TABLE Countries
--(
--	CountryId INT IDENTITY(1,1) PRIMARY KEY,
--	CountryName NVARCHAR (100) NOT NULL UNIQUE
--)

--INSERT INTO dbo.Countries(CountryName) VALUES('Russia'), ('USA'), ('China'), ('India'), ('Ukraine'), ('Taiwan'), ('Germany'), ('France'), ('Sweden'), ('Switzerland'), ('Japan'), ('Italy'), ('Great Britain'), ('Czech Republic'), ('South Korea'), ('Israel'), ('Turkey')

--INSERT INTO dbo.Countries(CountryName) VALUES ('Poland')
--select * from dbo.Countries


--CREATE TABLE CarBrands
--(
--	BrandId INT IDENTITY(1,1) PRIMARY KEY,
--	BrandName NVARCHAR (100) NOT NULL UNIQUE,
--	CountryId INT FOREIGN KEY REFERENCES dbo.Countries(CountryId)
--)

--INSERT INTO dbo.CarBrands (BrandName, CountryId) VALUES ('VAZ', 1), ('ZAZ', 1), ('UAZ', 1), ('GAZ', 1), ('Mercedes-Benz', 7), ('BMW', 7), ('Porsche', 7)

--select BrandName, CountryName
--from dbo.CarBrands CB
--join dbo.Countries Cn on Cn.CountryId = CB.CountryId

--select * 
--from dbo.CarBrands CB

--CREATE TABLE Manufacturers
--(
--	ManufacturerId INT IDENTITY(1,1) PRIMARY KEY,
--	ManufacturerName NVARCHAR (100) NOT NULL ,
--	CountryId INT FOREIGN KEY REFERENCES dbo.Countries(CountryId)
--)

--INSERT INTO dbo.Manufacturers (ManufacturerName, CountryId) VALUES ('VBF', 1), ('GAZ', 1 ), ('VAZ', 1), ('DK', 3), ('Herzog', 7), ('Truckman', 17), ('LSA', 3), ('Hola', 18), ('Riginal', 1), ('ZMZ', 1), ('Sachs', 7)

--INSERT INTO dbo.Manufacturers (ManufacturerName, CountryId) VALUES ('GAZ', 3 )
 --INSERT INTO dbo.Manufacturers (ManufacturerName, CountryId) VALUES ('UMZ', 3 )
 --INSERT INTO dbo.Manufacturers (ManufacturerName, CountryId) VALUES ('Riginal', 3 )

--Select M.ManufacturerName, C.CountryName
--from dbo.Manufacturers M
--join dbo.Countries C on C.CountryId = M.CountryId

--CREATE TABLE CarModels
--(
--	CarModelId INT IDENTITY(1,1) PRIMARY KEY,
--	CarModelName NVARCHAR (100) NOT NULL ,
--	EngineType NVARCHAR (100) NULL,
--	CarcassType NVARCHAR (100) NULL,
--	OtherSpecification NVARCHAR (100) NULL,
--	BrandId INT FOREIGN KEY REFERENCES dbo.CarBrands(BrandId)
--)

--INSERT INTO dbo.CarModels (CarModelName, EngineType, BrandId) VALUES ('3302', '406', 4), ('3302', '402', 4), ('NEXT', 'Cummins', 4), ('NEXT', 'Evotech', 4), ('3110', '402', 4), ('3110', '406', 4), ('3110', 'Steyr 560', 4)
 --INSERT INTO dbo.CarModels (CarModelName, BrandId) VALUES  ('2110', 1), ('Sprinter', 5), ('469', 3)
 --INSERT INTO dbo.CarModels (CarModelName, EngineType, BrandId) VALUES ('3302', '4215', 4)


--CREATE TABLE Products
--(
--	ProductId INT IDENTITY(1,1) PRIMARY KEY,
--	ProductName NVARCHAR (100) NOT NULL ,
--	VendorCode NVARCHAR (100) NOT NULL ,
--	ProductCardShop NVARCHAR (100) NULL ,
--	ProductCard1 NVARCHAR (100) NULL ,
--	ProductCard2 NVARCHAR (100) NULL ,
--	PurchasedPrice MONEY NOT NULL,
--	SellingPrice MONEY NOT NULL,
--	ManufacturingDate Date NULL,
--	ManufacturerId INT FOREIGN KEY REFERENCES dbo.Manufacturers(ManufacturerId),
--	CarModelId INT FOREIGN KEY REFERENCES dbo.CarModels(CarModelId),
--	CategoryId INT FOREIGN KEY REFERENCES dbo.Categories(CategoryId),
--	QuantityNumber INT NOT NULL
--)

--INSERT INTO dbo.Products (ProductName, ManufacturerId, VendorCode, ProductCard1, CarModelId, CategoryId, PurchasedPrice, SellingPrice )  VALUES
--('Clutch Bag', 13, '063082001150', '051470', 3, 7, 1419.12, '1530'),
--('Clutch Bag', 6, '406.1601090-05', '372414', 1, 7, 575.37, '680'),
--('Flywheel', 15, '4173.1005115-30', '062544', 11, 1, 1003, 1150),
--('Flywheel', 14, '4173.1005115-30', '355999', 11, 1, 1158, 1260)






--CREATE TABLE DeliveryServices
--(
--	DeliveryServiceId INT IDENTITY(1,1) PRIMARY KEY,
--	DeliveryServiceName NVARCHAR (60) NOT NULL
--)

--INSERT INTO dbo.DeliveryServices (DeliveryServiceName) VALUES ('Intime'), ('EXW'), ('Nova Poshta'), ('CAT'), ('Delivery'), ('UkrPoshta'), 
--('Avtolux')

--CREATE TABLE Adresses
--(
--	AdressId INT IDENTITY(1,1) PRIMARY KEY,
--	CountryId INT FOREIGN KEY REFERENCES dbo.Countries(CountryId),
--	City NVARCHAR (60) NOT NULL,
--	Adress1 NVARCHAR (100) NULL,
--	Adress2 NVARCHAR (100) NULL
--)

--INSERT INTO dbo.Adresses (CountryId, City, Adress1) VALUES (5, 'Kharkiv', 'Haharina Avenue 195, flat 14'), (5, 'Kharkiv', 'Autopart market LOSK, row 7, place ?96') 

--CREATE TABLE dbo.PhoneNumbers 
--(
--	PhoneNumberId INT IDENTITY(1,1) PRIMARY KEY,	
--	WorkPhoneNumber NVARCHAR(30) NOT NULL,
--	CellPhoneNumber NVARCHAR(30) NULL,
--	HomePhoneNumber NVARCHAR(30) NULL
--)

--INSERT INTO dbo.PhoneNumbers (WorkPhoneNumber) VALUES ('+380954988787'), ('+380733113838'), ('0577648426'), ('+380506883828'), ('+380507338445')

--CREATE TABLE Emails
--(
--	EmailId INT IDENTITY(1,1) PRIMARY KEY,	
--	WorkMail NVARCHAR(30) NOT NULL,
--	PrivateMail NVARCHAR(30) NULL,
--	HomeMail NVARCHAR(30) NULL
--)
--INSERT INTO dbo.Emails (WorkMail) VALUES ('korzhdc@gmail.com'), ('juliatretiak@gmail.com'), ('omega@gmail.com'), ('sanek7@gmail.com')

--CREATE TABLE People
--(
--	PersonId INT IDENTITY(1,1) PRIMARY KEY,
--	FirstName NVARCHAR (60) NOT NULL,
--	LastName NVARCHAR (60) NOT NULL,
--	MiddleName NVARCHAR (60) NULL,
--	PhoneNumberId INT FOREIGN KEY REFERENCES dbo.PhoneNumbers(PhoneNumberId),
--	EmailId INT FOREIGN KEY REFERENCES dbo.Emails(EmailId),
--	AdressId INT FOREIGN KEY REFERENCES dbo.Adresses (AdressId)
--)

--INSERT INTO dbo.People (LastName,FirstName, PhoneNumberId, EmailId, AdressId) VALUES ('Lukina','Innesa',


--CREATE TABLE Companies
--(
--	CompanyId INT IDENTITY(1,1) PRIMARY KEY,
--	CompanyName NVARCHAR (60) NOT NULL,
--	AdressId INT FOREIGN KEY REFERENCES dbo.Adresses (AdressId),	
--	PreferredDeliveryServiceId INT FOREIGN KEY REFERENCES dbo.DeliveryServices(DeliveryServiceId),
--	PreferredDeliveryServiceDepartment NVARCHAR (30) NULL,
--	PhoneNumberId INT FOREIGN KEY REFERENCES dbo.PhoneNumbers(PhoneNumberId),
--	PreferredCompanyAgentId INT FOREIGN KEY REFERENCES dbo.People(PersonId), 
--  EmailId INT FOREIGN KEY REFERENCES dbo.Emails (EmailId)
--)

--EXEC sp_InsertPerson 'Lukin', 'Ihor', '+380669611867', 'lukinid@mail.ru', 'Kharkiv', 'Autoparts market LOSK, row 1, place 20'


--INSERT INTO dbo.Companies (CompanyName, AdressId, PreferredDeliveryServiceId, PreferredDeliveryServiceDepartment, PhoneNumberId, PreferredCompanyAgentId)
--VALUES ('LiderAuto', 4, 2, 'Their office', 9, 3)


--CREATE TABLE CompanyEmployee
--(
--	CompanyEmployeeId INT IDENTITY(1,1) PRIMARY KEY,
--	PersonId INT FOREIGN KEY REFERENCES dbo.People(PersonId), 
--	CompanyId INT FOREIGN KEY REFERENCES dbo.Companies(CompanyId)
--)
--SELECT * from V_People
--SELECT * FROM V_Companies

--Insert into dbo.CompanyEmployee (PersonId, CompanyId) VALUES (2,2), (3,2), (4,4), (1,4)



--CREATE TABLE CompaniesProviders
--(
--	CompanyProviderId INT IDENTITY(1,1) PRIMARY KEY,
--	CompanyId INT FOREIGN KEY REFERENCES dbo.Companies(CompanyId) 
--)

--CREATE TABLE CompaniesClients
--(
--	CompanyProviderId INT IDENTITY(1,1) PRIMARY KEY,
--	CompanyId INT FOREIGN KEY REFERENCES dbo.Companies(CompanyId) 
--)

--CREATE TABLE WorkPositions
--(
--	WorkPositionId INT IDENTITY(1,1) PRIMARY KEY,
--	WorkPositionName NVARCHAR(50) NOT NULL UNIQUE
--)


--CREATE TABLE Employees
--(
--	EmployeeId  INT IDENTITY(1,1) PRIMARY KEY,
--	PersonId INT FOREIGN KEY REFERENCES dbo.People(PersonId),
--	WorkPositionId INT FOREIGN KEY REFERENCES dbo.WorkPositions(WorkPositionId),
--	SalaryRate MONEY NOT NULL,
--	HiredDate DATE NOT NULL
--)

--CREATE TABLE Checks
--(
--	CheckId  INT IDENTITY(1,1) PRIMARY KEY,
--	EmployeeId INT FOREIGN KEY REFERENCES dbo.Employees(EmployeeId),
--	DateOfIssue DATETIME NOT NULL,
--	TotalSum MONEY  NOT NULL	
--)

--ALTER TABLE dbo.Checks
--DROP COLUMN TimeOfIssue 

--CREATE TABLE CheckDetails 
--(
--	CheckDetailsId INT IDENTITY(1,1) PRIMARY KEY,
--	CheckId INT FOREIGN KEY REFERENCES dbo.Checks(CheckId) NOT NULL,
--	ProductId INT FOREIGN KEY REFERENCES dbo.Products(ProductId) NOT NULL,
--	SaledPrice MONEY NOT NULL,
--	NumberOfProducts INT NOT NULL
--)


--SELECT * FROM dbo.v_Products

--select * from v_Employees



--INSERT INTO dbo.Checks (EmployeeId, DateOfIssue, TotalSum) VALUES (1, GETDATE(), 45180)
--select * from dbo.Checks
--select * from v_Products

--INSERT INTO dbo.CheckDetails (CheckId, ProductId, SaledPrice, NumberOfProducts) VALUES (1,3,1530,7), (1,4,680,8), (1,5,1150,11), (1,6,1260,13)

--select * from dbo.CheckDetails

--select * from  v_Products

--SELECT *
--from V_CompaniesProviders

--Select *
--From V_CompaniesClients

--select *
--from V_Companies

--select *
--from dbo.Adresses

--exec sp_InsertCompany 'KRZautoparts', 'Sumskaya 11', 'Kharkiv', 'krzautoparts@gmail.com', '+380954988787', 3, 'Pochtomat 1020, Pushkinska 10, Kharkiv', 6



--INT FOREIGN KEY REFERENCES dbo.CompaniesClients(CompanyClientId);
--ADD COLUMN CompanyProviderId INT FOREIGN KEY REFERENCES dbo.CompaniesProviders()

--update dbo.Checks
--SET CompanyClientId = 2
--where CheckId = 1

--ALTER TABLE dbo.Checks
--ADD CompanyEmployeeId INT FOREIGN KEY REFERENCES dbo.CompanyEmployees(CompanyEmployeeId)


--INSERT INTO dbo.CompanyEmployees(CompanyId, PersonId) Values(5,5)

--update dbo.Checks
--SET CustomerCompanyEmployeeId = 5
--WHERE CheckId = 1

--select * 
--from V_CompaniesClients

--select *
--from Companies

--select *
--from People


--select * from
--dbo.V_Employees

--select * 
--from V_CompanyEmployees


--CREATE VIEW V_Checks
--AS
--SELECT Chk.CheckId, Emp.LastName as 'Employee last name', Emp.FirstName as 'Employee first name', CE.CompanyName,
-- Ce.LastName  as 'Client last name', CE.FirstName as 'Client first name', Chk.DateOfIssue, Chk.TotalSum
--FROM dbo.Checks Chk
--JOIN V_Employees Emp on Emp.EmployeeId = Chk.EmployeeId
--JOIN dbo.V_CompanyEmployees CE on CE.CompanyEmployeeId = Chk.CustomerCompanyEmployeeId
CREATE VIEW [dbo].[V_CheckDetails]
AS
Select CheckId, ChD.ProductId, VendorCode, ProductName, ManufacturerName, CarModelName, EngineType, PurchasedPrice, SellingPrice, ChD.NumberOfProducts
from dbo.CheckDetails ChD
JOIN dbo.V_Products Pr on Pr.ProductId = ChD.ProductId 

--JOIN dbo.CompaniesProviders CmpP on CmpP.CompanyProviderId = Chk.CompanyProviderId

--JOIN dbo.CompaniesClients CmpC on Cmpc.CompanyClientId = Chk.CompanyClientId
--JOIN dbo.Companies CmpCl on CmpCl.CompanyId = CmpC.CompanyId
  


GO
/****** Object:  Table [dbo].[Checks]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Checks](
	[CheckId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NULL,
	[DateOfIssue] [datetime] NOT NULL,
	[TotalSum] [money] NOT NULL,
	[CustomerCompanyEmployeeId] [int] NULL,
	[TypeOfCheckId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CheckId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypesOfCheck]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypesOfCheck](
	[TypeOfCheckId] [int] IDENTITY(1,1) NOT NULL,
	[TypeOfCheckName] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeOfCheckId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Checks]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[V_Checks]
AS
SELECT Chk.CheckId, TOC.TypeOfCheckName, Emp.LastName as 'Employee last name', Emp.FirstName as 'Employee first name', CE.CompanyName,
 Ce.LastName  as 'Client last name', CE.FirstName as 'Client first name', Chk.DateOfIssue, Chk.TotalSum
FROM dbo.Checks Chk
JOIN V_Employees Emp on Emp.EmployeeId = Chk.EmployeeId
JOIN dbo.V_CompanyEmployees CE on CE.CompanyEmployeeId = Chk.CustomerCompanyEmployeeId
JOIN dbo.TypesOfCheck TOC on Chk.TypeOfCheckId = TOC.TypeOfCheckId
GO
/****** Object:  Table [dbo].[DeliveryAdditionalInformation]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryAdditionalInformation](
	[DeliveryAdditionalInformationId] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryReceiptId] [int] NOT NULL,
	[NumberOfPlaces] [int] NULL,
	[Weight] [float] NULL,
	[CostOfService] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryAdditionalInformationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryReceipt]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryReceipt](
	[DeliveryReceiptId] [int] IDENTITY(1,1) NOT NULL,
	[AdressId] [int] NOT NULL,
	[ArrivalDate] [datetime] NOT NULL,
	[CheckId] [int] NOT NULL,
	[CompanyEmployeeId] [int] NOT NULL,
	[Comments] [nvarchar](100) NULL,
	[DeliveryServiceId] [int] NOT NULL,
	[DeliveryServiceReceiptNumber] [nvarchar](35) NOT NULL,
	[DeliveryStatusId] [int] NOT NULL,
	[DepartureDate] [datetime] NOT NULL,
	[TypeOfPaymentId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryReceiptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryStatuses]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryStatuses](
	[DeliveryStatusId] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryStatusName] [nvarchar](35) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypesOfPayment]    Script Date: 12/11/2017 11:36:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypesOfPayment](
	[TypeOfPaymentId] [int] IDENTITY(1,1) NOT NULL,
	[TypeOfPaymentName] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeOfPaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Adresses] ON 

INSERT [dbo].[Adresses] ([AdressId], [CountryId], [City], [Adress1], [Adress2]) VALUES (1, 5, N'Харьков', N'Проспект Гагарина 195, кв. 14', NULL)
INSERT [dbo].[Adresses] ([AdressId], [CountryId], [City], [Adress1], [Adress2]) VALUES (2, 5, N'Харьков', N'Авторынок ЛОСК, ряд 7, место 96', NULL)
INSERT [dbo].[Adresses] ([AdressId], [CountryId], [City], [Adress1], [Adress2]) VALUES (3, 5, N'Харьков', N'Проспект Гагарина 195, кв. 14', NULL)
INSERT [dbo].[Adresses] ([AdressId], [CountryId], [City], [Adress1], [Adress2]) VALUES (4, 5, N'Харьков', N'Авторынок ЛОСК, ряд 1, место 20', NULL)
INSERT [dbo].[Adresses] ([AdressId], [CountryId], [City], [Adress1], [Adress2]) VALUES (5, 5, N'Харьков', N'Авторынок ЛОСК, ряд 1, место 20', NULL)
INSERT [dbo].[Adresses] ([AdressId], [CountryId], [City], [Adress1], [Adress2]) VALUES (6, 5, N'Харьков', N'Авторынок ЛОСК, ряд 7, место 110', NULL)
INSERT [dbo].[Adresses] ([AdressId], [CountryId], [City], [Adress1], [Adress2]) VALUES (7, 5, N'Харьков', N'Авторынок ЛОСК', NULL)
INSERT [dbo].[Adresses] ([AdressId], [CountryId], [City], [Adress1], [Adress2]) VALUES (8, 5, N'Харьков', N'Авторынок ЛОСК', NULL)
INSERT [dbo].[Adresses] ([AdressId], [CountryId], [City], [Adress1], [Adress2]) VALUES (9, 5, N'Харьков', N'По умолчанию', NULL)
INSERT [dbo].[Adresses] ([AdressId], [CountryId], [City], [Adress1], [Adress2]) VALUES (10, 5, N'Харьков', N'Бульвар Юрьева 20', NULL)
INSERT [dbo].[Adresses] ([AdressId], [CountryId], [City], [Adress1], [Adress2]) VALUES (11, 5, N'Харьков', N'Катериненская 11, кв. 16', NULL)
INSERT [dbo].[Adresses] ([AdressId], [CountryId], [City], [Adress1], [Adress2]) VALUES (12, 5, N'Харьков', N'Молочная 11, кв. 7', NULL)
INSERT [dbo].[Adresses] ([AdressId], [CountryId], [City], [Adress1], [Adress2]) VALUES (13, 5, N'Харьков', N'Сумская 11', NULL)
SET IDENTITY_INSERT [dbo].[Adresses] OFF
SET IDENTITY_INSERT [dbo].[CarBrands] ON 

INSERT [dbo].[CarBrands] ([BrandId], [BrandName], [CountryId]) VALUES (1, N'ВАЗ', 1)
INSERT [dbo].[CarBrands] ([BrandId], [BrandName], [CountryId]) VALUES (2, N'ЗАЗ', 1)
INSERT [dbo].[CarBrands] ([BrandId], [BrandName], [CountryId]) VALUES (3, N'УАЗ', 1)
INSERT [dbo].[CarBrands] ([BrandId], [BrandName], [CountryId]) VALUES (4, N'ГАЗ', 1)
INSERT [dbo].[CarBrands] ([BrandId], [BrandName], [CountryId]) VALUES (5, N'Mercedes-Benz', 7)
INSERT [dbo].[CarBrands] ([BrandId], [BrandName], [CountryId]) VALUES (6, N'BMW', 7)
INSERT [dbo].[CarBrands] ([BrandId], [BrandName], [CountryId]) VALUES (7, N'Porsche', 7)
SET IDENTITY_INSERT [dbo].[CarBrands] OFF
SET IDENTITY_INSERT [dbo].[CarModels] ON 

INSERT [dbo].[CarModels] ([CarModelId], [CarModelName], [EngineType], [CarcassType], [OtherSpecification], [BrandId]) VALUES (1, N'3302', N'406', NULL, NULL, 4)
INSERT [dbo].[CarModels] ([CarModelId], [CarModelName], [EngineType], [CarcassType], [OtherSpecification], [BrandId]) VALUES (2, N'3302', N'402', NULL, NULL, 4)
INSERT [dbo].[CarModels] ([CarModelId], [CarModelName], [EngineType], [CarcassType], [OtherSpecification], [BrandId]) VALUES (3, N'NEXT', N'Cummins', NULL, NULL, 4)
INSERT [dbo].[CarModels] ([CarModelId], [CarModelName], [EngineType], [CarcassType], [OtherSpecification], [BrandId]) VALUES (4, N'NEXT', N'Evotech', NULL, NULL, 4)
INSERT [dbo].[CarModels] ([CarModelId], [CarModelName], [EngineType], [CarcassType], [OtherSpecification], [BrandId]) VALUES (5, N'3110', N'402', NULL, NULL, 4)
INSERT [dbo].[CarModels] ([CarModelId], [CarModelName], [EngineType], [CarcassType], [OtherSpecification], [BrandId]) VALUES (6, N'3110', N'406', NULL, NULL, 4)
INSERT [dbo].[CarModels] ([CarModelId], [CarModelName], [EngineType], [CarcassType], [OtherSpecification], [BrandId]) VALUES (7, N'3110', N'Steyr 560', NULL, NULL, 4)
INSERT [dbo].[CarModels] ([CarModelId], [CarModelName], [EngineType], [CarcassType], [OtherSpecification], [BrandId]) VALUES (8, N'2110', NULL, NULL, NULL, 1)
INSERT [dbo].[CarModels] ([CarModelId], [CarModelName], [EngineType], [CarcassType], [OtherSpecification], [BrandId]) VALUES (9, N'Sprinter', NULL, NULL, NULL, 5)
INSERT [dbo].[CarModels] ([CarModelId], [CarModelName], [EngineType], [CarcassType], [OtherSpecification], [BrandId]) VALUES (10, N'469', NULL, NULL, NULL, 3)
INSERT [dbo].[CarModels] ([CarModelId], [CarModelName], [EngineType], [CarcassType], [OtherSpecification], [BrandId]) VALUES (11, N'3302', N'4215', NULL, NULL, 4)
SET IDENTITY_INSERT [dbo].[CarModels] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (11, N'Вентиляция и отопление')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (6, N'Выхлопная вистема')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (1, N'Двигатель')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (13, N'Кузов')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (10, N'Рулевое управление')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (4, N'Система впрыска топлива')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (3, N'Система охлаждения')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (2, N'Система смазки')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (5, N'Тормозная система')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (7, N'Трансмиссия')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (12, N'Фильтры')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (8, N'Ходовая')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (9, N'Электрооборудование')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[CheckDetails] ON 

INSERT [dbo].[CheckDetails] ([CheckDetailsId], [CheckId], [ProductId], [SaledPrice], [NumberOfProducts]) VALUES (1, 1, 3, 1530.0000, 7)
INSERT [dbo].[CheckDetails] ([CheckDetailsId], [CheckId], [ProductId], [SaledPrice], [NumberOfProducts]) VALUES (2, 1, 4, 680.0000, 8)
INSERT [dbo].[CheckDetails] ([CheckDetailsId], [CheckId], [ProductId], [SaledPrice], [NumberOfProducts]) VALUES (3, 1, 5, 1150.0000, 11)
INSERT [dbo].[CheckDetails] ([CheckDetailsId], [CheckId], [ProductId], [SaledPrice], [NumberOfProducts]) VALUES (4, 1, 6, 1260.0000, 13)
SET IDENTITY_INSERT [dbo].[CheckDetails] OFF
SET IDENTITY_INSERT [dbo].[Checks] ON 

INSERT [dbo].[Checks] ([CheckId], [EmployeeId], [DateOfIssue], [TotalSum], [CustomerCompanyEmployeeId], [TypeOfCheckId]) VALUES (1, 1, CAST(N'2017-12-01T10:52:32.080' AS DateTime), 45180.0000, 5, 1)
SET IDENTITY_INSERT [dbo].[Checks] OFF
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([CompanyId], [CompanyName], [AdressId], [PreferredDeliveryServiceId], [PreferredDeliveryServiceDepartment], [PhoneNumberId], [PreferredCompanyAgentId], [EmailId]) VALUES (2, N'LiderAuto', 4, 2, N'Офис компании', 9, 3, 7)
INSERT [dbo].[Companies] ([CompanyId], [CompanyName], [AdressId], [PreferredDeliveryServiceId], [PreferredDeliveryServiceDepartment], [PhoneNumberId], [PreferredCompanyAgentId], [EmailId]) VALUES (4, N'Trade Rocket', 8, 2, N'Офис компании', 12, 4, 10)
INSERT [dbo].[Companies] ([CompanyId], [CompanyName], [AdressId], [PreferredDeliveryServiceId], [PreferredDeliveryServiceDepartment], [PhoneNumberId], [PreferredCompanyAgentId], [EmailId]) VALUES (5, N'Авторынок ЛОСК', 10, 2, N'Самовывоз', 14, 5, 12)
INSERT [dbo].[Companies] ([CompanyId], [CompanyName], [AdressId], [PreferredDeliveryServiceId], [PreferredDeliveryServiceDepartment], [PhoneNumberId], [PreferredCompanyAgentId], [EmailId]) VALUES (6, N'KRZautoparts', 13, 3, N'Почтомат 1020, Пушкинская 10', 17, 6, 15)
SET IDENTITY_INSERT [dbo].[Companies] OFF
SET IDENTITY_INSERT [dbo].[CompaniesClients] ON 

INSERT [dbo].[CompaniesClients] ([CompanyClientId], [CompanyId]) VALUES (1, 4)
INSERT [dbo].[CompaniesClients] ([CompanyClientId], [CompanyId]) VALUES (2, 5)
INSERT [dbo].[CompaniesClients] ([CompanyClientId], [CompanyId]) VALUES (3, 6)
SET IDENTITY_INSERT [dbo].[CompaniesClients] OFF
SET IDENTITY_INSERT [dbo].[CompaniesProviders] ON 

INSERT [dbo].[CompaniesProviders] ([CompanyProviderId], [CompanyId]) VALUES (1, 2)
INSERT [dbo].[CompaniesProviders] ([CompanyProviderId], [CompanyId]) VALUES (2, 5)
INSERT [dbo].[CompaniesProviders] ([CompanyProviderId], [CompanyId]) VALUES (3, 6)
SET IDENTITY_INSERT [dbo].[CompaniesProviders] OFF
SET IDENTITY_INSERT [dbo].[CompanyEmployees] ON 

INSERT [dbo].[CompanyEmployees] ([CompanyEmployeeId], [PersonId], [CompanyId]) VALUES (1, 2, 2)
INSERT [dbo].[CompanyEmployees] ([CompanyEmployeeId], [PersonId], [CompanyId]) VALUES (2, 3, 2)
INSERT [dbo].[CompanyEmployees] ([CompanyEmployeeId], [PersonId], [CompanyId]) VALUES (3, 4, 4)
INSERT [dbo].[CompanyEmployees] ([CompanyEmployeeId], [PersonId], [CompanyId]) VALUES (4, 1, 4)
INSERT [dbo].[CompanyEmployees] ([CompanyEmployeeId], [PersonId], [CompanyId]) VALUES (5, 5, 5)
SET IDENTITY_INSERT [dbo].[CompanyEmployees] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (13, N'Великобритания')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (7, N'Германия')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (16, N'Израиль')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (4, N'Индия')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (12, N'Италия')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (3, N'Китай')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (18, N'Польша')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (1, N'Россия')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (2, N'США')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (6, N'Тайвань')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (17, N'Турция')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (5, N'Украина')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (8, N'Франция')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (14, N'Чехия')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (10, N'Швейцария')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (9, N'Швеция')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (15, N'Южная Корея')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (11, N'Япония')
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[DeliveryServices] ON 

INSERT [dbo].[DeliveryServices] ([DeliveryServiceId], [DeliveryServiceName]) VALUES (1, N'Интайм')
INSERT [dbo].[DeliveryServices] ([DeliveryServiceId], [DeliveryServiceName]) VALUES (2, N'Самовывоз')
INSERT [dbo].[DeliveryServices] ([DeliveryServiceId], [DeliveryServiceName]) VALUES (3, N'Новая Почта')
INSERT [dbo].[DeliveryServices] ([DeliveryServiceId], [DeliveryServiceName]) VALUES (4, N'САТ')
INSERT [dbo].[DeliveryServices] ([DeliveryServiceId], [DeliveryServiceName]) VALUES (5, N'Деливери')
INSERT [dbo].[DeliveryServices] ([DeliveryServiceId], [DeliveryServiceName]) VALUES (6, N'УкрПочта')
INSERT [dbo].[DeliveryServices] ([DeliveryServiceId], [DeliveryServiceName]) VALUES (7, N'Автолюкс')
SET IDENTITY_INSERT [dbo].[DeliveryServices] OFF
SET IDENTITY_INSERT [dbo].[DeliveryStatuses] ON 

INSERT [dbo].[DeliveryStatuses] ([DeliveryStatusId], [DeliveryStatusName]) VALUES (3, N'В очереди на отправку')
INSERT [dbo].[DeliveryStatuses] ([DeliveryStatusId], [DeliveryStatusName]) VALUES (1, N'Отправлено')
INSERT [dbo].[DeliveryStatuses] ([DeliveryStatusId], [DeliveryStatusName]) VALUES (2, N'Прибыл')
SET IDENTITY_INSERT [dbo].[DeliveryStatuses] OFF
SET IDENTITY_INSERT [dbo].[Emails] ON 

INSERT [dbo].[Emails] ([EmailId], [WorkMail], [PrivateMail], [HomeMail]) VALUES (1, N'korzhdc@gmail.com', NULL, NULL)
INSERT [dbo].[Emails] ([EmailId], [WorkMail], [PrivateMail], [HomeMail]) VALUES (2, N'juliatretiak@gmail.com', NULL, NULL)
INSERT [dbo].[Emails] ([EmailId], [WorkMail], [PrivateMail], [HomeMail]) VALUES (3, N'omega@gmail.com', NULL, NULL)
INSERT [dbo].[Emails] ([EmailId], [WorkMail], [PrivateMail], [HomeMail]) VALUES (4, N'sanek7@gmail.com', NULL, NULL)
INSERT [dbo].[Emails] ([EmailId], [WorkMail], [PrivateMail], [HomeMail]) VALUES (5, N'lukina@mail.ru', NULL, NULL)
INSERT [dbo].[Emails] ([EmailId], [WorkMail], [PrivateMail], [HomeMail]) VALUES (6, N'coolnina@gmail.com', NULL, NULL)
INSERT [dbo].[Emails] ([EmailId], [WorkMail], [PrivateMail], [HomeMail]) VALUES (7, N'lukinid@mail.ru', NULL, NULL)
INSERT [dbo].[Emails] ([EmailId], [WorkMail], [PrivateMail], [HomeMail]) VALUES (8, N'leshaomega@gmail.com', NULL, NULL)
INSERT [dbo].[Emails] ([EmailId], [WorkMail], [PrivateMail], [HomeMail]) VALUES (9, N'traderocket@gmail.com', NULL, NULL)
INSERT [dbo].[Emails] ([EmailId], [WorkMail], [PrivateMail], [HomeMail]) VALUES (10, N'traderocket@gmail.com', NULL, NULL)
INSERT [dbo].[Emails] ([EmailId], [WorkMail], [PrivateMail], [HomeMail]) VALUES (11, N'None', NULL, NULL)
INSERT [dbo].[Emails] ([EmailId], [WorkMail], [PrivateMail], [HomeMail]) VALUES (12, N'NONE', NULL, NULL)
INSERT [dbo].[Emails] ([EmailId], [WorkMail], [PrivateMail], [HomeMail]) VALUES (13, N'krzautoparts@gmail.com', NULL, NULL)
INSERT [dbo].[Emails] ([EmailId], [WorkMail], [PrivateMail], [HomeMail]) VALUES (14, N'tretiakjulia@gmail.com', NULL, NULL)
INSERT [dbo].[Emails] ([EmailId], [WorkMail], [PrivateMail], [HomeMail]) VALUES (15, N'krzautoparts@gmail.com', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Emails] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeId], [PersonId], [WorkPositionId], [SalaryRate], [HiredDate]) VALUES (1, 6, 2, 15000.0000, CAST(N'2017-11-30' AS Date))
INSERT [dbo].[Employees] ([EmployeeId], [PersonId], [WorkPositionId], [SalaryRate], [HiredDate]) VALUES (2, 7, 5, 10000.0000, CAST(N'2017-11-30' AS Date))
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Manufacturers] ON 

INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (1, N'ВПЗ', 1)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (2, N'ГАЗ', 1)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (3, N'ВАЗ', 1)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (4, N'Дорожная Карта', 3)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (5, N'Herzog', 7)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (6, N'Truckman', 17)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (7, N'LSA', 3)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (8, N'Hola', 18)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (10, N'ЗМЗ', 1)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (11, N'Sachs', 7)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (13, N'ГАЗ*', 3)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (14, N'Riginal', 1)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (15, N'УМЗ', 1)
SET IDENTITY_INSERT [dbo].[Manufacturers] OFF
SET IDENTITY_INSERT [dbo].[People] ON 

INSERT [dbo].[People] ([PersonId], [FirstName], [LastName], [MiddleName], [PhoneNumberId], [EmailId], [AdressId]) VALUES (1, N'Нина', N'Логвинова', NULL, 8, 6, 1)
INSERT [dbo].[People] ([PersonId], [FirstName], [LastName], [MiddleName], [PhoneNumberId], [EmailId], [AdressId]) VALUES (2, N'Иннеса', N'Лукина', NULL, 6, 5, 4)
INSERT [dbo].[People] ([PersonId], [FirstName], [LastName], [MiddleName], [PhoneNumberId], [EmailId], [AdressId]) VALUES (3, N'Игорь', N'Лукин', NULL, 9, 7, 5)
INSERT [dbo].[People] ([PersonId], [FirstName], [LastName], [MiddleName], [PhoneNumberId], [EmailId], [AdressId]) VALUES (4, N'Алексей', N'Долгополов', NULL, 10, 8, 6)
INSERT [dbo].[People] ([PersonId], [FirstName], [LastName], [MiddleName], [PhoneNumberId], [EmailId], [AdressId]) VALUES (5, N'Клиент', N'По умолчанию', NULL, 13, 11, 9)
INSERT [dbo].[People] ([PersonId], [FirstName], [LastName], [MiddleName], [PhoneNumberId], [EmailId], [AdressId]) VALUES (6, N'Даниил', N'Корженевский', NULL, 15, 13, 11)
INSERT [dbo].[People] ([PersonId], [FirstName], [LastName], [MiddleName], [PhoneNumberId], [EmailId], [AdressId]) VALUES (7, N'Юлия', N'Третьяк', NULL, 16, 14, 12)
SET IDENTITY_INSERT [dbo].[People] OFF
SET IDENTITY_INSERT [dbo].[PhoneNumbers] ON 

INSERT [dbo].[PhoneNumbers] ([PhoneNumberId], [WorkPhoneNumber], [CellPhoneNumber], [HomePhoneNumber]) VALUES (1, N'+380954988787', NULL, NULL)
INSERT [dbo].[PhoneNumbers] ([PhoneNumberId], [WorkPhoneNumber], [CellPhoneNumber], [HomePhoneNumber]) VALUES (2, N'+380733113838', NULL, NULL)
INSERT [dbo].[PhoneNumbers] ([PhoneNumberId], [WorkPhoneNumber], [CellPhoneNumber], [HomePhoneNumber]) VALUES (3, N'0577648426', NULL, NULL)
INSERT [dbo].[PhoneNumbers] ([PhoneNumberId], [WorkPhoneNumber], [CellPhoneNumber], [HomePhoneNumber]) VALUES (4, N'+380506883828', NULL, NULL)
INSERT [dbo].[PhoneNumbers] ([PhoneNumberId], [WorkPhoneNumber], [CellPhoneNumber], [HomePhoneNumber]) VALUES (5, N'+380507338445', NULL, NULL)
INSERT [dbo].[PhoneNumbers] ([PhoneNumberId], [WorkPhoneNumber], [CellPhoneNumber], [HomePhoneNumber]) VALUES (6, N'+380956799878', N'+380662144607', NULL)
INSERT [dbo].[PhoneNumbers] ([PhoneNumberId], [WorkPhoneNumber], [CellPhoneNumber], [HomePhoneNumber]) VALUES (7, N'+380931500039', N'+380663831445', NULL)
INSERT [dbo].[PhoneNumbers] ([PhoneNumberId], [WorkPhoneNumber], [CellPhoneNumber], [HomePhoneNumber]) VALUES (8, N'380991891496', NULL, NULL)
INSERT [dbo].[PhoneNumbers] ([PhoneNumberId], [WorkPhoneNumber], [CellPhoneNumber], [HomePhoneNumber]) VALUES (9, N'+380669611867', NULL, NULL)
INSERT [dbo].[PhoneNumbers] ([PhoneNumberId], [WorkPhoneNumber], [CellPhoneNumber], [HomePhoneNumber]) VALUES (10, N'+380666102239', NULL, NULL)
INSERT [dbo].[PhoneNumbers] ([PhoneNumberId], [WorkPhoneNumber], [CellPhoneNumber], [HomePhoneNumber]) VALUES (11, N'+380504123698', NULL, NULL)
INSERT [dbo].[PhoneNumbers] ([PhoneNumberId], [WorkPhoneNumber], [CellPhoneNumber], [HomePhoneNumber]) VALUES (12, N'+380504123698', NULL, NULL)
INSERT [dbo].[PhoneNumbers] ([PhoneNumberId], [WorkPhoneNumber], [CellPhoneNumber], [HomePhoneNumber]) VALUES (13, N'None', NULL, NULL)
INSERT [dbo].[PhoneNumbers] ([PhoneNumberId], [WorkPhoneNumber], [CellPhoneNumber], [HomePhoneNumber]) VALUES (14, N'NONE', NULL, NULL)
INSERT [dbo].[PhoneNumbers] ([PhoneNumberId], [WorkPhoneNumber], [CellPhoneNumber], [HomePhoneNumber]) VALUES (15, N'+380954988787', NULL, NULL)
INSERT [dbo].[PhoneNumbers] ([PhoneNumberId], [WorkPhoneNumber], [CellPhoneNumber], [HomePhoneNumber]) VALUES (16, N'+380636919754', NULL, NULL)
INSERT [dbo].[PhoneNumbers] ([PhoneNumberId], [WorkPhoneNumber], [CellPhoneNumber], [HomePhoneNumber]) VALUES (17, N'+380954988787', NULL, NULL)
SET IDENTITY_INSERT [dbo].[PhoneNumbers] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductName], [VendorCode], [ProductCardShop], [ProductCard1], [ProductCard2], [PurchasedPrice], [SellingPrice], [ManufacturingDate], [ManufacturerId], [CarModelId], [CategoryId], [QuantityNumber], [ProductAlias]) VALUES (3, N'Диск сцепления нажимной', N'063082001150', NULL, N'051470', NULL, 1419.1200, 1530.0000, NULL, 13, 3, 7, 10, N'Корзина сцепления')
INSERT [dbo].[Products] ([ProductId], [ProductName], [VendorCode], [ProductCardShop], [ProductCard1], [ProductCard2], [PurchasedPrice], [SellingPrice], [ManufacturingDate], [ManufacturerId], [CarModelId], [CategoryId], [QuantityNumber], [ProductAlias]) VALUES (4, N'Диск сцепления нажимной', N'406.1601090-05', NULL, N'372414', NULL, 575.3700, 680.0000, NULL, 6, 1, 7, 13, N'Корзина сцепления')
INSERT [dbo].[Products] ([ProductId], [ProductName], [VendorCode], [ProductCardShop], [ProductCard1], [ProductCard2], [PurchasedPrice], [SellingPrice], [ManufacturingDate], [ManufacturerId], [CarModelId], [CategoryId], [QuantityNumber], [ProductAlias]) VALUES (5, N'Маховик', N'4173.1005115-30', NULL, N'062544', NULL, 1003.0000, 1150.0000, NULL, 15, 11, 1, 15, NULL)
INSERT [dbo].[Products] ([ProductId], [ProductName], [VendorCode], [ProductCardShop], [ProductCard1], [ProductCard2], [PurchasedPrice], [SellingPrice], [ManufacturingDate], [ManufacturerId], [CarModelId], [CategoryId], [QuantityNumber], [ProductAlias]) VALUES (6, N'Маховик', N'4173.1005115-30', NULL, N'355999', NULL, 1158.0000, 1260.0000, NULL, 14, 11, 1, 20, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[TypesOfCheck] ON 

INSERT [dbo].[TypesOfCheck] ([TypeOfCheckId], [TypeOfCheckName]) VALUES (1, N'Закупка')
INSERT [dbo].[TypesOfCheck] ([TypeOfCheckId], [TypeOfCheckName]) VALUES (2, N'Продажа')
SET IDENTITY_INSERT [dbo].[TypesOfCheck] OFF
SET IDENTITY_INSERT [dbo].[TypesOfPayment] ON 

INSERT [dbo].[TypesOfPayment] ([TypeOfPaymentId], [TypeOfPaymentName]) VALUES (3, N'Долг')
INSERT [dbo].[TypesOfPayment] ([TypeOfPaymentId], [TypeOfPaymentName]) VALUES (4, N'Наложенный платеж')
INSERT [dbo].[TypesOfPayment] ([TypeOfPaymentId], [TypeOfPaymentName]) VALUES (2, N'Оплачено')
INSERT [dbo].[TypesOfPayment] ([TypeOfPaymentId], [TypeOfPaymentName]) VALUES (1, N'Отгружено')
SET IDENTITY_INSERT [dbo].[TypesOfPayment] OFF
SET IDENTITY_INSERT [dbo].[WorkPositions] ON 

INSERT [dbo].[WorkPositions] ([WorkPositionId], [WorkPositionName]) VALUES (3, N'IT')
INSERT [dbo].[WorkPositions] ([WorkPositionId], [WorkPositionName]) VALUES (5, N'Бухгалтер')
INSERT [dbo].[WorkPositions] ([WorkPositionId], [WorkPositionName]) VALUES (2, N'Директор')
INSERT [dbo].[WorkPositions] ([WorkPositionId], [WorkPositionName]) VALUES (4, N'Кладовщик')
INSERT [dbo].[WorkPositions] ([WorkPositionId], [WorkPositionName]) VALUES (1, N'Менеджер продаж')
SET IDENTITY_INSERT [dbo].[WorkPositions] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CarBrand__2206CE9B12C56A44]    Script Date: 12/11/2017 11:36:05 PM ******/
ALTER TABLE [dbo].[CarBrands] ADD UNIQUE NONCLUSTERED 
(
	[BrandName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Categori__8517B2E0D68DAB82]    Script Date: 12/11/2017 11:36:05 PM ******/
ALTER TABLE [dbo].[Categories] ADD UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Countrie__E056F201312B6A2F]    Script Date: 12/11/2017 11:36:05 PM ******/
ALTER TABLE [dbo].[Countries] ADD UNIQUE NONCLUSTERED 
(
	[CountryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Delivery__932489752D913874]    Script Date: 12/11/2017 11:36:05 PM ******/
ALTER TABLE [dbo].[DeliveryStatuses] ADD UNIQUE NONCLUSTERED 
(
	[DeliveryStatusName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TypesOfC__D39E08BED42F29B3]    Script Date: 12/11/2017 11:36:05 PM ******/
ALTER TABLE [dbo].[TypesOfCheck] ADD UNIQUE NONCLUSTERED 
(
	[TypeOfCheckName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TypesOfP__8D6B27F1236F6FB5]    Script Date: 12/11/2017 11:36:05 PM ******/
ALTER TABLE [dbo].[TypesOfPayment] ADD UNIQUE NONCLUSTERED 
(
	[TypeOfPaymentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__WorkPosi__C2F9D60DBEF91885]    Script Date: 12/11/2017 11:36:05 PM ******/
ALTER TABLE [dbo].[WorkPositions] ADD UNIQUE NONCLUSTERED 
(
	[WorkPositionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adresses]  WITH CHECK ADD FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([CountryId])
GO
ALTER TABLE [dbo].[CarBrands]  WITH CHECK ADD FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([CountryId])
GO
ALTER TABLE [dbo].[CarModels]  WITH CHECK ADD FOREIGN KEY([BrandId])
REFERENCES [dbo].[CarBrands] ([BrandId])
GO
ALTER TABLE [dbo].[CheckDetails]  WITH CHECK ADD FOREIGN KEY([CheckId])
REFERENCES [dbo].[Checks] ([CheckId])
GO
ALTER TABLE [dbo].[CheckDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Checks]  WITH CHECK ADD FOREIGN KEY([CustomerCompanyEmployeeId])
REFERENCES [dbo].[CompanyEmployees] ([CompanyEmployeeId])
GO
ALTER TABLE [dbo].[Checks]  WITH CHECK ADD FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Checks]  WITH CHECK ADD FOREIGN KEY([TypeOfCheckId])
REFERENCES [dbo].[TypesOfCheck] ([TypeOfCheckId])
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD FOREIGN KEY([AdressId])
REFERENCES [dbo].[Adresses] ([AdressId])
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD FOREIGN KEY([PhoneNumberId])
REFERENCES [dbo].[PhoneNumbers] ([PhoneNumberId])
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD FOREIGN KEY([PreferredDeliveryServiceId])
REFERENCES [dbo].[DeliveryServices] ([DeliveryServiceId])
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD FOREIGN KEY([PreferredCompanyAgentId])
REFERENCES [dbo].[People] ([PersonId])
GO
ALTER TABLE [dbo].[CompaniesClients]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
GO
ALTER TABLE [dbo].[CompaniesProviders]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
GO
ALTER TABLE [dbo].[CompanyEmployees]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
GO
ALTER TABLE [dbo].[CompanyEmployees]  WITH CHECK ADD FOREIGN KEY([PersonId])
REFERENCES [dbo].[People] ([PersonId])
GO
ALTER TABLE [dbo].[DeliveryAdditionalInformation]  WITH CHECK ADD FOREIGN KEY([DeliveryReceiptId])
REFERENCES [dbo].[DeliveryReceipt] ([DeliveryReceiptId])
GO
ALTER TABLE [dbo].[DeliveryReceipt]  WITH CHECK ADD FOREIGN KEY([AdressId])
REFERENCES [dbo].[Adresses] ([AdressId])
GO
ALTER TABLE [dbo].[DeliveryReceipt]  WITH CHECK ADD FOREIGN KEY([CheckId])
REFERENCES [dbo].[Checks] ([CheckId])
GO
ALTER TABLE [dbo].[DeliveryReceipt]  WITH CHECK ADD FOREIGN KEY([CompanyEmployeeId])
REFERENCES [dbo].[Checks] ([CheckId])
GO
ALTER TABLE [dbo].[DeliveryReceipt]  WITH CHECK ADD FOREIGN KEY([DeliveryServiceId])
REFERENCES [dbo].[Checks] ([CheckId])
GO
ALTER TABLE [dbo].[DeliveryReceipt]  WITH CHECK ADD FOREIGN KEY([DeliveryStatusId])
REFERENCES [dbo].[DeliveryStatuses] ([DeliveryStatusId])
GO
ALTER TABLE [dbo].[DeliveryReceipt]  WITH CHECK ADD FOREIGN KEY([TypeOfPaymentId])
REFERENCES [dbo].[TypesOfPayment] ([TypeOfPaymentId])
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([PersonId])
REFERENCES [dbo].[People] ([PersonId])
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([WorkPositionId])
REFERENCES [dbo].[WorkPositions] ([WorkPositionId])
GO
ALTER TABLE [dbo].[Manufacturers]  WITH CHECK ADD FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([CountryId])
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD FOREIGN KEY([AdressId])
REFERENCES [dbo].[Adresses] ([AdressId])
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD FOREIGN KEY([EmailId])
REFERENCES [dbo].[Emails] ([EmailId])
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD FOREIGN KEY([PhoneNumberId])
REFERENCES [dbo].[PhoneNumbers] ([PhoneNumberId])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CarModelId])
REFERENCES [dbo].[CarModels] ([CarModelId])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([ManufacturerId])
REFERENCES [dbo].[Manufacturers] ([ManufacturerId])
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertAdress1Ukraine]    Script Date: 12/11/2017 11:36:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertAdress1Ukraine]
	@City NVARCHAR(60),
	@Adress NVARCHAR(100)
AS
INSERT INTO dbo.Adresses (CountryId, City , Adress1) VALUES (5, @City, @Adress)
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCompany]    Script Date: 12/11/2017 11:36:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertCompany]
	@CompanyName NVARCHAR(60) ,
	@Adress NVARCHAR(100),
	@City NVARCHAR(60),
	@Email NVARCHAR(30),
	@PhoneNumber NVARCHAR(30),
	@PreferredDeliveryServiceId INT,
	@PreferredDeliveryServiceDepartment NVARCHAR(30),
	@PreferredCompanyAgentId INT
AS
	EXECUTE sp_InsertAdress1Ukraine @City, @Adress
	EXECUTE sp_InsertEmailWork @Email
	EXECUTE sp_InsertPhoneNumberWork @PhoneNumber
	INSERT INTO dbo.Companies (CompanyName, AdressId, PreferredDeliveryServiceId, PreferredDeliveryServiceDepartment, 
				PhoneNumberId, 	PreferredCompanyAgentId, EmailId )	VALUES
	(@CompanyName, 
	(SELECT MAX(AdressId) FROM dbo.Adresses), 
	@PreferredDeliveryServiceId, 
	@PreferredDeliveryServiceDepartment,
	 (SELECT MAX(PhoneNumberId) FROM dbo.PhoneNumbers),
	@PreferredCompanyAgentId, (SELECT MAX(EmailId) FROM dbo.Emails) )
	
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertEmailWork]    Script Date: 12/11/2017 11:36:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INSERT INTO dbo.PhoneNumbers (WorkPhoneNumber, CellPhoneNumber) VALUES ('+380956799878', '+380662144607')


--CREATE PROCEDURE sp_InsertWorkPhoneNumberAndCellPhoneNumber
--	@WorkPhoneNumber NVARCHAR(50),
--	@CellPhoneNumber NVARCHAR(50)
--AS
--INSERT INTO dbo.PhoneNumbers (WorkPhoneNumber, CellPhoneNumber) VALUES (@WorkPhoneNumber, @CellPhoneNumber)

CREATE PROCEDURE [dbo].[sp_InsertEmailWork]
	@WorkMail NVARCHAR(30)
AS
INSERT INTO dbo.Emails (WorkMail) VALUES (@WorkMail)
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertPerson]    Script Date: 12/11/2017 11:36:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertPerson]
	@LastName NVARCHAR(60),
	@FirstName NVARCHAR(60),
	@PhoneNumber NVARCHAR(30), 
	@Email NVARCHAR(30),
	@City NVARCHAR(60),
	@Adress NVARCHAR(100)
AS
EXECUTE sp_InsertPhoneNumberWork @PhoneNumber
EXECUTE sp_InsertEmailWork @Email
EXECUTE sp_InsertAdress1Ukraine @City, @Adress
INSERT INTO dbo.People (EmailId, PhoneNumberId, AdressId, LastName,FirstName) 
VALUES ((SELECT MAX(EmailId) FROM dbo.Emails) , (SELECT MAX(PhoneNumberId) FROM dbo.PhoneNumbers), (SELECT MAX(AdressId) FROM dbo.Adresses), 
@LastName, @FirstName)
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertPhoneNumberWork]    Script Date: 12/11/2017 11:36:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertPhoneNumberWork]
	@WorkPhoneNumber NVARCHAR(50)
AS
INSERT INTO dbo.PhoneNumbers (WorkPhoneNumber) VALUES (@WorkPhoneNumber)
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertPhoneNumberWorkAndCellPhoneNumber]    Script Date: 12/11/2017 11:36:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INSERT INTO dbo.PhoneNumbers (WorkPhoneNumber, CellPhoneNumber) VALUES ('+380956799878', '+380662144607')


CREATE PROCEDURE [dbo].[sp_InsertPhoneNumberWorkAndCellPhoneNumber]
	@WorkPhoneNumber NVARCHAR(50),
	@CellPhoneNumber NVARCHAR(50)
AS
INSERT INTO dbo.PhoneNumbers (WorkPhoneNumber, CellPhoneNumber) VALUES (@WorkPhoneNumber, @CellPhoneNumber)
GO
USE [master]
GO
ALTER DATABASE [AutopartsShop] SET  READ_WRITE 
GO
