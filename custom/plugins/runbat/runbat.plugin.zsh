#!/usr/bin/env zsh 
# Plugin cho Zsh - Chạy file .bat
bat_handler() {
    local bat_file="$1"

    # Kiểm tra xem file có đuôi .bat không
    if [[ "$bat_file" == *.bat ]]; then
        echo "Đang xử lý file .bat: $bat_file"

        # Kiểm tra nếu Wine đã được cài đặt
        if command -v wine &> /dev/null; then
            echo "Chạy file .bat bằng Wine..."
            wine cmd /c "$bat_file"
        else
            echo "Wine không được cài đặt. Đang chuyển đổi file .bat sang .sh..."

            # Tạo file Bash từ .bat
            local sh_file="${bat_file%.bat}.sh"
            echo "##!/usr/bin/env zsh " > "$sh_file"
            echo "# Chuyển đổi từ file $bat_file" >> "$sh_file"
            # Chuyển đổi các lệnh từ Windows sang Linux
            sed 's/^@echo off//g; s/^echo /echo /g; s/set /export /g' "$bat_file" >> "$sh_file"
            
            # Thiết lập quyền thực thi cho file .sh
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

# Alias để chạy file .bat
alias runbat='bat_handler'

# Khi chạy file .bat, sẽ gọi hàm bat_handler
autoload -Uz add-zsh-hook
add-zsh-hook preexec '[[ "$1" == *.bat ]] && bat_handler "$1"'
