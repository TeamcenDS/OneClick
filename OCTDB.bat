@rem ----- OCTDB Begin -----
@rem CompanyName: Ceniun Design Studio
@rem FileDescription: MADE: By TEAM cenDS
@rem FileVersion: 1.0.0.1 beta
@rem LegalCopyright: GNU © 2005 - 2011 Ceniun Design Studio
@rem ProductName: One Click Trinity Database Installer
@rem ----- OCTDB End -----
title One Click Trinty Database Installer 
@echo off
:START
CLS
@COLOR 0B
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO ^|                                                                             ^|
ECHO ^|                  One Click Trinty Database Installer                        ^|
ECHO ^|                                                                             ^|
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO.
Echo Where is your MYSQL Path^?
ECHO EXAMPLE C:\Program Files\MySQL\
ECHO.
ECHO MYSQL Location: && SET /p mysqldir=
SET mysqlpath=%mysqldir%
path=%mysqlpath%bin;%~dp0;%systemroot%;%systemroot%system32
ECHO.
ECHO What is your MySQL database USERNAME^? (Most likely "root")
ECHO USERNAME: && SET /p mysqlusr=
ECHO.
ECHO What is your MySQL database PASSWORD^?
ECHO PASSWORD: && SET /p mysqlpw=
ECHO.
ECHO Now we SET your Account Database Name to "auth"
SET authdb=auth
ECHO Now we SET your Characters Database Name to "characters"
SET charactersdb=characters
ECHO Now we SET your world Database Name to "world"
SET worlddb=world
ECHO.
ECHO.
GOTO DWAIT
:DWAIT
cls
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO ^|                                                                             ^|
ECHO ^|                  One Click Trinty Database Installer                        ^|
ECHO ^|                                                                             ^|
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO.
ECHO.
ECHO   Preparing Database Setup  
echo   ----------------------------------
echo   Progress: ≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤ 1%%
echo   ----------------------------------
IF EXIST %~dp0"temp.txt" DEL %~dp0"temp.txt"
IF EXIST %~dp0"auth.log" DEL %~dp0"auth.log"
IF EXIST %~dp0"char.log" DEL %~dp0"char.log"
IF EXIST %~dp0"world.log" DEL %~dp0"world.log"
IF EXIST C:\Trinity\TC_DB\All_Auth_Updates.sql DEL C:\Trinity\TC_DB\All_Auth_Updates.sql
IF EXIST C:\Trinity\TC_DB\All_Characters_Updates.sql DEL C:\Trinity\TC_DB\All_Characters_Updates.sql
IF EXIST C:\Trinity\TC_DB\All_World_Updates.sql DEL C:\Trinity\TC_DB\All_World_Updates.sql
IF EXIST C:\Trinity\TC_DB\All_Script_Updates.sql DEL C:\Trinity\TC_DB\All_Script_Updates.sql
ping 127.0.0.1 -n 1 -w 500 > nul
cls
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO ^|                                                                             ^|
ECHO ^|                  One Click Trinty Database Installer                        ^|
ECHO ^|                                                                             ^|
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO.
ECHO.
ECHO   Checking Settings 
echo   ----------------------------------
echo   Progress: ≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤ 3%%
echo   ----------------------------------
REM Repos Sources
set repo_database="https://trinitydb.googlecode.com/hg/trinitydb"
REM Folder Sources
set f_database=C:\Trinity\TC_DB
REM Checking for 32/64Bit OS 
set prog_path=%ProgramFiles%
if not "[%ProgramFiles(x86)%]"=="[]" set prog_path=%ProgramFiles(x86)%
REM Program Sources 
set HG="%prog_path%\TortoiseHg\hg.exe"
set SVN="C:\%prog_path%\TortoiseSVN\bin\TortoiseProc.exe"

