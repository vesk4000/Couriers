use CouriersDB
go

create or alter proc udp_AddClient
	@Name nvarchar(50),
	@PhoneNumber nvarchar(50)
as begin
	if exists(
		select * from Clients
		where Name = @Name and PhoneNumber = @PhoneNumber
	)
	begin
		print 'A client with the same name and phone number already exists!'
		return
	end
	if dbo._udf_CheckPhoneNumber(@PhoneNumber) = 0 begin
		print 'The phone number provided is not valid!'
		return
	end
	insert into Clients values (@Name, @PhoneNumber);
	declare @id int = (
		select top 1 ID from Clients
		where Name = @Name and PhoneNumber = @PhoneNumber)
	print 'Client added with ID: ' + cast(@id as nvarchar(50))
end
go

use master
go

/* Example
-- Add a client to the database
exec udp_AddClient 'Tom Scott', '0888888888';
exec udp_AddClient 'John Doe', 'not a phone number';
exec udp_AddClient 'Tom Scott', '0888888888';
*/