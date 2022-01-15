use master
go

drop database if exists CouriersDB
go

create database CouriersDB
collate Cyrillic_General_CI_AS
GO

use master
go
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
use CouriersDB
go

drop table if exists Couriers

CREATE TABLE Couriers (
	ID int identity(1, 1) NOT NULL primary key,
	Name varchar(50) NOT NULL,
	PhoneNumber varchar(10) NOT NULL,
	unique(Name, PhoneNumber)
)
GO

use master
go
use CouriersDB
go

drop table if exists Dispatchers

CREATE TABLE Dispatchers (
	ID int identity(1, 1) NOT NULL primary key,
	Name varchar(50) NOT NULL,
	PhoneNumber varchar(10) NOT NULL,
	unique(Name, PhoneNumber)
)
GO

use master
go
use CouriersDB
go

drop table if exists Recipients

CREATE TABLE Recipients (
	ID int identity(1, 1) NOT NULL primary key,
	Name varchar(50) NOT NULL unique,
)
GO

use master
go
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
use CouriersDB
go

drop table if exists Orders

CREATE TABLE Orders (
	ID int identity(1, 1) NOT NULL primary key,
	OrderDate date NOT NULL,
	ReceiveDate date NOT NULL,
	Total money NOT NULL,
	AddressID int NOT NULL foreign key references Addresses(ID),
	TypeID int NOT NULL foreign key references TypesOfService(ID),
	DispatcherID int NOT NULL foreign key references Dispatchers(ID),
	ClientID int NOT NULL foreign key references Clients(ID),
	CourierID int NOT NULL foreign key references Couriers(ID),
	RecipientID int NOT NULL foreign key references Recipients(ID),
)
GO

use master
go
use CouriersDB
go

CREATE TABLE Addresses_Temp(
    Address VARCHAR(50)
);
INSERT INTO dbo.Addresses_Temp VALUES
    ('ул. Бреза 9'),
    ('ул. Александър Кръстев 22'),
    ('ул. Вардар 8'),
    ('ул. Бук 18'),
    ('ул. Здравко Чакъров 100'),
    ('ул. Здравко Чакъров 100'),
    ('ул. Иван Вазов 24'),
    ('ул. Дрин 66'),
    ('ул. Блян, бл. 56'),
    ('ул. Дрин 66'),
    ('ул. Жеравна 120'),
    ('ул. Блян, бл. 56'),
    ('ул. Емануил Поптодоров 20'),
    ('ул. Драгаш 56'),
    ('ул. Ивайло 15'),
    ('ул. Блян, бл. 56'),
    ('ул. Ивайло 15'),
    ('ул. Блян, бл. 65'),
    ('ул. Емил Гаванаков 25'),
    ('ул. Ивайло 15'),
    ('ул. Блян, бл. 65'),
    ('ул. Емил Гаванаков 5'),
    ('ул. Блян, бл. 56'),
    ('ул. Иван Янев 65'),
    ('ул. Лебед 7'),
    ('ул. Иван Троянски 22'),
    ('ул. Иван Владиков 23'),
    ('ул. Дядо Димитър 16'),
    ('ул. Дядо Димитър 16'),
    ('ул. Иван Троянски 22'),
    ('ул. Зограф 6'),
    ('ул. Лебед 7'),
    ('ул. Дядо Димитър 16'),
    ('ул. Иван Троянски 22'),
    ('ул. Божур 9'),
    ('ул. Божур 9');
INSERT INTO Addresses
SELECT DISTINCT Address FROM Addresses_Temp;
GO

DROP TABLE Addresses_Temp;
GO

use master
go
use CouriersDB
go

CREATE TABLE Clients_Temp (
    Name VARCHAR(50),
    PhoneNumber VARCHAR(10)
);
INSERT INTO Clients_Temp VALUES
    ('Галин Христов',0888555111),
    ('Джим Шон',0888555222),
    ('Джим Шон',0888555222),
    ('Галин Христов',0888555111),
    ('Борис Зарев',0889777555),
    ('Борис Зарев',0889777555),
    ('Румен Огнянов',0888555788),
    ('Милен Галев',0887555777),
    ('Христо Христов',0889555123),
    ('Милен Галев',0887555777),
    ('Орлин Балев',0889123121),
    ('Христо Христов',0889555123),
    ('Араам Безисян',0823555444),
    ('Нено Ненов',0888555666),
    ('Шон Петерсон',0881555111),
    ('Христо Христов',0889555123),
    ('Шон Петерсон',0881555111),
    ('Стамен Киров',0883555246),
    ('Нено Ненов',0888555666),
    ('Шон Петерсон',0881555111),
    ('Стамен Киров',0883555246),
    ('Филип Филипов',0888555333),
    ('Христо Христов',0889555123),
    ('Севинч Халилова',0888999567),
    ('Нено Ненов',0888555666),
    ('Светлин Манев',0889245543),
    ('Светлин Манев',0889245543),
    ('Нено Ненов',0888555666),
    ('Нено Ненов',0888555666),
    ('Светлин Манев',0889245543),
    ('Кирил Занев',0888666111),
    ('Нено Ненов',0888555666),
    ('Нено Ненов',0888555666),
    ('Светлин Манев',0889245543),
    ('Христо Иванов',0777555111),
    ('Христо Иванов',0777555111);
