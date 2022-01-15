use CouriersDB
go

drop table if exists Addresses

CREATE TABLE Addresses (
	ID int identity(1, 1) NOT NULL primary key,
	Address varchar(50) NOT NULL unique,
)
GO

use master
go