use CouriersDB
go

create or alter function _udf_CheckPhoneNumber (@PhoneNumber nvarchar(50))
returns bit as begin
	if not @PhoneNumber like '%[^0-9]%'
		return 1;
	return 0;
end
go

use master
go

/* _Example
-- Check if a phone number is valid
print dbo._udf_CheckPhoneNumber('088888888')
print dbo._udf_CheckPhoneNumber('notaphonenumber')
*/