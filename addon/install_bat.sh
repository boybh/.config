#!/bin/zsh

# Kiểm tra xem bat đã được cài đặt chưa
if command -v bat &> /dev/null
then
    echo "bat đã được cài đặt."
else
    echo "bat chưa được cài đặt, bắt đầu cài đặt..."

    # Cập nhật hệ thống và cài đặt các gói cần thiết
    sudo apt update
    sudo apt install -y git build-essential cmake pkg-config libssl-dev curl
    sudo apt install -y gh
    sudo apt-get install git-lfs
    # Clone repository của bat từ GitHub
    git clone https://github.com/sharkdp/bat.git ~/apps/bat

    # Di chuyển vào thư mục bat
    cd ~/apps/bat

    # Cài đặt Rust (nếu chưa có)
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    # Tải và cài đặt Rust
    source $HOME/.cargo/env

    # Biên dịch bat
    cargo build --release

    # Copy file thực thi của bat vào /usr/local/bin
    sudo cp target/release/bat /usr/local/bin/

    # Tạo cấu hình cho bat
    mkdir -p ~/.config/bat
    touch ~/.config/bat/config

    # Thêm cấu hình vào file config
    echo "# Sử dụng màu sắc để tô syntax" >> ~/.config/bat/config
    echo "--color=always" >> ~/.config/bat/config

    echo "# Tùy chọn màu sắc cho các thành phần khác nhau của cú pháp" >> ~/.config/bat/config
    echo "--theme=TwoDark" >> ~/.config/bat/config

    echo "# Hiển thị số dòng bên cạnh nội dung" >> ~/.config/bat/config
    echo "--line-numbers=always" >> ~/.config/bat/config

    echo "# Hiển thị kích thước của file" >> ~/.config/bat/config
    echo "--file-size" >> ~/.config/bat/config

    echo "# Hiển thị file ẩn" >> ~/.config/bat/config
    echo "--show-all" >> ~/.config/bat/config

    echo "Cài đặt bat và cấu hình hoàn tất!"
fi