INSERT INTO Clients
SELECT DISTINCT Name, '0' + PhoneNumber FROM Clients_Temp;
GO

DROP TABLE Clients_Temp;
GO

use master
go
use CouriersDB
go

CREATE TABLE Couriers_Names_Phones_Temp (
    Name VARCHAR(50),
    PhoneNumber VARCHAR(10)
);
INSERT INTO Couriers_Names_Phones_Temp VALUES
    ('Димана Донева',0876555555),
    ('Камен Каменов',0876555111),
    ('Мони Иванова',0876555222),
    ('Димана Донева',0876555555),
    ('Петър Иванов',0876555777),
    ('Петър Иванов',0876555777),
    ('Силвия Бонева',0876555666),
    ('Синтия Гочева',0876555888),
    ('Мони Иванова',0876555222),
    ('Петър Иванов',0876555777),
    ('Таня Руменова',0876555444),
    ('Калина Минкова',0876555333),
    ('Камен Каменов',0876555111),
    ('Димана Донева',0876555555),
    ('Силвия Бонева',0876555666),
    ('Мони Иванова',0876555222),
    ('Силвия Бонева',0876555666),
    ('Таня Руменова',0876555444),
    ('Синтия Гочева',0876555888),
    ('Петър Иванов',0876555777),
    ('Синтия Гочева',0876555888),
    ('Таня Руменова',0876555444),
    ('Калина Минкова',0876555333),
    ('Мони Иванова',0876555222),
    ('Калина Минкова',0876555333),
    ('Силвия Бонева',0876555666),
    ('Силвия Бонева',0876555666),
    ('Таня Руменова',0876555444),
    ('Димана Донева',0876555555),
    ('Силвия Бонева',0876555666),
    ('Калина Минкова',0876555333),
    ('Камен Каменов',0876555111),
    ('Мони Иванова',0876555222),
    ('Силвия Бонева',0876555666),
    ('Камен Каменов',0876555111),
    ('Камен Каменов',0876555111);
INSERT INTO Couriers
SELECT DISTINCT Name, '0' + PhoneNumber FROM Couriers_Names_Phones_Temp;
GO

DROP TABLE Couriers_Names_Phones_Temp;
GO

use master
go
use CouriersDB
go

CREATE TABLE Dispatchers_Temp (
    Name VARCHAR(50),
    PhoneNumber VARCHAR(10)
);
INSERT INTO Dispatchers_Temp VALUES
    ('Асен Донев',0887897555),
    ('Асен Донев',0887897555),
    ('Колю Колев',0888987555),
    ('Маша Малишкина',0881122678),
    ('Маша Малишкина',0881122678),
    ('Асен Донев',0887897555),
    ('Маша Малишкина',0881122678),
    ('Маша Малишкина',0881122678),
    ('Петър Петров',0882898666),
    ('Теа Иванова',0883567555),
    ('Теа Иванова',0883567555),
    ('Петър Петров',0882898666),
    ('Колю Колев',0888987555),
    ('Колю Колев',0888987555),
    ('Тодор Стоев',0889978555),
    ('Теа Иванова',0883567555),
    ('Маша Малишкина',0881122678),
    ('Колю Колев',0888987555),
    ('Тодор Стоев',0889978555),
    ('Колю Колев',0888987555),
    ('Тодор Стоев',0889978555),
    ('Тодор Стоев',0889978555),
    ('Асен Донев',0887897555),
    ('Тодор Стоев',0889978555),
    ('Тодор Стоев',0889978555),
    ('Тодор Стоев',0889978555),
    ('Асен Донев',0887897555),
    ('Асен Донев',0887897555),
    ('Петър Петров',0882898666),
    ('Теа Иванова',0883567555),
    ('Маша Малишкина',0881122678),
    ('Теа Иванова',0883567555),
    ('Колю Колев',0888987555),
    ('Петър Петров',0882898666),
    ('Колю Колев',0888987555),
    ('Петър Петров',0882898666);
INSERT INTO Dispatchers
SELECT DISTINCT Name, '0' + PhoneNumber FROM Dispatchers_Temp;
GO

DROP TABLE Dispatchers_Temp;
GO

use master
go
use CouriersDB
go

CREATE TABLE Recipients_Temp (
    Name VARCHAR(50)
);
INSERT INTO Recipients_Temp VALUES
    ('Галена Халиева'),
    ('Шон Джим'),
    ('Шон Джим'),
    ('Христо Галев'),
    ('Зарко Борисов'),
    ('Зарко Борисов'),
    ('Огнян Руменов'),
    ('Петко Петков'),
    ('Сиси Бонева'),
    ('Петко Петков'),
    ('Васил Ставрев'),
    ('Харалампи Харалампиев'),
    ('Безис Абрамян'),
    ('Драган Драганов'),
    ('Лиляна Павлова'),
    ('Христина Христова'),
    ('Лиляна Павлова'),
    ('Стефан Колев'),
    ('Емилия Попова'),
    ('Лиляна Павлова'),
    ('Стефан Колев'),
    ('Филип Филипополов'),
    ('Харалампи Харалампиев'),
    ('Хамид Хамид'),
    ('Тино Ненов'),
    ('Иван Троянов'),
    ('Иван Василев'),
    ('Димитър Димитров'),
    ('Димитър Димитров'),
    ('Иван Троянов'),
    ('Борислава Борисова'),
    ('Тино Ненов'),
    ('Ненчо Ненов'),
    ('Ива Иванова'),
    ('Иван Христов'),
    ('Иван Христов');
