USE CouriersDB
GO

CREATE OR ALTER PROC delete_addresses @OldID INT, @WantToDeleteFromOrders BIT = 1, @NewID INT = NULL
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Addresses WHERE ID = @OldID)
	BEGIN
		PRINT 'No such address exists';
		RETURN
	END;

	IF (@WantToDeleteFromOrders = 1)
	BEGIN
		DELETE FROM Orders
		WHERE addressID = @OldID;
	END;
	ELSE IF EXISTS (SELECT * FROM Addresses WHERE ID = @NewID)
		UPDATE Orders
		SET addressID = @NewID
		WHERE addressID = @OldID;
	ELSE
	BEGIN
		SET @NewID = NULL;

		UPDATE Orders
		SET addressID = NULL
		WHERE addressID = @OldID;
	END;

	DELETE FROM Addresses
	WHERE ID = @OldID;

	PRINT 'Deleted address with ID = ' + CAST(@OldID AS VARCHAR);

	IF (@WantToDeleteFromOrders = 1)
		PRINT 'Deleted rows from Orders with addressID = ' + CAST(@OldID AS VARCHAR);
	ELSE
		PRINT 'Updated row(s) in Orders with addressID = ' + CAST(@OldID AS VARCHAR) + ' by setting addressID = ' + IIF(@NewID IS NULL, 'NULL', CAST(@NewID AS VARCHAR));
END;
GO
USE master
GO

/* Example
EXEC dbo.delete_addresses 1;
EXEC dbo.delete_addresses 2, 0;
EXEC dbo.delete_addresses 3, 0, 4;
EXEC dbo.delete_addresses 4, 0, 1000;
*/