# Cấu hình fzf-tab

# Chỉ định các tùy chọn cho fzf-tab
export FZF_TAB_OPTIONS='--preview "echo {}"'

# Ví dụ khác: Cấu hình để hiển thị danh sách hoàn thành với màu sắc
export FZF_TAB_PREVIEW='bat --style=numbers --color=always {}'

# Nếu bạn muốn điều chỉnh các thiết lập khác, hãy thêm vào đây

export FZF_TAB_OPTIONS='--height 40% --border'
export FZF_TAB_ACTIONS='--bind "ctrl-p:preview-up,ctrl-n:preview-down"'
#!/bin/bash

# Sử dụng fzf để tạo một popup
fzf --height 50% --border --preview 'bat --style=numbers --color=always {}'

# Cấu hình màu sắc cho prompt
autoload -U colors && colors

# Cấu hình màu cho thư mục
PROMPT='%F{yellow}%~%f %# '

# Ví dụ cấu hình màu sắc không có nền
ZSH_HIGHLIGHT_STYLES[default]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[command]='fg=green'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=red'

PROMPT='%F{yellow}%n@%m %F{green}%~ %f%# '
PROMPT='%n@%m %~ %# '
