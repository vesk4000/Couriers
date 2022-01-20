@echo off
setlocal
pushd %~dp0\sql-compiler

:: Call the argument-counting subroutine with all arguments received,
:: without interfering with the ability to reference the arguments
:: with %1, ... later.
call :count_args %*

:: Print the result.
::echo %ReturnValue% argument(s) received

set /A a = %ReturnValue%
if %a% == 0 (start "" sql-compiler.exe "couriers.sql" "examples.sql" "compile.bat" "AllFiles")
if %a% == 1 (start "" sql-compiler.exe %1 "examples.sql" "compile.bat" "AllFiles")
if %a% == 2 (start "" sql-compiler.exe %1 %2 "compile.bat" "AllFiles")
if %a% == 3 (start "" sql-compiler.exe %1 %2 %3 "AllFiles")
if %a% == 4 (start "" sql-compiler.exe %1 %2 %3 %4)

:: Exit the batch file.
exit /b

goto AllFiles

schemas/couriers-database.sql
schemas/addresses-table.sql
schemas/clients-table.sql
schemas/couriers-table.sql
schemas/dispatchers-table.sql
schemas/recipients-table.sql
schemas/types-of-service-table.sql
schemas/orders-table.sql

data/addresses-data.sql
data/clients-data.sql
data/couriers-data.sql
data/dispatchers-data.sql
data/recipients-data.sql
data/types-of-service-data.sql
data/orders-data.sql

private/*.sql
**/*.sql

:AllFiles

:: Subroutine that counts the arguments given.
:: Returns the count in %ReturnValue%
:count_args
  set /a ReturnValue = 0
  :count_args_for

    if %1.==. goto :eof

    set /a ReturnValue += 1

    shift
  goto count_args_for