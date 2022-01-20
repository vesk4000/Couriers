USE CouriersDB
GO

CREATE OR ALTER Proc usp_dates_with_most_delivered_orders
AS
BEGIN
	SELECT ReceiveDate, COUNT(*)
	FROM Orders
	GROUP BY ReceiveDate
	HAVING COUNT(*) > ALL (
	SELECT MAX(COUNT(*))
	FROM Orders AS o2
	WHERE ReceiveDate <> o2.ReceiveDate)
END
GO

EXEC dbo.usp_dates_with_most_delivered_orders
GO

USE master
GO

/* Example
-- reads and prints the names and the count of the orders of each recipient

*/