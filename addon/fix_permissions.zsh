#!/bin/zsh

# Danh sách các thư mục và file cần kiểm tra quyền
directories=(
    "/usr/share/zsh/functions"
    "/usr/share/zsh/functions/Completion"
    "/usr/share/zsh/functions/Misc"
    "/usr/share/zsh/functions/Zle"
    "/etc"
    "/usr/bin"
    "/usr/local/bin"
    "/var"
    "/bin"
)

# Đặt quyền cho các thư mục
for dir in "${directories[@]}"; do
    if [ ! -w "$dir" ]; then
        echo "Directory $dir is not writable. Attempting to change permissions..."
        
        # Thay đổi quyền cho thư mục
        sudo chmod -R 755 "$dir" || {
            echo "Failed to change permissions for $dir"
            continue
        }

        # Thay đổi chủ sở hữu cho thư mục
        sudo chown -R "$USER":"$USER" "$dir" || {
            echo "Failed to change ownership for $dir"
            continue
        }

        echo "Permissions changed for $dir."
    else
        echo "Directory $dir is writable."
    fi
done

echo "Permission checks completed."
