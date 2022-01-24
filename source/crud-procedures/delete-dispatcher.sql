USE CouriersDB
GO

CREATE OR ALTER PROC delete_dispatchers @OldID INT, @WantToDeleteFromOrders BIT = 1, @NewID INT = NULL
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Dispatchers WHERE ID = @OldID)
	BEGIN
		PRINT 'No such dispatcher exists';
		RETURN
	END;

	IF (@WantToDeleteFromOrders = 1)
	BEGIN
		DELETE FROM Orders
		WHERE dispatcherID = @OldID;
	END;
	ELSE IF EXISTS (SELECT * FROM Dispatchers WHERE ID = @NewID)
		UPDATE Orders
		SET dispatcherID = @NewID
		WHERE dispatcherID = @OldID;
	ELSE
	BEGIN
		SET @NewID = NULL;

		UPDATE Orders
		SET dispatcherID = NULL
		WHERE dispatcherID = @OldID;
	END;

	DELETE FROM Dispatchers
	WHERE ID = @OldID;

	PRINT 'Deleted dispatcher with ID = ' + CAST(@OldID AS VARCHAR);

	IF (@WantToDeleteFromOrders = 1)
		PRINT 'Deleted rows from Orders with dispatcherID = ' + CAST(@OldID AS VARCHAR);
	ELSE
		PRINT 'Updated row(s) in Orders with dispatcherID = ' + CAST(@OldID AS VARCHAR) + ' by setting dispatcherID = ' + IIF(@NewID IS NULL, 'NULL', CAST(@NewID AS VARCHAR));
END;
GO
USE master
GO

/* Example
EXEC dbo.delete_dispatchers 1;
EXEC dbo.delete_dispatchers 2, 0;
EXEC dbo.delete_dispatchers 3, 0, 4;
EXEC dbo.delete_dispatchers 4, 0, 1000;
*/