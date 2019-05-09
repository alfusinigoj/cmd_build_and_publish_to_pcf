echo Start Time: %time%
@SET INFO=@echo

%INFO% **************************************************************
%INFO% * SCRIPT: dev_build.bat *
%INFO% * CREATED: 07/02/2018
%INFO% * AUTHOR: Fiserv RO Team
%INFO% **************************************************************

echo cleaning bin and obj
dotnet clean
IF %ERRORLEVEL% NEQ 0 GOTO ERROR
cd %~dp0

echo compile and execute unit test
cd test\Unit.Tests
dotnet test
IF %ERRORLEVEL% NEQ 0 GOTO ERROR
cd %~dp0

cd test\Integration.Tests
dotnet test
IF %ERRORLEVEL% NEQ 0 GOTO ERROR
cd %~dp0

@GOTO SUCCESS

:ERROR
@echo \\\\\\\WARNING/////////
@echo "***Error occurred while running the command on %computername%***"
cd %~dp0
@GOTO END

:END
@echo End time: %time%
@echo "=============================================================="
exit /B 9

:SUCCESS
cd %~dp0
@echo ***************************************************************
@echo ***************** Process Completed **************************
@echo ***************************************************************
exit /B 9





