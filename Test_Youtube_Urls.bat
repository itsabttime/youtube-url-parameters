setlocal enabledelayedexpansion

:loop
set https=
set domain=
set one=
set two=
set three=
set four=
set five=
set url=
set delet=
set isvideo=
set isshorts=
cls
echo off
:repat
echo.enter url:
set /p url=
set delet="%url%"
rem echo Pause1&pause
set delet=%url:&=^^^&%
rem echo Pause1&pause
REM set delet=%url:^^^==x%



set delet=%delet:"=%
rem echo Pause1&pause
echo                  URL  Candidate is: "!delet!"
echo.
echo. Please wait...... Processing.........& TIMEOUT 2 >NUL
CLS
for   /f "tokens=1,2,3,4,5,6,7 delims=^=/?^&" %%i in ("!delet!") do (if "%%i"=="https:" set /a https=1)&(set domain=%%j)&Echo.                   Slicing../&echo %%i,%%j,%%k,%%l,%%m,%%n,%%o&(set one=%%k)&(set two=%%l)&(set three=%%m)&(set four=%%n)&(set five=%%o)
rem &(if "%%j"=="www.youtube.com" set /a domain=1)
rem 
rem pause
rem pause&(set temp=!temp:"=!&if "!temp!"=="https:" set /a https=1&echo.HERE)&pause&
set /a domen=0
if "%domain%"=="www.youtube.com" set /a domen=1
if "%domain%"=="youtube.com" set /a domen=2
if "%domain%"=="youtu.be" set /a domen=3 & if "%one%" NEQ "" if "%two%"=="" set isvideo=channel2
rem Pause
if "%https%"=="1" echo HTTPS is On.
if "%domen%"=="1" echo.Domain is number 1.
if "%domen%"=="2" echo.Domain is number 2.
if "%domen%"=="3" echo.Domain is number 3.
if %domen% NEQ 1 if %domen% NEQ 2 if %domen% NEQ 3 echo.Undocumented Invalid Domain.
TIMEOUT 1 >NUL
echo._________. ___. . __________. ___. . _______. ___. . __________. ___. . ____. . _______
echo.parameter1:%one% parameter2=%two% parameter3=%three% parameter4=%four% parameter5=%five%
TIMEOUT 1 >NUL
if "%one%"=="watch" if "%two%"=="v" echo %three% is Video_Id&set isvideo=video
if "%one%"=="playlist" echo This is a playlist.&if "%two%"=="list" echo. %three% is Playlist_id
if "%one%"=="shorts" echo This is a shorts video.& if "%two%" NEQ "" echo %two% is the Shorts' Video_id & set isshorts=true
if "%one%" NEQ "watch" if "%one%" NEQ "playlist" if "%one%" NEQ "shorts" if "%two%"=="" echo. This could be  a Chennl. (khomeni_Zindabad) Sit ^^^! :) &echo.%one% | find "@"&&set isvideo=channel2
if "%one%"=="channel" if "%two%" NEQ "" if "%three%"=="" echo. Thisis a Chenaal. Channel_id %two% & set isvideo=channel
if "%one%"=="results" if "%two%"=="search_query" if "%three%" NEQ "" set isvideo=isurl

if "%four%"=="list" if "%two%"=="v" echo. This video is Part of a Playlist with Playlist_Id %five%
TIMEOUT 2 >NUL
for %%a in (one two three four five) do CALL echo Parameter 1:       !%%a!
Timeout 2 >NUL
if "%one%"=="watch" if "%two%"=="v" if "%four%"=="list" echo. Reconstruction: https://www.youtube.com/watch?v=%three%^&list=%five%&set url=https://www.youtube.com/watch?v=%three%^&list=%five%
if "%one%"=="watch" if "%two%"=="v" if "%four%" NEQ "list" echo. Reconstruction: https://www.youtube.com/watch?v=%three%&set url=https://www.youtube.com/watch?v=%three%
if "%isvideo%"=="channel2" echo. Reconstruction: https://%domain%/%one%&set url=https://%domain%/%one%
if "%isvideo%"=="channel" echo. Reconstruction: https://www.youtube.com/%one%/%two%&set url=https://www.youtube.com/%one%/%two%
if "%isshorts%"=="true" echo. Reconstruction: https://www.youtube.com/%one%/%two%&set url=https://www.youtube.com/%one%/%two%
if "%isvideo%"=="isurl" echo. "ytsearch1:%three%"&set url=
if "%isvideo%"=="" if "%isshorts%"=="" ( echo.&echo. Reconstruction failed^^^!&echo.........................& timeout 2 >NUL& goto loop ) 
echo.-x-x-x-x-x-x-x-x--x-x-x-x-x--x-x-x-x-x-x-x-x-x-x-x-x-x--x-x--x-x-x-x-x--x---
TIMEOUT 3 >NUL
echo.               x---------------x
echo.               ^|  Beginning    ^|
echo.               ^|  Download   ^^^! ^|
echo.               ^|_______________^|&echo.&echo.
TIMEOUT 2 >NUL
set delet="%url%"
REM set delet=!delet:"=!
set delet=%url:&=^&%

CD Batch Folder
CALL "C:\Users\Anil Bapna\Desktop\Batch folder\PUBLISHED_ytd.bat" "!delet!"

goto loop