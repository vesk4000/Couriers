USE CouriersDB
GO

CREATE OR ALTER PROC delete_orders @OldID INT
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Orders WHERE ID = @OldID)
	BEGIN
		PRINT 'No such order exists';
		RETURN;
	END;
	
	DELETE FROM Orders
	WHERE ID = @OldID;

	PRINT 'Deleted order with ID = ' + CAST(@OldID AS VARCHAR);
END;
GO
USE master
GO

/* Example
EXEC dbo.delete_orders 1;
*/