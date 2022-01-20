USE CouriersDB
GO

CREATE OR ALTER PROC delete_recipients @OldID INT, @WantToDeleteFromOrders BIT = 1, @NewID INT = NULL
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Recipients WHERE ID = @OldID)
	BEGIN
		PRINT 'No such recipient exists';
		RETURN
	END;
	
	DECLARE @DeleteOrUpdate BIT = 0;

	IF (@WantToDeleteFromOrders = 1)
	BEGIN
		SET @DeleteOrUpdate = 1;

		DELETE FROM Orders
		WHERE recipientID = @OldID;
	END;
	ELSE IF EXISTS (SELECT * FROM Recipients WHERE ID = @NewID)
		UPDATE Orders
		SET recipientID = @NewID
		WHERE recipientID = @OldID;
	ELSE
	BEGIN
		SET @NewID = NULL;

		UPDATE Orders
		SET recipientID = NULL
		WHERE recipientID = @OldID;
	END;

	DELETE FROM Recipients
	WHERE ID = @OldID;

	PRINT 'Deleted recipient with ID = ' + CAST(@OldID AS VARCHAR);

	IF (@DeleteOrUpdate = 1)
		PRINT 'Deleted rows from Orders with recipientID = ' + CAST(@OldID AS VARCHAR);
	ELSE
		PRINT 'Updated row(s) in Orders with recipientID = ' + CAST(@OldID AS VARCHAR) + ' by setting recipientID = ' + IIF(@NewID IS NULL, 'NULL', CAST(@NewID AS VARCHAR));
END;
GO
USE master
GO

/* Example
EXEC dbo.delete_recipients 1;
EXEC dbo.delete_recipients 2, 0;
EXEC dbo.delete_recipients 3, 0, 4;
EXEC dbo.delete_recipients 4, 0, 1000;
*/