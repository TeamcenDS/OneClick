@REM ----- OCTSR Begin -----
@REM CompanyName: Ceniun Design Studio
@REM FileDescription: MADE: By TEAM cenDS
@REM FileVersion: 1.0.0.0 beta
@REM LegalCopyright: © 2005 - 2011 Ceniun Design Studio
@REM ProductName: One Click Trinity Core Installer
@REM ----- OCTSR End -----
title One Click Trinty Server Restart
@ECHO OFF
:START
cls
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO ^|                                                                             ^|
ECHO ^|                  One Click Trinty Server Restart                                      ^|
ECHO ^|                                                                             ^|
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO ^|                                                                             ^|
ECHO ^|                          Select your Option :                               ^|
ECHO ^|                    [ 1 ] Check Every 15 minutes                             ^|
echo ^|                    [ 2 ] Check Every 30 minutes                             ^|
echo ^|                    [ 3 ] Check Every 60 minutes                             ^|
echo ^|                    [ 0 ] EXIT                                               ^|
ECHO ^|                                                                             ^|
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
set /p choice=
if %choice%==1 SET time = 900000 && GOTO LOOP
if %choice%==2 SET time = 1800000 && GOTO LOOP
if %choice%==3 SET time = 3600000 && GOTO LOOP
if %choice%==0 EXIT
:LOOP
CLS
tasklist /FI "IMAGENAME eq worldserver.exe" 2>NUL | find /I /N "worldserver.exe">NUL
if "%ERRORLEVEL%"=="1" START C:\Trinity\Server\authserver.exe
tasklist /FI "IMAGENAME eq authserver.exe" 2>NUL | find /I /N "authserver.exe">NUL
if "%ERRORLEVEL%"=="1" START C:\Trinity\Server\authserver.exe
ping 1.1.1.1 -n 1 -w %time% >NUL
GOTO LOOP

::FOR /F "tokens=1,2 delims= " %%a  in ('tasklist ^| findstr /i worldserver.exe') DO SET WPID=%%b
::FOR /F "tokens=1,2 delims= " %%a  in ('tasklist ^| findstr /i authserver.exe') DO SET APID=%%b
::echo %WPID%
::echo %APID%