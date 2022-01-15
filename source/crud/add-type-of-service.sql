use CouriersDB
go

create or alter proc udp_AddTypeOfService
	@Name nvarchar(50)
as begin
	if exists(
		select * from TypesOfService
		where Type = @Name
	)
	begin
		print 'This type is already in the database!'
		return
	end
	insert into TypesOfService values (@Name);
	declare @id int = (
		select top 1 ID from TypesOfService
		where Type = @Name)
	print 'Type added with ID: ' + cast(@id as nvarchar(50))
end
go

use master
go

/* Example
-- Add a type of service to the database
exec udp_AddTypeOfService 'An amazing service';
exec udp_AddTypeOfService 'An amazing service';
*/