#!/bin/sh

# Định nghĩa màu sắc
RESET="\033[0m"
BOLD="\033[1m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
CYAN="\033[36m"
WHITE="\033[97m"

# Khai báo các biến mặc định
MEGA_EMAIL="lygiaquan@outlook.com"
MEGA_PASSWORD="1211@@Sad"
LOCAL_FOLDER="$HOME"
REMOTE_FOLDER="/Root/$(basename $HOME)"
EXCLUDE_PATTERNS="*.tmp *.log $HOME/.java $HOME/.rustup/ $HOME/"
INCLUDE_PATTERNS="$HOME"  # Các thư mục và tập tin sẽ sao lưu
BACKUP_FOLDER="/backup/$(basename $HOME)"

# Kiểm tra trình thông dịch
if [ -n "$ZSH_VERSION" ]; then
    SHELL_NAME="zsh"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_NAME="bash"
else
    SHELL_NAME="sh"
fi

while true; do
    echo "${CYAN}====================${RESET}"
    echo "${BOLD}${GREEN}MEGA CMD Menu${RESET}"
    echo "${CYAN}====================${RESET}"
    echo "${YELLOW}1.${RESET} ${BLUE}Đăng nhập vào tài khoản MEGA${RESET}"
    echo "${YELLOW}2.${RESET} ${BLUE}Đăng xuất khỏi tài khoản MEGA${RESET}"
    echo "${YELLOW}3.${RESET} ${BLUE}Đồng bộ hóa thư mục${RESET}"
    echo "${YELLOW}4.${RESET} ${BLUE}Dừng đồng bộ hóa thư mục${RESET}"
    echo "${YELLOW}5.${RESET} ${BLUE}Xóa đồng bộ hóa thư mục${RESET}"
    echo "${YELLOW}6.${RESET} ${BLUE}Kiểm tra trạng thái tài khoản${RESET}"
    echo "${YELLOW}7.${RESET} ${BLUE}Kiểm tra dung lượng lưu trữ${RESET}"
    echo "${YELLOW}8.${RESET} ${BLUE}Kiểm tra trạng thái các tệp đang tải lên hoặc tải xuống${RESET}"
    echo "${YELLOW}9.${RESET} ${BLUE}Kiểm tra phiên bản MEGAcmd${RESET}"
    echo "${YELLOW}q.${RESET} ${RED}Thoát${RESET}"
    echo "${CYAN}====================${RESET}"
    read -p "Chọn một tùy chọn: " choice

    case $choice in
        1)
            echo "${BLUE}Đang đăng nhập với email $MEGA_EMAIL${RESET}"
            mega-login $MEGA_EMAIL $MEGA_PASSWORD
            ;;
        2)
            mega-logout
            ;;
        3)
            echo "${BLUE}Đang đồng bộ thư mục từ $LOCAL_FOLDER tới $REMOTE_FOLDER${RESET}"
            # Sử dụng các tham số mặc định để đồng bộ thư mục
            mega-sync $LOCAL_FOLDER $REMOTE_FOLDER --exclude "$EXCLUDE_PATTERNS" --include "$INCLUDE_PATTERNS"
            ;;
        4)
            echo "${BLUE}Dừng đồng bộ thư mục tại $LOCAL_FOLDER${RESET}"
            mega-sync --stop $LOCAL_FOLDER
            ;;
        5)
            echo "${BLUE}Xóa đồng bộ thư mục tại $LOCAL_FOLDER${RESET}"
            mega-sync --remove $LOCAL_FOLDER
            ;;
        6)
            mega-whoami
            ;;
        7)
            mega-df
            ;;
        8)
            mega-transfers
            ;;
        9)
            mega-version
            ;;
        q)
            echo "${RED}Thoát khỏi menu.${RESET}"
            break
            ;;
        *)
            echo "${RED}Tùy chọn không hợp lệ. Vui lòng chọn lại.${RESET}"
            ;;
    esac
done
