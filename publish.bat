echo Start Time: %time%
@SET INFO=@echo

%INFO% **************************************************************
%INFO% * SCRIPT: publish.bat *
%INFO% * CREATED: 07/02/2018
%INFO% * AUTHOR: Fiserv RO Team
%INFO% **************************************************************

@echo "dotnet publish"
@echo "targetting full framework"

rmdir bin /Q/S
rmdir obj /Q/S
rmdir _publish /Q/S

dotnet publish -o _publish --configuration Release --framework net471 --force --self-contained

REM chenge _publish to any target path where the published artifacts to reside