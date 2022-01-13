use master
go

drop database CouriersDB
go

CREATE DATABASE CouriersDB
COLLATE Cyrillic_General_CI_AS
GO

USE CouriersDB;
GO

CREATE TABLE [Clients] (
	ID int identity(1, 1) NOT NULL,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	PhoneNumber varchar(10) NOT NULL,
	CONSTRAINT [PK_CLIENTS] PRIMARY KEY CLUSTERED (
		[ID] ASC
	) WITH (IGNORE_DUP_KEY = OFF),
	unique(FirstName, LastName, PhoneNumber)
)
GO

CREATE TABLE [Dispatchers] (
	ID int identity(1, 1) NOT NULL,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	PhoneNumber varchar(10) NOT NULL,
	CONSTRAINT [PK_DISPATCHERS] PRIMARY KEY CLUSTERED (
		[ID] ASC
	) WITH (IGNORE_DUP_KEY = OFF),
	unique(FirstName, LastName, PhoneNumber)
)
GO
CREATE TABLE [Couriers] (
	ID int identity(1, 1) NOT NULL,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	PhoneNumber varchar(10) NOT NULL,
	CONSTRAINT [PK_COURIERS] PRIMARY KEY CLUSTERED (
		[ID] ASC
	) WITH (IGNORE_DUP_KEY = OFF),
	unique(FirstName, LastName, PhoneNumber)
)
GO

CREATE TABLE [Orders] (
	ID int identity(1, 1) NOT NULL,
	OrderDate date NOT NULL,
	ReceiveDate date NOT NULL,
	Total int NOT NULL,
	AddressID int NOT NULL,
	TypeID int NOT NULL,
	DispatcherID int NOT NULL,
	ClientID int NOT NULL,
	CourierID int NOT NULL,
	RecipientID int NOT NULL,
	CONSTRAINT [PK_ORDERS] PRIMARY KEY CLUSTERED (
		[ID] ASC
	) WITH (IGNORE_DUP_KEY = OFF)
)
GO
CREATE TABLE [Recipients] (
	ID int identity(1, 1) NOT NULL,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	CONSTRAINT [PK_RECIPIENTS] PRIMARY KEY CLUSTERED (
		[ID] ASC
	) WITH (IGNORE_DUP_KEY = OFF),
	unique(FirstName, LastName)
)
GO

CREATE TABLE [TypesOfService] (
	ID int identity(1, 1) NOT NULL,
	Type varchar(50) unique NOT NULL,
	CONSTRAINT [PK_TYPESOFSERVICE] PRIMARY KEY CLUSTERED (
		[ID] ASC
	) WITH (IGNORE_DUP_KEY = OFF)
)
GO

CREATE TABLE [Addresses] (
	ID int identity(1, 1) NOT NULL,
	Address varchar(100) unique NOT NULL,
	CONSTRAINT [PK_ADDRESSES] PRIMARY KEY CLUSTERED (
		[ID] ASC
	) WITH (IGNORE_DUP_KEY = OFF)
)
GO

ALTER TABLE [Orders] WITH CHECK ADD CONSTRAINT [Orders_fk0] FOREIGN KEY ([AddressID]) REFERENCES [Addresses]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Orders] CHECK CONSTRAINT [Orders_fk0]
GO
ALTER TABLE [Orders] WITH CHECK ADD CONSTRAINT [Orders_fk1] FOREIGN KEY ([TypeID]) REFERENCES [TypesOfService]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Orders] CHECK CONSTRAINT [Orders_fk1]
GO
ALTER TABLE [Orders] WITH CHECK ADD CONSTRAINT [Orders_fk2] FOREIGN KEY ([DispatcherID]) REFERENCES [Dispatchers]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Orders] CHECK CONSTRAINT [Orders_fk2]
GO
ALTER TABLE [Orders] WITH CHECK ADD CONSTRAINT [Orders_fk3] FOREIGN KEY ([ClientID]) REFERENCES [Clients]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Orders] CHECK CONSTRAINT [Orders_fk3]
GO
ALTER TABLE [Orders] WITH CHECK ADD CONSTRAINT [Orders_fk4] FOREIGN KEY ([CourierID]) REFERENCES [Couriers]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Orders] CHECK CONSTRAINT [Orders_fk4]
GO
ALTER TABLE [Orders] WITH CHECK ADD CONSTRAINT [Orders_fk5] FOREIGN KEY ([RecipientID]) REFERENCES [Recipients]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Orders] CHECK CONSTRAINT [Orders_fk5]
GO




