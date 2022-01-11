use CouriersDB
go

create or alter function _udf_CheckPhoneNumber (@PhoneNumber nvarchar(50))
returns bit as begin
	/*declare @i int = 0
	while @i < len(@PhoneNumber) begin
		if
		set @i = @i + 1
	end
	return true*/
	if not @PhoneNumber like '%[^0-9]%'
		return 1;
	return 0;
end;
go

print dbo._udf_CheckPhoneNumber('sdasfhdsfghadsghafgh4656556460')
go

--create or alter function _

/*create or alter proc udp_AddClient
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@PhoneNumber nvarchar(50)
as begin
	
end go*/