USE [master]
GO
/****** Object:  Database [AutopartsShop]    Script Date: 11/30/2017 2:02:37 AM ******/
CREATE DATABASE [AutopartsShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AutopartsShop', FILENAME = N'D:\Task\AutoParts2\AutoPartsDB\AutopartsShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AutopartsShop_log', FILENAME = N'D:\Task\AutoParts2\AutoPartsDB\AutopartsShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Categories]    Script Date: 11/30/2017 2:02:37 AM ******/
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
/****** Object:  Table [dbo].[Countries]    Script Date: 11/30/2017 2:02:37 AM ******/
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
/****** Object:  Table [dbo].[CarBrands]    Script Date: 11/30/2017 2:02:37 AM ******/
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
/****** Object:  Table [dbo].[Manufacturers]    Script Date: 11/30/2017 2:02:37 AM ******/
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
/****** Object:  Table [dbo].[CarModels]    Script Date: 11/30/2017 2:02:37 AM ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 11/30/2017 2:02:37 AM ******/
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
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_Products]    Script Date: 11/30/2017 2:02:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_Products] as
SELECT P.ProductId, P.VendorCode, P.ProductName, M.ManufacturerName, C.CountryName, Br.BrandName, CM.CarModelName, CM.EngineType, Ct.CategoryName, 
P.PurchasedPrice, P.SellingPrice, P.QuantityNumber
FROM dbo.Products P
JOIN dbo.Manufacturers M on M.ManufacturerId = P.ManufacturerId
JOIN dbo.Countries C on C.CountryId = M.CountryId
JOIN dbo.CarModels CM on CM.CarModelId = P.CarModelId
JOIN dbo.CarBrands Br on Br.BrandId = CM.BrandId
JOIN dbo.Categories Ct on Ct.CategoryId = P.CategoryId
GO
/****** Object:  Table [dbo].[Adresses]    Script Date: 11/30/2017 2:02:37 AM ******/
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
/****** Object:  Table [dbo].[PhoneNumbers]    Script Date: 11/30/2017 2:02:37 AM ******/
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
/****** Object:  Table [dbo].[Emails]    Script Date: 11/30/2017 2:02:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emails](
	[EmailId] [int] IDENTITY(1,1) NOT NULL,
	[WorkMail] [nvarchar](30) NOT NULL,
	[PrivateMail] [nvarchar](30) NULL,
	[HomeMail] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 11/30/2017 2:02:37 AM ******/
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
/****** Object:  View [dbo].[V_People]    Script Date: 11/30/2017 2:02:37 AM ******/
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
/****** Object:  Table [dbo].[DeliveryServices]    Script Date: 11/30/2017 2:02:37 AM ******/
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
/****** Object:  Table [dbo].[Companies]    Script Date: 11/30/2017 2:02:37 AM ******/
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
/****** Object:  View [dbo].[V_Companies]    Script Date: 11/30/2017 2:02:37 AM ******/
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
/****** Object:  Table [dbo].[CompanyEmployee]    Script Date: 11/30/2017 2:02:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyEmployee](
	[CompanyEmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NULL,
	[CompanyId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyEmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Adresses] ON 

INSERT [dbo].[Adresses] ([AdressId], [CountryId], [City], [Adress1], [Adress2]) VALUES (1, 5, N'Kharkiv', N'Haharina Avenue 195, flat 14', NULL)
INSERT [dbo].[Adresses] ([AdressId], [CountryId], [City], [Adress1], [Adress2]) VALUES (2, 5, N'Kharkiv', N'Autopart market LOSK, row 7, place ?96', NULL)
INSERT [dbo].[Adresses] ([AdressId], [CountryId], [City], [Adress1], [Adress2]) VALUES (3, 5, N'Kharkiv', N'Haharina Avenue 195, flat 14', NULL)
INSERT [dbo].[Adresses] ([AdressId], [CountryId], [City], [Adress1], [Adress2]) VALUES (4, 5, N'Kharkiv', N'AUtoparts market LOSK, row 1, place 20', NULL)
INSERT [dbo].[Adresses] ([AdressId], [CountryId], [City], [Adress1], [Adress2]) VALUES (5, 5, N'Kharkiv', N'Autoparts market LOSK, row 1, place 20', NULL)
INSERT [dbo].[Adresses] ([AdressId], [CountryId], [City], [Adress1], [Adress2]) VALUES (6, 5, N'Kharkiv', N'Autopart market LOSk, row 7, place 110', NULL)
INSERT [dbo].[Adresses] ([AdressId], [CountryId], [City], [Adress1], [Adress2]) VALUES (7, 5, N'Kharkiv', N'Autopart market Losk', NULL)
INSERT [dbo].[Adresses] ([AdressId], [CountryId], [City], [Adress1], [Adress2]) VALUES (8, 5, N'Kharkiv', N'Autopart market Losk', NULL)
SET IDENTITY_INSERT [dbo].[Adresses] OFF
SET IDENTITY_INSERT [dbo].[CarBrands] ON 

INSERT [dbo].[CarBrands] ([BrandId], [BrandName], [CountryId]) VALUES (1, N'VAZ', 1)
INSERT [dbo].[CarBrands] ([BrandId], [BrandName], [CountryId]) VALUES (2, N'ZAZ', 1)
INSERT [dbo].[CarBrands] ([BrandId], [BrandName], [CountryId]) VALUES (3, N'UAZ', 1)
INSERT [dbo].[CarBrands] ([BrandId], [BrandName], [CountryId]) VALUES (4, N'GAZ', 1)
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

INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (5, N'Braking system')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (13, N'Carcass')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (8, N'Chassis')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (3, N'Cooling system')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (9, N'Electrical equipment')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (1, N'Engine')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (6, N'Exhaust system')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (12, N'Filters')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (4, N'Fuel injection system')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (2, N'Lubrication system')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (10, N'Steering system')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (7, N'Transmission')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (11, N'Ventilation and heating system')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([CompanyId], [CompanyName], [AdressId], [PreferredDeliveryServiceId], [PreferredDeliveryServiceDepartment], [PhoneNumberId], [PreferredCompanyAgentId], [EmailId]) VALUES (2, N'LiderAuto', 4, 2, N'Their office', 9, 3, 7)
INSERT [dbo].[Companies] ([CompanyId], [CompanyName], [AdressId], [PreferredDeliveryServiceId], [PreferredDeliveryServiceDepartment], [PhoneNumberId], [PreferredCompanyAgentId], [EmailId]) VALUES (4, N'Trade Rocket', 8, 2, N'Office', 12, 4, 10)
SET IDENTITY_INSERT [dbo].[Companies] OFF
SET IDENTITY_INSERT [dbo].[CompanyEmployee] ON 

INSERT [dbo].[CompanyEmployee] ([CompanyEmployeeId], [PersonId], [CompanyId]) VALUES (1, 2, 2)
INSERT [dbo].[CompanyEmployee] ([CompanyEmployeeId], [PersonId], [CompanyId]) VALUES (2, 3, 2)
INSERT [dbo].[CompanyEmployee] ([CompanyEmployeeId], [PersonId], [CompanyId]) VALUES (3, 4, 4)
INSERT [dbo].[CompanyEmployee] ([CompanyEmployeeId], [PersonId], [CompanyId]) VALUES (4, 1, 4)
SET IDENTITY_INSERT [dbo].[CompanyEmployee] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (3, N'China')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (14, N'Czech Republic')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (8, N'France')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (7, N'Germany')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (13, N'Great Britain')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (4, N'India')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (16, N'Israel')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (12, N'Italy')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (11, N'Japan')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (18, N'Poland')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (1, N'Russia')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (15, N'South Korea')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (9, N'Sweden')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (10, N'Switzerland')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (6, N'Taiwan')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (17, N'Turkey')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (5, N'Ukraine')
INSERT [dbo].[Countries] ([CountryId], [CountryName]) VALUES (2, N'USA')
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[DeliveryServices] ON 

INSERT [dbo].[DeliveryServices] ([DeliveryServiceId], [DeliveryServiceName]) VALUES (1, N'Intime')
INSERT [dbo].[DeliveryServices] ([DeliveryServiceId], [DeliveryServiceName]) VALUES (2, N'EXW')
INSERT [dbo].[DeliveryServices] ([DeliveryServiceId], [DeliveryServiceName]) VALUES (3, N'Nova Poshta')
INSERT [dbo].[DeliveryServices] ([DeliveryServiceId], [DeliveryServiceName]) VALUES (4, N'CAT')
INSERT [dbo].[DeliveryServices] ([DeliveryServiceId], [DeliveryServiceName]) VALUES (5, N'Delivery')
INSERT [dbo].[DeliveryServices] ([DeliveryServiceId], [DeliveryServiceName]) VALUES (6, N'UkrPoshta')
INSERT [dbo].[DeliveryServices] ([DeliveryServiceId], [DeliveryServiceName]) VALUES (7, N'Avtolux')
SET IDENTITY_INSERT [dbo].[DeliveryServices] OFF
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
SET IDENTITY_INSERT [dbo].[Emails] OFF
SET IDENTITY_INSERT [dbo].[Manufacturers] ON 

INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (1, N'VBF', 1)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (2, N'GAZ', 1)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (3, N'VAZ', 1)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (4, N'DK', 3)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (5, N'Herzog', 7)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (6, N'Truckman', 17)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (7, N'LSA', 3)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (8, N'Hola', 18)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (9, N'Riginal', 1)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (10, N'ZMZ', 1)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (11, N'Sachs', 7)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (13, N'GAZ', 3)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (14, N'Riginal', 1)
INSERT [dbo].[Manufacturers] ([ManufacturerId], [ManufacturerName], [CountryId]) VALUES (15, N'UMZ', 1)
SET IDENTITY_INSERT [dbo].[Manufacturers] OFF
SET IDENTITY_INSERT [dbo].[People] ON 

INSERT [dbo].[People] ([PersonId], [FirstName], [LastName], [MiddleName], [PhoneNumberId], [EmailId], [AdressId]) VALUES (1, N'Nina', N'Logvinova', NULL, 8, 6, 1)
INSERT [dbo].[People] ([PersonId], [FirstName], [LastName], [MiddleName], [PhoneNumberId], [EmailId], [AdressId]) VALUES (2, N'Lukina', N'Inna', NULL, 6, 5, 4)
INSERT [dbo].[People] ([PersonId], [FirstName], [LastName], [MiddleName], [PhoneNumberId], [EmailId], [AdressId]) VALUES (3, N'Ihor', N'Lukin', NULL, 9, 7, 5)
INSERT [dbo].[People] ([PersonId], [FirstName], [LastName], [MiddleName], [PhoneNumberId], [EmailId], [AdressId]) VALUES (4, N'Oleksii', N'Dolhopolov', NULL, 10, 8, 6)
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
SET IDENTITY_INSERT [dbo].[PhoneNumbers] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductName], [VendorCode], [ProductCardShop], [ProductCard1], [ProductCard2], [PurchasedPrice], [SellingPrice], [ManufacturingDate], [ManufacturerId], [CarModelId], [CategoryId], [QuantityNumber]) VALUES (3, N'Clutch Bag', N'063082001150', NULL, N'051470', NULL, 1419.1200, 1530.0000, NULL, 13, 3, 7, 10)
INSERT [dbo].[Products] ([ProductId], [ProductName], [VendorCode], [ProductCardShop], [ProductCard1], [ProductCard2], [PurchasedPrice], [SellingPrice], [ManufacturingDate], [ManufacturerId], [CarModelId], [CategoryId], [QuantityNumber]) VALUES (4, N'Clutch Bag', N'406.1601090-05', NULL, N'372414', NULL, 575.3700, 680.0000, NULL, 6, 1, 7, 13)
INSERT [dbo].[Products] ([ProductId], [ProductName], [VendorCode], [ProductCardShop], [ProductCard1], [ProductCard2], [PurchasedPrice], [SellingPrice], [ManufacturingDate], [ManufacturerId], [CarModelId], [CategoryId], [QuantityNumber]) VALUES (5, N'Flywheel', N'4173.1005115-30', NULL, N'062544', NULL, 1003.0000, 1150.0000, NULL, 15, 11, 1, 15)
INSERT [dbo].[Products] ([ProductId], [ProductName], [VendorCode], [ProductCardShop], [ProductCard1], [ProductCard2], [PurchasedPrice], [SellingPrice], [ManufacturingDate], [ManufacturerId], [CarModelId], [CategoryId], [QuantityNumber]) VALUES (6, N'Flywheel', N'4173.1005115-30', NULL, N'355999', NULL, 1158.0000, 1260.0000, NULL, 14, 11, 1, 20)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CarBrand__2206CE9B12C56A44]    Script Date: 11/30/2017 2:02:38 AM ******/
ALTER TABLE [dbo].[CarBrands] ADD UNIQUE NONCLUSTERED 
(
	[BrandName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Categori__8517B2E0D68DAB82]    Script Date: 11/30/2017 2:02:38 AM ******/
ALTER TABLE [dbo].[Categories] ADD UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Countrie__E056F201312B6A2F]    Script Date: 11/30/2017 2:02:38 AM ******/
ALTER TABLE [dbo].[Countries] ADD UNIQUE NONCLUSTERED 
(
	[CountryName] ASC
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
ALTER TABLE [dbo].[CompanyEmployee]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
GO
ALTER TABLE [dbo].[CompanyEmployee]  WITH CHECK ADD FOREIGN KEY([PersonId])
REFERENCES [dbo].[People] ([PersonId])
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
/****** Object:  StoredProcedure [dbo].[sp_InsertAdress1Ukraine]    Script Date: 11/30/2017 2:02:38 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_InsertCompany]    Script Date: 11/30/2017 2:02:38 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_InsertEmailWork]    Script Date: 11/30/2017 2:02:38 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_InsertPerson]    Script Date: 11/30/2017 2:02:38 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_InsertPhoneNumberWork]    Script Date: 11/30/2017 2:02:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertPhoneNumberWork]
	@WorkPhoneNumber NVARCHAR(50)
AS
INSERT INTO dbo.PhoneNumbers (WorkPhoneNumber) VALUES (@WorkPhoneNumber)
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertPhoneNumberWorkAndCellPhoneNumber]    Script Date: 11/30/2017 2:02:38 AM ******/
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
