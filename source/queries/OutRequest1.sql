use CouriersDB

go

create or alter function _udf_CheckPhoneNumber (@PhoneNumber nvarchar(50))
returns bit as begin
	if not @PhoneNumber like '%[^0-9]%'
		return 1;
	return 0;
end;

go

create or alter procedure usp_CheckClientPartOfNameOrPhone( @input nvarchar(50) )
as
begin

	if( dbo._udf_CheckPhoneNumber(@input) = 1 )
	begin
		select Name as [Client Name], PhoneNumber as [Phone Number] from Clients
		where CHARINDEX(@input, PhoneNumber) > 0
		return
	end

	select Name as [Client Name], PhoneNumber as [Phone Number] from Clients
	where CHARINDEX(@input, Name) > 0
	return


end

go
exec usp_CheckClientPartOfNameOrPhone 'Шон'

use master

go

/* Example
-- This displays a client's name and phone number via searching by part of name or phone number
exec usp_CheckClientPartOfNameOrPhone 'Шон'
exec usp_CheckClientPartOfNameOrPhone '0888'