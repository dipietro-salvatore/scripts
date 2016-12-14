@echo off
ipconfig | findstr /R /C:"IPv4 Address"
pause