INSERT INTO Recipients
SELECT DISTINCT Name FROM Recipients_Temp;
GO

DROP TABLE Recipients_Temp;
GO

use master
go
use CouriersDB
go

CREATE TABLE TypesOfService_Temp (
    ToS VARCHAR(50)
);
INSERT INTO TypesOfService_Temp VALUES
    ('Колетна пратка над 2 до 5 кг'),
    ('Колетна пратка до 2 кг'),
    ('Колетна пратка над 2 до 5 кг'),
    ('Колетна пратка над 2 до 5 кг'),
    ('Колетна пратка над 10 до 15 кг'),
    ('Колетна пратка над 10 до 15 кг'),
    ('Колетна пратка до 2 кг'),
    ('Колетна пратка над 5 до 10 кг'),
    ('Колетна пратка до 2 кг'),
    ('Колетна пратка над 10 до 15 кг'),
    ('Колетна пратка над 10 до 15 кг'),
    ('Колетна пратка до 2 кг'),
    ('Колетна пратка над 2 до 5 кг'),
    ('Колетна пратка до 2 кг'),
    ('Колетна пратка над 10 до 15 кг'),
    ('Колетна пратка над 2 до 5 кг'),
    ('Колетна пратка над 5 до 10 кг'),
    ('Колетна пратка над 5 до 10 кг'),
    ('Колетна пратка до 2 кг'),
    ('Колетна пратка до 2 кг'),
    ('Колетна пратка над 5 до 10 кг'),
    ('Колетна пратка над 10 до 15 кг'),
    ('Колетна пратка до 2 кг'),
    ('Колетна пратка над 2 до 5 кг'),
    ('Колетна пратка над 2 до 5 кг'),
    ('Колетна пратка над 5 до 10 кг'),
    ('Колетна пратка над 10 до 15 кг'),
    ('Колетна пратка над 5 до 10 кг'),
    ('Колетна пратка над 2 до 5 кг'),
    ('Колетна пратка до 2 кг'),
    ('Колетна пратка над 2 до 5 кг'),
    ('Колетна пратка над 5 до 10 кг'),
    ('Колетна пратка до 2 кг'),
    ('Колетна пратка над 5 до 10 кг'),
    ('Колетна пратка над 10 до 15 кг'),
    ('Колетна пратка над 2 до 5 кг');
INSERT INTO TypesOfService
SELECT DISTINCT ToS FROM TypesOfService_Temp;
GO

DROP TABLE TypesOfService_Temp;
GO


use master
go
use CouriersDB
go

