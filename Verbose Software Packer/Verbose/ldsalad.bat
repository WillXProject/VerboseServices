@echo off
clutils elevate %cd%/ldsalad.bat
echo This app uses SafeExamBrowser, please have it installed before running this
echo After this pause, you will be locked down to Salad and this command prompt, exit to stop
pause
echo Checking for SEB...
if exist "C:\Program Files\SafeExamBrowser\Application\SafeExamBrowser.Client.exe" goto sebinstalled
if not exist "C:\Program Files\SafeExamBrowser\Application\SafeExamBrowser.Client.exe" goto sebnf
:sebnf
echo SafeExamBrowser not found, make sure to install it in the default directory
echo Exiting...
pause
exit
:sebinstalled
SET seb = "C:\Program Files\SafeExamBrowser\Application\SafeExamBrowser.Client.exe"
echo SafeExamBrowser was found, installing...
echo Please continue installation via SEB
echo PRESS "YES" ON THE PROMPT
%cd%/src/SebClientSettings.seb
echo Waiting for 10 seconds...
ping localhost -n 10 >NUL
echo Installed, starting...
%seb%
ping localhost -n 10 >NUL
explorer
C:\Program Files\Salad\Salad.exe
echo Starting UI...
cls
:menu
echo Choose an option:
echo [1] Explorer
echo [2] Command Prompt
echo [3] Powershell
echo [4] Exit
echo [5] Done (DO NOT USE THIS UNTIL YOU HAVE EXITED SEB USING THE OPTION "4")
echo ----------
set /p "menuoption=Selection: "
if %menuoption%==1 goto explorer
if %menuoption%==2 goto cmd
if %menuoption%==3 goto powershell
if %menuoption%==4 goto exit
if %menuoption%==5 goto done
:explorer
explorer
cls
goto menu
:cmd
cmd
cls
goto menu
:powershell
powershell
cls
goto menu
:exit
echo In order to exit, you must press the keys... and type...
pause
cls
goto menu
:done
exit