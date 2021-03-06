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