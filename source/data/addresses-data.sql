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