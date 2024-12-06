#!/bin/bash

# Kiểm tra phiên bản Git
git_version=$(git --version 2>/dev/null)
if [[ $? -ne 0 ]]; then
  echo "Git không được cài đặt. Vui lòng cài đặt Git trước khi tiếp tục."
  exit 1
fi

# In ra phiên bản Git
echo "Phiên bản Git: $git_version"

# Cập nhật và cài đặt Git nếu cần
required_version="2.25"
installed_version=$(echo "$git_version" | awk '{print $3}')
if [[ "$(printf '%s\n' "$required_version" "$installed_version" | sort -V | head -n1)" != "$required_version" ]]; then
  echo "Git của bạn quá cũ ($installed_version). Cập nhật Git."
  sudo apt update
  sudo apt install -y git
fi

# Tạo thư mục và khởi tạo repository
mkdir -p ohmyzsh_plugins
cd ohmyzsh_plugins || { echo "Không thể di chuyển đến thư mục ohmyzsh_plugins"; exit 1; }
git init

# Cấu hình sparse-checkout
git config core.sparseCheckout true

# Thêm remote repository
git remote add origin https://github.com/ohmyzsh/ohmyzsh.git

# Cấu hình sparse-checkout để lấy thư mục plugins
echo "plugins/" > .git/info/sparse-checkout

# Pull dữ liệu từ remote
git pull origin master

# Kiểm tra nội dung thư mục
echo "Nội dung của thư mục plugins:"
ls plugins/
