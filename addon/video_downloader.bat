@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

REM Tạo thư mục tạm để lưu cookie
set temp_dir=%TEMP%\yt-dlp_cookies
if not exist "!temp_dir!" (
    mkdir "!temp_dir!"
)

REM Kiểm tra xem Python đã được cài đặt chưa
where python >nul 2>nul
if errorlevel 1 (
    echo Python chưa được cài đặt. Đang tải Python...
    curl -L -o "python-installer.exe" "https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe"
    start /wait python-installer.exe /quiet InstallAllUsers=1 PrependPath=1
    del python-installer.exe
) else (
    echo Python đã được cài đặt.
)

REM Kiểm tra xem yt-dlp đã được cài đặt hay chưa
if not exist "C:\Program Files\yt-dlp.exe" (
    echo yt-dlp chưa được tìm thấy. Đang tải yt-dlp...
    curl -L -o "C:\Program Files\yt-dlp.exe" "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe"
) else (
    echo yt-dlp đã được cài đặt.
)

REM Kiểm tra xem file cookie đã tồn tại chưa
set cookie_file="!temp_dir!\cookies.txt"
if not exist !cookie_file! (
    echo File cookie không tồn tại. Đang xuất cookie...
    python -c "import browser_cookie3; cj = browser_cookie3.chrome(domain_name='youtube.com'); with open('!cookie_file!', 'w') as f: [f.write(f'{cookie.name}\t{cookie.domain}\t{cookie.path}\t{cookie.secure}\t{cookie.expires}\t{cookie.value}\n') for cookie in cj]"
)

:menu
cls
echo ===========================
echo Chọn một tùy chọn để tải video:
echo 1. Tải video từ YouTube
echo 2. Tải video từ QQ
echo 3. Tải video từ OK.ru
echo 4. Quay lại
echo ===========================
set /p choice="Nhập lựa chọn của bạn (1-4 hoặc gõ 'q' hoặc '0' để thoát): "

if /i "%choice%"=="q" (
    exit
) else if "%choice%"=="0" (
    exit
) else if "%choice%"=="1" (
    call :download_video "YouTube"
) else if "%choice%"=="2" (
    call :download_video "QQ"
) else if "%choice%"=="3" (
    call :download_video "OK.ru"
) else if "%choice%"=="4" (
    exit
) else (
    echo Lựa chọn không hợp lệ. Vui lòng thử lại.
)

pause
goto menu

:download_video
set platform=%~1
set /p save_dir="Nhập thư mục để lưu video (hoặc gõ 'q' hoặc '0' để quay lại menu chính): "
if /i "!save_dir!"=="q" goto menu
if /i "!save_dir!"=="0" goto menu

set /p url="Nhập URL video từ %platform% (hoặc gõ 'q' hoặc '0' để quay lại menu chính): "
if /i "!url!"=="q" goto menu
if /i "!url!"=="0" goto menu

REM Lấy thông tin video để hiển thị chất lượng
echo ===========================
echo Đang lấy danh sách chất lượng video...

REM Kiểm tra nếu không có cookies.txt
if not exist "!temp_dir!\cookies.txt" (
    echo Vui lòng tạo file cookies.txt tại "!temp_dir!" để tải video.
    pause
    goto menu
)

"C:\Program Files\yt-dlp.exe" -F --cookies "!temp_dir!\cookies.txt" "!url!" || (
    echo Đã xảy ra lỗi khi lấy thông tin video. Vui lòng kiểm tra lại URL.
    pause
    goto menu
)

echo ===========================
echo Chọn chất lượng để tải (nhập mã chất lượng, 'best' để tải chất lượng tốt nhất, hoặc gõ 'q' hoặc '0' để quay lại menu chính): 
set /p quality_choice=""

if /i "!quality_choice!"=="best" (
    set quality_choice="bestvideo+bestaudio/best"
) else if /i "!quality_choice!"=="q" goto menu
if /i "!quality_choice!"=="0" goto menu

"C:\Program Files\yt-dlp.exe" -f "!quality_choice!" --cookies "!temp_dir!\cookies.txt" -o "!save_dir!\%%(title)s.%%(ext)s" "!url!" || (
    echo Tải video thất bại. Vui lòng kiểm tra URL và thử lại.
)

pause
goto :eof

