use CouriersDB
go

drop table if exists Recipients

CREATE TABLE Recipients (
	ID int identity(1, 1) NOT NULL primary key,
	Name varchar(50) NOT NULL unique,
)
GO

use master