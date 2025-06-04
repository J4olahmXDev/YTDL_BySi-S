# 🎵 SiS - YouTube Downloader V1.3

A simple cross-platform (macOS & Windows) YouTube video/playlist downloader with a minimal, interactive interface. Download videos as `.mp3`, `.wav`, or `.mp4` with automatic folder handling.

## ✨ Features

- Interactive CLI – no need to type command-line arguments
- Playlist support – creates auto-named folders from Playlist title or current date
- Output formats: `mp3`, `wav`, `mp4` (macOS only)
- No installation required – uses portable `yt-dlp` and `ffmpeg`
- Auto fallback if Playlist name is invalid
- Supports custom download paths
- Logs status with clear success/error messages
- Works offline after setup

## 🖥 Platforms

- ✅ macOS (tested on Ventura)
- ✅ Windows 10/11

## 📁 Folder Structure


> ⚠️ **Important Note**:  
> Please avoid using special characters or spaces in download folder names. Some systems (especially Windows) may reject paths like:
> - `C:\Users\Name\My Downloads`
> - `C:\Test\ชื่อเพลลิสต์🎵`
>
> Use ASCII-only characters or underscores instead:
> - `C:\Users\Name\Downloads\My_Downloads`

## 🚀 How to Use

### macOS

1. Open Terminal
2. Run: `chmod +x 1_Install_All.command && ./1_Install_All.command`
3. Once setup completes, run: `./2_YouTubeDL.command`
4. Follow the prompt

### Windows

1. Double-click `1_Install_All.bat` to extract `yt-dlp` and `ffmpeg`
2. Run `2_YouTubeDL.bat`
3. Paste YouTube link, choose format, and done

## 🔧 Dependencies

- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- [FFmpeg](https://ffmpeg.org/) (optional for best quality, required for conversion)

## 🙋 Credits

- 👩‍💻 Developed by: **Si** 
- 💡 Original idea & structure by: **S** 

## 📜 License

This project is open-source and provided as-is under the MIT License.

---

Happy downloading! 🎧  
