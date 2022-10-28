@echo off
net user /add NovaRecovery Recovery
C:\Verbose\clutils runas NovaRecovery Recovery cmd.exe
net user NovaRecovery /delete