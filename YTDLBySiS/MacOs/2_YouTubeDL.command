#!/bin/bash
clear
echo "         ♪ ♫ ♬ ♩ ♭ ♯ ♪ ♫ ♬ ♩"
echo "         Si&S - YouTube Downloader V.1.3"
echo "===================================================="
echo "🖥️ เวอร์ชัน: CLI"
echo "===================================================="

read -p "🔗 วางลิงก์ YouTube หรือ Playlist: " URL

# Get playlist or video title to create folder
PL_NAME=$(yt-dlp --flat-playlist --print "%(playlist_title)s" "$URL" | head -n 1 | tr -cd '[:alnum:] _-' | tr ' ' '_')
if [[ -z "$PL_NAME" ]]; then
    PL_NAME=$(date "+%d.%m.%Y")
fi

# Ask for custom path or use default
echo "กด Enter เพื่อใช้โฟลเดอร์ปลายทาง ~/Downloads/$PL_NAME"
read -p "หรือวางพาธปลายทางเอง: " CUSTOM_PATH

if [[ -z "$CUSTOM_PATH" ]]; then
    DEST="$HOME/Downloads/$PL_NAME"
else
    DEST="$CUSTOM_PATH/$PL_NAME"
fi

mkdir -p "$DEST"

read -p "🎧 เลือกรูปแบบไฟล์ (mp3/wav): " FORMAT

# Set format options
case "$FORMAT" in
    mp3)
        OPT="-f bestaudio --extract-audio --audio-format mp3"
        EXT="mp3"
        ;;
    wav)
        OPT="-f bestaudio --extract-audio --audio-format wav"
        EXT="wav"
        ;;
    *)
        echo "ไม่รู้จักรูปแบบไฟล์ที่เลือก"
        exit 1
        ;;
esac

cd "$DEST"

yt-dlp $OPT "$URL" --no-overwrites \
    --output "%(title)s.%(ext)s" \
    --encoding utf-8 \
    --exec 'if [ -f "{}" ]; then echo "=========== {} : โหลดเสร็จสิ้น =============" >> ~/Downloads/downloads.log; else echo "=========== {} : Error =============" >> ~/Downloads/downloads.log; fi'

echo
echo "📁 ไฟล์ถูกเก็บไว้ที่: $DEST"
echo "🚀 เสร็จสิ้นแล้วค่ะ~"
read -p "กด Enter เพื่อออกจากโปรแกรม"
