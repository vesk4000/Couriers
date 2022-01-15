use CouriersDB
go

create or alter proc udp_AddOrders
	@OrderDate Date,
	@ReceiveDate Date,
	@Total money,
	@AddressID int,
	@TypeID int,
	@DispatcherID int,
	@ClientID int,
	@CourierID int,
	@RecipientID int
as begin
	if not exists(
		select * from Addresses
		where ID = @AddressID
	) begin
		print 'Invalid Address ID!'
		return
	end

	if not exists(
		select * from TypesOfService
		where ID = @TypeID
	) begin
		print 'Invalid Type ID!'
		return
	end

	if not exists(
		select * from Dispatchers
		where ID = @DispatcherID
	) begin
		print 'Invalid Dispatcher ID!'
		return
	end

	if not exists(
		select * from Clients
		where ID = @ClientID
	) begin
		print 'Invalid Client ID!'
		return
	end
	
	if not exists(
		select * from Couriers
		where ID = @CourierID
	) begin
		print 'Invalid Courier ID!'
		return
	end

	if not exists(
		select * from Recipients
		where ID = @RecipientID
	) begin
		print 'Invalid Recipient ID!'
		return
	end

	if exists(
		select * from Orders
		where OrderDate = @OrderDate
		and ReceiveDate = @ReceiveDate
		and Total = @Total
		and AddressID = @AddressID
		and TypeID = @TypeID
		and DispatcherID = @DispatcherID
		and ClientID = @ClientID
		and CourierID = @CourierID
		and RecipientID = @RecipientID
	) begin
		print 'This order is already in the database!'
		return
	end

	insert into Orders values (
		@OrderDate,
		@ReceiveDate,
		@Total,
		@AddressID,
		@TypeID,
		@DispatcherID,
		@ClientID,
		@CourierID,
		@RecipientID);
	declare @id int = (
		select top 1 ID from Orders
		where OrderDate = @OrderDate
		and ReceiveDate = @ReceiveDate
		and Total = @Total
		and AddressID = @AddressID
		and TypeID = @TypeID
		and DispatcherID = @DispatcherID
		and ClientID = @ClientID
		and CourierID = @CourierID
		and RecipientID = @RecipientID)
	print 'Order added with ID: ' + cast(@id as nvarchar(50))
end
go

select * from Orders as o

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

use master
go

/* Example
-- Add an order to the database
exec udp_AddOrder 'Tom Scott', '0888888888';
*/