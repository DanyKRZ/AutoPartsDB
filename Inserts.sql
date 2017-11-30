--INSERT INTO dbo.PhoneNumbers (WorkPhoneNumber, CellPhoneNumber) VALUES ('+380956799878', '+380662144607')


--CREATE PROCEDURE sp_InsertPhoneNumberWorkAndCellPhoneNumber
--	@WorkPhoneNumber NVARCHAR(50),
--	@CellPhoneNumber NVARCHAR(50)
--AS
--INSERT INTO dbo.PhoneNumbers (WorkPhoneNumber, CellPhoneNumber) VALUES (@WorkPhoneNumber, @CellPhoneNumber)

--CREATE PROCEDURE sp_InsertPhoneNumberWork
--	@WorkPhoneNumber NVARCHAR(50)
--AS
--INSERT INTO dbo.PhoneNumbers (WorkPhoneNumber) VALUES (@WorkPhoneNumber)

--CREATE PROCEDURE sp_InsertAdress1Ukraine
--	@City NVARCHAR(60),
--	@Adress NVARCHAR(100)
--AS
--INSERT INTO dbo.Adresses (CountryId, City , Adress1) VALUES (5, @City, @Adress)

--CREATE PROCEDURE sp_InsertEmailWork
--	@WorkMail NVARCHAR(30)
--AS
--INSERT INTO dbo.Emails (WorkMail) VALUES (@WorkMail)

--EXEC sp_InsertWorkEmail 'lukina@mail.ru'

--CREATE PROCEDURE sp_InsertPerson
--	@LastName NVARCHAR(60),
--	@FirstName NVARCHAR(60),
--	@PhoneNumber NVARCHAR(30), 
--	@Email NVARCHAR(30),
--	@City NVARCHAR(60),
--	@Adress NVARCHAR(100)
--AS
--EXECUTE sp_InsertPhoneNumberWork @PhoneNumber
--EXECUTE sp_InsertEmailWork @Email
--EXECUTE sp_InsertAdress1Ukraine @City, @Adress
--INSERT INTO dbo.People (EmailId, PhoneNumberId, AdressId, LastName,FirstName) 
--VALUES ((SELECT MAX(EmailId) FROM dbo.Emails) , (SELECT MAX(PhoneNumberId) FROM dbo.PhoneNumbers), (SELECT MAX(AdressId) FROM dbo.Adresses), 
--@LastName, @FirstName)

CREATE PROCEDURE sp_InsertCompany
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
	
	--EXEC sp_InsertPerson  'Dolhopolov' ,'Oleksii', '+380666102239', 'leshaomega@gmail.com', 'Kharkiv', 'Autopart market LOSk, row 7, place 110'

EXEC sp_InsertCompany 'Trade Rocket', 'Autopart market Losk', 'Kharkiv', 'traderocket@gmail.com', '+380504123698', 2, 'Office', 4




	

