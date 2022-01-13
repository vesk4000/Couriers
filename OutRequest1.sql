create or alter function _udf_CheckPhoneNumber (@PhoneNumber nvarchar(50))
returns bit as begin
	if not @PhoneNumber like '%[^0-9]%'
		return 1;
	return 0;
end;
go

--print dbo._udf_CheckPhoneNumber('sdasfhdsfghadsghafgh4656556460')
go


create or alter procedure usp_CheckPartOfNameOrPhone( @input nvarchar(50) )
as
begin
	
	if( dbo._udf_CheckPhoneNumber(@input) = 1 )
	begin
		select * from Clients
		where CHARINDEX(@input, PhoneNumber) > 0
		return
	end
	
	select * from Clients
	where CHARINDEX(@input, FirstName) > 0
	return
	

end

go

exec usp_CheckPartOfNameOrPhone 'peta'
exec usp_CheckPartOfNameOrPhone '131'
