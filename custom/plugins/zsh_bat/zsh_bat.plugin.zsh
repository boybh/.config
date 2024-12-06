# Plugin cho Zsh để xử lý file .bat
bat_handler() {
    local bat_file="$1"

    # Kiểm tra xem file có đuôi .bat không
    if [[ "$bat_file" == *.bat ]]; then
        echo "Đang phát hiện file .bat: $bat_file"

        # Kiểm tra nếu Wine được cài đặt
        if command -v wine &> /dev/null; then
            echo "Chạy file .bat bằng Wine..."
            wine cmd /c "$bat_file"
        else
            echo "Wine không được cài đặt. Đang chuyển đổi file .bat sang .sh..."

            # Tạo file Bash từ .bat
            local sh_file="${bat_file%.bat}.sh"
            echo "#!/bin/bash" > "$sh_file"
            echo "# Chuyển đổi từ file $bat_file" >> "$sh_file"
            # Chuyển đổi đơn giản: thay đổi cú pháp Windows sang Linux
            sed 's/^@echo off//g; s/^echo /echo /g; s/set /export /g' "$bat_file" >> "$sh_file"
            
            # Đảm bảo file .sh có quyền thực thi
            chmod +x "$sh_file"
            
            echo "File đã chuyển đổi: $sh_file"
            echo "Đang chạy file chuyển đổi..."
            "$sh_file"
        fi
    else
        # Nếu không phải file .bat, chạy bình thường
        echo "File không phải .bat: $bat_file"
        return 1
    fi
}

# Alias để tự động xử lý file .bat
alias runbat='bat_handler'

# Khi chạy file .bat, sẽ gọi hàm bat_handler tự động
autoload -Uz add-zsh-hook
add-zsh-hook preexec 'if [[ "$1" == *.bat ]]; then bat_handler "$1"; fi'

