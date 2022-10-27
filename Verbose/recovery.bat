@echo off
title Verbose - System Recovery
echo ----------------------------
echo         V e r b o s e
echo        System Recovery
echo           Installer
echo         Made by Nova
echo ----------------------------
echo Thanks for using Verbose software!
echo Continue if you'd like to start System Recovery
echo Close this window if you don't want to
pause
echo Editing Registry...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d C:\Verbose\recovery\start.bat /f
echo Added Entry!
echo Changed "Shell" RegKey to Verbose System Recovery's Protocol
pause