ping 127.0.0.1 -n 1 -w 500 > nul
cls
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO ^|                                                                             ^|
ECHO ^|                  One Click Trinty Database Installer                        ^|
ECHO ^|                                                                             ^|
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO.
ECHO.
ECHO   Preparing Clone/Pull Trinity DB
echo   ----------------------------------
echo   Progress: €≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤ 5%%
echo   ----------------------------------
IF EXIST %f_database%\ DEL %f_database%\
ping 127.0.0.1 -n 1 -w 500 > nul
cls
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO ^|                                                                             ^|
ECHO ^|                  One Click Trinty Database Installer                        ^|
ECHO ^|                                                                             ^|
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO.
ECHO.
ECHO   Clone/Pull Trinity DB
echo   ----------------------------------
echo   Progress: €€≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤ 10%%
echo   ----------------------------------
ECHO.
IF not exist %f_database% (
    ECHO - Create folder "%f_database%"
    ECHO.
    md %f_database%
    ECHO.
    ECHO - Checkout %repo_database%
    ECHO.
    call %HG% clone %repo_database% %f_database%
    ECHO.
)ELSE (
    cd %f_database%
	call %HG% pull 
    ECHO.
)
ping 127.0.0.1 -n 1 -w 500 > nul
cls
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO ^|                                                                             ^|
ECHO ^|                  One Click Trinty Database Installer                        ^|
ECHO ^|                                                                             ^|
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO.
ECHO.
ECHO   Preparing Database Merger
echo   ----------------------------------
echo   Progress: €€€€€€€€€≤≤≤≤≤≤≤≤≤≤ 46%%
echo   ----------------------------------
ECHO.
SET f_allupdates=C:\Trinity\TC\sql\updates\
SET g_allupdates=C:\Trinity\TC_DB\updates\
SET WorldUpdates=All_World_Updates.sql
SET CharactersUpdates=All_Characters_Updates.sql
SET AuthUpdates=All_Auth_Updates.sql
SET ScriptUpdates=All_Script_Updates.sql
ping 127.0.0.1 -n 1 -w 500 > nul
cls
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO ^|                                                                             ^|
ECHO ^|                  One Click Trinty Database Installer                        ^|
ECHO ^|                                                                             ^|
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO.
ECHO.
ECHO   Merging Trinity Database Updates
echo   ----------------------------------
echo   Progress: €€€€€€€€€€€€€€≤≤≤≤≤≤ 68%%
echo   ----------------------------------
ECHO.
ECHO merge world.sql updates
ECHO.
IF EXIST %f_allupdates%*world*.sql COPY %f_allupdates%*world*.sql %g_allupdates%%WorldUpdates% >nul
ECHO merge characters.sql updates
ECHO.
IF EXIST %f_allupdates%*characters*.sql COPY %f_allupdates%*characters*.sql %g_allupdates%%CharactersUpdates% >nul
ECHO merge auth.sql updates
ECHO.
IF EXIST %f_allupdates%*auth*.sql COPY %f_allupdates%*auth*.sql %g_allupdates%%AuthUpdates% >nul
ECHO merge scripts.sql updates
ECHO.
IF EXIST %f_allupdates%*script*.sql COPY %f_allupdates%*script*.sql  %g_allupdates%%ScriptUpdates% >nul
ping 127.0.0.1 -n 1 -w 500 > nul
cls
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO ^|                                                                             ^|
ECHO ^|                  One Click Trinty Database Installer                        ^|
ECHO ^|                                                                             ^|
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO.
ECHO.
ECHO   Preparing Download Setup
echo   ----------------------------------
echo   Progress: €€€€€€€€€€€€€€€€≤≤≤≤ 79%%
echo   ----------------------------------
ECHO.
ping 127.0.0.1 -n 1 -w 195 > nul
cls
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO ^|                                                                             ^|
ECHO ^|                  One Click Trinty Database Installer                        ^|
ECHO ^|                                                                             ^|
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO.
ECHO.
ECHO   Verifying Unzip.exe presence
echo   ----------------------------------
echo   Progress: €€€€€€€€€€€€€€€€€€≤≤ 92%%
echo   ----------------------------------
ECHO.
ping 127.0.0.1 -n 1 -w 500 > nul
cls
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO ^|                                                                             ^|
ECHO ^|                  One Click Trinty Database Installer                        ^|
ECHO ^|                                                                             ^|
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO.
ECHO.
ECHO   Database Download Complete
echo   ----------------------------------
echo   Progress: €€€€€€€€€€€€€€€€€€€€ 100%%
echo   ----------------------------------
ECHO.
@PAUSE
GOTO UNTDB
:UNTDB
cls
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO ^|                                                                             ^|
ECHO ^|                  One Click Trinty Database Installer                        ^|
ECHO ^|                                                                             ^|
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO.
ECHO Extracting World Archive
ECHO.
ECHO Preparing World Archive Extraction
ECHO.
IF EXIST C:\Trinity\TC_DB\full_db\TDB_*.sql DEL C:\Trinity\TC_DB\full_db\TDB_*.sql
IF EXIST TDB_*.sql DEL TDB_*.sql
ECHO.
ECHO EXTRACTING NEW WORLD .SQL
ECHO.
IF EXIST unzip.exe echo UNZIP was found
UNZIP C:\Trinity\TC_DB\full_db\TDB_*.zip
ECHO.
ECHO MOVING NEW WORLD .SQL
ECHO.
IF EXIST TDB_*.sql COPY TDB_*.sql C:\Trinity\TC_DB\full_db\
ECHO.
FOR %%f IN (TDB_*.sql) DO ECHO mysql  -u%mysqlusr% -p%mysqlpw% -D %worlddb% ^<"C:\Trinity\TC_DB\full_db\%%f">%~dp0"temp.txt"
@pause
GOTO CLEANUP
:CLEANUP
cls
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO ^|                                                                             ^|
ECHO ^|                  One Click Trinty Database Installer                        ^|
ECHO ^|                                                                             ^|
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO.
ECHO CLEANING UP ENVIRONMENT
IF EXIST TDB_*.sql DEL TDB_*.sql ECHO Removed TDB_*.sql
GOTO MYSQLCLN
:MYSQLCLN
ECHO.
ECHO Cleaning Mysql Environment
ECHO.
IF EXIST %mysqldir% GOTO AUTH
:AUTH
IF EXIST %mysqldir%data\auth GOTO AUTHDEL
GOTO AUTHSKP
:AUTHDEL
mysqladmin -u%mysqlusr% -p%mysqlpw% --force drop auth
GOTO CHAR
:AUTHSKP
ECHO Database "auth" is not present --- GOOD
GOTO CHAR
:CHAR
IF EXIST %mysqldir%data\characters GOTO CHARDEL
GOTO CHARSKP
:CHARDEL
mysqladmin -u%mysqlusr% -p%mysqlpw% --force drop characters
GOTO WORLD
:CHARSKP
ECHO Database "characters" is not present --- GOOD
GOTO WORLD
:WORLD
IF EXIST %mysqldir%data\world GOTO WORLDDEL
GOTO WORLDSKP
:WORLDDEL
mysqladmin -u%mysqlusr% -p%mysqlpw% --force drop world
ECHO.
@pause
goto INSERT
:WORLDSKP
ECHO Database "world" is not present --- GOOD
ECHO.
@pause
goto INSERT

