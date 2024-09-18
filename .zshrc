# ================================================
# Cấu hình Zsh của bạn - gọn gàng và dễ quản lý
# ================================================

# 1. Thiết lập môi trường cơ bản
# ------------------------------
export LANG=vi_VN.UTF-8       # Thiết lập ngôn ngữ là tiếng Việt
export LC_ALL=vi_VN.UTF-8



# 2. Thiết lập thư mục custom cho các cấu hình
# --------------------------------------------
export config="~/.config"
export custom="$config/custom"

# 3. Khởi động Zinit để quản lý plugin
# ------------------------------------
if [[ ! -d "$HOME/.zinit" ]]; then
    echo "Zinit chưa được cài, vui lòng cài Zinit"
else
    source "${HOME}/.zinit/bin/zinit.zsh"
fi

# 4. Tự động tải plugin với Zinit
# --------------------------------
zinit light zsh-users/zsh-syntax-highlighting     # Tô màu cú pháp
zinit light zsh-users/zsh-autosuggestions         # Gợi ý lệnh dựa trên lịch sử
zinit light Aloxaf/fzf-tab                        # Fzf Tab
zinit light zdharma-continuum/fast-syntax-highlighting  # Highlight nhanh




# 5. Cấu hình alias (bí danh) cho các lệnh thường dùng
# ----------------------------------------------------
alias c='clear'
alias h='history'

# 6. Tạo hàm sao lưu và khôi phục cấu hình Zsh
# --------------------------------------------
backup_zshrc() {
    backup_dir="/mnt/e/custom/zsh_backups"
    mkdir -p "$backup_dir"
    backup_file="$backup_dir/zshrc_backup_$(date +%Y-%m-%d).tar.gz"

    tar -czvf "$backup_file" "$HOME/.zshrc" "$custom" "$HOME/.zinit" > /dev/null
    echo "Đã sao lưu cấu hình Zsh tại: $backup_file"

    # Commit và push lên Git
    git -C "$config" add .
    git -C "$config" commit -m "Backup cấu hình Zsh $(date +%Y-%m-%d)"
    git -C "$config" push origin boybh
}

restore_zshrc() {
    backup_dir="/mnt/e/custom/zsh_backups"
    latest_backup=$(ls -t $backup_dir | head -n 1)

    if [ -n "$latest_backup" ]; then
        tar -xzvf "$backup_dir/$latest_backup" -C "$HOME" > /dev/null
        echo "Đã khôi phục cấu hình Zsh từ: $latest_backup"
    else
        echo "Không tìm thấy bản sao lưu"
    fi
}

# 7. Nạp Oh My Zsh (nếu cần)
# --------------------------
if [[ -d "$HOME/.oh-my-zsh" ]]; then
    source $ZSH/oh-my-zsh.sh
fi

# 8. Đường dẫn cho các công cụ (path)
# -----------------------------------
export PATH="$HOME/bin:$PATH"

# 9. Tùy chỉnh prompt (dòng lệnh) với Powerlevel10k
# -----------------------------------------------
# source $ZSH/themes/powerlevel10k/powerlevel10k.zsh-theme

# Chạy p10k để cấu hình lần đầu
if [[ ! -f ~/.p10k.zsh ]]; then
    p10k configure
fi

# 10. Cấu hình cuối cùng
# ----------------------
alias naplai='source ~/.zshrc'

# ================================================
# Hết file .zshrc - Bạn có thể thêm phần khác nếu cần
# ================================================
