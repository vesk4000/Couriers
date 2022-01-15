USE CouriersDB
GO

CREATE OR ALTER Proc usp_orders_profit_by_tos
AS
BEGIN
	SELECT FORMAT(SUM(Total), 'C', 'bg-BG') AS [Profit], Type
	FROM Orders
	JOIN TypesOfService
	ON Orders.TypeID = TypesOfService.ID
	GROUP BY Type
END
GO

USE master
GO

/* Example
-- reads and prints the profit (sum of totals) for each order type (type of service)
EXEC usp_orders_profit_by_tos
*/