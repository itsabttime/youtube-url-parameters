

@echo off
echo ad |choice /c de >NUL
Set _bGreen=[42m
Set _RESET=[0m
Echo.%_bGreen%YOUTUBE &echo. ^(1^)Music^(2^)Video^(3^)Fail %_RESET%

for /f "tokens=3" %%i in ('reg query "HKEY_CURRENT_USER\Control Panel\International" /v sShortDate ^| find "sShortDate"') do set shortdate=%%i
for /f "tokens=3" %%i in ('reg query "HKEY_CURRENT_USER\Control Panel\International" /v sShortDate ^| find "sShortTime"') do set shorttime=%%i
:start

setlocal enabledelayedexpansion
for /f "tokens=*" %%i in (%1) do set url=%%i&echo "!url!"
echo.
echo. Testing URL...
(echo "!url!" | find "https://www.youtube.com/"&&echo.UP1)&(echo "!url!" | find "https://youtube.com/"&&echo.UP2)&(echo "!url!" | find "https://youtu.be/"&&echo.UP3)


choice /c 123
set perverta=%errorlevel%
:retry
if %perverta%==1  ..\YOUTUBE -f bestaudio "!url!"&if !errorlevel! NEQ 0  ( goto neq ) else ( goto successaudio )
if %perverta%==2  ..\YOUTUBE -f best "!url!"&if !errorlevel! NEQ 0  ( goto neq ) else ( goto successvideo )

if %perverta%==3   ..\YOUTUBE -F "!url!"&if !errorlevel! NEQ 0 goto invalidurl
set str=
echo.what is the three-lettered word? tell me,
choice /c 1234567890 >nul
set error=%errorlevel%
if !error!==10 set error=
set str=!str!!error!
choice /c 1234567890 >nul
set error=%errorlevel%
if !error!==10 set error=0
set str=!str!!error!
choice /c 1234567890 >nul
set error=%errorlevel%
if !error!==10 set error=0
set str=!str!!error!
set /a str=!str!+0+1-1
 echo...\YOUTUBE -f !str! "!url!"&..\YOUTUBE -f !str! "!url!"
:error
echo.^_Echo_ECHO^=[4m&PAUSE&Exit
:neq
echo.               x---------------x
echo.               ^|  Errors       ^|
echo.               ^|  Encountered^^^! ^|
echo.               ^|_______________^|&echo.&echo.
timeout 1 >NUL&echo. Retrying with parameter -F ...
set perverta=3&goto retry
:invalidurl
echo.&echo.
echo.               x---------------x
echo.               ^|  Invalid URL^^^! ^|
echo.               ^|_______________^|&echo.&echo.
goto Start

:successaudio
for /f %%i in ('powershell -c "(get-date).adddays(-1).tostring(\"%shorttime%\")"') do set scope_2=%%i
for /f %%i in ('powershell -c "(get-date).tostring(\"%shorttime%\")"') do set scope_1=%%i
set /a counter=0
echo scope_1=%scope_1%=scope_2=%scope_2%=
for /f %%i in ('dir /b /tc /o-d /-c *.mp3,*.webm,*.m4a,*.mp4 ^| findstr /r "^[^ ]" ^| find "%scope_1%"') do set fileis=%%i&set /a counter+=1
if !counter! NEQ 0 if %counter% GTR 1 ( echo. CONFUSED which is which:&echo.The following audio files were found:&dir /b /tc /o-d /-c *.mp3,*.webm,*.m4a,*.mp4 ) else ( echo. Fileis "%fileis%" )
set /a counter=0
for /f %%i in ('dir /b /tc /o-d /-c *.mp3,*.webm,*.m4a,*.mp4 ^| findstr /r "^[^ ]" ^| find "%scope_2%"') do set fileis=%%i&set /a counter+=1
if !counter! NEQ 0 if %counter% GTR 1 ( echo. CONFUSED which is which:&echo.The following audio files were found:&dir /b /tc /o-d /-c *.mp3,*.webm,*.m4a,*.mp4 ) else ( echo. Fileis "%fileis%" )
PAUSE
EXIT