CREATE TABLE Orders_Temp (
    ID INT IDENTITY(1,1),
    OrderDate DATETIME,
    Disp_Name VARCHAR(50),
    Disp_PN VARCHAR(10),
    Client_Name VARCHAR(50),
    Client_PN VARCHAR(10),
    ToS VARCHAR(50),
    Total Money,
    Cour_Name VARCHAR(50),
    Cour_PN VARCHAR(10),
    Address VARCHAR(50),
    Recip_Name VARCHAR(50),
    RecieveDate DATETIME
);
INSERT INTO Orders_Temp VALUES
    ('2021-08-16 00:00:00','Асен Донев',0887897555,'Галин Христов',0888555111,'Колетна пратка над 2 до 5 кг',6.72,'Димана Донева',0876555555,'ул. Бреза 9','Галена Халиева',CONVERT(DATETIME, '20.8.2021', 104)),
    ('2021-09-09 00:00:00','Асен Донев',0887897555,'Джим Шон',0888555222,'Колетна пратка до 2 кг',6,'Камен Каменов',0876555111,'ул. Александър Кръстев 22','Шон Джим',CONVERT(DATETIME, '15.9.2021', 104)),
    ('2021-09-09 00:00:00','Колю Колев',0888987555,'Джим Шон',0888555222,'Колетна пратка над 2 до 5 кг',6.72,'Мони Иванова',0876555222,'ул. Вардар 8','Шон Джим',CONVERT(DATETIME, '15.9.2021', 104)),
    ('2021-09-14 00:00:00','Маша Малишкина',0881122678,'Галин Христов',0888555111,'Колетна пратка над 2 до 5 кг',6.72,'Димана Донева',0876555555,'ул. Бук 18','Христо Галев',CONVERT(DATETIME, '17.9.2021', 104)),
    ('2021-09-15 00:00:00','Маша Малишкина',0881122678,'Борис Зарев',0889777555,'Колетна пратка над 10 до 15 кг',12.1,'Петър Иванов',0876555777,'ул. Здравко Чакъров 100','Зарко Борисов',CONVERT(DATETIME, '21.9.2021', 104)),
    ('2021-09-17 00:00:00','Асен Донев',0887897555,'Борис Зарев',0889777555,'Колетна пратка над 10 до 15 кг',12.1,'Петър Иванов',0876555777,'ул. Здравко Чакъров 100','Зарко Борисов',CONVERT(DATETIME, '23.9.2021', 104)),
    ('2021-09-22 00:00:00','Маша Малишкина',0881122678,'Румен Огнянов',0888555788,'Колетна пратка до 2 кг',6,'Силвия Бонева',0876555666,'ул. Иван Вазов 24','Огнян Руменов',CONVERT(DATETIME, '27.9.2021', 104)),
    ('2021-10-13 00:00:00','Маша Малишкина',0881122678,'Милен Галев',0887555777,'Колетна пратка над 5 до 10 кг',10.75,'Синтия Гочева',0876555888,'ул. Дрин 66','Петко Петков',CONVERT(DATETIME, '19.10.2021', 104)),
    ('2021-10-15 00:00:00','Петър Петров',0882898666,'Христо Христов',0889555123,'Колетна пратка до 2 кг',6,'Мони Иванова',0876555222,'ул. Блян, бл. 56','Сиси Бонева',CONVERT(DATETIME, '20.10.2021', 104)),
    ('2021-10-28 00:00:00','Теа Иванова',0883567555,'Милен Галев',0887555777,'Колетна пратка над 10 до 15 кг',12.1,'Петър Иванов',0876555777,'ул. Дрин 66','Петко Петков',CONVERT(DATETIME, '2.11.2021', 104)),
    ('2021-11-01 00:00:00','Теа Иванова',0883567555,'Орлин Балев',0889123121,'Колетна пратка над 10 до 15 кг',12.1,'Таня Руменова',0876555444,'ул. Жеравна 120','Васил Ставрев',CONVERT(DATETIME, '5.11.2021', 104)),
    ('2021-11-04 00:00:00','Петър Петров',0882898666,'Христо Христов',0889555123,'Колетна пратка до 2 кг',6,'Калина Минкова',0876555333,'ул. Блян, бл. 56','Харалампи Харалампиев',CONVERT(DATETIME, '10.11.2021', 104)),
    ('2021-11-08 00:00:00','Колю Колев',0888987555,'Араам Безисян',0823555444,'Колетна пратка над 2 до 5 кг',6.72,'Камен Каменов',0876555111,'ул. Емануил Поптодоров 20','Безис Абрамян',CONVERT(DATETIME, '12.11.2021', 104)),
    ('2021-11-16 00:00:00','Колю Колев',0888987555,'Нено Ненов',0888555666,'Колетна пратка до 2 кг',6,'Димана Донева',0876555555,'ул. Драгаш 56','Драган Драганов',CONVERT(DATETIME, '22.11.2021', 104)),
    ('2021-11-16 00:00:00','Тодор Стоев',0889978555,'Шон Петерсон',0881555111,'Колетна пратка над 10 до 15 кг',12.1,'Силвия Бонева',0876555666,'ул. Ивайло 15','Лиляна Павлова',CONVERT(DATETIME, '22.11.2021', 104)),
    ('2021-11-17 00:00:00','Теа Иванова',0883567555,'Христо Христов',0889555123,'Колетна пратка над 2 до 5 кг',6.72,'Мони Иванова',0876555222,'ул. Блян, бл. 56','Христина Христова',CONVERT(DATETIME, '23.11.2021', 104)),
    ('2021-11-17 00:00:00','Маша Малишкина',0881122678,'Шон Петерсон',0881555111,'Колетна пратка над 5 до 10 кг',10.75,'Силвия Бонева',0876555666,'ул. Ивайло 15','Лиляна Павлова',CONVERT(DATETIME, '23.11.2021', 104)),
    ('2021-11-22 00:00:00','Колю Колев',0888987555,'Стамен Киров',0883555246,'Колетна пратка над 5 до 10 кг',10.75,'Таня Руменова',0876555444,'ул. Блян, бл. 65','Стефан Колев',CONVERT(DATETIME, '26.11.2021', 104)),
    ('2021-11-24 00:00:00','Тодор Стоев',0889978555,'Нено Ненов',0888555666,'Колетна пратка до 2 кг',6,'Синтия Гочева',0876555888,'ул. Емил Гаванаков 25','Емилия Попова',CONVERT(DATETIME, '29.11.2021', 104)),
    ('2021-11-24 00:00:00','Колю Колев',0888987555,'Шон Петерсон',0881555111,'Колетна пратка до 2 кг',6,'Петър Иванов',0876555777,'ул. Ивайло 15','Лиляна Павлова',CONVERT(DATETIME, '30.11.2021', 104)),
    ('2021-11-30 00:00:00','Тодор Стоев',0889978555,'Стамен Киров',0883555246,'Колетна пратка над 5 до 10 кг',10.75,'Синтия Гочева',0876555888,'ул. Блян, бл. 65','Стефан Колев',CONVERT(DATETIME, '6.12.2021', 104)),
    ('2021-12-01 00:00:00','Тодор Стоев',0889978555,'Филип Филипов',0888555333,'Колетна пратка над 10 до 15 кг',12.1,'Таня Руменова',0876555444,'ул. Емил Гаванаков 5','Филип Филипополов',CONVERT(DATETIME, '6.12.2021', 104)),
    ('2021-12-07 00:00:00','Асен Донев',0887897555,'Христо Христов',0889555123,'Колетна пратка до 2 кг',6,'Калина Минкова',0876555333,'ул. Блян, бл. 56','Харалампи Харалампиев',CONVERT(DATETIME, '10.12.2021', 104)),
    ('2021-12-07 00:00:00','Тодор Стоев',0889978555,'Севинч Халилова',0888999567,'Колетна пратка над 2 до 5 кг',6.72,'Мони Иванова',0876555222,'ул. Иван Янев 65','Хамид Хамид',CONVERT(DATETIME, '10.12.2021', 104)),
    ('2021-12-08 00:00:00','Тодор Стоев',0889978555,'Нено Ненов',0888555666,'Колетна пратка над 2 до 5 кг',6.72,'Калина Минкова',0876555333,'ул. Лебед 7','Тино Ненов',CONVERT(DATETIME, '14.12.2021', 104)),
    ('2021-12-10 00:00:00','Тодор Стоев',0889978555,'Светлин Манев',0889245543,'Колетна пратка над 5 до 10 кг',10.75,'Силвия Бонева',0876555666,'ул. Иван Троянски 22','Иван Троянов',CONVERT(DATETIME, '15.12.2021', 104)),
    ('2021-12-13 00:00:00','Асен Донев',0887897555,'Светлин Манев',0889245543,'Колетна пратка над 10 до 15 кг',12.1,'Силвия Бонева',0876555666,'ул. Иван Владиков 23','Иван Василев',CONVERT(DATETIME, '17.12.2021', 104)),
    ('2021-12-15 00:00:00','Асен Донев',0887897555,'Нено Ненов',0888555666,'Колетна пратка над 5 до 10 кг',10.75,'Таня Руменова',0876555444,'ул. Дядо Димитър 16','Димитър Димитров',CONVERT(DATETIME, '21.12.2021', 104)),
    ('2021-12-17 00:00:00','Петър Петров',0882898666,'Нено Ненов',0888555666,'Колетна пратка над 2 до 5 кг',6.72,'Димана Донева',0876555555,'ул. Дядо Димитър 16','Димитър Димитров',CONVERT(DATETIME, '22.12.2021', 104)),
    ('2021-12-20 00:00:00','Теа Иванова',0883567555,'Светлин Манев',0889245543,'Колетна пратка до 2 кг',6,'Силвия Бонева',0876555666,'ул. Иван Троянски 22','Иван Троянов',CONVERT(DATETIME, '23.12.2021', 104)),
    ('2021-12-20 00:00:00','Маша Малишкина',0881122678,'Кирил Занев',0888666111,'Колетна пратка над 2 до 5 кг',6.72,'Калина Минкова',0876555333,'ул. Зограф 6','Борислава Борисова',CONVERT(DATETIME, '24.12.2021', 104)),
    ('2021-12-23 00:00:00','Теа Иванова',0883567555,'Нено Ненов',0888555666,'Колетна пратка над 5 до 10 кг',10.75,'Камен Каменов',0876555111,'ул. Лебед 7','Тино Ненов',CONVERT(DATETIME, '29.12.2021', 104)),
    ('2021-12-27 00:00:00','Колю Колев',0888987555,'Нено Ненов',0888555666,'Колетна пратка до 2 кг',6,'Мони Иванова',0876555222,'ул. Дядо Димитър 16','Ненчо Ненов',CONVERT(DATETIME, '31.12.2021', 104)),
    ('2021-12-27 00:00:00','Петър Петров',0882898666,'Светлин Манев',0889245543,'Колетна пратка над 5 до 10 кг',10.75,'Силвия Бонева',0876555666,'ул. Иван Троянски 22','Ива Иванова',CONVERT(DATETIME, '31.12.2021', 104)),
    ('2021-12-30 00:00:00','Колю Колев',0888987555,'Христо Иванов',0777555111,'Колетна пратка над 10 до 15 кг',12.1,'Камен Каменов',0876555111,'ул. Божур 9','Иван Христов',CONVERT(DATETIME, '5.1.2022', 104)),
    ('2021-12-31 00:00:00','Петър Петров',0882898666,'Христо Иванов',0777555111,'Колетна пратка над 2 до 5 кг',6.72,'Камен Каменов',0876555111,'ул. Божур 9','Иван Христов',CONVERT(DATETIME, '6.1.2022', 104));
