# ~/.oh-my-zsh/custom/tmux_custom.zsh

# Tự động kết nối tmux
export ZSH_TMUX_AUTOCONNECT=1

# Tự động đặt tên phiên tmux
export ZSH_TMUX_AUTONAME_SESSION=1

# Tự động thoát tmux khi kết thúc session
export ZSH_TMUX_AUTOQUIT=1

# Tự động khởi động tmux khi bắt đầu terminal
export ZSH_TMUX_AUTOSTART=1

# Chỉ tự động khởi động tmux một lần
export ZSH_TMUX_AUTOSTART_ONCE=1

# Đường dẫn đến file cấu hình tmux
export ZSH_TMUX_CONFIG="$HOME/.tmux.conf"

# Tùy chọn nếu tmux đang chạy ở chế độ detached
export ZSH_TMUX_DETACHED=0

# Khắc phục các vấn đề về terminal
export ZSH_TMUX_FIXTERM=1

# Khắc phục lỗi terminal với 256 màu
export ZSH_TMUX_FIXTERM_WITH_256COLOR=1

# Khắc phục lỗi terminal mà không có 256 màu
export ZSH_TMUX_FIXTERM_WITHOUT_256COLOR=1

# Hỗ trợ cho iTerm2 (nếu đang sử dụng)
export ZSH_TMUX_ITERM2=2

# Cấu hình biến môi trường cho tmux
export ZSH_TMUX_TERM="screen-256color"

# Hỗ trợ chế độ Unicode
export ZSH_TMUX_UNICODE=1

