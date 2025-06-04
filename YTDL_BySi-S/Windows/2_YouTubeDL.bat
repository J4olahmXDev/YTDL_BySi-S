@echo off
title SiS - YouTube Downloader V1.3
chcp 65001 >nul
setlocal

echo ===============================================
echo        SiS - YouTube Downloader V1.3
echo ===============================================

:: SET PATHS
set "YT=%~dp0tools\yt-dlp.exe"
set "FF=%~dp0tools\ffmpeg\bin\ffmpeg.exe"

:: GET URL
set /p URL=Paste YouTube video or playlist link: 

:: GET PLAYLIST NAME
for /f "tokens=* delims=" %%A in ('%YT% --flat-playlist --print "%%(playlist_title)s" "%URL%" ^| more') do (
    set "PL_NAME=%%A"
    goto :gotname
)
:gotname

if not defined PL_NAME (
    for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format dd.MM.yyyy"') do set "PL_NAME=%%i"
)

:: GET DEST PATH
echo Default download folder: %USERPROFILE%\Downloads\%PL_NAME%
set /p CUSTOM=Or enter custom path: 

if "%CUSTOM%"=="" (
    set "DEST=%USERPROFILE%\Downloads\%PL_NAME%"
) else (
    set "DEST=%CUSTOM%\%PL_NAME%"
)

mkdir "%DEST%"
cd /d "%DEST%"

:: CHOOSE FORMAT
set /p FORMAT=Choose format (mp3/wav): 

if /i "%FORMAT%"=="mp3" (
    set "OPT=-f bestaudio --extract-audio --audio-format mp3"
) else if /i "%FORMAT%"=="wav" (
    set "OPT=-f bestaudio --extract-audio --audio-format wav"
) else (
    echo Invalid format. Exiting.
    pause
    exit /b
)

echo.
echo Downloading...

:: EXEC COMMAND AFTER DOWNLOAD
%YT% %OPT% "%URL%" --ffmpeg-location "%FF%" --output "%%(title)s.%%(ext)s" --no-overwrites --restrict-filenames ^
--exec "cmd /c if exist \"{}\" (echo =========== \"{}\" : Download Complete ============= >> \"%USERPROFILE%\Downloads\downloads.log\") else (echo =========== \"{}\" : Error ============= >> \"%USERPROFILE%\Downloads\downloads.log\")"
 else (echo =========== {} : Error ============= >> %USERPROFILE%\Downloads\downloads.log)\""

echo.
echo Files saved in: %DEST%
echo Download completed. Press any key to exit.
pause >nul