INSERT INTO Orders
SELECT OrderDate, RecieveDate, Total,
	(SELECT ID
	FROM Addresses
	WHERE Addresses.Address = Orders_Temp.Address),
	(SELECT ID
	FROM TypesOfService
	WHERE TypesOfService.Type = Orders_Temp.ToS),
	(SELECT ID
	FROM Dispatchers
	WHERE Dispatchers.Name = Orders_Temp.Disp_Name AND Dispatchers.PhoneNumber = '0' + Orders_Temp.Disp_PN),
	(SELECT ID
	FROM Clients
	WHERE Clients.Name = Orders_Temp.Client_Name AND Clients.PhoneNumber = '0' + Orders_Temp.Client_PN),
	(SELECT ID
	FROM Couriers
	WHERE Couriers.Name = Orders_Temp.Cour_Name AND Couriers.PhoneNumber = '0' + Orders_Temp.Cour_PN),
	(SELECT ID
	FROM Recipients
	WHERE Recipients.Name = Orders_Temp.Recip_Name)
FROM Orders_Temp;
GO

DROP TABLE Orders_Temp;
GO

use master
go
use CouriersDB
go

create or alter function _udf_CheckPhoneNumber (@PhoneNumber nvarchar(50))
returns bit as begin
	if not @PhoneNumber like '%[^0-9]%'
		return 1;
	return 0;