:INSERT
cls
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO ^|                                                                             ^|
ECHO ^|                  One Click Trinty Database Installer                        ^|
ECHO ^|                                                                             ^|
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO.
ECHO Please wait while installing Databases
ECHO.
mysql -u%mysqlusr% -p%mysqlpw% < "C:\Trinity\TC\sql\create\create_mysql.sql"
mysql -u%mysqlusr% -p%mysqlpw%  -D %authdb% < "C:\Trinity\TC\sql\base\auth_database.sql"
mysql -u%mysqlusr% -p%mysqlpw%  -D %charactersdb% < "C:\Trinity\TC\sql\base\characters_database.sql"
set /p worldx=<%~dp0"temp.txt"
%worldx%
ECHO.
ECHO.
ECHO Importing all the updates... Please Hold/ Smoke a cig and chill.
ECHO.
:AUTHU
IF EXIST %g_allupdates%All_Auth_Updates.sql GOTO AUTHUPD
GOTO AUTHUSKP
:AUTHUSKP
ECHO Database "auth" has no updates present
GOTO CHARU
:AUTHUPD
mysql -u%mysqlusr% -p%mysqlpw%  -D %authdb% < "%g_allupdates%All_Auth_Updates.sql"
GOTO CHARU

:CHARU
IF EXIST %g_allupdates%All_Characters_Updates.sql GOTO CHARUPD
GOTO CHARUSKP
:CHARUSKP
ECHO Database "characters" has no updates present
GOTO WORLDU
:CHARUPD
mysql -u%mysqlusr% -p%mysqlpw%  -D %charactersdb% < "%g_allupdates%All_Characters_Updates.sql"
GOTO WORLDU

