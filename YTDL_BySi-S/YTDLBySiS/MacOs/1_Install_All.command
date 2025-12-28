#!/bin/bash

echo "====================================================="
echo "      🛠️  Si&S - Setup Python3 + ffmpeg + yt-dlp     "
echo "====================================================="

# 1. ตรวจสอบและติดตั้ง Homebrew
if ! command -v brew &> /dev/null; then
    echo "🍺 ไม่พบ Homebrew... กำลังพยายามติดตั้งให้ใหม่นะคะ"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    if [[ $(uname -m) == "arm64" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

if ! command -v brew &> /dev/null; then
    echo "❌ ติดตั้ง Homebrew ไม่สำเร็จ กรุณาเช็คอินเทอร์เน็ตนะคะ"
    exit 1
fi

echo "✅ Homebrew พร้อมใช้งานแล้วค่ะ"

# 2. รายการ Package
packages=(python ffmpeg yt-dlp)

for pkg in "${packages[@]}"; do
    if brew list $pkg &>/dev/null; then
        echo "✅ $pkg ติดตั้งอยู่แล้ว"
    else
        echo "📦 กำลังติดตั้ง $pkg..."
        brew install $pkg
    fi
done

echo
echo "🎉 ติดตั้งเสร็จสิ้นทุกอย่างแล้วค่ะ!"
echo "✨ คุณซัวว์พร้อมใช้งาน YouTube Downloader แล้วนะคะ"
echo

# 3. Countdown แบบเนียนๆ (ใช้ printf แทน echo)
for i in {5..1}; do
  printf "\r⏳ ปิดตัวใน %d วินาที..." "$i"
  sleep 1
done
printf "\nเรียบร้อยค่ะ บ๊ายบาย!\n"
exit 0