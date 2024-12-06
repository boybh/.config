#!/bin/zsh

# Cập nhật hệ thống và cài đặt các gói cần thiết
echo "Cập nhật hệ thống và cài đặt git..."
sudo apt update && sudo apt install -y git

# Clone repository của bạn
echo "Cloning repository kali..."
git clone https://github.com/boybh/kali.git ~/kali

# Di chuyển toàn bộ nội dung từ thư mục kali vào $HOME và tự động tạo thư mục nếu chưa có
echo "Di chuyển toàn bộ nội dung từ ~/kali vào $HOME..."

# Sao chép tất cả các tệp và thư mục từ ~/kali vào $HOME
sudo cp -r ~/kali/* $HOME/

# Clone oh-my-zsh
echo "Cloning oh-my-zsh..."
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

# Clone fzf
echo "Cloning fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Thông báo hoàn tất
echo "Quá trình hoàn tất."
