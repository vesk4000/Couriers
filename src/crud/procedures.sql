use CouriersDB
go

create or alter function _udf_CheckPhoneNumber (@PhoneNumber nvarchar(50))
returns bit as begin
	if not @PhoneNumber like '%[^0-9]%'
		return 1;
	return 0;
end
go

/*
print dbo._udf_CheckPhoneNumber('sdasfhdsfghadsghafgh4656556460');
go
*/

-- Add Client
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

/*
delete from Clients

exec udp_AddClient 'John Doe', 'not a phone number';
exec udp_AddClient 'Tom Scott', '0888888888';
exec udp_AddClient 'Tom Scott', '0888888888';
go
*/

-- Add Courier
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

/*
delete from Couriers

exec udp_AddCourier 'George Doe', 'not a phone number';
exec udp_AddCourier 'Will Smith', '0888888888';
exec udp_AddCourier 'Will Smith', '0888888888';
go
*/