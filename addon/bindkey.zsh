# Cấu hình cho sự kiện nhấp chuột
# Khi nhấp chuột vào vị trí bất kỳ trong dòng lệnh,
# con trỏ sẽ di chuyển đến vị trí đó.
bindkey -M viins '^[[<' beginning-of-line  # Nhấp chuột vào bên trái con trỏ: Di chuyển đến đầu dòng
bindkey -M viins '^[[>' end-of-line         # Nhấp chuột vào bên phải con trỏ: Di chuyển đến cuối dòng
# Cấu hình keybindings và các chức năng liên quan

bindkey 'M-^?' backward-kill-word             # Alt + Backspace: Xóa từ phía trước con trỏ
bindkey 'M-e' autosuggest-enable              # Alt + e: Bật tính năng gợi ý
bindkey 'M-t' autosuggest-toggle              # Alt + t: Chuyển đổi giữa bật/tắt gợi ý
bindkey -e                                    # Sử dụng phím điều khiển kiểu emacs
bindkey '  ' magic-space                      # Nhấn Space hai lần: Lưu lệnh vào lịch sử
bindkey '^x' backward-kill-line               # Ctrl + x: Xóa toàn bộ dòng hiện tại
bindkey '^[[3;5~' kill-word                   # Ctrl + Supr (Delete): Xóa một từ phía sau con trỏ
bindkey '^[[3~' delete-char                   # Delete: Xóa một ký tự
bindkey '^[[1;5C' forward-word                # Ctrl + ->: Di chuyển con trỏ sang phải một từ
bindkey '^[[1;5D' backward-word               # Ctrl + <-: Di chuyển con trỏ sang trái một từ
bindkey '^[[5~' beginning-of-buffer-or-history # Page Up: Về đầu lịch sử
bindkey '^[[6~' end-of-buffer-or-history      # Page Down: Về cuối lịch sử
bindkey '^[[H' beginning-of-line              # Home: Di chuyển về đầu dòng
bindkey '^[[' end-of-line                     # End: Di chuyển về cuối dòng
bindkey '^[[z' undo                           # Crtl + z: Hoàn tác thao tác cuối cùng
#bindkey '^ ' fzf-completion-widget            # Ctrl + Space: Kích hoạt gợi ý fzf
