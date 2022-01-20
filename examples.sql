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

-- source\crud-procedures\delete-address.sql
EXEC dbo.delete_addresses 1;
EXEC dbo.delete_addresses 2, 0;
EXEC dbo.delete_addresses 3, 0, 4;
EXEC dbo.delete_addresses 4, 0, 1000;

-- source\crud-procedures\delete-client.sql
EXEC dbo.delete_clients 1;
EXEC dbo.delete_clients 2, 0;
EXEC dbo.delete_clients 3, 0, 4;
EXEC dbo.delete_clients 4, 0, 1000;

-- source\crud-procedures\delete-courier.sql
EXEC dbo.delete_couriers 1;
EXEC dbo.delete_couriers 2, 0;
EXEC dbo.delete_couriers 3, 0, 4;
EXEC dbo.delete_couriers 4, 0, 1000;

-- source\crud-procedures\delete-dispatcher.sql
EXEC dbo.delete_dispatchers 1;
EXEC dbo.delete_dispatchers 2, 0;
EXEC dbo.delete_dispatchers 3, 0, 4;
EXEC dbo.delete_dispatchers 4, 0, 1000;

-- source\crud-procedures\delete-recipient.sql
EXEC dbo.delete_recipients 1;
EXEC dbo.delete_recipients 2, 0;
EXEC dbo.delete_recipients 3, 0, 4;
EXEC dbo.delete_recipients 4, 0, 1000;

-- source\crud-procedures\delete-type.sql
EXEC dbo.delete_types 1;
EXEC dbo.delete_types 2, 0;
EXEC dbo.delete_types 3, 0, 4;
EXEC dbo.delete_types 4, 0, 1000;

-- source\crud-procedures\update-address.sql
-- Update an address
exec udp_UpdateAddress 5, 'Random Address'
exec udp_UpdateAddress 5, NULL
exec udp_UpdateAddress 1000

-- source\crud-procedures\update-client.sql
-- Update a Clients' Credentials
exec udp_UpdateClient 5, 'Tom', '089899898'
exec udp_UpdateClient 5, 'Don'
exec udp_UpdateClient 5, NULL, '798797898'
exec udp_UpdateClient 5, @PhoneNumber = '456465456'
exec udp_UpdateClient 1000

-- source\crud-procedures\update-courier.sql
-- Update a Couriers' Credentials
exec udp_UpdateCourier 5, 'Tom', '089899898'
exec udp_UpdateCourier 5, 'Don'
exec udp_UpdateCourier 5, NULL, '798797898'
exec udp_UpdateCourier 5, @PhoneNumber = '456465456'
exec udp_UpdateCourier 1000

-- source\crud-procedures\update-dispatcher.sql
-- Update a Dispatchers' Credentials
exec udp_UpdateDispatcher 5, 'Tom', '089899898'
exec udp_UpdateDispatcher 5, 'Don'
exec udp_UpdateDispatcher 5, NULL, '798797898'
exec udp_UpdateDispatcher 5, @PhoneNumber = '456465456'
exec udp_UpdateDispatcher 1000

-- source\crud-procedures\update-order.sql
-- Update a Clients' Credentials
exec udp_UpdateClient 5, 'Tom', '089899898'
exec udp_UpdateClient 5, 'Don'
exec udp_UpdateClient 5, NULL, '798797898'
exec udp_UpdateClient 5, @PhoneNumber = '456465456'
exec udp_UpdateClient 1000

-- source\crud-procedures\update-recipient.sql
-- Update a Recipient's Credentials
exec udp_UpdateAddress 5, 'Random Name'
exec udp_UpdateAddress 5, NULL
exec udp_UpdateAddress 1000

-- source\crud-procedures\update-type-of-service.sql
-- Update a type of service
exec udp_UpdateTypeOfService 2, 'Type Of Service'
exec udp_UpdateTypeOfService 2, NULL
exec udp_UpdateTypeOfService 1000

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
EXEC dbo.usp_dates_with_most_delivered_orders

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

