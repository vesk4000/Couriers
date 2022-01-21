use CouriersDB
go

drop table if exists Orders

CREATE TABLE Orders (
	ID int identity(1, 1) NOT NULL primary key,
	OrderDate date NOT NULL,
	ReceiveDate date NOT NULL,
	Total money NOT NULL,
	AddressID int foreign key references Addresses(ID),
	TypeID int foreign key references TypesOfService(ID),
	DispatcherID int foreign key references Dispatchers(ID),
	ClientID int foreign key references Clients(ID),
	CourierID int foreign key references Couriers(ID),
	RecipientID int foreign key references Recipients(ID),
)
GO

use master
go