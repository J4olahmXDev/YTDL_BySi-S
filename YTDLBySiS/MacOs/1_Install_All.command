#!/bin/bash

echo "====================================================="
echo "      🛠️  Si&S - Setup Python3 + ffmpeg + yt-dlp     "
echo "====================================================="

# ตรวจสอบ Homebrew
if ! command -v brew &> /dev/null; then
    echo "🍺 กำลังติดตั้ง Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "✅ พบ Homebrew แล้ว"
fi

# ติดตั้ง Python3
echo "🐍 ติดตั้ง Python3..."
brew install python

# ติดตั้ง ffmpeg
echo "🎞️ ติดตั้ง ffmpeg..."
brew install ffmpeg

# ติดตั้ง yt-dlp
echo "📥 ติดตั้ง yt-dlp..."
pip3 install -U yt-dlp

echo
echo "🎉 ติดตั้งเสร็จสิ้นทุกอย่างแล้วค่ะ!"
echo "✨ พร้อมใช้งาน YouTube Downloader แล้วนะคะ"
echo

# Countdown ก่อนปิด
for i in {5..1}; do
  echo "⏳ ปิดตัวใน $i วินาที..."
  sleep 1
done
exit 0