end
go

use master
go

/* _Example
-- Check if a phone number is valid
print dbo._udf_CheckPhoneNumber('088888888')
print dbo._udf_CheckPhoneNumber('notaphonenumber')
*/
use CouriersDB
go

create or alter proc udp_AddAddress
	@Name nvarchar(50)
as begin
	if exists(
		select * from Addresses
		where Address = @Name
	)
	begin
		print 'This address is already in the database!'
		return
	end
	insert into Addresses values (@Name);
	declare @id int = (
		select top 1 ID from Addresses
		where Address = @Name)
	print 'Address added with ID: ' + cast(@id as nvarchar(50))
end
go

use master
go

/* Example
-- Add a Address to the database
exec udp_AddAddress '123 Address Str.';
exec udp_AddAddress '123 Address Str.';
*/
use CouriersDB
go

create or alter proc udp_AddClient
	@Name nvarchar(50),
	@PhoneNumber nvarchar(50)
as begin
	if exists(
		select * from Clients
		where Name = @Name and PhoneNumber = @PhoneNumber
	)
	begin
		print 'A client with the same name and phone number already exists!'
		return
	end
	if dbo._udf_CheckPhoneNumber(@PhoneNumber) = 0 begin
		print 'The phone number provided is not valid!'
		return
	end
	insert into Clients values (@Name, @PhoneNumber);
	declare @id int = (
		select top 1 ID from Clients
		where Name = @Name and PhoneNumber = @PhoneNumber)
	print 'Client added with ID: ' + cast(@id as nvarchar(50))
end
go

use master
go

/* Example
-- Add a client to the database
exec udp_AddClient 'Tom Scott', '0888888888';
exec udp_AddClient 'John Doe', 'not a phone number';
exec udp_AddClient 'Tom Scott', '0888888888';
*/
use CouriersDB
go

create or alter proc udp_AddCourier
	@Name nvarchar(50),
	@PhoneNumber nvarchar(50)
as begin
	if exists(
		select * from Couriers
		where Name = @Name and PhoneNumber = @PhoneNumber
	)
	begin
		print 'A courier with the same name and phone number already exists!'
		return
	end
	if dbo._udf_CheckPhoneNumber(@PhoneNumber) = 0 begin
		print 'The phone number provided is not valid!'
		return
	end
	insert into Couriers values (@Name, @PhoneNumber);
	declare @id int = (
		select top 1 ID from Couriers
		where Name = @Name and PhoneNumber = @PhoneNumber)
	print 'Courier added with ID: ' + cast(@id as nvarchar(50))
end
go

use master
go

/* Example
-- Add a courier to the database
exec udp_AddCourier 'Bill Smith', '0888888888';
exec udp_AddCourier 'John Smith', 'not a phone number';
exec udp_AddCourier 'Bill Smith', '0888888888';
*/
use CouriersDB
go

create or alter proc udp_AddDispatcher
	@Name nvarchar(50),
	@PhoneNumber nvarchar(50)
as begin
	if exists(
		select * from Dispatchers
		where Name = @Name and PhoneNumber = @PhoneNumber
	)
	begin
		print 'A dispatcher with the same name and phone number already exists!'
		return
	end
	if dbo._udf_CheckPhoneNumber(@PhoneNumber) = 0 begin
		print 'The phone number provided is not valid!'
		return
	end
	insert into Dispatchers values (@Name, @PhoneNumber);
	declare @id int = (
		select top 1 ID from Dispatchers
		where Name = @Name and PhoneNumber = @PhoneNumber)
	print 'Dispatcher added with ID: ' + cast(@id as nvarchar(50))
end
go

use master
go

/* Example
-- Add a dispatcher to the database
exec udp_AddDispatcher 'Will Smith', '0888888888';
exec udp_AddDispatcher 'Will Doe', 'not a phone number';
exec udp_AddDispatcher 'Will Smith', '0888888888';
*/
use CouriersDB
go

create or alter proc udp_AddOrders
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

select * from Orders as o

inner join Addresses as a
on o.AddressID = a.ID

inner join Clients as cl
on o.ClientID = cl.ID

inner join Couriers as co
on o.CourierID = co.ID

inner join Dispatchers as d
on o.DispatcherID = d.ID

inner join Recipients as r
on o.RecipientID = r.ID

inner join TypesOfService as t
on o.TypeID = t.ID

use master
go

/* Example
-- Add an order to the database
exec udp_AddOrder 'Tom Scott', '0888888888';
*/
use CouriersDB
go

create or alter proc udp_AddRecipient
	@Name nvarchar(50)
as begin
	if exists(
		select * from Recipients
		where Name = @Name
	)
	begin
		print 'A recipient with the same name already exists!'
		return
	end
	insert into Recipients values (@Name);
	declare @id int = (
		select top 1 ID from Recipients
		where Name = @Name)
	print 'Recipient added with ID: ' + cast(@id as nvarchar(50))
