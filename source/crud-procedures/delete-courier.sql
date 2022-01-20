USE CouriersDB
GO

CREATE OR ALTER PROC delete_couriers @OldID INT, @WantToDeleteFromOrders BIT = 1, @NewID INT = NULL
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Couriers WHERE ID = @OldID)
	BEGIN
		PRINT 'No such courier exists';
		RETURN
	END;
	
	DECLARE @DeleteOrUpdate BIT = 0;

	IF (@WantToDeleteFromOrders = 1)
	BEGIN
		SET @DeleteOrUpdate = 1;

		DELETE FROM Orders
		WHERE courierID = @OldID;
	END;
	ELSE IF EXISTS (SELECT * FROM Couriers WHERE ID = @NewID)
		UPDATE Orders
		SET courierID = @NewID
		WHERE courierID = @OldID;
	ELSE
	BEGIN
		SET @NewID = NULL;

		UPDATE Orders
		SET courierID = NULL
		WHERE courierID = @OldID;
	END;

	DELETE FROM Couriers
	WHERE ID = @OldID;

	PRINT 'Deleted courier with ID = ' + CAST(@OldID AS VARCHAR);

	IF (@DeleteOrUpdate = 1)
		PRINT 'Deleted rows from Orders with courierID = ' + CAST(@OldID AS VARCHAR);
	ELSE
		PRINT 'Updated row(s) in Orders with courierID = ' + CAST(@OldID AS VARCHAR) + ' by setting courierID = ' + IIF(@NewID IS NULL, 'NULL', CAST(@NewID AS VARCHAR));
END;
GO
USE master
GO

/* Example
EXEC dbo.delete_couriers 1;
EXEC dbo.delete_couriers 2, 0;
EXEC dbo.delete_couriers 3, 0, 4;
EXEC dbo.delete_couriers 4, 0, 1000;
*/