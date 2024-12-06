import os
import sys
import subprocess
import tempfile
import browser_cookie3
import requests

# Create a temp directory for cookies
temp_dir = os.path.join(tempfile.gettempdir(), "yt-dlp_cookies")
if not os.path.exists(temp_dir):
    os.makedirs(temp_dir)

# Function to check if a command exists
def command_exists(command):
    return subprocess.call(f"where {command}", shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE) == 0

# Function to download yt-dlp if not found
def download_yt_dlp():
    yt_dlp_path = os.path.join(temp_dir, "yt-dlp.exe")
    if not command_exists("yt-dlp"):
        print("yt-dlp not found. Downloading yt-dlp...")
        url = "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe"
        r = requests.get(url)
        with open(yt_dlp_path, 'wb') as f:
            f.write(r.content)
    else:
        print("yt-dlp already installed.")
        yt_dlp_path = "yt-dlp"
    return yt_dlp_path

# Download Python if not installed (this part assumes Windows-specific installer logic)
def download_python():
    if not command_exists("python"):
        print("Python not found. Downloading and installing Python...")
        url = "https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe"
        r = requests.get(url)
        with open("python-installer.exe", 'wb') as f:
            f.write(r.content)
        subprocess.call(["python-installer.exe", "/quiet", "InstallAllUsers=1", "PrependPath=1"])
        os.remove("python-installer.exe")
    else:
        print("Python already installed.")

# Function to extract cookies from the browser
def get_cookies():
    cookie_file = os.path.join(temp_dir, "cookies.txt")
    if not os.path.exists(cookie_file):
        print("Extracting cookies from the browser...")
        cookies = browser_cookie3.chrome(domain_name='youtube.com')
        with open(cookie_file, 'w') as f:
            for cookie in cookies:
                f.write(f"{cookie.name}\t{cookie.domain}\t{cookie.path}\t{cookie.secure}\t{cookie.expires}\t{cookie.value}\n")
    return cookie_file

# Display menu
def display_menu():
    print("===========================")
    print("Select an option to download video:")
    print("1. Download video from YouTube")
    print("2. Download video from QQ")
    print("3. Download video from OK.ru")
    print("4. Exit")
    print("===========================")
    choice = input("Enter your choice (1-4 or type 'q' to quit): ")
    return choice

# Download video logic
def download_video(platform):
    save_dir = input("Enter directory to save the video (or type 'q' to return to main menu): ")
    if save_dir.lower() == 'q':
        return

    url = input(f"Enter video URL from {platform} (or type 'q' to return to main menu): ")
    if url.lower() == 'q':
        return

    yt_dlp_exe = download_yt_dlp()
    cookie_file = get_cookies()

    print("===========================")
    print("Fetching video quality options...")
    try:
        subprocess.run([yt_dlp_exe, "-F", "--cookies", cookie_file, url], check=True)
    except subprocess.CalledProcessError:
        print("Error fetching video info. Please check the URL.")
        return

    print("===========================")
    quality_choice = input("Choose quality (enter quality code or 'best' for best quality, 'q' to return): ")

    if quality_choice.lower() == 'q':
        return

    if quality_choice.lower() == 'best':
        quality_choice = "bestvideo+bestaudio/best"

    try:
        subprocess.run([yt_dlp_exe, "-f", quality_choice, "--cookies", cookie_file, "-o", os.path.join(save_dir, "%(title)s.%(ext)s"), url], check=True)
        print("Video downloaded successfully.")
    except subprocess.CalledProcessError:
        print("Video download failed. Please check the URL and try again.")

# Main loop
if __name__ == "__main__":
    download_python()

    while True:
        choice = display_menu()
        if choice == '1':
            download_video("YouTube")
        elif choice == '2':
            download_video("QQ")
        elif choice == '3':
            download_video("OK.ru")
        elif choice == '4' or choice.lower() == 'q':
            sys.exit()
        else:
            print("Invalid choice. Please try again.")

