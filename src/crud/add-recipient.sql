use CouriersDB
go

create or alter proc udp_AddRecipient
	@Name nvarchar(50)
as begin
	if exists(
		select * from Recipients
		where Name = @Name
	)
	begin
		print 'A recipient with the same name already exists!'
		return
	end
	insert into Recipients values (@Name);
	declare @id int = (
		select top 1 ID from Recipients
		where Name = @Name)
	print 'Recipient added with ID: ' + cast(@id as nvarchar(50))
end
go

use master
go

/* Example
-- Add a recipient to the database
exec udp_AddRecipient 'Tom Recipient';
exec udp_AddRecipient 'Tom Recipient';
*/