use CouriersDB
go

create or alter proc udp_UpdateTypeOfService
	@ID int,
	@Type nvarchar(50) = NULL
as begin
	if not exists (
		select * from TypesOfService
		where ID = @ID
	)
	begin
		print 'No Type with this ID exists!'
		return
	end

	if @Type is not NULL
	begin
		update TypesOfService
		set Type = @Type
		where ID = @ID
	end

	print 'Type updated!'
end
go

exec udp_UpdateTypeOfService 2, 'Type Of Service'
exec udp_UpdateTypeOfService 2, NULL
exec udp_UpdateTypeOfService 1000
select * from TypesOfService

use master
go

/* Example
-- Update a type of service
exec udp_UpdateTypeOfService 2, 'Type Of Service'
exec udp_UpdateTypeOfService 2, NULL
exec udp_UpdateTypeOfService 1000
*/