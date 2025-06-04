@echo off
title Installing yt-dlp and ffmpeg
echo ===============================================
echo        Installing yt-dlp and ffmpeg...
echo ===============================================
mkdir tools
cd tools

:: Download yt-dlp.exe
echo Downloading yt-dlp.exe...
curl -L -o yt-dlp.exe https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe

:: Download and unzip ffmpeg
echo Downloading ffmpeg...
curl -L -o ffmpeg.zip https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip

echo Extracting ffmpeg...
powershell -Command "Expand-Archive ffmpeg.zip -DestinationPath ffmpeg_temp"
move ffmpeg_temp\ffmpeg-* ffmpeg >nul 2>&1
rd /s /q ffmpeg_temp
del ffmpeg.zip

echo.
echo All tools have been installed successfully.
echo You may now close this window or press any key to exit.
pause >nul
