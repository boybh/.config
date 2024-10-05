#!/bin/bash

# Switch to UTF-8 encoding (not always necessary on Unix systems)
export LANG=C.UTF-8

# Create a temporary directory to store cookies
temp_dir="/tmp/yt-dlp_cookies"
if [ ! -d "$temp_dir" ]; then
    mkdir "$temp_dir"
fi

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "Python is not installed. Downloading Python..."
    curl -L -o "python-installer.sh" "https://www.python.org/ftp/python/3.10.11/Python-3.10.11.tgz"
    tar -xzf python-installer.sh
    cd Python-3.10.11
    ./configure
    make
    sudo make install
    cd ..
    rm -rf Python-3.10.11 python-installer.sh
else
    echo "Python is already installed."
fi

# Check if yt-dlp is installed
if [ ! -f "/usr/local/bin/yt-dlp" ]; then
    echo "yt-dlp not found. Downloading yt-dlp..."
    sudo curl -L -o "/usr/local/bin/yt-dlp" "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp"
    sudo chmod a+rx /usr/local/bin/yt-dlp
else
    echo "yt-dlp is already installed."
fi

# Check if cookie file exists
cookie_file="$temp_dir/cookies.txt"
if [ ! -f "$cookie_file" ]; then
    echo "Cookie file not found. Exporting cookies..."
    python3 -c "import browser_cookie3; cj = browser_cookie3.chrome(domain_name='youtube.com'); with open('$cookie_file', 'w') as f: [f.write(f'{cookie.name}\t{cookie.domain}\t{cookie.path}\t{cookie.secure}\t{cookie.expires}\t{cookie.value}\n') for cookie in cj]"
fi

menu() {
    clear
    echo "==========================="
    echo "Select an option to download video:"
    echo "1. Download video from YouTube"
    echo "2. Download video from QQ"
    echo "3. Download video from OK.ru"
    echo "4. Exit"
    echo "==========================="
    read -p "Enter your choice (1-4 or type 'q' to quit): " choice

    case "$choice" in
        "q"|"0") exit ;;
        "1") download_video "YouTube" ;;
        "2") download_video "QQ" ;;
        "3") download_video "OK.ru" ;;
        "4") exit ;;
        *) echo "Invalid choice. Please try again."; menu ;;
    esac
}

download_video() {
    local platform=$1
    read -p "Enter directory to save the video (or type 'q' to return to menu): " save_dir
    if [ "$save_dir" == "q" ] || [ "$save_dir" == "0" ]; then
        menu
    fi

    read -p "Enter video URL from $platform (or type 'q' to return to menu): " url
    if [ "$url" == "q" ] || [ "$url" == "0" ]; then
        menu
    fi

    echo "==========================="
    echo "Fetching video quality options..."

    # Ensure cookies.txt exists
    if [ ! -f "$cookie_file" ]; then
        echo "Please create cookies.txt in $temp_dir to download the video."
        read -p "Press any key to return to the menu..." key
        menu
    fi

    yt-dlp -F --cookies "$cookie_file" "$url" || {
        echo "Error fetching video info. Please check the URL."
        read -p "Press any key to return to the menu..." key
        menu
    }

    echo "==========================="
    echo "Choose a quality option to download:"
    echo "==========================="

    local counter=1
    declare -A quality_map

    while IFS= read -r line; do
        id=$(echo "$line" | awk '{print $1}')
        ext=$(echo "$line" | awk '{print $2}')
        echo "$counter. ID: $id | EXT: $ext"
        quality_map[$counter]=$id
        counter=$((counter + 1))
    done < <(yt-dlp -F --cookies "$cookie_file" "$url" | grep -E "^[0-9]+ ")

    echo
    read -p "Enter quality code (or type 'best' to download the best quality, 'q' to return to menu): " quality_choice

    if [ "$quality_choice" == "best" ]; then
        quality_choice="bestvideo+bestaudio/best"
    elif [ "$quality_choice" == "q" ] || [ "$quality_choice" == "0" ]; then
        menu
    elif [ -n "${quality_map[$quality_choice]}" ]; then
        quality_choice=${quality_map[$quality_choice]}
    else
        echo "Invalid choice. Please try again."
        read -p "Press any key to continue..." key
        menu
    fi

    yt-dlp -f "$quality_choice" --cookies "$cookie_file" -o "$save_dir/%(title)s.%(ext)s" "$url" || {
        echo "Video download failed. Please check the URL and try again."
    }

    read -p "Press any key to return to the menu..." key
    menu
}

menu

