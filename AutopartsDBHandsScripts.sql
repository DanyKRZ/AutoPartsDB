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
SELECT * FROM V_Companies

--Insert into dbo.CompanyEmployee (PersonId, CompanyId) VALUES (2,2), (3,2), (4,4), (1,4)




--('', '', '', '', '', '', '', ''),
--('', '', '', '', '', '', '', ''),
--('', '', '', '', '', '', '', ''),
--('', '', '', '', '', '', '', ''),
--('', '', '', '', '', '', '', ''),
--('', '', '', '', '', '', '', ''),


 

