echo Start Time: %time%
@SET INFO=@echo

%INFO% **************************************************************
%INFO% * SCRIPT: create_marketplace_services.bat *
%INFO% * CREATED: 07/02/2018
%INFO% * AUTHOR: Fiserv RO Team
%INFO% **************************************************************

IF "%1"=="" @GOTO NO_ARGUMENT_PROVIDED
%INFO% Argument is space name

IF "%1"=="demo" @GOTO VALID_ARGUMENT
IF "%1"=="test" @GOTO VALID_ARGUMENT
IF "%1"=="zak-ro" @GOTO VALID_ARGUMENT

@GOTO NO_VALID_ARGUMENT

:VALID_ARGUMENT
@echo **************************************************************
@echo Changing target to %1...
@echo **************************************************************
cf target -s %1

cf cs p-redis shared-vm redis-cache
cf cs vault standard vault-store
cf cs p-config-server standard config-server =p "{\"key\":\"\"}"
REM TODO: Add the git url, token, etc as needed within the json above
REM ===============================================================

IF %ERRORLEVEL% NEQ 0 GOTO ERROR
cd %~dp0

IF %ERRORLEVEL% EQU 0 GOTO SUCCESS


:NO_VALID_ARGUMENT
@echo \\\\\\\WARNING/////////
@echo "***Valid space name is not provided***"
cd %~dp0
@GOTO END

:NO_ARGUMENT_PROVIDED
@echo \\\\\\\WARNING/////////
@echo "***No  argument (version suffix name) provided***"
cd %~dp0
@GOTO END

:ERROR
@echo \\\\\\\WARNING/////////
@echo "***Error occurred while running the command on %computername%***"
cd %~dp0

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