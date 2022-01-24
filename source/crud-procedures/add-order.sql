use CouriersDB
go

create or alter proc udp_AddOrder
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

use master
go


/* Example
-- Add an order to the database
exec udp_AddOrder '01-25-2022', '01-30-2022', 5000, 5, 2, 4, 1, 2, 3
*/