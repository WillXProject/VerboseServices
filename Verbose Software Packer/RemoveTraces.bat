@echo off
echo Removing Verbose Traces in Registry...
reg delete HKLM\SOFTWARE\Verbose
echo Attempted Removal
echo If an error showed up instead, it didn't work
pause