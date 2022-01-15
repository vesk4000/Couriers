use CouriersDB
go

create or alter proc udp_AddAddress
	@Name nvarchar(50)
as begin
	if exists(
		select * from Addresses
		where Address = @Name
	)
	begin
		print 'This address is already in the database!'
		return
	end
	insert into Addresses values (@Name);
	declare @id int = (
		select top 1 ID from Addresses
		where Address = @Name)
	print 'Address added with ID: ' + cast(@id as nvarchar(50))
end
go

use master
go

/* Example
-- Add a Address to the database
exec udp_AddAddress '123 Address Str.';
exec udp_AddAddress '123 Address Str.';
*/