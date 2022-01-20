USE CouriersDB
GO

CREATE OR ALTER Proc usp_orders_count_by_order_date
AS
BEGIN
	SELECT COUNT(*) AS [Count of Orders], OrderDate
	FROM Orders
	GROUP BY OrderDate
END
GO

USE master
GO


/* Example
-- reads and prints the count of the orders grouped by the order date
EXEC dbo.usp_orders_count_by_order_date
GO
*/