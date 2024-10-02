#!/bin/zsh

# Đường dẫn đến thư mục Git
REPO_DIR="$HOME/.config"

# Chuyển đến thư mục Git
cd $REPO_DIR || { echo "Không thể chuyển đến thư mục $REPO_DIR"; exit 1; }

# Cập nhật các thay đổi
git add .
git commit -m "update mới"
git push origin config

# Thông báo hoàn thành
echo "Đã cập nhật thành công!"
