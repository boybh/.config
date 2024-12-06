#!/usr/bin/env zsh

# Hiển thị thông tin dòng lệnh cơ bản
PROMPT='%n@%m %~ %# '  # Hiển thị tên người dùng, tên máy và thư mục hiện tại

# Hiển thị thời gian hiện tại ở bên phải
RPROMPT='%D{%L:%M:%S}'  # Hiển thị thời gian hiện tại ở bên phải prompt

# Kích hoạt hoàn thành
autoload -Uz compinit; compinit -C  # Tải và khởi động hệ thống hoàn thành
compinit -d ~/.cache/zcompdump  # Sử dụng cache cho hoàn thành

# Tùy chỉnh kiểu hoàn thành
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
zstyle ':omz:lib:*' aliases yes  # Bỏ qua alias từ lib
zstyle ':omz:plugins:*' aliases yes  # Bỏ qua alias từ các plugin

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


