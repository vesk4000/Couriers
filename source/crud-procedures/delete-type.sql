USE CouriersDB
GO

CREATE OR ALTER PROC delete_types @OldID INT, @WantToDeleteFromOrders BIT = 1, @NewID INT = NULL
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM TypesOfService WHERE ID = @OldID)
	BEGIN
		PRINT 'No such type of service exists';
		RETURN
	END;
	
	IF (@WantToDeleteFromOrders = 1)
	BEGIN
		DELETE FROM Orders
		WHERE typeID = @OldID;
	END;
	ELSE IF EXISTS (SELECT * FROM TypesOfService WHERE ID = @NewID)
		UPDATE Orders
		SET typeID = @NewID
		WHERE typeID = @OldID;
	ELSE
	BEGIN
		SET @NewID = NULL;

		UPDATE Orders
		SET typeID = NULL
		WHERE typeID = @OldID;
	END;

	DELETE FROM TypesOfService
	WHERE ID = @OldID;

	PRINT 'Deleted type with ID = ' + CAST(@OldID AS VARCHAR);

	IF (@WantToDeleteFromOrders = 1)
		PRINT 'Deleted rows from Orders with typeID = ' + CAST(@OldID AS VARCHAR);
	ELSE
		PRINT 'Updated row(s) in Orders with typeID = ' + CAST(@OldID AS VARCHAR) + ' by setting typeID = ' + IIF(@NewID IS NULL, 'NULL', CAST(@NewID AS VARCHAR));
END;
GO
USE master
GO

/* Example
EXEC dbo.delete_types 1;
EXEC dbo.delete_types 2, 0;
EXEC dbo.delete_types 3, 0, 4;
EXEC dbo.delete_types 4, 0, 1000;
*/
