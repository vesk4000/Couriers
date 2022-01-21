# Couriers

## Overview

The goal of the 'Couriers' project is to help a delivery company manage orders by utilizing an SQL database.

The system has the ability to ```read```, ```add```, ```update```, and ```delete``` (CRUD) the data from tables which store information about orders, clients, dispatchers, orders, etc.
(more info can be found in the Database Design part of this documentation)

## Database Design

We designed the schema of our database ```CouriersDB``` by transforming a table in 1FN[^1] into 7 tables that meet the 3NF[^2] standards.

--to be considered if it's going to be included

This is the given 1FN table with some sample data:

| Order # | Order Date | Dispatcher Name | Phone Number - Dispatcher | Client Name | Phone Number - Client | Type of Service | Total | Courier Name | Phone Number - Courier | Delivery Address | Recipient Name | Delivery Date |
| ---------------- | --------------- | ---------------- | ------------------ | -------------- | ---------------- | ---------------------------- | -------- | ------------- | ---------------- | ------------------------- | ---------------- | ---------------- |
| 1                | 8/16/2021       | Асен Донев       | 0887897555         | Галин Христов  | 0888555111       | Колетна пратка над 2 до 5 кг | 6.72 лв. | Димана Донева | 0876555555       | ул. Бреза 9               | Галена Халиева   | 20.8.2021 г.     |
| 2                | 9/9/2021        | Асен Донев       | 0887897555         | Джим Шон       | 0888555222       | Колетна пратка до 2 кг       | 6.00 лв. | Камен Каменов | 0876555111       | ул. Александър Кръстев 22 | Шон Джим         | 15.9.2021 г.     |
| 3                | 9/9/2021        | Колю Колев       | 0888987555         | Джим Шон       | 0888555222       | Колетна пратка над 2 до 5 кг | 6.72 лв. | Мони Иванова  | 0876555222       | ул. Вардар 8              | Шон Джим         | 15.9.2021 г.     |
| 4                | 9/14/2021       | Маша Малишкина   | 0881122678         | Галин Христов  | 0888555111       | Колетна пратка над 2 до 5 кг | 6.72 лв. | Димана Донева | 0876555555       | ул. Бук 18                | Христо Галев     | 17.9.2021 г.     |

-- end of considered part

The ```CouriersDB```, which consists of 7 3NF tables has the following schema:

-- IMAGE_SCHEMA



### **dbo.Orders**

```sql
CREATE TABLE Orders (
	ID int identity(1, 1) NOT NULL primary key,
	OrderDate date NOT NULL,
	ReceiveDate date NOT NULL,
	Total money NOT NULL,
	AddressID int FOREIGN KEY references Addresses(ID),
	TypeID int FOREIGN KEY references TypesOfService(ID),
	DispatcherID int FOREIGN KEY references Dispatchers(ID),
	ClientID int FOREIGN KEY references Clients(ID),
	CourierID int FOREIGN KEY references Couriers(ID),
	RecipientID int FOREIGN KEY references Recipients(ID),
)
```

### Columns:

| Column Name | Data Type | Descriprtion |
| ---------------- | --------------- | ----------- |
| ID | INT | The identification number (```PRIMARY KEY```) |
| OrderDate | DATE | The date of the registration of the order |
| ReceiveDate | DATE | The date of the delivery of the order |
| AddressID | INT | The identification number of the Address, where the order has to be delivered to (```FOREIGN KEY``` linked to the ```ID``` of (```dbo.Addresses```) |
| TypeID | INT | The identification number of the type of service of the order (```FOREIGN KEY``` linked to the ```ID``` of ```dbo.TypesOfService```) |
| DispatcherID | INT | The identification number of the dispatcher, who works on the coordination of the order (```FOREIGN KEY``` linked to the ```ID``` of ```dbo.Dispatchers```) |
| ClientID | INT | The identification number of the client, who has made the order (``````FOREIGN KEY`````` linked to the ```ID``` of ```dbo.Clients```) |
| CourierID | INT | The identification number of the type of service of the courier, who has to deliver the order (```FOREIGN KEY``` linked to the ```ID``` of ```dbo.Couriers```) |
| RecipientID | INT | The identification number of the recipient, who has to receive the order (```FOREIGN KEY``` linked to the ```ID``` of ```dbo.Recipients```) |


## Project Structure

## Guide

## Development

## Conclusion


[^1]: 1NF - First Normal Form*

*2 3NF - Third Normal Form*