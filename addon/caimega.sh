#!/bin/sh

# Biến cấu hình
MEGA_EMAIL="lygiaquan@outlook.com"
MEGA_PASSWORD="1211@@Sad"
LOCAL_FOLDER="$HOME"
REMOTE_FOLDER="SAOLUU/kali)"
TEMP_FOLDER="$HOME/temp_backup"

# Danh sách các mục cần loại trừ
EXCLUDE_LIST=".cache .tmp *.log *.tmp .java .rustup .android"

# Kiểm tra trạng thái đăng nhập
LOGIN_STATUS=$(mega-whoami 2>&1)

if echo "$LOGIN_STATUS" | grep -q "Not logged in"; then
    echo "Bạn chưa đăng nhập vào MEGA. Đang tiến hành đăng nhập..."
    mega-login "$MEGA_EMAIL" "$MEGA_PASSWORD"
elif echo "$LOGIN_STATUS" | grep -q "$MEGA_EMAIL"; then
    echo "Bạn đã đăng nhập vào tài khoản $MEGA_EMAIL."
else
    echo "Bạn đang đăng nhập vào một tài khoản khác."
    echo "Bạn có muốn đăng xuất để đăng nhập vào tài khoản $MEGA_EMAIL không? (y/n)"
    read -r CONFIRM
    if [ "$CONFIRM" = "y" ]; then
        mega-logout
        echo "Đang đăng nhập vào tài khoản $MEGA_EMAIL..."
        mega-login "$MEGA_EMAIL" "$MEGA_PASSWORD"
    else
        echo "Hủy bỏ. Script sẽ không thay đổi tài khoản đăng nhập."
        exit 1
    fi
fi

# Tạo thư mục tạm
echo "Đang tạo thư mục tạm để đồng bộ hóa..."
mkdir -p "$TEMP_FOLDER"

# Sao chép tệp cần thiết vào thư mục tạm
echo "Đang sao chép dữ liệu (bỏ qua các mục loại trừ)..."
for item in "$LOCAL_FOLDER"/*; do
    skip=false
    for pattern in $EXCLUDE_LIST; do
        if echo "$item" | grep -q "$pattern"; then
            skip=true
            echo "Bỏ qua: $item"
            break
        fi
    done
    if [ "$skip" = false ]; then
        cp -rf "$item" "$TEMP_FOLDER"
    fi
done

# Đồng bộ thư mục tạm với MEGA
echo "Đang đồng bộ thư mục tạm với MEGA..."
if mega-sync "$TEMP_FOLDER" "$REMOTE_FOLDER"; then
    echo "Đồng bộ hóa đã được thiết lập thành công!"
else
    echo "Có lỗi xảy ra trong quá trình đồng bộ hóa."
    exit 1
fi

# Xóa thư mục tạm
echo "Xóa thư mục tạm..."
rm -rf "$TEMP_FOLDER"
