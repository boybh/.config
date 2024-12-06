# Tắt sắp xếp khi hoàn thành lệnh `git checkout`
#zstyle ':completion:*:git-checkout:*' sort false

# Định dạng mô tả để hỗ trợ nhóm
zstyle ':completion:*:descriptions' format '[%d]'

# Màu sắc danh sách hoàn thành
#LS_COLORS="di=34:ln=36:so=32:pi=33:ex=35:bd=43;30:cd=43;30"
#export LS_COLORS
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Tắt menu hoàn thành của Zsh để `fzf-tab` có thể bắt đầu
zstyle ':completion:*' menu no

# Xem trước nội dung thư mục khi hoàn thành lệnh `cd`
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

# Tùy chỉnh cờ `fzf`
#zstyle ':fzf-tab:*' fzf-flags '--color=fg:2,fg+:green --bind=tab:accept'

#zstyle ':fzf-tab:*' fzf-command fzf
#zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
#zstyle ':fzf-tab:*' accept-line enter


# use input as query string when completing zlua
#zstyle ':fzf-tab:complete:_zlua:*' query-string input
#zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
#zstyle ':fzf-tab:*' query-string prefix input first
#z#style ':fzf-tab:*' prefix '·'
#zstyle ':completion:*:descriptions' format
#export FZF_DEFAULT_OPTS="--color=fg:#ebdbb2,bg:#282828,hl:#fabd2f"
#FZF_TAB_GROUP_COLORS=(
#    $'\033[94m' $'\033[32m' $'\033[33m' $'\033[35m' $'\033[31m' $'\033[38;5;27m' $'\033[36m' \
#    $'\033[38;5;100m' $'\033[38;5;98m' $'\033[91m' $'\033[38;5;80m' $'\033[92m' \
#    $'\033[38;5;214m' $'\033[38;5;165m' $'\033[38;5;124m' $'\033[38;5;120m'
#)
#zstyle ':fzf-tab:*' group-colors $FZF_TAB_GROUP_COLORS
# apply to all command
zstyle ':fzf-tab:*' popup-min-size 50 8
# only apply to 'diff'
zstyle ':fzf-tab:complete:diff:*' popup-min-size 80 12
zstyle ':fzf-tab:complete:*' fzf-bindings \
	'ctrl-v:execute-silent({_FTB_INIT_}code "$realpath")' \
    'ctrl-e:execute-silent({_FTB_INIT_}kwrite "$realpath")'


# Kích hoạt hoàn thành
autoload -Uz compinit; compinit -C  # Tải và khởi động hệ thống hoàn thành
compinit -d ~/.cache/zcompdump  # Sử dụng cache cho hoàn thành

# Tùy chỉnh kiểu hoàn thành
#zstyle ':autocomplete:*' ignored-input '..##'
zstyle ':completion:*' use-cache on  # Kích hoạt tính năng cache
zstyle ':completion:*' cache-path ~/.zsh/cache  # Đường dẫn đến thư mục cache
zstyle ':completion:*:history-words' users "${USER}"  # Ghi nhớ từ lịch sử
zstyle ':completion:*:*:*:*:*' menu select=1  # Kích hoạt menu chọn cho hoàn thành
zstyle ':completion:*' auto-description 'specify: %d'  # Hiển thị mô tả tự động
zstyle ':completion:*' auto-list yes  # Tự động hiển thị danh sách hoàn thành
zstyle ':completion:*' auto-menu yes  # Kích hoạt menu tự động
zstyle ':completion:*' auto-abbrev yes  # Cho phép viết tắt cho các từ
#zstyle ':completion:*' completer _expand _complete  # Tùy chọn cho hoàn thành
zstyle ':completion:*' completer _expand _complete _approximate  # Tùy chọn cho hoàn thành gần đúng
#zstyle ':completion:*' completer _complete _ignored _history _correct  # Các phương thức hoàn thành
zstyle ':completion:*' group-name ''  # Không nhóm hoàn thành
zstyle ':completion:*:default' list-suffixes  # Hiển thị hậu tố cho danh sách hoàn thành
zstyle ':completion:*' format 'Đang hoàn thành: %d'  # Định dạng hiển thị danh sách hoàn thành
zstyle ':completion:*:*:git:*' git-files  # Kích hoạt hoàn thành cho các lệnh git
zstyle ':completion:*' accept-exact 'true'  # Chấp nhận chính xác các tùy chọn hoàn thành
zstyle ':completion:*' extra-keys 'ctrl-x:cut,ctrl-c:copy'  # Kích hoạt phím tắt bổ sung trong cửa sổ hoàn thành
zstyle ':completion:*:*:files' ignored-patterns '*~' '*.tmp' '*.log'  #không cần hoàn thành cho các file tạm thời hoặc log

# Hoàn thành file
zstyle ':completion:*:*:files' ignored-patterns '*?.o' '*?.log' '*?.dll'  # Bỏ qua các file cụ thể
zstyle ':completion:*:*:files' file-sort size  # Sắp xếp file theo kích thước

# Hoàn thành thư mục
zstyle ':completion:*:*:directories' sort yes  # Sắp xếp thư mục
zstyle ':completion:*:*:directories' ignored-patterns '*/CVS'  # Bỏ qua thư mục cụ thể

