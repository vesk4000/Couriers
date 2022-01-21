# Couriers

## Overview

## Database Design

## Project Structure
In order to facilitate for easier collaboration and overall code development, we split up all of the SQL code into many files. All of them are located in the ```source``` folder in the root of the repository. In there you will find the files grouped into the ```crud-procedures```, ```data```, ```private```, ```queries``` and ```schemas``` folders. All of them contain a number of ```.sql``` files, which themselves are all either a definition of a single procedure, function, table or database, or in the case of the files in the ```data``` folder the ```INSERT``` queries used to populate the different tables with their respective data.

Here's a brief description of what each of the folders contain:
| Folder                | Description |
|-----------------------|-------------|
| ```crud-proceduers``` | CR          |
|                       |             |
|                       |             |

table generator: https://www.tablesgenerator.com/markdown_tables


```
📦Couriers
 ┣ 📂source
 ┃ ┣ 📂crud-procedures
 ┃ ┃ ┣ 📄add-client.sql
 ┃ ┃ ┣ 📄delete-client.sql
 ┃ ┃ ┣ 📄update-client.sql
 ┃ ┃ ┗ ...
 ┃ ┣ 📂data
 ┃ ┃ ┣ 📄addresses-data.sql
 ┃ ┃ ┣ 📄clients-data.sql
 ┃ ┃ ┗ ...
 ┃ ┣ 📂private
 ┃ ┃ ┗ 📄check-phone-number.sql
 ┃ ┣ 📂queries
 ┃ ┃ ┣ 📄OutRequest1.sql
 ┃ ┃ ┣ 📄OutRequest2.sql
 ┃ ┃ ┣ 📄OutRequest3.sql
 ┃ ┃ ┣ 📄OutRequest4.sql
 ┃ ┃ ┣ 📄OutRequest5.sql
 ┃ ┃ ┣ 📄usp_dates_with_most_delivered_orders.sql
 ┃ ┃ ┣ 📄usp_names_of_recipients_by_order_count.sql
 ┃ ┃ ┣ 📄usp_name_phonenumber_category.sql
 ┃ ┃ ┣ 📄usp_orders_count_by_order_date.sql
 ┃ ┃ ┗ 📄usp_orders_profit_by_tos.sql
 ┃ ┗ 📂schemas
 ┃ ┃ ┣ 📄addresses-table.sql
 ┃ ┃ ┣ 📄clients-table.sql
 ┃ ┃ ┗ ...
 ┣ 📂sql-compiler
 ┃ ┣ 📄Program.cs
 ┃ ┣ 📄sql-compiler.csproj
 ┃ ┗ 📄sql-compiler.exe
 ┣ 📄.gitignore
 ┣ 📄compile.bat
 ┣ 📄couriers-project_data.xlsx
 ┣ 📄couriers.sql
 ┣ 📄examples.sql
 ┗ 📄README.md
```

## Guide

## Development

## Conclusion