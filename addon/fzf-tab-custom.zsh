# Kích hoạt hoàn thành
autoload -Uz compinit  # Tải và khởi động hệ thống hoàn thành
compinit -d ~/.cache/zcompdump  # Sử dụng cache cho hoàn thành

zstyle ':completion::complete:*' cache-path ${XDG_CACHE_HOME}/zsh/zcompcache
zstyle ':completion:*' use-cache on  												# Kích hoạt tính năng cache
zstyle ':completion:*' cache-path ~/.cache  										# Đường dẫn đến thư mục cache
zstyle ':completion:*:history-words' users "${USER}"  								# Ghi nhớ từ lịch sử
zstyle ':completion:*:*:*:*:*' menu select  										# Kích hoạt menu chọn cho hoàn thành
zstyle ':completion:*' auto-description 'specify: %d'  	#Hiển thị mô tả tự động
zstyle ':completion:*' auto-list yes  												# Tự động hiển thị danh sách hoàn thành
zstyle ':completion:*' auto-menu yes  												# Kích hoạt menu tự động
zstyle ':completion:*' auto-abbrev yes  											# Cho phép viết tắt cho các từ
zstyle ':completion:*' completer _complete _ignored _history _correct  				# Các phương thức hoàn thành
zstyle ':completion:*:default' list-suffixes  										# Hiển thị hậu tố cho danh sách hoàn thành
zstyle ':completion:*' format 'Đang hoàn thành: %d'  								# Định dạng hiển thị danh sách hoàn thành
zstyle ':completion:*:*:git:*' git-files  											# Kích hoạt hoàn thành cho các lệnh git
zstyle ':completion:*' accept-exact 'true'
## Chấp nhận chính xác các tùy chọn hoàn thành
zstyle ':completion:*' extra-keys 'ctrl-x:cut,ctrl-c:copy'  						# Kích hoạt phím tắt bổ sung trong cửa sổ hoàn thành
zstyle ':completion:*:*:files' ignored-patterns '*~' '*.tmp' '*.log' '*.dll' 		# không cần hoàn thành cho các file tạm thời hoặc log

# Hoàn thành file
zstyle ':completion:*:*:files' ignored-patterns '*?.o' '*?.log' '*?.dll'   			# Bỏ qua các file cụ thể
zstyle ':completion:*:*:files' file-sort size    									# Sắp xếp file theo kích thước

# Hoàn thành thư mục
zstyle ':completion:*:*:directories' sort yes    									# Sắp xếp thư mục
zstyle ':completion:*:*:directories' ignored-patterns '*/CVS'  	  				# Bỏ qua thư mục cụ thể

# Hoàn thành biến môi trường
zstyle ':completion:*:parameters' sort yes    										# Sắp xếp biến môi trường
zstyle ':completion:*' list-colors ''    											# Đặt màu sắc cho danh sách hoàn thành
zstyle ':completion:*' list-prompt %STại %p: Nhấn TAB để xem thêm, hoặc nhập ký tự để chèn%s  # Thông báo cho người dùng
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'    						# Cho phép không phân biệt chữ hoa chữ thường
zstyle ':completion:*' rehash true    												# Tự động cập nhật danh sách hoàn thành
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s  # Hiển thị trạng thái lựa chọn
zstyle ':completion:*' verbose true  												# Hiển thị thông tin chi tiết
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'  	# Lệnh để hiển thị thông tin tiến trình

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
#zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
#zstyle ':omz:plugins:eza' 'dirs-first' yes
#zstyle ':omz:plugins:eza' 'git-status' yes
#zstyle ':omz:plugins:eza' 'header' yes
#zstyle ':omz:plugins:eza' 'show-group' yes
#zstyle ':omz:plugins:eza' 'icons' yes
#zstyle ':omz:plugins:eza' 'size-prefix' si
#zstyle ':omz:plugins:eza' 'hyperlink' yes

#FzF
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
#zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
zstyle ':fzf-tab:*' use-fzf-default-opts yes


# Sử dụng gnu-ls cho theme-and-appearance
zstyle ':omz:lib:theme-and-appearance' gnu-ls yes  # Sử dụng gnu-ls cho giao diện

# Bỏ qua tất cả các alias từ lib và plugin
zstyle ':omz:lib:*' aliases yes  # Bỏ qua alias từ lib
#zstyle ':omz:plugins:*' aliases yes  # Bỏ qua alias từ các plugin

# Bỏ qua các alias từ directories.zsh
zstyle ':omz:lib:directories' aliases yes  # Bỏ qua alias từ thư viện directories

# Tắt tính năng correction cho alias
zstyle ':omz:lib:correction' aliases no  # Không tự động sửa alias

# Bỏ qua alias từ plugin git
#zstyle ':omz:plugins:git' aliases yes  # Bỏ qua alias từ plugin git

# Sử dụng async-prompt cho plugin git
zstyle ':omz:alpha:lib:git' async-prompt yes  # Kích hoạt prompt bất đồng bộ cho git

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort true
# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
#zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
#zstyle ':completion:*' menu select
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview "eza -gh --group-directories-first --git --icons --color --hyperlink -G -a"
# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
#zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# switch group using `<` and `>`
#zstyle ':fzf-tab:*' switch-group '<' '>'

#export FZF_DEFAULT_COMMAND='fd --type file'                                                            
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"                                                     
#export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'                           
#export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"
