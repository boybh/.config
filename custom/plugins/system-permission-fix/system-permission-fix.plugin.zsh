# system-permission-fix.zsh

# Hàm để sửa lỗi và phân quyền tạm thời cho hệ thống
fix_system_permissions() {
    # Đặt danh sách các thư mục cần kiểm tra quyền
    local directories=(
        "/usr/share/zsh/functions"
        "/usr/share/zsh/functions/Completion"
        "/usr/share/zsh/functions/Completion/Base"
        "/usr/share/zsh/functions/Completion/Unix"
        "/usr/share/zsh/functions/Completion/Zsh"
        "/usr/share/zsh/functions/Misc"
        "/usr/share/zsh/functions/Zle"
        "/etc"                # Thêm thư mục /etc
        "/usr/bin"           # Thêm thư mục /usr/bin
        "/usr/local/bin"     # Thêm thư mục /usr/local/bin
        "/var"               # Thêm thư mục /var
        # Thêm các thư mục khác nếu cần
    )

    # Lưu trữ quyền ban đầu để khôi phục sau này
    declare -A original_permissions

    # Kiểm tra và thay đổi quyền cho từng thư mục
    for dir in "${directories[@]}"; do
        if [[ ! -w "$dir" ]]; then
            echo "Directory $dir is not writable. Attempting to change permissions temporarily."
            # Lưu quyền gốc
            original_permissions["$dir"]="$(stat -c %a "$dir")"  # Lưu quyền truy cập
            # Thay đổi quyền cho user hiện tại
            sudo chmod -R u+w "$dir" 2>/dev/null
            
            if [[ $? -eq 0 ]]; then
                echo "Permissions changed for $dir."
            else
                echo "Failed to change permissions for $dir. Please check your privileges."
            fi
        else
            echo "Directory $dir is writable."
        fi
    done

    echo "Permission checks completed."

    # Khôi phục quyền truy cập ban đầu
    for dir in "${!original_permissions[@]}"; do
        if [[ -n "${original_permissions[$dir]}" ]]; then
            echo "Restoring original permissions for $dir."
            sudo chmod "${original_permissions[$dir]}" "$dir"
        fi
    done
}

# Gọi hàm khi plugin được chạy
fix_system_permissions
