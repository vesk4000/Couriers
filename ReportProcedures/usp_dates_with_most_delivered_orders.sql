USE CouriersDB
GO

CREATE OR ALTER Proc usp_dates_with_most_delivered_orders
AS
BEGIN
	SELECT ReceiveDate, COUNT(*) as [Count of delivered orders]
	FROM Orders AS o1
	GROUP BY ReceiveDate
	HAVING COUNT(*) >= ALL (
	SELECT COUNT(*)
	FROM Orders AS o2
	WHERE o1.ReceiveDate <> o2.ReceiveDate
	GROUP BY ReceiveDate)
END
GO

EXEC dbo.usp_dates_with_most_delivered_orders
GO

USE master
GO

/* Example
-- reads and prints the names and the count of the orders of each recipient

*/