# Hoàn thành biến môi trường
zstyle ':completion:*:parameters' sort yes  # Sắp xếp biến môi trường
zstyle ':completion:*' list-colors ''  # Đặt màu sắc cho danh sách hoàn thành
zstyle ':completion:*' list-prompt %STại %p: Nhấn TAB để xem thêm, hoặc nhập ký tự để chèn%s  # Thông báo cho người dùng
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # Cho phép không phân biệt chữ hoa chữ thường
zstyle ':completion:*' rehash true  # Tự động cập nhật danh sách hoàn thành
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s  # Hiển thị trạng thái lựa chọn
zstyle ':completion:*' use-compctl false  # Tắt compctl
zstyle ':completion:*' verbose true  # Hiển thị thông tin chi tiết
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'  # Lệnh để hiển thị thông tin tiến trình

# Tùy chỉnh tên nhóm hoàn thành
zstyle ':completion:*:commands' group-name 'Lệnh'  # Đặt tên nhóm cho lệnh
zstyle ':completion:*:files' group-name 'Tệp tin'  # Đặt tên nhóm cho tệp tin
zstyle ':completion:*:directories' group-name 'Thư mục'  # Đặt tên nhóm cho thư mục

# Plugin oh-my-zsh
zstyle ':omz:plugins:alias-finder' autoload yes  # Kích hoạt plugin tìm alias
zstyle ':omz:plugins:alias-finder' longer yes  # Cho phép tìm kiếm alias dài
zstyle ':omz:plugins:alias-finder' exact yes  # Chấp nhận tìm kiếm chính xác
zstyle ':omz:plugins:alias-finder' cheaper yes  # Kích hoạt tìm kiếm nhanh hơn
zstyle ':omz:plugins:plugin-name' autoload yes  # Kích hoạt plugin theo tên
zstyle ':omz:plugins:auto-suggestions' suggestions yes  # Kích hoạt gợi ý tự động
zstyle ':omz:plugins:auto-suggestions' highlight yes  # Kích hoạt làm nổi bật gợi ý
zstyle ':omz:plugins:fzf:completion' 'enable' 'true'  # Kích hoạt hoàn thành fzf
zstyle ':omz:plugins:fzf:preview' 'enable' 'true'  # Kích hoạt xem trước fzf
zstyle ':omz:plugins:fzf:command-history' 'enable' 'true'  # Kích hoạt lịch sử lệnh fzf
zstyle ':omz:plugins:fzf:file-browser' 'enable' 'true'  # Kích hoạt trình duyệt file fzf
zstyle ':omz:plugins:fzf:bindings' 'enable' 'true'  # Kích hoạt các phím tắt fzf
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup  # Kết nối fzf-tab với tmux

# Sử dụng gnu-ls cho theme-and-appearance
zstyle ':omz:lib:theme-and-appearance' gnu-ls yes  # Sử dụng gnu-ls cho giao diện

# Bỏ qua tất cả các alias từ lib và plugin
#zstyle ':omz:lib:*' aliases yes  # Bỏ qua alias từ lib
#zstyle ':omz:plugins:*' aliases yes  # Bỏ qua alias từ các plugin

# Bỏ qua các alias từ directories.zsh
zstyle ':omz:lib:directories' aliases yes  # Bỏ qua alias từ thư viện directories

# Tắt tính năng correction cho alias
zstyle ':omz:lib:correction' aliases no  # Không tự động sửa alias

# Bỏ qua alias từ plugin git
zstyle ':omz:plugins:git' aliases yes  # Bỏ qua alias từ plugin git

# Sử dụng async-prompt cho plugin git
zstyle ':omz:alpha:lib:git' async-prompt yes  # Kích hoạt prompt bất đồng bộ cho git

# Cập nhật tự động cho Oh My Zsh
zstyle ':omz:update' mode auto  # Cập nhật tự động cho Oh My Zsh

# Cấu hình màu sắc cho hoàn thành lệnh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(builtin)  # Đặt các highlighter cho hoàn thành


#zstyle '*:compinit' arguments -D -i -u -C -w
# all Tab widgets
#zstyle ':autocomplete:*complete*:*' insert-unambiguous yes

# all history widgets
#zstyle ':autocomplete:*history*:*' insert-unambiguous yes

# ^S
#zstyle ':autocomplete:menu-search:*' insert-unambiguous yes
#zstyle ':completion:*:*' matcher-list 'm:{[:lower:]-}={[:upper:]_}' '+r:|[.]=**'
#zstyle ':autocomplete:*' add-space \
#    executables aliases functions builtins reserved-words commands
#zstyle ':autocomplete:*' min-input 3
#zstyle ':autocomplete:*' ignored-input '..##'
# Note: -e lets you specify a dynamically generated value.

# Override default for all listings
# $LINES is the number of lines that fit on screen.
#zstyle -e ':autocomplete:*:*' list-lines 'reply=( $(( LINES / 3 )) )'

# Override for recent path search only
#zstyle ':autocomplete:recent-paths:*' list-lines 10

# Override for history search only
#zstyle ':autocomplete:history-incremental-search-backward:*' list-lines 8

# Override for history menu only
#zstyle ':autocomplete:history-search-backward:*' list-lines 2000





zstyle ':omz:plugins:eza' 'dirs-first' yes
zstyle ':omz:plugins:eza' 'git-status' yes
zstyle ':omz:plugins:eza' 'header' yes
zstyle ':omz:plugins:eza' 'show-group' yes
zstyle ':omz:plugins:eza' 'icons' yes
zstyle ':omz:plugins:eza' 'size-prefix' si
zstyle ':omz:plugins:eza' 'hyperlink' yes



#export FZF_DEFAULT_COMMAND='fd --type file'
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
#export FZF_DEFAULT_COMMAND="fd --type file --color=always"
#export FZF_DEFAULT_OPTS="--ansi"
