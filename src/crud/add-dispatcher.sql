use CouriersDB
go

create or alter proc udp_AddDispatcher
	@Name nvarchar(50),
	@PhoneNumber nvarchar(50)
as begin
	if exists(
		select * from Dispatchers
		where Name = @Name and PhoneNumber = @PhoneNumber
	)
	begin
		print 'A dispatcher with the same name and phone number already exists!'
		return
	end
	if dbo._udf_CheckPhoneNumber(@PhoneNumber) = 0 begin
		print 'The phone number provided is not valid!'
		return
	end
	insert into Dispatchers values (@Name, @PhoneNumber);
	declare @id int = (
		select top 1 ID from Dispatchers
		where Name = @Name and PhoneNumber = @PhoneNumber)
	print 'Dispatcher added with ID: ' + cast(@id as nvarchar(50))
end
go

use master
go

/* Example
-- Add a dispatcher to the database
exec udp_AddDispatcher 'Will Smith', '0888888888';
exec udp_AddDispatcher 'Will Doe', 'not a phone number';
exec udp_AddDispatcher 'Will Smith', '0888888888';
*/