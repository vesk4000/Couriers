use CouriersDB
go

create or alter proc udp_UpdateClient
	@ID int,
	@Name nvarchar(50) = NULL,
	@PhoneNumber nvarchar(50) = NULL
as begin
	if not exists (
		select * from Clients
		where ID = @ID
	)
	begin
		print 'No client with this ID exists!'
		return
	end

	if @Name is not NULL
	begin
		update Clients
		set Name = @Name
		where ID = @ID
	end

	if @PhoneNumber is not NULL
	begin
		update Clients
		set PhoneNumber = @PhoneNumber
		where ID = @ID
	end

	print 'Client updated!'
end
go

use master
go

/* Example
-- Update a Clients' Credentials
exec udp_UpdateClient 5, 'Tom', '089899898'
exec udp_UpdateClient 5, 'Don'
exec udp_UpdateClient 5, NULL, '798797898'
exec udp_UpdateClient 5, @PhoneNumber = '456465456'
exec udp_UpdateClient 1000
*/