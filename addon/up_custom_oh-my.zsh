#!/bin/bash

# Đường dẫn đến thư mục .config
CONFIG_DIR="$HOME/.config"
CUSTOM_DIR="$HOME/.oh-my-zsh/custom"

# Kiểm tra nếu thư mục .config đã clone từ repository
if [ ! -d "$CONFIG_DIR/.git" ]; then
    echo "Chưa tìm thấy repository local. Đang clone từ GitHub..."
    git clone https://github.com/boybh/.config.git "$CONFIG_DIR"
else
    echo "Repository local đã tồn tại."
fi

# Sao chép thư mục custom vào .config/custom
echo "Sao chép thư mục custom vào $CONFIG_DIR/custom..."
cp -r "$CUSTOM_DIR" "$CONFIG_DIR/custom"

# Di chuyển vào thư mục .config
cd "$CONFIG_DIR" || { echo "Không thể vào thư mục $CONFIG_DIR"; exit 1; }

# Thêm thay đổi vào Git
echo "Thêm thay đổi vào Git..."
git add .config/custom

# Commit thay đổi
echo "Commit thay đổi..."
git commit -m "Upload custom folder from oh-my-zsh"

# Push thay đổi lên GitHub
echo "Đẩy thay đổi lên GitHub..."
git push origin master

echo "Đã hoàn thành việc upload thư mục custom lên GitHub."
