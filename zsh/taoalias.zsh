# Đường dẫn đến file lưu alias
ALIAS_FILE="$HOME/.config/zsh/aliases.zsh"

# Hàm để thêm alias
alias_add() {
    local alias_name="$1"
    local alias_command="$2"

    # Kiểm tra nếu alias đã tồn tại
    if alias "$alias_name" >/dev/null 2>&1; then
        echo "Lỗi: Alias '$alias_name' đã tồn tại." >&2
        return 1
    fi

    # Thêm alias vào shell
    alias "$alias_name"="$alias_command"

    # Ghi vào file
    echo "alias $alias_name='$alias_command'" >> "$ALIAS_FILE"

    # Thông báo thành công
    echo "Đã thêm alias '$alias_name' vào file $ALIAS_FILE."
}

# Hàm để xóa alias
alias_delete() {
    local alias_name="$1"

    # Kiểm tra nếu alias tồn tại
    if ! alias "$alias_name" >/dev/null 2>&1; then
        echo "Lỗi: Alias '$alias_name' không tồn tại." >&2
        return 1
    fi

    # Xóa alias khỏi shell
    unalias "$alias_name"

    # Xóa alias khỏi file
    sed -i.bak "/alias $alias_name=/d" "$ALIAS_FILE"
    rm "$ALIAS_FILE.bak"  # Xóa file backup

    # Thông báo thành công
    echo "Đã xóa alias '$alias_name' khỏi file $ALIAS_FILE."
}

# Hàm để liệt kê tất cả các alias
alias_list() {
    if [ ! -f "$ALIAS_FILE" ]; then
        echo "Không tìm thấy file $ALIAS_FILE." >&2
        return 1
    fi

    echo "Danh sách các alias tùy chỉnh:"
    cat "$ALIAS_FILE"
}

# Tạo alias ngắn gọn
#alias as="alias_save"
#alias ad="alias_delete"
#alias al="alias_list"

# Ví dụ cách sử dụng:
# as myalias "echo Hello World"   # Thêm alias
# ad myalias                      # Xóa alias
# al                              # Liệt kê tất cả các alias
