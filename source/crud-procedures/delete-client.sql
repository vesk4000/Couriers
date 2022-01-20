USE CouriersDB
GO

CREATE OR ALTER PROC delete_clients @OldID INT, @WantToDeleteFromOrders BIT = 1, @NewID INT = NULL
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Clients WHERE ID = @OldID)
	BEGIN
		PRINT 'No such client exists';
		RETURN
	END;
	
	DECLARE @DeleteOrUpdate BIT = 0;

	IF (@WantToDeleteFromOrders = 1)
	BEGIN
		SET @DeleteOrUpdate = 1;

		DELETE FROM Orders
		WHERE ClientID = @OldID;
	END;
	ELSE IF EXISTS (SELECT * FROM Clients WHERE ID = @NewID)
		UPDATE Orders
		SET ClientID = @NewID
		WHERE ClientID = @OldID;
	ELSE
	BEGIN
		SET @NewID = NULL;

		UPDATE Orders
		SET ClientID = NULL
		WHERE ClientID = @OldID;
	END;

	DELETE FROM Clients
	WHERE ID = @OldID;

	PRINT 'Deleted Client with ID = ' + CAST(@OldID AS VARCHAR);

	IF (@DeleteOrUpdate = 1)
		PRINT 'Deleted rows from Orders with clientID = ' + CAST(@OldID AS VARCHAR);
	ELSE
		PRINT 'Updated row(s) in Orders with clientID = ' + CAST(@OldID AS VARCHAR) + ' by setting clientID = ' + IIF(@NewID IS NULL, 'NULL', CAST(@NewID AS VARCHAR));
END;
GO
USE master
GO

/* Example
EXEC dbo.delete_clients 1;
EXEC dbo.delete_clients 2, 0;
EXEC dbo.delete_clients 3, 0, 4;
EXEC dbo.delete_clients 4, 0, 1000;
*/
