use CouriersDB
go

create or alter proc udp_UpdateCourier
	@ID int,
	@Name nvarchar(50) = NULL,
	@PhoneNumber nvarchar(50) = NULL
as begin
	if not exists (
		select * from Couriers
		where ID = @ID
	)
	begin
		print 'No courier with this ID exists!'
		return
	end

	if @Name is not NULL
	begin
		update Couriers
		set Name = @Name
		where ID = @ID
	end

	if @PhoneNumber is not NULL
	begin
		update Couriers
		set PhoneNumber = @PhoneNumber
		where ID = @ID
	end

	print 'Courier updated!'
end
go

use master
go

/* Example
-- Update a Couriers' Credentials
exec udp_UpdateCourier 5, 'Tom', '089899898'
exec udp_UpdateCourier 5, 'Don'
exec udp_UpdateCourier 5, NULL, '798797898'
exec udp_UpdateCourier 5, @PhoneNumber = '456465456'
exec udp_UpdateCourier 1000
*/