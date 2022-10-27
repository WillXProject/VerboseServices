@echo off
title Verbose - System Recovery
echo ----------------------------
echo         V e r b o s e
echo        System Recovery
echo           Reverter
echo         Made by Nova
echo ----------------------------
echo Thanks for using Verbose software!
echo Editing Registry...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d C:\Verbose\recovery\start.bat /f
echo Added Entry!
echo Changed "Shell" RegKey to Windows Explorer (Actual Shell)
echo After this pause, your machine will restart
echo Thanks for using our tools!
pause
shutdown /r /f /t 0