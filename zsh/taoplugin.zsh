# Đường dẫn đến file lưu plugin
PLUGIN_FILE="$HOME/.config/zsh/plugin_omz.sh"

# Hàm để thêm plugin vào file
plugin_add() {
    local plugins=("$@")

    for plugin_name in "${plugins[@]}"; do
        # Kiểm tra nếu plugin đã tồn tại trong file
    if grep -q -E "plugins=\($plugin_name\)|$plugin_name" "$PLUGIN_FILE" && grep -q -E "plugins=\($plugin_name\)|$plugin_name" "$PLUGIN_FILE" ; then
        echo "Lỗi: Plugin '$plugin_name' đã tồn tại." >&2
        return 1
    fi     
# Thêm plugin vào shell (vào biến plugins)
    plugins+=("$plugin_name")    
 # Ghi vào file
    echo "plugins+=($plugin_name)" >> "$PLUGIN_FILE"

    # Thông báo thành công
    echo "Đã thêm plugin '$plugin_name' vào file $PLUGIN_FILE."
done
}

# Hàm để xóa plugin khỏi file
plugin_delete() {
    local plugins=("$@")

    for plugin_name in "${plugins[@]}"; do
        # Kiểm tra nếu plugin tồn tại trong file
        if grep -q "plugins+=($plugin_name)" "$PLUGIN_FILE"; then
            # Xóa dòng chứa plugins+=(plugin_name)
            sudo sed -i.bak "/plugins+=($plugin_name)/d" "$PLUGIN_FILE"
            echo "Đã xóa plugin '$plugin_name' khỏi phần plugins+= trong file $PLUGIN_FILE."
        else
            echo "Lỗi: Plugin '$plugin_name' không tồn tại." >&2
        fi
    done

    # Kiểm tra và xóa file backup nếu có
    if [ -f "$PLUGIN_FILE.bak" ]; then
        rm "$PLUGIN_FILE.bak"
    fi
}


# Hàm để liệt kê tất cả các plugin
plugin_list() {
    if [ ! -f "$PLUGIN_FILE" ]; then
        echo "Không tìm thấy file $PLUGIN_FILE." >&2
        return 1
    fi

    echo "Danh sách các plugin đã cài đặt:"
    cat $PLUGIN_FILE | sort -u

}

# Tạo alias ngắn gọn
alias pla="plugin_add"
alias pld="plugin_delete"
alias pll="plugin_list"

# Ví dụ cách sử dụng:
# pa cd-ls cd-gitroot copyzshell forgit vundle dropbox colors   # Thêm nhiều plugin
# pd cd-ls forgit                                               # Xóa nhiều plugin
# pl                                                            # Liệt kê tất cả các plugin

