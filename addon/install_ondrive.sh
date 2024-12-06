#!/bin/bash

# Định nghĩa các biến
CONFIG_DIR="$HOME/.config/onedrive"
ALIAS_NAME="onedrive"
ALIAS_FILE="$CAUHINH/aliases.zsh"

# Hàm kiểm tra lệnh
check_command() {
    if ! command -v "$1" &> /dev/null; then
        echo "$1 không được cài đặt. Vui lòng cài đặt $1 trước."
        exit 1
    fi
}

# Kiểm tra yêu cầu cơ bản
check_command "onedrive"

# Cấu hình alias cho tiện lợi
echo "Thêm alias vào $ALIAS_FILE..."
echo "alias $ALIAS_NAME='onedrive'" >> "$ALIAS_FILE"

# Đăng nhập vào OneDrive
echo "Đăng nhập vào OneDrive..."
onedrive auth

# Tạo thư mục cấu hình
mkdir -p "$CONFIG_DIR"
echo "Tạo thư mục cấu hình tại $CONFIG_DIR"

# Thiết lập đồng bộ thư mục
echo "Đặt thư mục đồng bộ hóa (mặc định là ~/OneDrive)..."
onedrive sync --download ~/OneDrive

echo "Cài đặt và cấu hình onedrive đã hoàn tất."
echo "Vui lòng mở một phiên terminal mới hoặc chạy 'source $CAUHINH/aliases.zsh' để áp dụng thay đổi."
