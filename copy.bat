@echo off
set mods=\mods\
set src_folder=%cd%%mods%
set user=%Userprofile%
set "minecraft=\AppData\Roaming\.minecraft\mods\"
set "dst_folder=%user%%minecraft%"
set file_list=%cd%\deps\files.txt

setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure? This action will delete all of your own /mods and replace them with this file's /mods (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

@RD /S /Q %dst_folder%

if not exist "%dst_folder%" mkdir "%dst_folder%"

for /f "delims=" %%f in (%file_list%) do (
    xcopy "%src_folder%\%%f" "%dst_folder%\"
)

setlocal
:PROMPT
SET /P AREYOUSURE=Would you like to install fabric? (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

start %cd%\deps\fabric.exe

:END
endlocal