@echo off

echo -- Successfully compiled > couriers.sql

::CALL :NORMALIZEPATH "..\..\..\foo\bar.txt"
::SET BLAH=%RETVAL%

::ECHO "%BLAH%"

::for %%i in (
	::\src\schemas\clients-table.sql
	::\src\schemas\couriers-table.sql
::) do (
	CALL :NORMALIZEPATH \src\schemas\clients-table.sql
	SET BLAH=%RETVAL%
	echo %BLAH%
	::type %~f1 >> couriers.sql
::)

:: ========== FUNCTIONS ==========
EXIT /B

:NORMALIZEPATH
  SET RETVAL=%~f1
  EXIT /B