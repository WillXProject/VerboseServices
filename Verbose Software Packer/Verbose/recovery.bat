@echo off
title Verbose - System Recovery
echo ----------------------------
echo         V e r b o s e
echo        System Recovery
echo           Installer
echo         Made by Nova
echo ----------------------------
echo Thanks for using Verbose software!
echo (this does need admin)
echo Continue if you'd like to start System Recovery
echo Close this window if you don't want to
pause
clutils elevate %cd%/recovery.bat
echo Editing Registry...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d C:\Verbose\recovery\start.bat /f
echo Added Entry!
echo Changed "Shell" RegKey to Verbose System Recovery's Protocol
echo Adding to ENV VAR...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Sessions Manager\Environment" /v VerboseRecovery /t REG_EXPAND_SZ /d C:\Verbose\recovery /f 
echo Added to ENV VAR
pause
echo After this pause, your machine will restart
echo Thanks for using our tools!
pause
shutdown /r /f /t 0