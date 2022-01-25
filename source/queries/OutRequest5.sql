use CouriersDB

go

create or alter procedure usp_PackagesByCourier( @input nvarchar(50) )
as
begin

	select 
		o.ID as [Order ID],
		o.OrderDate as [Order Date],
		d.Name as [Dispatcher Name], 
		d.PhoneNumber as [Dispatcher Phone], 
		cl.Name as [Client Name], 
		cl.PhoneNumber as [Client Phone], 
		t.Type as [Type of Service], 
		o.Total as [Total], 
		co.Name as [Courier Name], 
		co.PhoneNumber as [Courier Phone], 
		a.Address as [Delivery Address],
		r.Name as [Recipient Name],
		o.ReceiveDate as [Date of Delivery]

	from Orders as o

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

	where @input = co.Name

end

go

use master

go

/* Example
-- This returns all orders of a specific courier
exec usp_PackagesByCourier 'Камен Каменов'
exec usp_PackagesByCourier 'Мони Иванова'
*/