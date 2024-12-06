#!/bin/zsh

# Kiểm tra trình thông dịch
if [ -n "$ZSH_VERSION" ]; then
    SHELL_NAME="zsh"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_NAME="bash"
else
    SHELL_NAME="sh"
fi

# Biến cấu hình
MEGA_EMAIL="lygiaquan@outlook.com"
MEGA_PASSWORD="1211@@Sad"
LOCAL_FOLDER="$HOME"
REMOTE_FOLDER="/Root/$(basename $HOME)"
EXCLUDE_PATTERNS=("*.tmp" "*.log" "$HOME/.java" "$HOME/.rustup/" "$HOME/.android" "$HOME/.cache" "$HOME/tmp")       # Các thư mục và tập tin sẽ loại trừ
INCLUDE_PATTERNS=("$HOME")  # Các thư mục và tập tin sẽ sao lưu
BACKUP_FOLDER="/backup/$(basename $HOME)"

# Kiểm tra xem MEGAcmd đã được cài đặt hay chưa
if ! command -v mega-login &> /dev/null
then
    echo "MEGAcmd chưa được cài đặt. Đang tiến hành cài đặt..."

    # Tải và cài đặt MEGAcmd
    wget https://mega.nz/linux/repo/Debian_testing/amd64/megacmd-Debian_testing_amd64.deb
    sudo apt install -y "$PWD/megacmd-Debian_testing_amd64.deb"

    # Xóa tệp đã tải để giải phóng dung lượng
    rm megacmd-Debian_testing_amd64.deb

    echo "Cài đặt MEGAcmd hoàn tất."
else
    echo "MEGAcmd đã được cài đặt."
fi

# Đăng nhập vào tài khoản MEGA
mega-login $MEGA_EMAIL $MEGA_PASSWORD

# Sao lưu thư mục người dùng hiện tại
echo "Đang sao lưu thư mục người dùng hiện tại..."
mkdir -p $BACKUP_FOLDER
cp -r $LOCAL_FOLDER/* $BACKUP_FOLDER

# Thiết lập đồng bộ hóa với các tùy chọn loại trừ và bao gồm
SYNC_COMMAND="mega-sync $LOCAL_FOLDER $REMOTE_FOLDER"
for pattern in "${EXCLUDE_PATTERNS[@]}"; do
    SYNC_COMMAND+=" --exclude=\"$pattern\""
done
for pattern in "${INCLUDE_PATTERNS[@]}"; do
    SYNC_COMMAND+=" --include=\"$pattern\""
done

# Thực thi lệnh đồng bộ hóa
eval $SYNC_COMMAND

echo "Đồng bộ hóa đã được thiết lập thành công!"
