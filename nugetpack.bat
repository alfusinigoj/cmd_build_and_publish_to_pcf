echo Start Time: %time%
@SET INFO=@echo

%INFO% **************************************************************
%INFO% * SCRIPT: nugetpack.bat *
%INFO% * CREATED: 07/02/2018
%INFO% * AUTHOR: Fiserv RO Team
%INFO% **************************************************************

IF "%1"=="" @GOTO NO_ARGUMENT_PROVIDED
%INFO% Argument is the version suffix

@echo creating nuget package

%INFO% "--Navigate to the folder where project file exists"
REM cd nugetpks
RMDIR bin /Q/S
RMDIR obj /Q/S
RMDIR nugetpks /Q/S

dotnet pack --version-suffix %1 --output nugetpks --include-symbols

IF %ERRORLEVEL% NEQ 0 GOTO ERROR
cd %~dp0

IF %ERRORLEVEL% EQU 0 GOTO SUCCESS

:NO_ARGUMENT_PROVIDED
@echo \\\\\\\WARNING/////////
@echo "***No  argument (version suffix name) provided***"
cd %~dp0
@GOTO END

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