end
go

use master
go

/* Example
-- Add a recipient to the database
exec udp_AddRecipient 'Tom Recipient';
exec udp_AddRecipient 'Tom Recipient';
*/
use CouriersDB
go

create or alter proc udp_AddTypeOfService
	@Name nvarchar(50)
as begin
	if exists(
		select * from TypesOfService
		where Type = @Name
	)
	begin
		print 'This type is already in the database!'
		return
	end
	insert into TypesOfService values (@Name);
	declare @id int = (
		select top 1 ID from TypesOfService
		where Type = @Name)
	print 'Type added with ID: ' + cast(@id as nvarchar(50))
end
go

use master
go

/* Example
-- Add a type of service to the database
exec udp_AddTypeOfService 'An amazing service';
exec udp_AddTypeOfService 'An amazing service';
*/
use CouriersDB
go

create or alter function _udf_CheckPhoneNumber (@PhoneNumber nvarchar(50))
returns bit as begin
	if not @PhoneNumber like '%[^0-9]%'
		return 1;
	return 0;
end
go

/*
print dbo._udf_CheckPhoneNumber('sdasfhdsfghadsghafgh4656556460');
go
*/

-- Add Client
create or alter proc udp_AddClient
	@Name nvarchar(50),
	@PhoneNumber nvarchar(50)
as begin
	if exists(
		select * from Clients
		where Name = @Name and PhoneNumber = @PhoneNumber
	)
	begin
		print 'A client with the same name and phone number already exists!'
		return
	end
	if dbo._udf_CheckPhoneNumber(@PhoneNumber) = 0 begin
		print 'The phone number provided is not valid!'
		return
	end
	insert into Clients values (@Name, @PhoneNumber);
	declare @id int = (
		select top 1 ID from Clients
		where Name = @Name and PhoneNumber = @PhoneNumber)
	print 'Client added with ID: ' + cast(@id as nvarchar(50))
end
go

/*
delete from Clients

exec udp_AddClient 'John Doe', 'not a phone number';
exec udp_AddClient 'Tom Scott', '0888888888';
exec udp_AddClient 'Tom Scott', '0888888888';
go
*/

-- Add Courier
create or alter proc udp_AddCourier
	@Name nvarchar(50),
	@PhoneNumber nvarchar(50)
as begin
	if exists(
		select * from Couriers
		where Name = @Name and PhoneNumber = @PhoneNumber
	)
	begin
		print 'A courier with the same name and phone number already exists!'
		return
	end
	if dbo._udf_CheckPhoneNumber(@PhoneNumber) = 0 begin
		print 'The phone number provided is not valid!'
		return
	end
	insert into Couriers values (@Name, @PhoneNumber);
	declare @id int = (
		select top 1 ID from Couriers
		where Name = @Name and PhoneNumber = @PhoneNumber)
	print 'Courier added with ID: ' + cast(@id as nvarchar(50))
end
go

/*
delete from Couriers

exec udp_AddCourier 'George Doe', 'not a phone number';
exec udp_AddCourier 'Will Smith', '0888888888';
exec udp_AddCourier 'Will Smith', '0888888888';
go
*/
use CouriersDB

go

create or alter function _udf_CheckPhoneNumber (@PhoneNumber nvarchar(50))
returns bit as begin
	if not @PhoneNumber like '%[^0-9]%'
		return 1;
	return 0;
end;

go

create or alter procedure usp_CheckClientPartOfNameOrPhone( @input nvarchar(50) )
as
begin
	
	if( dbo._udf_CheckPhoneNumber(@input) = 1 )
	begin
		select * from Clients
		where CHARINDEX(@input, PhoneNumber) > 0
		return
	end
	
	select * from Clients
	where CHARINDEX(@input, Name) > 0
	return
	

end

go

use master

go

/* Example
-- This displays a client's name and phone number via searching by part of name or phone number

exec usp_CheckClientPartOfNameOrPhone 'Шон'
exec usp_CheckClientPartOfNameOrPhone '0888'

*/
use CouriersDB

go

create or alter procedure usp_CheckByDispNameOrDateOfDelivery( @input nvarchar(50) )
as
begin
	
	if( ISDATE(@input) = 1 )
	begin
		select * from Orders as o    --- TODO: Replace * with specific names

		inner join Addresses as a
		on o.AddressID = a.ID

		inner join Clients as cl
		on o.ClientID = cl.ID

		inner join Couriers as co
		on o.CourierID = co.ID

		inner join Dispatchers as d
		on o.DispatcherID = d.ID

		inner join Recipients as r
		on o.RecipientID = r.ID

		inner join TypesOfService as t
		on o.TypeID = t.ID
		
		where CAST( @input as date ) = o.ReceiveDate
		return
	end
	
	else
	begin
		select * from Orders as o    --- TODO: Replace * with specific names

		inner join Addresses as a
		on o.AddressID = a.ID

		inner join Clients as cl
		on o.ClientID = cl.ID

		inner join Couriers as co
		on o.CourierID = co.ID

		inner join Dispatchers as d
		on o.DispatcherID = d.ID

		inner join Recipients as r
		on o.RecipientID = r.ID

		inner join TypesOfService as t
		on o.TypeID = t.ID
		
		where @input = d.Name
		
		return
	end


