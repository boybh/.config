#!/usr/bin/env zsh

# Hiển thị thông tin dòng lệnh cơ bản
#PROMPT='%n@%m %~ %# '

# Hiển thị thời gian hiện tại ở bên phải
#RPROMPT='%D{%L:%M:%S}'

# Kích hoạt hoàn thành .....
autoload -Uz compinit; compinit
compinit -d ~/.cache/zcompdump

# Customize completion styles
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache
zstyle ':completion:*:history-words' users "${USER}"
zstyle ':fzf-tab:*' list-colors ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:*:*:*' menu select=1
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' auto-list yes
zstyle ':completion:*' auto-menu yes
zstyle ':completion:*' auto-abbrev yes                          # Tùy chọn này cho phép hoàn thành tự động các từ viết t>
#zstyle ':completion:*' completer _expand _complete
#zstyle ':completion:*' completer _expand _complete _approximate
zstyle ':completion:*' completer _complete _ignored _history _correct
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' list-suffixes
zstyle ':completion:*' format 'Đang hoàn thành: %d'
zstyle ':completion:*:*:git:*' git-files                        # Kích hoạt hoàn thành cho các lệnh git
zstyle ':completion:*' accept-exact 'true'                      # Kích hoạt hoàn thành gợi ý với các tùy chọn thêm
zstyle ':completion:*' extra-keys 'ctrl-x:cut,ctrl-c:copy'      # Kích hoạt các phím tắt bổ sung trong cửa sổ hoàn thành

# Hoàn thành file
zstyle ':completion:*:*:files' ignored-patterns '*?.o' '*?.log' '*?.dll'
zstyle ':completion:*:*:files' file-sort size

# Hoàn thành thư mục
zstyle ':completion:*:*:directories' sort yes
zstyle ':completion:*:*:directories' ignored-patterns '*/CVS'

# Hoàn thành biến môi trường
zstyle ':completion:*:parameters' sort yes
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %STại %p: Nhấn TAB để xem thêm, hoặc nhập ký tự để chèn%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# Customize completion group names
zstyle ':completion:*:commands' group-name 'Lệnh'
zstyle ':completion:*:files' group-name 'Tệp tin'
zstyle ':completion:*:directories' group-name 'Thư mục'


# Plugin oh-my-zsh
zstyle ':omz:plugins:alias-finder' autoload yes
zstyle ':omz:plugins:alias-finder' longer yes
zstyle ':omz:plugins:alias-finder' exact yes
zstyle ':omz:plugins:alias-finder' cheaper yes
zstyle ':omz:plugins:plugin-name' autoload yes
zstyle ':omz:plugins:auto-suggestions' suggestions yes
zstyle ':omz:plugins:auto-suggestions' highlight yes
zstyle ':omz:plugins:fzf:completion' 'enable' 'true'
zstyle ':omz:plugins:fzf:preview' 'enable' 'true'
zstyle ':omz:plugins:fzf:command-history' 'enable' 'true'
zstyle ':omz:plugins:fzf:file-browser' 'enable' 'true'
zstyle ':omz:plugins:fzf:bindings' 'enable' 'true'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# Sử dụng gnu-ls cho theme-and-appearance
zstyle ':omz:lib:theme-and-appearance' gnu-ls yes

# Bỏ qua tất cả các alias từ lib và plugin
zstyle ':omz:lib:*' aliases yes
zstyle ':omz:plugins:*' aliases yes

# Bỏ qua các alias từ directories.zsh
#zstyle ':omz:lib:directories' aliases yes

# Tắt tính năng correction cho alias
#zstyle ':omz:lib:correction' aliases no

# Bỏ qua alias từ plugin git
#zstyle ':omz:plugins:git' aliases yes

# Sử dụng async-prompt cho plugin git
zstyle ':omz:alpha:lib:git' async-prompt yes

# Cập nhật tự động cho Oh My Zsh
zstyle ':omz:update' mode auto
# Cấu hình màu sắc cho hoàn thành lệnh
#ZSH_HIGHLIGHT_HIGHLIGHTERS=(builtin)
