echo Start Time: %time%
@SET INFO=@echo

%INFO% **************************************************************
%INFO% * SCRIPT: nugetpublish.bat *
%INFO% * CREATED: 07/02/2018
%INFO% * AUTHOR: Fiserv RO Team
%INFO% **************************************************************

IF "%1"=="" @GOTO NO_ARGUMENT_PROVIDED
%INFO% Argument is the name of the nuget repo

@echo publishing to nuget 

%INFO% "--Navigate to the folder where nuget packages are available"
REM cd nugetpks

dotnet nuget push *.nupkg -s %1

IF %ERRORLEVEL% NEQ 0 GOTO ERROR
cd %~dp0

IF %ERRORLEVEL% EQU 0 GOTO SUCCESS

:NO_ARGUMENT_PROVIDED
@echo \\\\\\\WARNING/////////
@echo "***No  argument (repo name) provided***"
cd %~dp0

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


