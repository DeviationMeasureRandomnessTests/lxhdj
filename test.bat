@echo off
setlocal enabledelayedexpansion

call:changeOneFile a.txt "player=2" "int player=3;"

exit /b 0 


:changeOneFile
set filename=%1
set findstring=%~2
set targetline=%~3
set bakfilename=%filename%.bak
if exist %bakfilename% del /f /q %bakfilename%
for /F "tokens=*" %%i in (%filename%) do (
    echo %%i  > tmp.txt
    find "%findstring%" tmp.txt >nul
    if !errorlevel! EQU 0 (
        echo %targetline% >> %bakfilename%
    ) else (
        echo %%i >> %bakfilename%
    )
)
goto:eof
