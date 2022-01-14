use CouriersDB
go

create or alter proc udp_AddCourier
	@Name nvarchar(50),
	@PhoneNumber nvarchar(50)
as begin
	if exists(
		select * from Couriers
		where Name = @Name and PhoneNumber = @PhoneNumber
	)
	begin
		print 'A courier with the same name and phone number already exists!'
		return
	end
	if dbo._udf_CheckPhoneNumber(@PhoneNumber) = 0 begin
		print 'The phone number provided is not valid!'
		return
	end
	insert into Couriers values (@Name, @PhoneNumber);
	declare @id int = (
		select top 1 ID from Couriers
		where Name = @Name and PhoneNumber = @PhoneNumber)
	print 'Courier added with ID: ' + cast(@id as nvarchar(50))
end
go

use master
go

/* Example
-- Add a courier to the database
exec udp_AddCourier 'Bill Smith', '0888888888';
exec udp_AddCourier 'John Smith', 'not a phone number';
exec udp_AddCourier 'Bill Smith', '0888888888';
*/