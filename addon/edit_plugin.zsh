# Đường dẫn đến file lưu plugin
PLUGIN_FILE="$HOME/.config/custom/plugins/plugins.zsh"

# Hàm để thêm plugin
plugin_save() {
    local plugin_name="$1"

    # Kiểm tra nếu plugin đã tồn tại
    if grep -q "$plugin_name" "$PLUGIN_FILE"; then
        echo "Lỗi: Plugin '$plugin_name' đã tồn tại." >&2
        return 1
    fi

    # Thêm plugin vào shell (vào biến plugins)
    plugins+=("$plugin_name")

    # Ghi vào file
    echo "plugins+=($plugin_name)" >> "$PLUGIN_FILE"

    # Thông báo thành công
    echo "Đã thêm plugin '$plugin_name' vào file $PLUGIN_FILE."
}

# Hàm để xóa plugin
plugin_delete() {
    local plugin_name="$1"

    # Kiểm tra nếu plugin tồn tại trong file
    if ! grep -q "$plugin_name" "$PLUGIN_FILE"; then
        echo "Lỗi: Plugin '$plugin_name' không tồn tại." >&2
        return 1
    fi

    # Xóa plugin khỏi shell
    plugins=("${plugins[@]/$plugin_name}")

    # Xóa plugin khỏi file
    sed -i.bak "/plugins+=($plugin_name)/d" "$PLUGIN_FILE"
    rm "$PLUGIN_FILE.bak"  # Xóa file backup

    # Thông báo thành công
    echo "Đã xóa plugin '$plugin_name' khỏi file $PLUGIN_FILE."
}

# Hàm để liệt kê tất cả các plugin
plugin_list() {
    if [ ! -f "$PLUGIN_FILE" ]; then
        echo "Không tìm thấy file $PLUGIN_FILE." >&2
        return 1
    fi

    echo "Danh sách các plugin tùy chỉnh:"
    cat "$PLUGIN_FILE"
}

# Tạo alias ngắn gọn
alias apl="plugin_save"
alias xpl="plugin_delete"
alias lpl="plugin_list"

# Tự động load các plugin từ file
if [ -f "$PLUGIN_FILE" ]; then
    source "$PLUGIN_FILE"
fi
