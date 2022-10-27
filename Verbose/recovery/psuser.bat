@echo off
net user /add NovaRecovery Recovery
C:\Verbose\clutils runas NovaRecovery Recovery powershell.exe
net user NovaRecovery /delete