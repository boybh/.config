#!/bin/zsh

# Thiết lập biến cho các thông tin kết nối
REMOTE_USER="root"  # Thay đổi với tên người dùng trên máy từ xa
REMOTE_HOST="192.168.1.124"  # Thay đổi với IP hoặc tên máy của máy từ xa
SSH_PORT="22"  # Cổng SSH (thường là 22)
PRIVATE_KEY_PATH="$HOME/.ssh/id_rsa"  # Đường dẫn đến khóa SSH riêng của bạn (nếu có)

# Kiểm tra xem OpenSSH client có được cài đặt không
if ! command -v ssh &> /dev/null
then
    echo "SSH client không được cài đặt. Vui lòng cài đặt trước khi tiếp tục."
    exit 1
fi

# Tạo khóa SSH nếu chưa có
if [ ! -f "$PRIVATE_KEY_PATH" ]; then
    echo "Khóa SSH chưa được tạo. Tạo khóa mới..."
    ssh-keygen -t rsa -b 4096 -f "$PRIVATE_KEY_PATH" -N ""
    echo "Khóa SSH đã được tạo tại $PRIVATE_KEY_PATH"
else
    echo "Khóa SSH đã tồn tại tại $PRIVATE_KEY_PATH"
fi

# Sao chép khóa công khai vào máy từ xa
echo "Sao chép khóa công khai vào máy từ xa..."
ssh-copy-id -i "$PRIVATE_KEY_PATH.pub" "$REMOTE_USER@$REMOTE_HOST" -p "$SSH_PORT"
if [ $? -eq 0 ]; then
    echo "Khóa công khai đã được sao chép thành công vào máy từ xa."
else
    echo "Lỗi khi sao chép khóa công khai. Vui lòng kiểm tra lại."
    exit 1
fi

# Kết nối SSH tới máy từ xa mà không cần mật khẩu
echo "Kết nối với máy từ xa..."
ssh -i "$PRIVATE_KEY_PATH" "$REMOTE_USER@$REMOTE_HOST" -p "$SSH_PORT"
