use AutopartsShop
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


--SELECT CompanyId, CompanyName, Ad.City, Ad.Adress1, DeliveryServiceName, WorkPhoneNumber, WorkMail, Peop.LastName, Peop.FirstName
--FROM dbo.Companies Cmp
--JOIN dbo.Adresses Ad on Ad.AdressId = Cmp.AdressId
--JOIN dbo.DeliveryServices DS on DS.DeliveryServiceId = Cmp.PreferredDeliveryServiceId
--JOIN dbo. PhoneNumbers Phn on Phn.PhoneNumberId = Cmp.PhoneNumberId
--JOIN dbo.Emails Eml on Eml.EmailId = Cmp.EmailId
--JOIN dbo.People Peop on Peop.PersonId = Cmp.PreferredCompanyAgentId

--CREATE VIEW V_CompanyEmployees
--AS
--SELECT CompanyName, P.LastName, P.FirstName, Phn.WorkPhoneNumber, Eml.WorkMail
--FROM dbo.CompanyEmployees CE
--JOIN dbo.Companies Cmp on Cmp.CompanyId = CE.CompanyId
--JOIN dbo.People P on P.PersonId = CE.PersonId
--JOIN dbo.PhoneNumbers Phn on Phn.PhoneNumberId = P.PhoneNumberId
--JOIN dbo.Emails Eml on Eml.EmailId = P.EmailId

--SELECT * FROM V_CompanyEmployees

--select * from dbo.V_Companies

--CREATE VIEW [dbo].[V_CompaniesProviders]
--AS
--SELECT CP.CompanyId, CompanyName as 'CompanyProviderName', Ad.City, Ad.Adress1, DeliveryServiceName, WorkPhoneNumber, WorkMail, Peop.LastName, Peop.FirstName
--FROM dbo.CompaniesProviders CP
--JOIN dbo.Companies Cmp on Cmp.CompanyId =  CP.CompanyId
--JOIN dbo.Adresses Ad on Ad.AdressId = Cmp.AdressId
--JOIN dbo.DeliveryServices DS on DS.DeliveryServiceId = Cmp.PreferredDeliveryServiceId
--JOIN dbo. PhoneNumbers Phn on Phn.PhoneNumberId = Cmp.PhoneNumberId
--JOIN dbo.Emails Eml on Eml.EmailId = Cmp.EmailId
--JOIN dbo.People Peop on Peop.PersonId = Cmp.PreferredCompanyAgentId

--CREATE VIEW [dbo].[V_CompaniesClients]
--AS
--SELECT CP.CompanyId, CompanyName as 'CompanyClientName', Ad.City, Ad.Adress1, DeliveryServiceName, WorkPhoneNumber, WorkMail, Peop.LastName, Peop.FirstName
--FROM dbo.CompaniesClients CP
--JOIN dbo.Companies Cmp on Cmp.CompanyId =  CP.CompanyId
--JOIN dbo.Adresses Ad on Ad.AdressId = Cmp.AdressId
--JOIN dbo.DeliveryServices DS on DS.DeliveryServiceId = Cmp.PreferredDeliveryServiceId
--JOIN dbo. PhoneNumbers Phn on Phn.PhoneNumberId = Cmp.PhoneNumberId
--JOIN dbo.Emails Eml on Eml.EmailId = Cmp.EmailId
--JOIN dbo.People Peop on Peop.PersonId = Cmp.PreferredCompanyAgentId

--SELECT * from V_CompaniesClients


--CREATE VIEW v_Employees
--AS
--SELECT P.LastName, P.FirstName, Phn.WorkPhoneNumber, Eml.WorkMail, WorkPositionName, SalaryRate
--FROM dbo.Employees Emp
--JOIN dbo.People P on P.PersonId = Emp.PersonId
--JOIN dbo.PhoneNumbers Phn on Phn.PhoneNumberId = P.PhoneNumberId
--JOIN dbo.Emails Eml on Eml.EmailId = P.EmailId
--JOIN dbo.WorkPositions WP on WP.WorkPositionId = Emp.WorkPositionId

