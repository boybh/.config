# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Standard-Widgets

# Đảm bảo rằng terminal đang ở chế độ ứng dụng khi zle hoạt động,
# vì chỉ khi đó các giá trị từ $terminfo mới hợp lệ
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx  # Kích hoạt chế độ ứng dụng
  }
  function zle-line-finish() {
    echoti rmkx  # Kết thúc chế độ ứng dụng
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

# Sử dụng các phím tắt kiểu emacs
bindkey -e

# [PageUp] - Lên một dòng lịch sử
if [[ -n "${terminfo[kpp]}" ]]; then
  bindkey -M emacs "${terminfo[kpp]}" up-line-or-history
  bindkey -M viins "${terminfo[kpp]}" up-line-or-history
  bindkey -M vicmd "${terminfo[kpp]}" up-line-or-history
fi
# [PageDown] - Xuống một dòng lịch sử
if [[ -n "${terminfo[knp]}" ]]; then
  bindkey -M emacs "${terminfo[knp]}" down-line-or-history
  bindkey -M viins "${terminfo[knp]}" down-line-or-history
  bindkey -M vicmd "${terminfo[knp]}" down-line-or-history
fi

# Bắt đầu gõ + [Up-Arrow] - tìm kiếm lịch sử phía trước
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search

bindkey -M emacs "^[[A" up-line-or-beginning-search
bindkey -M viins "^[[A" up-line-or-beginning-search
bindkey -M vicmd "^[[A" up-line-or-beginning-search
if [[ -n "${terminfo[kcuu1]}" ]]; then
  bindkey -M emacs "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey -M viins "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey -M vicmd "${terminfo[kcuu1]}" up-line-or-beginning-search
fi

# Bắt đầu gõ + [Down-Arrow] - tìm kiếm lịch sử phía sau
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey -M emacs "^[[B" down-line-or-beginning-search
bindkey -M viins "^[[B" down-line-or-beginning-search
bindkey -M vicmd "^[[B" down-line-or-beginning-search
if [[ -n "${terminfo[kcud1]}" ]]; then
  bindkey -M emacs "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey -M viins "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey -M vicmd "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# [Home] - Về đầu dòng
if [[ -n "${terminfo[khome]}" ]]; then
  bindkey -M emacs "${terminfo[khome]}" beginning-of-line
  bindkey -M viins "${terminfo[khome]}" beginning-of-line
  bindkey -M vicmd "${terminfo[khome]}" beginning-of-line
fi
# [End] - Về cuối dòng
if [[ -n "${terminfo[kend]}" ]]; then
  bindkey -M emacs "${terminfo[kend]}"  end-of-line
  bindkey -M viins "${terminfo[kend]}"  end-of-line
  bindkey -M vicmd "${terminfo[kend]}"  end-of-line
fi

# [Shift-Tab] - di chuyển qua menu hoàn thành ngược lại
if [[ -n "${terminfo[kcbt]}" ]]; then
  bindkey -M emacs "${terminfo[kcbt]}" reverse-menu-complete
  bindkey -M viins "${terminfo[kcbt]}" reverse-menu-complete
  bindkey -M vicmd "${terminfo[kcbt]}" reverse-menu-complete
fi

# [Backspace] - xóa ngược
bindkey -M emacs '^?' backward-delete-char
bindkey -M viins '^?' backward-delete-char
bindkey -M vicmd '^?' backward-delete-char
# [Delete] - xóa tới
if [[ -n "${terminfo[kdch1]}" ]]; then
  bindkey -M emacs "${terminfo[kdch1]}" delete-char
  bindkey -M viins "${terminfo[kdch1]}" delete-char
  bindkey -M vicmd "${terminfo[kdch1]}" delete-char
else
  bindkey -M emacs "^[[3~" delete-char
  bindkey -M viins "^[[3~" delete-char
  bindkey -M vicmd "^[[3~" delete-char

  bindkey -M emacs "^[3;5~" delete-char
  bindkey -M viins "^[3;5~" delete-char
  bindkey -M vicmd "^[3;5~" delete-char
fi

# [Ctrl-Delete] - xóa toàn bộ từ phía trước
bindkey -M emacs '^[[3;5~' kill-word
bindkey -M viins '^[[3;5~' kill-word
bindkey -M vicmd '^[[3;5~' kill-word

# [Ctrl-RightArrow] - di chuyển tới một từ phía trước
bindkey -M emacs '^[[1;5C' forward-word
bindkey -M viins '^[[1;5C' forward-word
bindkey -M vicmd '^[[1;5C' forward-word
# [Ctrl-LeftArrow] - di chuyển tới một từ phía sau
bindkey -M emacs '^[[1;5D' backward-word
bindkey -M viins '^[[1;5D' backward-word
bindkey -M vicmd '^[[1;5D' backward-word

# [Esc-w] - Xóa từ từ con trỏ đến dấu đánh dấu
bindkey '\ew' kill-region
# [Esc-l] - chạy lệnh: ls
bindkey -s '\el' 'ls\n'
# [Ctrl-r] - Tìm kiếm ngược theo từng ký tự cho một chuỗi đã chỉ định
bindkey '^r' history-incremental-search-backward
# [Space] - không thực hiện mở rộng lịch sử
bindkey ' ' magic-space

# Chỉnh sửa dòng lệnh hiện tại trong $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# Sao chép từ trước vào clipboard
bindkey "^[m" copy-prev-shell-word

# Cân nhắc các phím tắt kiểu emacs
#
#bindkey -e  ## các phím tắt kiểu emacs
#
#bindkey '^[[A' up-line-or-search
#bindkey '^[[B' down-line-or-search
#bindkey '^[^[[C' emacs-forward-word
#bindkey '^[^[[D' emacs-backward-word
#
#bindkey -s '^X^Z' '%-^M'
#bindkey '^[e' expand-cmd-path
#bindkey '^[^I' reverse-menu-complete
#bindkey '^X^N' accept-and-infer-next-history
#bindkey '^W' kill-region
#bindkey '^I' complete-word
## Sửa chuỗi kỳ lạ mà rxvt tạo ra
#bindkey -s '^[[Z' '\t'

# Kích hoạt chế độ phím điều khiển kiểu Emacs
bindkey -e

# Kích hoạt chế độ phím điều khiển kiểu Vi (nếu bạn muốn sử dụng chế độ này)
bindkey -v

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
bindkey '^[[z' undo                           # Shift + Tab: Hoàn tác thao tác cuối cùng
bindkey '^ ' fzf-completion-widget            # Ctrl + Space: Kích hoạt gợi ý fzf
