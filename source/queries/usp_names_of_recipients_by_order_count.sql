USE CouriersDB
GO

CREATE OR ALTER Proc usp_names_of_recipients_by_order_count @MinOrdersCount INT
AS
BEGIN
	SELECT COUNT(RecipientID) AS [Count of orders], Name
	FROM Orders
	JOIN Recipients
	ON RecipientID = Recipients.ID
	GROUP BY Name
	HAVING COUNT(RecipientID) > @MinOrdersCount
END
GO

USE master
GO

/* Example
-- reads and prints the names and the count of the orders of each recipient
EXEC dbo.usp_names_of_recipients_by_order_count 1;
EXEC dbo.usp_names_of_recipients_by_order_count 2;
*/