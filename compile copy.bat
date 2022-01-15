@echo off

echo -- Successfully compiled > couriers.sql

::CALL :NORMALIZEPATH "..\..\..\foo\bar.txt"
::SET BLAH=%RETVAL%

::ECHO "%BLAH%"

::for %%i in (
	::src\schemas\clients-table.sql
	::src\schemas\couriers-table.sql
::) do (
	set peth = src\\schemas\\clients-table.sql
	CALL :NORMALIZEPATH src\\schemas\\clients-table.sql
	SET BLAH=%RETVAL%
	echo "%BLAH%"
	::type %~f1 >> couriers.sql
	type "%BLAH%" > couriers.sql
::)

:: ========== FUNCTIONS ==========
EXIT /B

:NORMALIZEPATH
  SET RETVAL=%~f1
  EXIT /B
