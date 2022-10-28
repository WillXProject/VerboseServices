@echo off
title Verbose - Uninstaller
echo ----------------------------
echo         V e r b o s e
echo           Utilities
echo          Uninstaller
echo         Made by Nova
echo ----------------------------
echo Thanks for using Verbose Software!
echo THIS UNINSTALLER REQUIRES ADMIN PERMS, THESE WILL BE ASKED FOR DURING UNINSTALLATION
echo Continue to start uninstalling...
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
rmdir /s /q C:\Verbose\
echo If this showed an error, you either didn't have Verbose installed, or changed the directories, not a bug
pause