echo Start Time: %time%
@SET INFO=@echo

%INFO% **************************************************************
%INFO% * SCRIPT: publish_all.bat *
%INFO% * CREATED: 07/02/2018
%INFO% * AUTHOR: Fiserv RO Team
%INFO% **************************************************************

@echo **************************************************************
@echo Publishing PBI 1151 app...
@echo **************************************************************

%INFO% "Navigate to the folder where specific publish file in available"
cd ..\..\PBI1151
call publish.bat
IF %ERRORLEVEL NEQ 0 @GOTO SCRIPT_ERROR
cd %~dp0

@echo **************************************************************
@echo Publishing PBI 1451 app...
@echo **************************************************************

%INFO% "Navigate to the folder where specific publish file in available"
cd ..\..\PBI1451
call publish.bat
IF %ERRORLEVEL NEQ 0 @GOTO SCRIPT_ERROR
cd %~dp0
@GOTO SUCCESS

:SCRIPT_ERROR
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
