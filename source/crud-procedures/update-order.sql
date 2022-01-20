use CouriersDB
go

create or alter proc udp_UpdateOrder
	@ID int,
	@OrderDate Date = NULL,
	@ReceiveDate Date = NULL,
	@Total money = NULL,
	@AddressID int = NULL,
	@TypeID int = NULL,
	@DispatcherID int = NULL,
	@ClientID int = NULL,
	@CourierID int = NULL,
	@RecipientID int = NULL
as begin
	if not exists (
		select * from Clients
		where ID = @ID
	)
	begin
		print 'No order with this ID exists!'
		return
	end

	if @OrderDate is not NULL
	begin
		update Orders
		set OrderDate = @OrderDate
		where ID = @ID
	end

	if @ReceiveDate is not NULL
	begin
		update Orders
		set ReceiveDate = @ReceiveDate
		where ID = @ID
	end

	if @Total is not NULL
	begin
		update Orders
		set Total = @Total
		where ID = @ID
	end

	if @AddressID is not NULL
	begin
		update Orders
		set AddressID = @AddressID
		where ID = @ID
	end

	if @CourierID is not NULL
	begin
		update Orders
		set CourierID = @CourierID
		where ID = @ID
	end

	if @DispatcherID is not NULL
	begin
		update Orders
		set DispatcherID = @DispatcherID
		where ID = @ID
	end

	if @RecipientID is not NULL
	begin
		update Orders
		set RecipientID = @RecipientID
		where ID = @ID
	end

	if @TypeID is not NULL
	begin
		update Orders
		set TypeID = @TypeID
		where ID = @ID
	end

	print 'Order updated!'
end
go

exec udp_UpdateOrder 3, @Total = 10000
select * from Orders

use master
go

/* Example
-- Update a Clients' Credentials
exec udp_UpdateClient 5, 'Tom', '089899898'
exec udp_UpdateClient 5, 'Don'
exec udp_UpdateClient 5, NULL, '798797898'
exec udp_UpdateClient 5, @PhoneNumber = '456465456'
exec udp_UpdateClient 1000
*/