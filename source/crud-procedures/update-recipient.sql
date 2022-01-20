use CouriersDB
go

create or alter proc udp_UpdateRecipient
	@ID int,
	@Name nvarchar(50) = NULL
as begin
	if not exists (
		select * from Recipients
		where ID = @ID
	)
	begin
		print 'No Recipient with this ID exists!'
		return
	end

	if @Name is not NULL
	begin
		update Recipients
		set Name = @Name
		where ID = @ID
	end

	print 'Recipient updated!'
end
go

use master
go

/* Example
-- Update a Recipient's Credentials
exec udp_UpdateAddress 5, 'Random Name'
exec udp_UpdateAddress 5, NULL
exec udp_UpdateAddress 1000
*/