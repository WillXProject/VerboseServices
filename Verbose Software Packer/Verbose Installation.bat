@echo off
title Verbose - Installer
echo ----------------------------
echo         V e r b o s e
echo           Utilities
echo           Installer
echo         Made by Nova
echo ----------------------------
echo Thanks for using Verbose software!
echo This installer will unpack all the required files to the needed folders
echo Verbose Software Version: v1.0
echo Goto github.com/WillXProject/VerboseServices to check for updates
echo THIS INSTALLER REQUIRES ADMIN PERMS, THESE WILL BE ASKED FOR DURING INSTALLATION
echo Continue to start installing...
pause
:: BatchGotAdmin
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
echo Making Directories...
mkdir C:\Verbose\
mkdir C:\Verbose\src
mkdir C:\Verbose\guides
mkdir C:\Verbose\recovery
echo Copying files...
xcopy /v /y /q %cd%\Verbose\ C:\Verbose\
xcopy /v /y /q %cd%\Verbose\src C:\Verbose\src
xcopy /v /y /q %cd%\Verbose\guides C:\Verbose\guides
xcopy /v /y /q %cd%\Verbose\recovery C:\Verbose\recovery
if not exist C:\Verbose\src\DONOTDELETETHISFILE.txt goto failed
if exist C:\Verbose\src\DONOTDELETETHISFILE.txt goto success
:success
reg add HKLM\SOFTWARE\Verbose\ /f
reg add HKLM\SOFTWARE\Verbose\ /v Installed /t REG_DWORD /d 1 /f
del /f /q C:\Verbose\src\DONOTDELETETHISFILE.txt
:failed
reg add HKLM\SOFTWARE\Verbose\ /v Installed /t REG_DWORD /d 0 /f
echo If this showed an error, the installation failed and the Verbose Directories probably weren't copied properly
pause