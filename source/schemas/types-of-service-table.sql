use CouriersDB
go

drop table if exists TypesOfService

CREATE TABLE TypesOfService (
	ID int identity(1, 1) NOT NULL primary key,
	Type varchar(50) NOT NULL unique,
)
GO

use master
go