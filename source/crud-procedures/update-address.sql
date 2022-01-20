use CouriersDB
go

create or alter proc udp_UpdateAddress
	@ID int,
	@Address nvarchar(50) = NULL
as begin
	if not exists (
		select * from Addresses
		where ID = @ID
	)
	begin
		print 'No Address with this ID exists!'
		return
	end

	if @Address is not NULL
	begin
		update Addresses
		set Address = @Address
		where ID = @ID
	end

	print 'Address updated!'
end
go

use master
go

/* Example
-- Update an address
exec udp_UpdateAddress 5, 'Random Address'
exec udp_UpdateAddress 5, NULL
exec udp_UpdateAddress 1000
*/