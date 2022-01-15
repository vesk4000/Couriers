use CouriersDB
go

drop table if exists Clients

CREATE TABLE Clients (
	ID int identity(1, 1) NOT NULL primary key,
	Name varchar(50) NOT NULL,
	PhoneNumber varchar(10) NOT NULL,
	unique(Name, PhoneNumber)
)
GO

use master
go