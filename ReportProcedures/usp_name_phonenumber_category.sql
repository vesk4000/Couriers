USE CouriersDB
GO

CREATE OR ALTER Proc usp_name_phonenumber_category
AS
BEGIN
	SELECT Name, PhoneNumber, 'Courier' AS [Category]
	FROM Couriers
	UNION
	SELECT Name, PhoneNumber, 'Client'
	FROM Clients
	UNION
	SELECT Name, PhoneNumber, 'Dispatcher'
	FROM Dispatchers
END
GO

USE master
GO

/* Example
-- reads and prints the name, the phone number, and the category (client, dispatcher, courier) for each person in the system (Database)
EXEC dbo.usp_name_phonenumber_category;
*/

