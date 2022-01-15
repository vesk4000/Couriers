-- source\crud-procedures\add-address.sql
-- Add a Address to the database
exec udp_AddAddress '123 Address Str.';
exec udp_AddAddress '123 Address Str.';

-- source\crud-procedures\add-client.sql
-- Add a client to the database
exec udp_AddClient 'Tom Scott', '0888888888';
exec udp_AddClient 'John Doe', 'not a phone number';
exec udp_AddClient 'Tom Scott', '0888888888';

-- source\crud-procedures\add-courier.sql
-- Add a courier to the database
exec udp_AddCourier 'Bill Smith', '0888888888';
exec udp_AddCourier 'John Smith', 'not a phone number';
exec udp_AddCourier 'Bill Smith', '0888888888';

-- source\crud-procedures\add-dispatcher.sql
-- Add a dispatcher to the database
exec udp_AddDispatcher 'Will Smith', '0888888888';
exec udp_AddDispatcher 'Will Doe', 'not a phone number';
exec udp_AddDispatcher 'Will Smith', '0888888888';

-- source\crud-procedures\add-order.sql
-- Add an order to the database
exec udp_AddOrder 'Tom Scott', '0888888888';

-- source\crud-procedures\add-recipient.sql
-- Add a recipient to the database
exec udp_AddRecipient 'Tom Recipient';
exec udp_AddRecipient 'Tom Recipient';

-- source\crud-procedures\add-type-of-service.sql
-- Add a type of service to the database
exec udp_AddTypeOfService 'An amazing service';
exec udp_AddTypeOfService 'An amazing service';

-- source\queries\OutRequest1.sql
-- This displays a client's name and phone number via searching by part of name or phone number

exec usp_CheckClientPartOfNameOrPhone 'Шон'
exec usp_CheckClientPartOfNameOrPhone '0888'


-- source\queries\OutRequest2.sql
-- This displays all orders of a specific dispatcher by name or on a certain date of delivery

exec usp_CheckByDispNameOrDateOfDelivery '09-15-2021'
exec usp_CheckByDispNameOrDateOfDelivery 'Асен Донев'


-- source\queries\OutRequest3.sql
-- This returns the total of all orders by a specific customer

exec usp_TotalOfOrdersByClient 'Нено Ненов'
exec usp_TotalOfOrdersByClient 'Борис Зарев'


-- source\queries\OutRequest4.sql
-- This returns all orders made on a specific date

exec usp_OrdersByDateOfOrder '9/9/2021'
exec usp_OrdersByDateOfOrder '8/16/2021'


-- source\queries\OutRequest5.sql
-- This returns all orders of a specific courier

exec usp_PackagesByCourier 'Камен Каменов'
exec usp_PackagesByCourier 'Мони Иванова'


-- source\queries\usp_dates_with_most_delivered_orders.sql
-- reads and prints the names and the count of the orders of each recipient


-- source\queries\usp_names_of_recipients_by_order_count.sql
-- reads and prints the names and the count of the orders of each recipient
EXEC dbo.usp_names_of_recipients_by_order_count

-- source\queries\usp_name_phonenumber_category.sql
-- reads and prints the name, the phone number, and the category (client, dispatcher, courier) for each person in the system (Database)
EXEC dbo.usp_name_phonenumber_category;

-- source\queries\usp_orders_count_by_order_date.sql
-- reads and prints the count of the orders grouped by the order date
EXEC dbo.usp_orders_count_by_order_date
GO

-- source\queries\usp_orders_profit_by_tos.sql
-- reads and prints the profit (sum of totals) for each order type (type of service)
EXEC usp_orders_profit_by_tos