end

go

use master

go

/* Example
-- This displays all orders of a specific dispatcher by name or on a certain date of delivery

exec usp_CheckByDispNameOrDateOfDelivery '09-15-2021'
exec usp_CheckByDispNameOrDateOfDelivery 'Асен Донев'

*/
use CouriersDB

go

create or alter procedure usp_TotalOfOrdersByClient( @input nvarchar(50) )
as
begin
	
	select SUM(o.Total) as 'Total by client' from Clients as c

	inner join Orders as o
	on c.ID = o.ClientID

	where @input = c.Name

end

go

use master

go

/* Example
-- This returns the total of all orders by a specific customer

exec usp_TotalOfOrdersByClient 'Нено Ненов'
exec usp_TotalOfOrdersByClient 'Борис Зарев'

*/
use CouriersDB

go

create or alter procedure usp_OrdersByDateOfOrder( @input nvarchar(50) )
as
begin
	
	if( ISDATE(@input) = 1 )
	begin
		select * from Orders as o    --- TODO: Replace * with specific names

		inner join Addresses as a
		on o.AddressID = a.ID

		inner join Clients as cl
		on o.ClientID = cl.ID

		inner join Couriers as co
		on o.CourierID = co.ID

		inner join Dispatchers as d
		on o.DispatcherID = d.ID

		inner join Recipients as r
		on o.RecipientID = r.ID

		inner join TypesOfService as t
		on o.TypeID = t.ID
		
		where CAST( @input as date ) = o.OrderDate
		return
	end

end

go

use master

go

/* Example
-- This returns all orders made on a specific date

exec usp_OrdersByDateOfOrder '9/9/2021'
exec usp_OrdersByDateOfOrder '8/16/2021'

*/
use CouriersDB

go

create or alter procedure usp_PackagesByCourier( @input nvarchar(50) )
as
begin
	
	select * from Orders as o    --- TODO: Replace * with specific names

	inner join Addresses as a
	on o.AddressID = a.ID

	inner join Clients as cl
	on o.ClientID = cl.ID

	inner join Couriers as co
	on o.CourierID = co.ID

	inner join Dispatchers as d
	on o.DispatcherID = d.ID

	inner join Recipients as r
	on o.RecipientID = r.ID

	inner join TypesOfService as t
	on o.TypeID = t.ID
		
	where @input = co.Name

end

go

use master

go

/* Example
-- This returns all orders of a specific courier

exec usp_PackagesByCourier 'Камен Каменов'
exec usp_PackagesByCourier 'Мони Иванова'

*/
USE CouriersDB
GO

CREATE OR ALTER Proc usp_dates_with_most_delivered_orders
AS
BEGIN
	SELECT ReceiveDate, COUNT(*)
	FROM Orders
	GROUP BY ReceiveDate
	HAVING COUNT(*) > ALL (
	SELECT MAX(COUNT(*))
	FROM Orders AS o2
	WHERE ReceiveDate <> o2.ReceiveDate)
END
GO

EXEC dbo.usp_dates_with_most_delivered_orders
GO

USE master
GO

/* Example
-- reads and prints the names and the count of the orders of each recipient

*/
USE CouriersDB
GO

CREATE OR ALTER Proc usp_names_of_recipients_by_order_count
AS
BEGIN
	SELECT COUNT(RecipientID) AS [Count of orders], Name
	FROM Orders
	JOIN Recipients
	ON RecipientID = Recipients.ID
	GROUP BY Name
END
GO

USE master
GO

/* Example
-- reads and prints the names and the count of the orders of each recipient
EXEC dbo.usp_names_of_recipients_by_order_count
*/
USE CouriersDB
GO

CREATE OR ALTER Proc usp_name_phonenumber_category
AS
BEGIN
	SELECT Name, PhoneNumber, 'Courier' AS [Category]
	FROM Couriers
	UNION
	SELECT Name, PhoneNumber, 'Client'
	FROM Clients
	UNION
	SELECT Name, PhoneNumber, 'Dispatcher'
	FROM Dispatchers
END
GO

USE master
GO

/* Example
-- reads and prints the name, the phone number, and the category (client, dispatcher, courier) for each person in the system (Database)
EXEC dbo.usp_name_phonenumber_category;
*/


USE CouriersDB
GO

CREATE OR ALTER Proc usp_orders_count_by_order_date
AS
BEGIN
	SELECT COUNT(*) AS [Count of Orders], OrderDate
	FROM Orders
	GROUP BY OrderDate
END
GO

USE master
GO


/* Example
-- reads and prints the count of the orders grouped by the order date
EXEC dbo.usp_orders_count_by_order_date
GO
*/
USE CouriersDB
GO

CREATE OR ALTER Proc usp_orders_profit_by_tos
AS
BEGIN
	SELECT FORMAT(SUM(Total), 'C', 'bg-BG') AS [Profit], Type
	FROM Orders
	JOIN TypesOfService
	ON Orders.TypeID = TypesOfService.ID
	GROUP BY Type
END
GO

USE master
GO

/* Example
-- reads and prints the profit (sum of totals) for each order type (type of service)
EXEC usp_orders_profit_by_tos
*/
