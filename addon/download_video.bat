@echo off
setlocal enabledelayedexpansion

REM Tải và cài đặt yt-dlp
echo Đang tải yt-dlp...
curl -L -o yt-dlp.exe https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe

REM Kiểm tra nếu yt-dlp.exe đã được tải
if exist yt-dlp.exe (
    echo yt-dlp đã được tải thành công.
) else (
    echo Không thể tải yt-dlp.
    exit /b 1
)

REM Menu chọn
:menu
cls
echo ===========================
echo Chọn một tùy chọn để tải video:
echo 1. Tải video từ YouTube
echo 2. Tải video từ QQ
echo 3. Tải video từ OK.ru
echo 4. Thoát
echo ===========================
set /p choice="Nhập lựa chọn của bạn (1-4): "

REM Xử lý lựa chọn
if "!choice!"=="1" (
    set /p url="Nhập URL của video YouTube: "
    yt-dlp -f bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4] "!url!" -o "%USERPROFILE%\Downloads\%(title)s.%(ext)s"
    echo Video đã được tải về thư mục Downloads.
    pause
    goto menu
) else if "!choice!"=="2" (
    set /p url="Nhập URL của video QQ: "
    yt-dlp "!url!" -o "%USERPROFILE%\Downloads\%(title)s.%(ext)s"
    echo Video đã được tải về thư mục Downloads.
    pause
    goto menu
) else if "!choice!"=="3" (
    set /p url="Nhập URL của video OK.ru: "
    yt-dlp "!url!" -o "%USERPROFILE%\Downloads\%(title)s.%(ext)s"
    echo Video đã được tải về thư mục Downloads.
    pause
    goto menu
) else if "!choice!"=="4" (
    echo Thoát...
    exit /b
) else (
    echo Lựa chọn không hợp lệ. Vui lòng thử lại.
    pause
    goto menu
)