:WORLDU
IF EXIST %g_allupdates%All_World_Updates.sql GOTO WORLDUPD
GOTO WORLDSKP
:WORLDUSKP
ECHO Database "world" has no updates present
GOTO WORLDU
:WORLDUPD
mysql -u%mysqlusr% -p%mysqlpw%  -D %authdb% < "%g_allupdates%All_World_Updates.sql"
GOTO SCRIPTU

:SCRIPTU
IF EXIST %g_allupdates%All_Script_Updates.sql GOTO SCRIPTUPD
GOTO SCRIPTUSKP
:SCRIPTUSKP
ECHO Database "scripts" has no updates present
GOTO FIN
:SCRIPTUPD
mysql -u%mysqlusr% -p%mysqlpw%  -D %authdb% < "%g_allupdates%All_Script_Updates.sql"
:FIN
ECHO Verifying Installation ^& Creating logs
IF EXIST %mysqldir%data\auth DIR %mysqldir%data\auth >%~dp0"auth.log"
IF NOT EXIST %mysqldir%data\auth ECHO Database "auth" is not present --- REINSTALL
IF EXIST %mysqldir%data\characters DIR %mysqldir%data\characters >%~dp0"char.log" 
IF NOT EXIST %mysqldir%data\characters ECHO Database "characters" is not present --- REINSTALL
IF EXIST %mysqldir%data\world DIR %mysqldir%data\world >%~dp0"world.log"
IF NOT EXIST %mysqldir%data\world  ECHO Database "world" is not present --- REINSTALL
IF EXIST %~dp0"temp.txt" DEL %~dp0"temp.txt"
IF EXIST C:\Trinity\TC_DB\full_db\TDB_*.sql DEL C:\Trinity\TC_DB\full_db\TDB_*.sql
IF EXIST %g_allupdates%"All_Auth_Updates.sql" DEL %g_allupdates%"All_Auth_Updates.sql"
IF EXIST %g_allupdates%"All_Characters_Updates.sql" DEL %g_allupdates%"All_Characters_Updates.sql"
IF EXIST %g_allupdates%"All_World_Updates.sql" DEL %g_allupdates%"All_World_Updates.sql"
IF EXIST %g_allupdates%"All_Script_Updates.sql" DEL %g_allupdates%"All_Script_Updates.sql"
ECHO.
ECHO DONE!
@pause
goto DONE
:DONE
CLS
color 04
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO ^|                                                                             ^|
ECHO ^|                          Thanks for using                                   ^|
ECHO ^|                  One Click Trinty Database Installer                        ^|
ECHO ^|                   Dedicated to the AC-Web Community                         ^|
ECHO ^|                                                                             ^|
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO ^|                                                                             ^|
ECHO ^|   began                : Thursday, Jan 19, 2011                             ^|
ECHO ^|   copyright            : GNU (C)2011 - TEAM CENDS                           ^|
ECHO ^|   Website              : http://www.ceniun.co.uk/                           ^|
ECHO ^|   Authors              : Dekription and Ceniun                              ^|
ECHO ^|                                                                             ^|
ECHO ^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+-^+
ECHO.
ECHO Press the "any key" to EXIT!
@PAUSE >NUL
EXIT