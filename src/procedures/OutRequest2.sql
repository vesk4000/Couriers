use CouriersDB

go

create or alter procedure usp_CheckByDispNameOrDateOfDelivery( @input nvarchar(50) )
as
begin
	
	if( ISDATE(@input) = 1 )
	begin
		select * from Orders as o    --- TODO: Replace * with specific names

		inner join Addresses as a
		on o.AddressID = a.ID

		inner join Clients as cl
		on o.ClientID = cl.ID

		inner join Couriers as co
		on o.CourierID = co.ID

		inner join Dispatchers as d
		on o.DispatcherID = d.ID

		inner join Recipients as r
		on o.RecipientID = r.ID

		inner join TypesOfService as t
		on o.TypeID = t.ID
		
		where CAST( @input as date ) = o.ReceiveDate
		return
	end
	
	else
	begin
		select * from Orders as o    --- TODO: Replace * with specific names

		inner join Addresses as a
		on o.AddressID = a.ID

		inner join Clients as cl
		on o.ClientID = cl.ID

		inner join Couriers as co
		on o.CourierID = co.ID

		inner join Dispatchers as d
		on o.DispatcherID = d.ID

		inner join Recipients as r
		on o.RecipientID = r.ID

		inner join TypesOfService as t
		on o.TypeID = t.ID
		
		where @input = d.Name
		
		return
	end


end

go

use master

go

/* Example
-- This displays all orders of a specific dispatcher by name or on a certain date of delivery

exec usp_CheckByDispNameOrDateOfDelivery '09-15-2021'
exec usp_CheckByDispNameOrDateOfDelivery 'Асен Донев'

*/