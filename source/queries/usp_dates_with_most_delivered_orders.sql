USE CouriersDB
GO

CREATE OR ALTER Proc usp_dates_with_most_delivered_orders
AS
BEGIN
	SELECT COUNT(*) AS [count]
	INTO TempOrders
	FROM Orders
	GROUP BY ReceiveDate;

	SELECT ReceiveDate, COUNT(*) as [Count of delivered orders]
	FROM Orders AS o1
	GROUP BY ReceiveDate
	HAVING COUNT(*) >= ALL (
		SELECT [count]
		FROM TempOrders);
END
GO
USE master
GO

/* Example
-- reads and prints the names and the count of the orders of each recipient
EXEC dbo.usp_dates_with_most_delivered_orders
*/