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
:menu
cls
echo Choose an option:
echo [1] 
echo [2] Print Robux
echo [3] Tutorial
echo [4] Uninstall
echo [5] Wipe SaveData
echo [6] Quit
echo ----------
set /p "menuoption=Selection: "
if %menuoption%==1 goto simulate
if %menuoption%==2 goto printrobux
if %menuoption%==3 goto start
if %menuoption%==4 goto uninstall
if %menuoption%==5 goto wipesd
if %menuoption%==6 goto quit