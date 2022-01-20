use CouriersDB
go

create or alter proc udp_UpdateDispatcher
	@ID int,
	@Name nvarchar(50) = NULL,
	@PhoneNumber nvarchar(50) = NULL
as begin
	if not exists (
		select * from Dispatchers
		where ID = @ID
	)
	begin
		print 'No Dispatcher with this ID exists!'
		return
	end

	if @Name is not NULL
	begin
		update Dispatchers
		set Name = @Name
		where ID = @ID
	end

	if @PhoneNumber is not NULL
	begin
		update Dispatchers
		set PhoneNumber = @PhoneNumber
		where ID = @ID
	end

	print 'Dispatcher updated!'
end
go

use master
go

/* Example
-- Update a Dispatchers' Credentials
exec udp_UpdateDispatcher 5, 'Tom', '089899898'
exec udp_UpdateDispatcher 5, 'Don'
exec udp_UpdateDispatcher 5, NULL, '798797898'
exec udp_UpdateDispatcher 5, @PhoneNumber = '456465456'
exec udp_UpdateDispatcher 1000
*/